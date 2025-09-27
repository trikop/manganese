require("prototypes/ore/manganese-recipe-modules")

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
end

if mods["space-exploration"] then 
    util.add_to_product("se-core-fragment-omni", "manganese-ore", -5)
    util.add_product("se-scrap-recycling", {type = "item", name="manganese-ore", amount=1, probability=0.1})
    data.raw.item["se-space-thermodynamics-laboratory"].ingredient_count = 24, --made it 24, so it won't conflict with another mod hopefully xD
    util.add_ingredient("se-experimental-alloys-data", "manganese-plate", 1)
    util.replace_ingredient("se-space-rail", "steel-plate", "mangalloy")
    util.replace_ingredient("se-space-rail-ramp", "steel-plate", "mangalloy")
    util.replace_ingredient("se-space-rail-support", "steel-plate", "mangalloy")
end

if mods.Krastorio2 then
    util.replace_ingredient("rail", "kr-steel-beam", "mangalloy")
    util.replace_ingredient("kr-quarry-drill", "kr-steel-beam", "mangalloy")
    util.replace_ingredient("kr-air-purifier", "kr-steel-beam", "mangalloy")
    util.replace_ingredient("kr-steel-pump", "kr-steel-beam", "mangalloy")
    util.add_or_add_to_ingredient("mangalloy", "crushed-manganese", 5)
    util.add_to_product("mangalloy", "mangalloy", -2)
end

for i, entity in pairs(data.raw.furnace) do
    if entity.result_inventory_size ~= nil and entity.result_inventory_size < 4 and util.contains(entity.crafting_categories, "smelting") then
      entity.result_inventory_size = 4
    end
  end