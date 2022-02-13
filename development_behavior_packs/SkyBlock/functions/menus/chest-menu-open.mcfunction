# Reset menu minecart counter
scoreboard players set @a menu_carts 0

# Set score to 1 if a menu minecart exists
execute @e[type=skyblock:invisible_chest_minecart,c=1] ~ ~ ~ scoreboard players set @a menu_carts 1

# Execute some code if score is 0
execute @a[scores={menu_carts=0}] ~ ~ ~ execute @a[tag=init] ~ ~ ~ summon skyblock:invisible_chest_minecart "SkyBlock Menu" ~ ~1.2 ~

# Execute some code if score is 1
execute @a[scores={menu_carts=1}] ~ ~ ~ execute @a[tag=init] ~ ~ ~ tp @e[type=skyblock:invisible_chest_minecart] ~ ~1.2 ~

# Make the Chest Minecart unbreakable
effect @e[type=skyblock:invisible_chest_minecart] resistance 255 255 true

## SkyBlock Menu ##
replaceitem entity @e[type=skyblock:invisible_chest_minecart] slot.inventory 4 skull 1 3
replaceitem entity @e[type=skyblock:invisible_chest_minecart] slot.inventory 10 diamond_sword
replaceitem entity @e[type=skyblock:invisible_chest_minecart] slot.inventory 11 painting
replaceitem entity @e[type=skyblock:invisible_chest_minecart] slot.inventory 12 book
replaceitem entity @e[type=skyblock:invisible_chest_minecart] slot.inventory 13 emerald
replaceitem entity @e[type=skyblock:invisible_chest_minecart] slot.inventory 14 writable_book
replaceitem entity @e[type=skyblock:invisible_chest_minecart] slot.inventory 15 clock
replaceitem entity @e[type=skyblock:invisible_chest_minecart] slot.inventory 16 chest
replaceitem entity @e[type=skyblock:invisible_chest_minecart] slot.inventory 20 potion
replaceitem entity @e[type=skyblock:invisible_chest_minecart] slot.inventory 21 bone
replaceitem entity @e[type=skyblock:invisible_chest_minecart] slot.inventory 22 crafting_table
replaceitem entity @e[type=skyblock:invisible_chest_minecart] slot.inventory 23 leather_chestplate
