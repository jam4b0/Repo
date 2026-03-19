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

## Addon-Aufteilung

- `Repu`: Logik, Standorterkennung, Priorisierung, Haupt-UI
- `Repu_Data`: optionale Wissensbasis fuer Rüstmeister, Aktivitäten, Questziele und Wegpunktdaten
- `Repu_Map`: optionale Kartenintegration fuer Pins und Kartenlayer

Der aktuelle Stand:

- `Repu` ist aktiv
- `Repu_Data` ist als separates Datenaddon aktiv
- `Repu_Map` ist als optionale Integrationsschicht vorbereitet

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

## Naechster Ausbau

1. Datenmodule fraktions- und instanzvollstaendig fuellen
2. Content-Module blockweise mit Rüstmeistern und Aktivitäten fuellen
3. Optionsseite je Client-Flavor weiter ausbauen

## Tools

- `tools/generate_content_module.py` erzeugt aus JSON ein Retail-Content-Modul fuer `data/content/retail/*.lua`
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
- `tools/generate_remaining_zone_wave.py` erzeugt aus `normal_zones` des Restreports eine zweite autonome Coverage-Welle
- `tools/generate_final_zone_cleanup.py` erzeugt aus den letzten verbleibenden Zonen nur explizite Keep-Cases fuer die Abschlusswelle
- `tools/generate_variant_zone_coverage.py` behandelt die verbleibenden Dubletten-/Variantenzonen als explizite Keep-/Exclude-Liste

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
