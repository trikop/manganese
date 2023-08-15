local util = require("__manganese__.data-util");

local category = {}
local ingredients = {}
if mods.Krastorio2 then 
    category = "smelting"
    ingredients = {{"basic-tech-card", 1}}
else
    category = "crafting"
    ingredients = {{"automation-science-pack", 1}}
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
        ingredients = {{"manganese-plate", 5}, {"bismuth-plate", 5}, {"iron-plate", 1}}, 
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
        ingredients = ingredients,
        },
        prerequisites = {},
    },
    })
    util.add_unlock_force("bismanol", "bismanol")
    if mods.bzfoundry and data.raw.item["foundry"] then util.set_to_founding("bismanol", {force=true}) end

    if mods["aai-industry"] then
        util.add_prerequisite("electricity", "bismanol")
        util.add_ingredient("electric-motor","bismanol", 1)
    else
        util.add_prerequisite("automation", "bismanol")
    end
end
    --neodium better version for small electric motors