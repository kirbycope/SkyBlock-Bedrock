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

# [Chest Menu] Item Count
scoreboard objectives add menu_carts dummy

# [Quest Tracker]
scoreboard objectives add quest_id dummy
scoreboard players add @a quest_id 0

# [Sidebar] SKYBLOCK
scoreboard objectives add skyblock_sidebar dummy "§e§lSKYBLOCK"
scoreboard objectives setdisplay sidebar skyblock_sidebar

# [NPC] Jerry
summon villager 3 65 26 become_unskilled "§fJerry §eCLICK"
tp @e[name="§fJerry §eCLICK"] 3 65 26 facing 0 64 0
effect @e[name="§fJerry §eCLICK"] resistance 255 255 true

# [NPC] Cobblestone Minion
summon skyblock:small_armor_stand -3 65 29 minecraft:entity_spawned "§7Cobblestone Minion"
tp @e[name="§7Cobblestone Minion"] -3 65 29 facing 0 64 0
replaceitem entity @e[name="§7Cobblestone Minion"] slot.armor.head 0 skyblock:cobblestone_helmet 1
replaceitem entity @e[name="§7Cobblestone Minion"] slot.armor.chest 0 leather_chestplate 1
replaceitem entity @e[name="§7Cobblestone Minion"] slot.armor.legs 0 leather_leggings 1
replaceitem entity @e[name="§7Cobblestone Minion"] slot.armor.feet 0 leather_boots 1
replaceitem entity @e[name="§7Cobblestone Minion"] slot.weapon.mainhand 0 stone_pickaxe 1
effect @e[name="§7Cobblestone Minion"] resistance 255 255 true
