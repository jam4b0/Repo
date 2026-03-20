local api = _G.RepuAPI

if not api or not api.RegisterLocaleDomain then
    return
end

api.RegisterLocaleDomain("retail_content_text", "deDE", {
    faction.9000111.summary = "Virtuelle Gruppenfraktion für Shattrath. Sie bündelt die großen Stadtfraktionen der Scherbenwelt, damit sie im UI als zusammengehöriger Cluster statt als ungeordnete Einzelfunde erscheinen.",
})
