-- Additional recipes if Space Exploration mod is enabled
local util = require("data-util");

if mods["space-exploration"] then
  se_delivery_cannon_recipes[util.me.manganese_ore] = {name= util.me.manganese_ore}
  se_delivery_cannon_recipes[util.me.manganese_plate] = {name= util.me.manganese_plate}
  util.se_landfill({ore="manganese-ore"})

  if util.se6() then
  util.se_matter({ore="manganese-ore", energy_required=1, quant_out=10, stream_out=60})
  data:extend({
  {
    type = "item-subgroup",
    name = "manganese",
    group = "resources",
    order = "a-h-z-a",
  }
  })
  util.set_item_subgroup("manganese-plate", "manganese")
  data:extend({
  {
    type = "item",
    name = "manganese-ingot",
    icons = {{icon = "__manganese__/graphics/icons/manganese-ingot.png", icon_size = 128}},
    order = "b-b",
    stack_size = 50,
    subgroup = "manganese",
  },
  {
    type = "fluid",
    name = "molten-manganese",
    default_temperature = 600,
    max_temperature = 600,
    base_color = {r=121, g=80, b=80},
    flow_color = {r=121, g=80, b=80},
    icons = {{icon = "__manganese__/graphics/icons/molten-manganese.png", icon_size = 128}},
    order = "a[molten]-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false,
    subgroup = "fluid",
  },
  {
    type = "recipe",
    category = "smelting",
    name = "molten-manganese",
    main_product = "molten-manganese",
    subgroup = "manganese",
    results = {
      {type = "fluid", name = "molten-manganese", amount = mods.Krastorio2 and 750 or 900},
    },
    energy_required = 60,
    ingredients = {
      {type= "item", name = util.k2() and "enriched-manganese" or "manganese-ore", amount = 24},
      {type = "fluid", name = "se-pyroflux", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-a"
  },
  {
    type = "recipe",
    name = "manganese-ingot",
    category = "casting",
    results = {{type = "item", name = "manganese-ingot", amount = 1}},
    energy_required = 25,
    ingredients = {
      {type = "fluid", name = "molten-manganese", amount = 250},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    category = "crafting",
    name = "manganese-ingot-to-plate",

    icons = {
      {icon = "__manganese__/graphics/icons/manganese-plate.png", icon_size = 64, icon_mipmaps = 3},
      {icon = "__manganese__/graphics/icons/manganese-ingot.png", icon_size = 128, scale = 0.125, shift = {-8, -8}},
    },
    results = {
      {type = "item", name = "manganese-plate", amount = 10},
    },
    energy_required = 5,
    ingredients = {
      {type = "item", name = "manganese-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-c-b"
  },
  })
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "molten-manganese"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "manganese-ingot"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "manganese-ingot-to-plate"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "molten-manganese"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "manganese-ingot"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "manganese-ingot-to-plate"})
  if mods["Krastorio2"] then
    util.set_item_subgroup("enriched-manganese", "manganese")
    data.raw.recipe["enriched-manganese-plate"].order= "d[manganese-plate]"
    se_delivery_cannon_recipes["enriched-manganese"] = {name= "enriched-manganese"}
  end
  se_delivery_cannon_recipes["manganese-ingot"] = {name="manganese-ingot"}
else
  data.raw.item["manganese-plate"].subgroup = "plates"
  if mods["Krastorio2"] then
    data:extend({
    {
      type = "recipe",
      name = "enriched-manganese-smelting-vulcanite",
      category = "smelting",
      order = "d[manganese-plate]",
      energy_required = 24,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {type = "item", name = "enriched-manganese", amount = 8},
        {type = "item", name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {type = "item", name = util.me.manganese_plate, amount = 12},
      },
      icons =
      {
        { icon = "__manganese__/graphics/icons/manganese-plate.png", icon_size = 64 },
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      },
      
    },
    })
    table.insert(data.raw.technology["se-processing-vulcanite"].effects,
        {type = "unlock-recipe", recipe= "enriched-manganese-smelting-vulcanite"})
    data.raw.recipe["enriched-manganese-plate"].order= "d[manganese-plate]"
    se_delivery_cannon_recipes["enriched-manganese"] = {name= "enriched-manganese"}
  else
    data:extend({
    {
      type = "recipe",
      name = "manganese-smelting-vulcanite",
      category = "smelting",
      subgroup = "plates",
      order = "d[manganese-plate]",
      energy_required = 24,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {type = "item", name = "manganese-ore", amount = 8},
        {type = "item", name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {type = "item", name = util.me.manganese_plate, 12},
      },
      icons =
      {
        { icon = "__manganese__/graphics/icons/manganese-plate.png", icon_size = 64, icon_mipmaps = 3 },
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, icon_mipmaps = 3, scale=0.25, shift= {-10, -10}},
      },

      
    },
    })
    table.insert(data.raw.technology["se-processing-vulcanite"].effects, 
        {type = "unlock-recipe", recipe= "manganese-smelting-vulcanite"})
  end
end
end
