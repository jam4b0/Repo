local api = _G.RepuAPI

if not api or not api.RegisterRetailContentModule then
    return
end

api.RegisterRetailContentModule({
    factions = {
        [1158] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 198,
                        title = "Hyjal",
                    },
                    title = "Hyjal",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Hyjal.",
        },
        [1171] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 207,
                        title = "Tiefenheim",
                    },
                    title = "Tiefenheim",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Tiefenheim.",
        },
        [1173] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 249,
                        title = "Uldum",
                    },
                    title = "Uldum",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Uldum.",
        },
        [1174] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 241,
                        title = "Schattenhochland",
                    },
                    title = "Schattenhochland",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Schattenhochland.",
        },
        [1177] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 244,
                        title = "Tol Barad",
                    },
                    title = "Tol Barad",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 245,
                        title = "Halbinsel von Tol Barad",
                    },
                    title = "Halbinsel von Tol Barad",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Tol Barad and Halbinsel von Tol Barad.",
        },
        [1178] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 244,
                        title = "Tol Barad",
                    },
                    title = "Tol Barad",
                },
                {
                    kind = "Zone",
                    location = {
                        mapID = 245,
                        title = "Halbinsel von Tol Barad",
                    },
                    title = "Halbinsel von Tol Barad",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Tol Barad and Halbinsel von Tol Barad.",
        },
        [2417] = {
            activities = {
                {
                    kind = "Zone",
                    location = {
                        mapID = 249,
                        title = "Uldum",
                    },
                    title = "Uldum",
                },
            },
            confidence = "medium",
            source = "curated",
            summary = "Retail content for this faction is centered on Uldum.",
        },
    },
})
