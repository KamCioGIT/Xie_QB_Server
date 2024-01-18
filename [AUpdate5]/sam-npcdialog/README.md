# ALL MADE BY Ayazwai
# Discord: Ayazwai#3900 - Ayazwai
# Linkedin: https://www.linkedin.com/in/ayaz-ekrem-770305212/
# Instagram: https://www.instagram.com/ayaz.ekremm/
# Discord Server: https://discord.com/invite/YanMPNg8Zn

# HOW TO USE EXPORT OR TRIGGER
-it only says how you can add this content to a new coordinate using export or trigger.

```

export or wais:add:dialog

---@entity - entity id
---@label - label of the dialog. (it is important to be unique)
---@coords - vector4(x, y, z, h)
---@distance - distance to show the marker
---@markerdistance - distance to show circle marker
---@modal_style - modal style (error, success, warning, question or np)
---@interactive - interactive style (
    type -- fivem controls or target.
    label,  -- label of the interactive
    key_label,  -- key label of the interactive
    icon  -- icon of the interactive
)
---@name - name of the npc (firstname, lastname)
---@title - title of the npc
---@question - question of the npc
---@options - options of the npc
---@option1-2-3-4-5-6-7.... - options of the npc (
    button - button of the option
    label - label of the option
    trigger - trigger of the option
    eventType - event type of the option (client or server)
    selected - selected of the option - don't touch it
)

--- return (
    added ? @boolean
    message ? @string
)

export["sam-npcdialog"]:addExtraDialog({
    entity = 1,
    label = 'test',
    coords = vector4(-184.219772, -1292.703247, 31.285034, 286.299194),
    distance = 2,
    markerdistance = 6,
    modal_style = 'error',
    interactive = {
        type = 38,
        label = 'test',
        key_label = 'E',
        icon = 'fa-solid fa-people-arrows',
    },
    name = {
        firstname = 'Frank',
        lastname = 'Miller',
    },
    title = 'police',
    question = 'You want to work with us? Being a cop is hard. You have to know the law well and know how to fight criminals. If you want to work with us as a trainee and learn many things from the beginning, I can say yes!',
    options = {
        option1 = {
            button = 1,
            label = 'Yes, Start as an assistant.',
            trigger = 'setNewJob',
            eventType = "client",
            selected = false,
        },
        option2 = {
            button = 2,
            label = 'I don\'t trust myself',
            selected = false,
        },
    },
})
```