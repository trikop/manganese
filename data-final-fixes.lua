require("prototypes/manganese-recipe-modules")

local util = require("__manganese__.data-util");
if util.me.get_setting("manganese-disable-manganese-as-smelting-byproduct") == false then
    if mods.Krastorio2 then
        util.add_product("iron-plate", {type="item", name="manganese-plate", amount=1, probability=0.33})
        util.add_product("enriched-iron", {type="item", name="manganese-ore", amount=1, probability=0.4})
        util.add_or_add_to_ingredient("iron-plate", "iron-ore", 2)
        util.add_or_add_to_ingredient("enriched-iron", "iron-ore", 2)
        util.set_main_product("iron-plate", "iron-plate")

    else
        util.add_product("iron-plate", {type="item", name="manganese-plate", amount=1, probability=0.033})
        util.set_main_product("iron-plate", "iron-plate")
    end

    if mods["space-exploration"] then 
        util.add_to_product("se-core-fragment-omni", "manganese-ore", -5)
    end
end