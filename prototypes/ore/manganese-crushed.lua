local util = require("__manganese__.data-util");

local icon = "__manganese__/graphics/icons/crushed-manganese.png"
local prereq = {}
if mods.Krastorio2 then
    category = "kr-crushing"
else
    category = "crafting"
end

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
    category = category,
    order = "d[crushed-manganese]",
    enabled = false,
    energy_required = 21,
    ingredients = {{type="item", name = "manganese-plate", amount = 1}}, 
    results = {{type="item", name = "crushed-manganese", amount = 20}},
},
})


