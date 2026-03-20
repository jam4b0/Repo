# Repu

Modularer, ortsbezogener Ruf-Tracker fuer World of Warcraft.

## Ziel

`Repu` zeigt standardmaessig nur die Fraktionen an, die fuer den aktuellen Standort des eingeloggten Charakters relevant sind:

- Zone
- Unterzone
- Dungeon
- Raid

Wenn kein Daten-Mapping greift, faellt das Addon kontrolliert auf sinnvolle Fallbacks zurueck, statt globale Ruflisten anzuzeigen.

## Architektur

- `core/`: generische Logik, Zustandsverwaltung, Compat, Priorisierung
- `data/`: expansions- und branchspezifische Zuordnungen
- `ui/`: Darstellung, Zeilen, Styles, spaetere Optionsintegration
- `debug/`: Slash-Kommandos, Dumps, Test-Ansichten

Retail wird intern jetzt fest nach Verantwortung getrennt:

- `data/retail/coverage/`: client_seed und generierte Coverage-Schichten
- `data/retail/mappings/regions/`: kuratierte regionale Orts-/Fraktionsmappings
- `data/retail/variants/`: bewusst getrennte Weltzustands- und Phasenfaelle
- `tests/cases/retail/`: datengetriebene Retail-Regressionstests
- `tests/cases/classic/`, `tbc/`, `wrath/`, `cata/`, `mop/`: Flavor-Regressionstests fuer die nicht-Retail-Daten

## Addon-Aufteilung

- `Repu`: Logik, Standorterkennung, Priorisierung, Haupt-UI
- `Repu_Data`: optionale Wissensbasis fuer Rüstmeister, Aktivitäten, Questziele und Wegpunktdaten
- `Repu_Map`: optionale Kartenintegration fuer Pins und Kartenlayer

Der aktuelle Stand:

- `Repu` ist aktiv
- `Repu_Data` ist als separates Datenaddon aktiv
- `Repu_Map` ist als optionale Integrationsschicht vorbereitet

`Repu_Data` ist fuer Retail jetzt ebenfalls fest gegliedert:

- `content/retail/expansions/`: expansionsspezifische Inhalte wie `outland.lua`, `war_within.lua`, `dragonflight.lua` oder `shadowlands.lua`
- `content/retail/families/`: nur echte Parent/Child-Familien wie Quel'Thalas oder `shattrath.lua`
- `content/retail/legacy/`: stabile Heimat- und Legacy-Fraktionen
- `content/retail/summary/`: generierte Startdatensaetze fuer noch nicht vertiefte Fraktionen

## I18n-System

Das Projekt benutzt jetzt ein gemeinsames, domainbasiertes I18n-Modell ueber alle drei Addons:

- `ui`
  - klassische UI- und Systemtexte von `Repu`
  - Beispiele: `OPTION_LOCK`, `DEBUG_STATUS`, `DETAIL_NO_DESCRIPTION`
- `retail_content`
  - lokalisierte Inhaltsdaten aus `Repu_Data`
  - Beispiele: `summary`, `activities`, `quartermasters` pro `factionID`
- `map_ui`
  - Karten-/Provider-Texte von `Repu_Map`

Die gemeinsame Runtime lebt in [i18n.lua](/root/Repo/Repu/core/i18n.lua) und wird ueber `_G.RepuAPI.RegisterLocaleDomain(domain, locale, payload)` befuellt.

Die Dateiform darf je Domain unterschiedlich aussehen:

- `Repu/locales/*.lua`
  - flache UI-Key-Tabellen fuer die Domain `ui`
- `Repu_Data/locales/*.lua`
  - Content-Overlays pro `factionID` fuer die Domain `retail_content`
- `Repu_Map/locales/*.lua`
  - flache Key-Tabellen fuer die Domain `map_ui`

Fuer `Repu_Data` gilt ausserdem:

- sprachneutrale Struktur bleibt in `content/retail/**/*.lua`
- sprachabhaengige Textfelder werden ueber `retail_content`-Locales ueberlagert
- fuer echte Blizzard-Ruffraktionen gilt bei `enUS`:
  - **Blizzard Game Data API `description` zuerst**
  - danach kuratierter Addon-Text
  - erst zuletzt generischer Fallback

## Datenquellen-Matrix

Feste Projektregel: jeder Datentyp hat genau eine Primaerquelle.

- `UiMap`, `mapID`, `mapChain`, aktueller Standort:
  - Primaerquelle: WoW-Client / Ingame-API
  - Verantwortung: `Repu`
- globale Ruffraktions-Kataloge:
  - Primaerquelle: Blizzard Game Data API
  - Verantwortung: Audit, Gap-Klassen, Vollstaendigkeitsreports in `Repu/tools`
- Charakter-Rufstand, Ruhm, aktive Reputationen:
  - Primaerquelle: WoW-Client / Ingame-API
  - Sekundaer: Blizzard Profile API fuer externe Audits
  - Verantwortung: `Repu/core/compat.lua`
- `Zone -> Fraktion`, Familien, Weltzustands- und Phasenlogik:
  - Primaerquelle: kuratiertes Addon-Datenmodell
  - Verantwortung: `Repu/data/retail/mappings/regions/` und `Repu/data/retail/variants/`
- Quartermaster, Activities, Daily/Weekly, Zusatzinhalte:
  - Primaerquelle: kuratierte Wissensbasis
  - Verantwortung: `Repu_Data`
- Wegpunkte und Koordinaten:
  - Primaerquelle: kuratierte Wissensbasis
  - Verantwortung: `Repu_Data`

Wichtig:

- Die Blizzard-Web-API beweist, dass eine Fraktion oder Quest existiert.
- Sie beweist nicht, dass diese Fraktion an Ort `X` die richtige Ortsfraktion fuer `Repu` ist.
- Diese Ortslogik bleibt immer kuratiert im Addon-Modell.

## Aktueller Stand

- Vollstaendiges Addon-Grundgeruest vorhanden
- Gemeinsame Core-Logik fuer Retail und Classic angelegt
- Datengetriebenes Mapping-System implementiert
- Erste Beispiel-Mappings fuer Retail und Classic enthalten
- Fallback- und Debug-Pfade implementiert
- Retail-Compat auf aktuelle `C_Reputation`-API ausgerichtet, Classic auf Legacy-API
- Debug-Kommandos fuer API-, Standort- und Fraktionsrohdatensicht erweitert
- Retail-Datenbasis in Weltblock-Module aufgeteilt
- Content-Schnittstelle fuer optionale Datenaddons angelegt
- Coverage-Report fuer Retail-Daten vorhanden
- Datenqualitaet wird ueber `source` und `confidence` klassifiziert
- Content-Datensaetze koennen ebenfalls mit `source` und `confidence` markiert werden

## Retail-Status

Der Retail-Core ist aktuell in vier klare Buckets aufgeteilt:

- `mapped`: lokale Ruffraktion oder Fraktionsfamilie ist bewusst hinterlegt
- `generated_secondary`: reine Coverage-/Seed-Schicht ohne eigene Ortsfraktion
- `variant_only`: Weltzustand-/Phasenfall ist getrennt, aber nicht mit einer eigenen lokalen Ruffraktion belegt
- `no_local_reputation`: Zone/Subzone hat bewusst keine lokale Ruffraktion und bleibt daher leer

Aktueller Retail-Backlog-Stand aus `tools/retail_faction_backlog.json`:

- `recordCount = 1002`
- `mapped = 771`
- `generated_secondary = 187`
- `variant_only = 46`
- `no_local_reputation = 6`
- `manualReviewCount = 0`

Das bedeutet:

- die Retail-Standortbasis ist im Core-Datenmodell geschlossen
- offene Retail-Restfaelle sind nicht mehr als ungeklaerte Backlog-Kandidaten vorhanden
- verbleibende Arbeit liegt jetzt eher in zusaetzlichen Inhaltsdaten fuer `Repu_Data` oder in spaeteren bewussten Mapping-Erweiterungen, nicht mehr im Grundunterbau

Der Blizzard-Retail-Audit trennt den Restbestand bewusst in Klassen:

- `excluded_global_system`: globale Systeme wie `Champions of Azeroth` oder `Tortollan Seekers`, die nicht als lokale Ortsfraktionen ins Zonenmodell gedrueckt werden
- `excluded_micro_side_rep`: kleine NPC-/Micro-Rufe wie `Darkfuse Solutions` oder `Roasts and Boasts`, die ebenfalls nicht als normale Ortsfraktionen gelten
- `candidate_legacy_or_side_rep`: der verbleibende langsame Legacy-/Sonderblock

Wichtig:

- `Repu` betrachtet globale Systeme und Micro-Reps nicht als fehlende normale Ortsfraktionen.
- Sie bleiben bewusst ausserhalb des lokalen Zonenmodells, bis es einen wirklich belastbaren Spezialpfad dafuer gibt.

## Naechster Ausbau

1. Datenmodule fraktions- und instanzvollstaendig fuellen
2. Content-Module blockweise mit Rüstmeistern und Aktivitäten fuellen
3. Optionsseite je Client-Flavor weiter ausbauen

## Tools

- `tools/generate_content_module.py` erzeugt aus JSON ein Retail-Content-Modul fuer `Repu_Data/content/retail/**/*.lua`
- `tools/content_example.json` zeigt das erwartete Inputformat fuer Fraktionsinhalte
- `tools/generate_map_manifest.py` erzeugt aus `RepuDB.debug.mapScan` ein pruefbares Zonen-Manifest mit Buckets fuer Kontinente, Zonen und Hubs
- `tools/generate_map_seed.py` erzeugt aus dem Manifest ein reines Zonen-Skelett fuer spaetere `Repu`-Seeds, ohne schon Fraktionswissen zu erfinden
- `tools/compare_map_seed.py` vergleicht den generierten Client-Seed mit der bestehenden Retail-Basis und zeigt Ueberlappung sowie Luecken
- `tools/list_curation_candidates.py` listet `client_seed`-Eintraege, die noch keine kuratierte Retail-Abdeckung haben
- `tools/prioritize_curation_candidates.py` gruppiert diese Kandidaten nach Weltblock und liefert eine blockweise Prioritaetsmatrix
- `tools/generate_reviewed_coverage.py` erzeugt daraus ein generiertes Retail-Coverage-Modul fuer alle normalen offenen Zonen ohne Fraktionswissen
- `tools/generate_reviewed_hubs.py` erzeugt daraus ein separates, bewusst konservatives Hub-/Subzonen-Coverage-Modul
- `tools/generate_hub_wave2.py` erzeugt eine zweite, explizite Keep-Case-Welle fuer nur manuell freigegebene Outdoor-/Hub-Subzonen
- `tools/classify_remaining_candidates.py` trennt den schwierigen Rest in Varianten, PvP/Event, instanznahe Hubs und technische Sonderkarten
- `tools/generate_variant_family_manifest.py` gruppiert die verbleibenden Dubletten in reviewbare Variantenfamilien statt nur Einzel-IDs
- `tools/generate_world_variant_coverage.py` uebernimmt die echten Welt-/Phasing-Varianten als Coverage-Schicht und laesst Event-/Instanz-/Technikvarianten weiter offen
- `tools/generate_event_variant_coverage.py` uebernimmt nur explizit freigegebene Event-/PvP-Varianten mit Weltbezug
- `tools/generate_special_zone_keepcases.py` schliesst die letzten offenen Spezialzonen des Retail-Zonenskeletts explizit
- `tools/generate_instance_adjacent_coverage.py` uebernimmt instanznahe Subzonen als eigene Coverage-Schicht
- `tools/generate_instance_variant_coverage.py` uebernimmt Instanz-/Raid-Dublettenfamilien als Coverage-Schicht
- `tools/generate_mixed_world_subzone_variants.py` uebernimmt explizit freigegebene weltbezogene Subzonen aus gemischten Dublettenfamilien
- `tools/generate_special_subzone_keepcases.py` schliesst die letzten bewusst behaltenen Retail-Spezialsubzonen explizit
- `tools/generate_excluded_retail_candidates.py` markiert bewusst ausgeschlossene Event-/Technikreste, damit sie nicht weiter als offene Arbeitskandidaten auftauchen
- `tools/generate_final_subzone_keepcases.py` schliesst die letzten verbliebenen Retail-Subzonenkandidaten explizit
- `tools/generate_remaining_zone_wave.py` erzeugt aus `normal_zones` des Restreports eine zweite autonome Coverage-Welle
- `tools/generate_final_zone_cleanup.py` erzeugt aus den letzten verbleibenden Zonen nur explizite Keep-Cases fuer die Abschlusswelle
- `tools/generate_variant_zone_coverage.py` behandelt die verbleibenden Dubletten-/Variantenzonen als explizite Keep-/Exclude-Liste
- `tools/build_retail_faction_backlog.py` erzeugt aus allen Retail-Modulen einen bereinigten Fraktionsstatus-Report und unterdrueckt dabei Coverage-Schatten, wenn bereits kuratierte Overrides existieren
- `tools/retail_faction_backlog.json` haelt den aktuellen Retail-Backlog-/Statusreport fuer den Core-Unterbau
- `tools/run_tests.lua` fuehrt datengetriebene Mapping-Regressionstests aus:
  - `lua tools/run_tests.lua retail`
  - `lua tools/run_tests.lua classic`
  - `lua tools/run_tests.lua tbc`
  - `lua tools/run_tests.lua wrath`
  - `lua tools/run_tests.lua cata`
  - `lua tools/run_tests.lua mop`
  - `lua tools/run_tests.lua all`
  - aktueller Stand: `36` grüne Regressionstests ueber `6` Suiten

## Map-Scan-Pipeline

Die Weltbasis fuer `Repu` soll nicht manuell abgeflogen oder aus veralteten Webseiten zusammengesucht werden. Stattdessen gilt:

1. `Repu` scannt die `UiMap`-Hierarchie direkt aus dem Client in `RepuDB.debug.mapScan`
2. `tools/generate_map_manifest.py` erzeugt daraus ein auditierbares Manifest
3. `tools/generate_map_seed.py` erzeugt daraus ein kontrolliertes `client_seed`-Skelett
4. Kuratierte Retail-Module legen fachliche Zuordnungen als Overrides darauf

Wichtig:

- `mapScan` ist die Rohquelle
- das Manifest ist die pruefbare Klassifikation
- `client_seed` ist die vollstaendige Standortunterlage aus dem Client
- gefilterte Seeds sind nur abgeleitete Sichten und duerfen die Rohvollstaendigkeit nicht ersetzen

## Datenqualitaet

Jeder Location-Eintrag wird mit zwei Metadaten gepflegt:

- `source`: `seed`, `observed`, `inferred`, `confirmed`
- `confidence`: `low`, `medium`, `high`

Dabei gilt:

- `seed` sind kuratierte Startdaten
- `observed` sind aus echten Ingame-Captures abgeleitete Eintraege
- `inferred` sind automatisch oder heuristisch abgeleitete Eintraege
- `confirmed` ist fuer verifizierte, belastbare Zuordnungen reserviert
