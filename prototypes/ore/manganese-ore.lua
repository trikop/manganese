local resource_autoplace = require("resource-autoplace");
local noise = require('noise');
local util = require("__manganese__.data-util");

data:extend({
  {
    type = "autoplace-control",
    category = "resource",
    name = "manganese-ore",
    richness = true,
    order = "b-e"
  },
  {
    type = "noise-layer",
    name = "manganese-ore"
  },
  {
    type = "item",
    name = "manganese-ore",
    icon_size = 64,
    icon_mipmaps = 4,
    icon = "__manganese__/graphics/icons/manganese-ore.png",
    pictures = {
      {filename="__manganese__/graphics/icons/manganese-ore.png", size=64, scale=0.25},
      {filename="__manganese__/graphics/icons/manganese-ore-1.png", size=64, scale=0.25},
      {filename="__manganese__/graphics/icons/manganese-ore-2.png", size=64, scale=0.25},
      {filename="__manganese__/graphics/icons/manganese-ore-3.png", size=64, scale=0.25},
    },
    subgroup = "raw-resource",
    order = "t-c-a",
    stack_size = util.get_stack_size(50)
  },
  {
    type = "resource",
    name = "manganese-ore",
    icon = "__manganese__/graphics/icons/manganese-ore.png",
    icon_size = 64,
    flags = {"placeable-neutral"},
    order="a-b-a",
    map_color = {r=0.43, g=0.18, b=0.06},
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      hardness = 2.25,
      mining_particle = "iron-ore-particle",
      mining_time = 1,
      results = 
      {
        {type="item", name="manganese-ore", amount=1},
      }
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "manganese-ore",
      order = "b-z",
      base_density = 4,
      base_spots_per_km2 = 1,
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 1,
      starting_rq_factor_multiplier = 1,
    },

    stage_counts = {15000, 10000, 5000, 3000, 1500, 500, 150, 80},
        stages =
        {
          sheet =
          {
      filename = "__manganese__/graphics/ores/manganese-ore.png",
      priority = "extra-high",
      size = 64,
      frame_count = 8,
      variation_count = 8,
      hr_version =
      {
      filename = "__manganese__/graphics/ores/hr-manganese-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
          }
    },
  },
})
