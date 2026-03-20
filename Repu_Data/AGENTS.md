# Repu_Data Contributor Rules

## Verantwortung

- `Repu_Data` enthaelt nur kuratierte Inhaltsdaten fuer `Repu`.
- Keine Standortlogik, kein Scoring und keine API-Compat-Logik in diesem Addon.
- `Zone -> Fraktion` bleibt immer in `Repu`, nicht in `Repu_Data`.

## Struktur

- `content/retail/expansions/`: expansionsspezifische Fraktionsinhalte
- `content/retail/families/`: echte Parent/Child-Familien wie `quelthalas.lua` oder `shattrath.lua`
- `content/retail/legacy/`: Heimat-, Stadt- und Legacy-Hubs
- `content/retail/summary/`: generierte oder einfache Fallback-Datensaetze

## Locale-Regeln

- `locales/*.lua` registrieren die gemeinsame I18n-Domain `retail_content`.
- Das Projekt verwendet dieselbe I18n-Runtime wie `Repu` und `Repu_Map`; nur die Payload-Form ist hier datenfoermig pro `factionID`.
- Rohdaten in `content/retail/**/*.lua` bleiben sprachneutral oder englisch-first.
- Sprachabhaengige Texte werden ueber `locales/enUS.lua`, `locales/deDE.lua` und spaetere Overrides geliefert.
- Fuer echte Blizzard-Ruffraktionen gilt:
  - `enUS` soll nach Moeglichkeit die offizielle Blizzard-`description` verwenden
  - kuratierte Summary-Texte dienen als Fallback oder fuer virtuelle Gruppen/Spezialfaelle

## Datenregeln

- Aktivitaeten, Quartermaster und Wegpunkte bleiben kuratiert.
- `summary` ist kein freier Blindtext, wenn Blizzard bereits eine brauchbare Fraktionsbeschreibung liefert.
- Virtuelle Gruppen wie Familiencluster duerfen weiterhin kuratierte Summary-Texte behalten.
- Neue Inhalte sollen `source` und `confidence` tragen, wenn der Datensatz nicht selbsterklaerend ist.
