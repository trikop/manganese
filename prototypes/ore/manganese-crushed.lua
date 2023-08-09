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
    category = "crafting",
    order = "d[crushed-manganese]",
    enabled = false,
    energy_required = 20,
    ingredients = {{"manganese-plate", 1}}, 
    results = {{"crushed-manganese", 20}},
},
})


