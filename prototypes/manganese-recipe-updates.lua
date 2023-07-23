-- recipe & tech changes
--
local util = require("__manganese__.data-util");

util.add_effect("automation", {type = "unlock-recipe", recipe = "manganese-plate"})
util.add_unlock_force("automation", "manganese-plate")

if mods["space-exploration"] then
  util.add_product("se-scrap-recycling", {name="manganese-ore", amount=1, probability=0.1})
  data.raw.item["se-space-thermodynamics-laboratory"].ingredient_count = 24, --made it 24, so it won't conflict with another mod hopefully xD
  util.add_ingredient("se-experimental-alloys-data","manganese-plate", 1)
end