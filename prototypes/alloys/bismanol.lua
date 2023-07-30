local util = require("__manganese__.data-util");

-- util.add_ingredient("bob-rubber","bismuth-plate", 1)
-- util.add_product("bob-rubber", {type="item", name="bismuth-plate", amount=1, probability=0.4})
-- util.set_main_product("bob-rubber", "rubber")
if data.raw.item["bismuth-plate"] then 
    local icon = "__manganese__/graphics/icons/bismanol.png"
    local prereq = {}
    data:extend({
    {
        type = "item",
        name = "bismanol",
        icon = icon,
        icon_size = 128,
        subgroup = "intermediate-product",
        order = "b[bismanol]",
        stack_size = util.get_stack_size(100),
    },
    {
        type = "recipe",
        name = "bismanol",
        category = "smelting",
        order = "d[bismanol]",
        enabled = false,
        energy_required = 1,
        ingredients = {{"manganese-plate", 5}, {"bismuth-plate", 5}, {"iron-plate", 1}}, 
        results = {{type = "item", name = "bismanol", amount = 5}},
    },
    {
        type = "technology",
        name = "bismanol",
        icon = icon,
        icon_size = 128,
        effects = {
        { type = "unlock-recipe", recipe = "bismanol" },
        },
        unit = {
        count = 60, time = 10,
        ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
        },
        prerequisites = {"automation"},
    },
    })
    util.add_unlock_force("bismanol", "bismanol")
    if mods.bzfoundry and data.raw.item["foundry"] then util.set_to_founding("bismanol", {force=true}) end
    
    if mods["aai-industries"] then
        util.add_prerequisite("electricity", "bismanol")
        util.add_ingredient("small-electric-motor","bismanol", 1)
    end
end
    --neodium better version for small electric motors