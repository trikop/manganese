local util = require("__manganese__.data-util");

local icon = "__manganese__/graphics/icons/crushed-manganese.png"
local prereq = {}
data:extend({
{
    type = "item",
    name = "crushed-manganese",
    icon = icon,
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "b[crushed-manganese]",
    stack_size = 100,
},
{
    type = "recipe",
    name = "crushed-manganese",
    category = "smelting",
    order = "d[crushed-manganese]",
    enabled = false,
    energy_required = 1,
    ingredients = {{"manganese-plate", 1}}, 
    results = {{"crushed-manganese", 100}},
},
})

util.add_ingredient("steel-plate", "crushed-manganese", 1)
util.add_unlock_force("steel-processing", "crushed-manganese")