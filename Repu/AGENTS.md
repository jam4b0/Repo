# Repu Contributor Rules

## Architekturregeln

- Keine expansionsspezifische Fachlogik in `core/`.
- Keine UI-Logik in `data/`.
- Keine API-Sonderfaelle ausserhalb von `core/compat.lua`.
- Standort-Mappings nur datengetrieben in `data/*.lua`.
- Fraktionsinhalte wie Rüstmeister, Aktivitäten, NPCs und Questziele gehoeren in ein separates Datenaddon wie `Repu_Data`.
- Scoring-Regeln nur in `core/scoring.lua`.
- Persistenzzugriffe nur ueber `core/state.lua`.

## Erweiterungsregeln

- Neue Fraktionen oder Orte werden zuerst als Datenmodell erfasst, nicht per `if`-Kaskade im Core.
- Wenn ein Client-Flavor neue API-Unterschiede einbringt, wird zuerst `compat.lua` erweitert.
- Neue UI-Features muessen mit bestehendem SavedVariables-Modell kompatibel bleiben.
- Debug-Ausgaben duerfen keine Spielfehler verursachen, wenn APIs `nil` liefern.
- Jeder Location-Eintrag bekommt explizit `source` und `confidence`.
- Content-Daten werden blockweise gepflegt, nicht als Einzelwissen im `core/`.
- Erlaubte `source`-Werte: `seed`, `observed`, `inferred`, `confirmed`.
- Erlaubte `confidence`-Werte: `low`, `medium`, `high`.
- `observed` wird fuer echte Ingame-Captures benutzt, `seed` fuer kuratierte Startdaten, `inferred` fuer abgeleitete Heuristiken, `confirmed` nur nach verifizierter Prüfung.
- Neue Eintraege sollen nach Moeglichkeit keine `unknown`-Quelle oder `unknown`-Confidence erzeugen.
- Zonenbasis wird bevorzugt aus `RepuDB.debug.mapScan` des Clients abgeleitet, nicht aus manuell abgeflogenen Listen.
- Zwischen Rohscan und finaler Seed-Datei soll ein pruefbares Manifest stehen.

## Content-Regeln

- `Repu` selbst enthaelt nur die Content-Schnittstelle, nicht die grosse Wissensbasis.
- `Repu_Data` pflegt Retail-Content unter `content/retail/expansions/`, `legacy/` und `summary/`; keine halbfertigen Sonderkategorien pflegen.
- Wegpunktdaten liegen als `mapID`, `x`, `y`, `title` direkt an der Aktivität oder dem NPC.
- Content-Einträge sollen nach Möglichkeit `source` und `confidence` tragen.
- Quellen wie Wowhead dienen als Offline-Referenz; das Addon macht keine Live-Abfragen.

## Locale-Regeln

- Das Projekt benutzt eine gemeinsame I18n-Runtime mit Domains.
- `ui` = `Repu` UI-/Systemtexte.
- `retail_content` = `Repu_Data` Content-Overlays pro `factionID`.
- `map_ui` = `Repu_Map` Karten-/Provider-Texte.
- `Repu/locales/*.lua` registrieren immer die Domain `ui`.
- `Repu_Data/locales/*.lua` registrieren immer die Domain `retail_content`.
- `Repu_Map/locales/*.lua` registrieren immer die Domain `map_ui`.
- Neue UI-Texte gehoeren nie nach `Repu_Data/locales/`.
- Neue Fraktionsinhalte gehoeren nie nach `Repu/locales/`.
- Bei echten Blizzard-Ruffraktionen soll `enUS` nach Moeglichkeit die offizielle Blizzard-`description` als Primaertext nutzen.
- Kuratierte Summary-Texte in `Repu_Data` sind Fallbacks oder ergaenzende Spezialtexte, keine bevorzugte Quelle fuer API-Fraktionen.
- TOC-Dateien werden aus `toc_manifest.json` generiert; Manifest und TOC muessen zusammen gepflegt werden.

## Quellenregeln

- `UiMap`, Standort, `mapID`, `mapChain` kommen primaer aus dem WoW-Client.
- globale Ruffraktions-Kataloge kommen primaer aus der Blizzard Game Data API.
- Charakter-Rufstand und Ruhm kommen primaer aus der Ingame-API, optional gespiegelt ueber die Blizzard Profile API.
- `Zone -> Fraktion` wird niemals direkt aus der Web-API uebernommen, sondern immer kuratiert im Addon-Modell gepflegt.
- Quartermaster, Activities, Daily/Weekly und Wegpunkte bleiben kuratierte `Repu_Data`-Inhalte.
- Eine Web-API-Existenz ist kein automatischer Beweis fuer eine Ortszuordnung.

## Map-Manifest-Regeln

- `mapScan` ist die Rohwahrheit fuer die vom Client gemeldete Weltstruktur.
- Das erste abgeleitete Artefakt ist ein Manifest mit Buckets wie `continents`, `zones` und `hubs`.
- Das Manifest darf Review-Flags wie `duplicateName`, `variantCandidate` und `needsReview` tragen.
- Gefilterte Seed-Dateien duerfen nie die Rohvollstaendigkeit verschleiern; Rohscan und Manifest muessen erhalten bleiben.

## Review-Checkliste

- Laeuft die Aenderung ohne Kenntnis einer spezifischen Expansion im Core?
- Ist das Mapping an genau einem Ort gepflegt?
- Ist die Fallback-Logik weiterhin deterministisch?
- Entsteht irgendwo eine OnUpdate-Dauerschleife?
- Sind neue SavedVariables rueckwaertskompatibel?
- Hat jeder neue Datenbankeintrag `source` und `confidence`?
- Ist der Eintrag eher `seed` als voreilig `confirmed` markiert?
