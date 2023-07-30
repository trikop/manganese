-- recipe & tech changes
--
local util = require("__manganese__.data-util");

util.add_effect("automation", {type = "unlock-recipe", recipe = "manganese-plate"})
util.add_unlock_force("automation", "manganese-plate")

