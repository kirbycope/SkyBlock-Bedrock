# Set the scoreboard so this only runs once
scoreboard players set global loaded 1

# [Calendar] Day
scoreboard objectives add day dummy
scoreboard players set World day 1
# [Calendar] Month
scoreboard objectives add month dummy
scoreboard players set World month 1
# [Calendar] Year
scoreboard objectives add year dummy
scoreboard players set World year 1

# [Clock] Time
scoreboard objectives add clock dummy

# [Quest Tracker]
scoreboard objectives add quest-id dummy

# [Sidebar] SKYBLOCK
scoreboard objectives add skyblock-sidebar dummy "§e§lSKYBLOCK"
scoreboard objectives setdisplay sidebar skyblock-sidebar

# [NPC] Jerry
summon villager 3 65 26 become_unskilled "§fJerry §eCLICK"
effect @e[name="§fJerry §eCLICK"] resistance 255 255 true

# [NPC] Cobblestone Minion
summon armor_stand -3 65 29 calmed_down "§7Cobblestone Minion"
replaceitem entity @e[name="§7Cobblestone Minion"] slot.armor.head 0 skull 1
replaceitem entity @e[name="§7Cobblestone Minion"] slot.armor.chest 0 leather_chestplate 1
replaceitem entity @e[name="§7Cobblestone Minion"] slot.armor.legs 0 leather_leggings 1
replaceitem entity @e[name="§7Cobblestone Minion"] slot.armor.feet 0 leather_boots 1
replaceitem entity @e[name="§7Cobblestone Minion"] slot.weapon.mainhand 0 stone_pickaxe 1
effect @e[name="§7Cobblestone Minion"] resistance 255 255 true

# Chest Menu - Menu Chest
summon skyblock:invisible_chest_minecart 0 64 0
