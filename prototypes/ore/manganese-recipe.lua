-- manganese smelting

local util = require("__manganese__.data-util");

if (not mods["pyrawores"] and not mods["bobplates"] and not mods["angelssmelting"] and not mods["IndustrialRevolution"]) then
data:extend({
  {
    type = "recipe",
    name = util.me.manganese_plate,
    category = "smelting",
    order = "d[manganese-plate]",
    icons = (mods["Krastorio2"] and
        {
          { icon = "__manganese__/graphics/icons/manganese-plate.png", icon_size = 64, icon_mipmaps = 3, },
          { icon = "__manganese__/graphics/icons/manganese-ore.png", icon_size = 64, icon_mipmaps = 3, scale=0.25, shift= {-8, -8}},
        } or {
          { icon = "__manganese__/graphics/icons/manganese-plate.png", icon_size = 64, icon_mipmaps = 3, },
        }
),
    normal = (mods["Krastorio2"] and
        {
          main_product = util.me.manganese_plate,
          enabled = false,
          energy_required = 10,
          ingredients = {{"manganese-ore", 10}},
          results = {
            {type="item", name = util.me.manganese_plate, amount=10},
          },
        } or
        {
          main_product = util.me.manganese_plate,
          enabled = false,
          energy_required = 1,
          ingredients = {{"manganese-ore", 1}},
          results = {
            {type="item", name = util.me.manganese_plate, amount=1},
          },
        }),
    expensive =
    {
      main_product = util.me.manganese_plate,
      enabled = false,
      energy_required = 12.8,
      ingredients = {{"manganese-ore", 4}},
      results = {
        {type="item", name = util.me.manganese_plate, amount=2},
      },
    }
  },
  {
    type = "item",
    name = util.me.manganese_plate,
    icon = "__manganese__/graphics/icons/manganese-plate.png",
    icon_size = 64, icon_mipmaps = 3,
    subgroup = "raw-material",
    order = "b[manganese-plate]",
    stack_size = util.get_stack_size(100)
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
    ingredients = {{"automation-science-pack", 1}},
    },
    prerequisites = {},
},
  mods["TheBigFurnace"] and {
    type = "recipe",
    name = "big-manganese-plate",
    icons = { { icon = "__manganese__/graphics/icons/manganese-plate.png", icon_size = 64 }, },
    subgroup = "raw-material",
    category = "big-smelting",
    order = "d[manganese-plate]",
    normal =
    {
      enabled = true,
      energy_required = 5,
      ingredients = {{"manganese-ore", 100}},
      results = {
        {type="item", name = util.me.manganese_plate, amount=100},
      }
    },
    expensive =
    {
      enabled = true,
      energy_required = 10,
      ingredients = {{"manganese-ore", 100}},
      results = {
        {type="item", name = util.me.manganese_plate, amount=50},
      }
    }
  } or nil,
})
end

util.add_prerequisite("steel-processing", "manganese-smelting")