-- manganese smelting

local util = require("__manganese__.data-util");
local item_sounds = require('__base__.prototypes.item_sounds')

if (not mods["pyrawores"] and not mods["bobplates"] and not mods["angelssmelting"] and not mods["IndustrialRevolution"]) then
data:extend({
  {
    type = "recipe",
    name = util.me.manganese_plate,
    category = "smelting",
    order = "d[manganese-plate]",
    icons = (util.k2() and
        {
          { icon = "__manganese__/graphics/icons/manganese-plate.png", icon_size = 64, icon_mipmaps = 3, },
          { icon = "__manganese__/graphics/icons/manganese-ore.png", icon_size = 64, icon_mipmaps = 3, scale=0.25, shift= {-8, -8}},
        } or {
          { icon = "__manganese__/graphics/icons/manganese-plate.png", icon_size = 64, icon_mipmaps = 3, },
        }
),
    main_product = util.me.manganese_plate,
    enabled = false,
    allow_productivity = true,
    energy_required = util.k2() and 16 or 1.6,
    ingredients = (util.k2() and {util.item("manganese-ore", 10)} or {util.item("manganese-ore", 1)}),
    results = {
      {
        type="item",
        name = util.me.manganese_plate,
        amount= util.k2() and 10 or 1
      },
    },
  },
  {
    type = "item",
    name = util.me.manganese_plate,
    icon = "__manganese__/graphics/icons/manganese-plate.png",
    icon_size = 64, icon_mipmaps = 3,
    subgroup = "raw-material",
    order = "b[manganese-plate]",
    stack_size = util.get_stack_size(100),
    weight = 2*kg,
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
  },
  {
    type = "technology",
    name = "manganese-smelting",
    icon = "__manganese__/graphics/icons/manganese-plate.png",
    icon_size = 64,
    order = "c",
    effects = {
    { type = "unlock-recipe", recipe = util.me.manganese_plate },
    { type = "unlock-recipe", recipe = "crushed-manganese" },
    },
    unit = {
    count = 30, time = 5,
    ingredients = util.k2() and (util.se6() and {{"kr-basic-tech-card", 1}}) or {{"automation-science-pack", 1}},
    },
    prerequisites = {},
},
})
end

util.add_prerequisite("steel-processing", "manganese-smelting")
if util.k2() and not util.se6() then
  util.add_prerequisite("manganese-smelting", "automation-science-pack")
end