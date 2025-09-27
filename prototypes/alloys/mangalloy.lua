local util = require("__manganese__.data-util");

local category = {}
if mods.Krastorio2 then 
    category = "smelting"
else
    category = "crafting"
end

local icon = "__manganese__/graphics/icons/mangalloy.png"
local prereq = {}
data:extend({
{
    type = "item",
    name = "mangalloy",
    icon = icon,
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "b[mangalloy]",
    stack_size = util.get_stack_size(100),
},
{
    type = "recipe",
    name = "mangalloy",
    category = category,
    order = "d[mangalloy]",
    enabled = false,
    energy_required = 13,
    ingredients = {
        {type="item", name = "manganese-plate", amount = 1}, 
        {type="item", name = "iron-plate", amount = 9}
    },
    results = {{type = "item", name = "mangalloy", amount = 5}},
},
{
    type = "technology",
    name = "mangalloy",
    icon = icon,
    icon_size = 64,
    order = "c",
    effects = {
    { type = "unlock-recipe", recipe = "mangalloy" },
    },
    unit = {
    count = 30, time = 10,
    ingredients = {{"automation-science-pack", 1}},
    },
    prerequisites = {"steel-processing"},
},
})
util.add_unlock_force("mangalloy", "mangalloy")
if mods.bzfoundry and data.raw.item["foundry"] then util.set_to_founding("mangalloy", {force=true}) end

util.add_prerequisite("railway", "mangalloy")
util.replace_ingredient("rail", "steel-plate", "mangalloy")
util.replace_ingredient("rail-ramp", "steel-plate", "mangalloy")
util.replace_ingredient("rail-support", "steel-plate", "mangalloy")

if mods["aai-industry"] then
    util.replace_ingredient("area-mining-drill", "steel-plate", "mangalloy")
end
