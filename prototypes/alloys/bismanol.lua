local util = require("__manganese__.data-util");

local category = {}
local ingredients = {}
if mods.Krastorio2 then 
    category = "smelting"
else
    category = "crafting"
end

if data.raw.item["bismuth-plate"] then 
    local icon = "__manganese__/graphics/icons/bismanol.png"
    local prereq = {}
    data:extend({
    {
        type = "item",
        name = "bismanol",
        icon = icon,
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "b[bismanol]",
        stack_size = util.get_stack_size(100),
    },
    {
        type = "recipe",
        name = "bismanol",
        category = category,
        order = "d[bismanol]",
        enabled = false,
        energy_required = 30,
        ingredients = {
            {type="item", name = "manganese-plate", amount = 5},
            {type="item", name = "bismuth-plate", amount = 5},
            {type="item", name = "iron-plate", amount = 1}
        }, 
        results = {{type = "item", name = "bismanol", amount = 10}},
    },
    {
        type = "technology",
        name = "bismanol",
        icon = icon,
        order = "c",
        icon_size = 64,
        effects = {
        { type = "unlock-recipe", recipe = "bismanol" },
        },
        unit = {
        count = 30, time = 10,
        ingredients = {{"automation-science-pack", 1}},
        },
        prerequisites = {},
    },
    })
    util.add_unlock_force("bismanol", "bismanol")
    util.add_prerequisite("bismanol", "manganese-smelting")
    if mods["aai-industry"] then
        util.add_prerequisite("electricity", "bismanol")
        util.add_ingredient("electric-motor","bismanol", 1)
    else
        util.add_prerequisite("automation", "bismanol")
        util.add_ingredient("electric-engine-unit","bismanol", 1)
    end

end
    --neodium better version for small electric motors