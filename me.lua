local me = {}

me.name = "manganese"
me.manganese_ore = "manganese-ore"
me.manganese_plate = "manganese-plate"
me.recipes = {me.manganese_plate, "enriched-manganese-plate", "enriched-manganese", "manganese-smelting-vulcanite", "molten-manganese", "enriched-manganese-smelting-vulcanite"}


function me.get_setting(name)
  if settings.startup[name] == nil then
    return nil
  end
  return settings.startup[name].value
end
me.bypass = {}
if me.get_setting(me.name.."-recipe-bypass") then 
  for recipe in string.gmatch(me.get_setting(me.name.."-recipe-bypass"), '[^",%s]+') do
    me.bypass[recipe] = true
  end
end

function me.add_modified(name) 
  if me.get_setting(me.name.."-list") then 
    table.insert(me.list, name)
  end
end


return me

