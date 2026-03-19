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
- `Repu_Data` kann Retail-Content in Untermodulen wie `content/retail/quelthalas.lua` pflegen.
- Wegpunktdaten liegen als `mapID`, `x`, `y`, `title` direkt an der Aktivität oder dem NPC.
- Content-Einträge sollen nach Möglichkeit `source` und `confidence` tragen.
- Quellen wie Wowhead dienen als Offline-Referenz; das Addon macht keine Live-Abfragen.

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
