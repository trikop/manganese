-- Enriched Manganese for Krastorio2
local util = require("data-util");

if mods["Krastorio2"] then
data:extend(
{
  {
    type = "item",
    name = "enriched-manganese",
    icon_size = 64,
    icon = "__manganese__/graphics/icons/enriched-manganese.png",
    icon_mipmaps = 3,
    pictures = {
      {filename="__manganese__/graphics/icons/enriched-manganese.png", size=64, scale=0.5},
      {filename="__manganese__/graphics/icons/enriched-manganese-1.png", size=64, scale=0.5},
      {filename="__manganese__/graphics/icons/enriched-manganese-2.png", size=64, scale=0.5},
      {filename="__manganese__/graphics/icons/enriched-manganese-3.png", size=64, scale=0.5},
    },
    subgroup = "raw-material",
    order = "e05-a[enriched-ores]-a1[enriched-manganese]",
    stack_size = util.get_stack_size(100)
  },
  {
    type = "recipe",
    name = "enriched-manganese",
    main_product = "enriched-manganese",
    icon = "__manganese__/graphics/icons/enriched-manganese.png",
    icon_size = 64,
    icon_mipmaps = 3,
    category = "chemistry",
    energy_required = 3,
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    allow_productivity = true,
	subgroup = "raw-material",
    ingredients =
    {
      {type = "fluid", name = "sulfuric-acid", amount = 3},
      {type = "fluid", name = "water", amount = 25, catalyst_amount = 25},
      {type = "item",  name = "manganese-ore", amount = 9}
    },
    results =
    { 
      {type = "item",  name = "enriched-manganese", amount = 5 or 6},
      {type = "fluid", name = "kr-dirty-water", amount = 25, catalyst_amount = 25},
    },
    crafting_machine_tint =
    {
      primary = {r = 0.721, g = 0.525, b = 0.043, a = 0.000},
      secondary = {r = 0.200, g = 0.680, b = 0.300, a = 0.357},
      tertiary = {r = 0.690, g = 0.768, b = 0.870, a = 0.000}, 
      quaternary = {r = 0.0, g = 0.980, b = 0.603, a = 0.900}
    },
    order = "e03[enriched-manganese]"
  },
  {
      type = "recipe",
      name = "enriched-manganese-plate",
      icons =
      {
        { icon = "__manganese__/graphics/icons/manganese-plate.png", icon_size = 64, icon_mipmaps = 3 },
        { icon = "__manganese__/graphics/icons/enriched-manganese.png", icon_size = 64, icon_mipmaps = 3, scale=0.25, shift= {-8, -8}},
      },
      category = "smelting",
      energy_required = 16,
      enabled = false,
      always_show_made_in = true,
      always_show_products = true,
      allow_productivity = true,
      ingredients = 
      {
        {type="item", name="enriched-manganese", amount=5}
      },
      results = {{type="item", name="manganese-plate", amount=12}},
      order = "b[manganese-plate]-b[enriched-manganese-plate]"
  },	
	{
		type = "recipe",
		name = "dirty-water-filtration-manganese",
		category = "kr-fluid-filtration",
		icons =
		{
			{
				icon = data.raw.fluid["kr-dirty-water"].icon,
				icon_size = data.raw.fluid["kr-dirty-water"].icon_size
			},
			{
				icon = data.raw.item["manganese-ore"].icon,
				icon_size =	data.raw.item["manganese-ore"].icon_size,
				scale = 0.20 * (64/data.raw.item["manganese-ore"].icon_size),
				shift = {0, 4}
			}
		},
		energy_required = 2,
		enabled = false,
		allow_as_intermediate = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients =
		{
			{type = "fluid", name = "kr-dirty-water", amount = 100, catalyst_amount = 100},
		},
		results =
		{
			{type = "fluid", name = "water", amount = 90, catalyst_amount = 90},
			{type = "item",  name = "stone", probability = 0.30, amount = 1},
			{type = "item",  name = "manganese-ore", probability = 0.50, amount = 1},
		},
		crafting_machine_tint =
		{
			primary = {r = 0.60, g = 0.20, b = 0, a = 0.6},
			secondary = {r = 1.0, g = 0.843, b = 0.0, a = 0.9}
		},
		subgroup = "raw-material",
		order = "w013[dirty-water-filtration-manganese]"
	}
}
)
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "enriched-manganese" })
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "enriched-manganese-plate" })
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "dirty-water-filtration-manganese" })
end
