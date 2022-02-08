# Set the scoreboard so this only runs once
scoreboard objectives add initialized dummy
scoreboard players set World initialized 1

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
scoreboard objectives add skyblock-sidebar dummy
#{"text":"SKYBLOCK", "color":"yellow","bold": true}
scoreboard objectives setdisplay sidebar skyblock-sidebar
#team add sidebar-1
#team add sidebar-2
#team add sidebar-3
#team add sidebar-4
#team add sidebar-5
#team add sidebar-6
#team add sidebar-7
#team add sidebar-8
#team add sidebar-9
#team join sidebar-9 ☀
#team join sidebar-9 ☽
#team add sidebar-10
#team add sidebar-11
#team add sidebar-12

# [NPC] Jerry
summon villager 3 65 26
#{CustomNameVisible:1,CustomName:'[{"text":"Jerry ","color":"white"},{"text":"CLICK","color":"yellow"}]',Attributes:[{Name:"generic.knockback_resistance",Base:1},{Name:"generic.movement_speed",Base:.001}],Invulnerable:1b,VillagerData:{type:"plains",profession:"nitwit",level:99},Rotation:[180f,0f]}

# [NPC] Cobblestone Minion
summon armor_stand -3 65 29
#{Silent:1b,NoGravity:1b,ShowArms:1b,Invulnerable:1b,NoBasePlate:1b,Pose:{Head:[23f,0f,0f],LeftLeg:[339f,0f,0f],RightLeg:[15f,0f,0f],LeftArm:[19f,11f,0f],RightArm:[326f,28f,0f]},ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6240048}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3231850}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5908264}}},{id:"player_head",Count:1b,tag:{SkullOwner:{Id:[I;1085844244,-1446688870,-1996481596,2086116866],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjljMzhmZTRmYzk4YTI0ODA3OWNkMDRjNjViNmJmZjliNDUwMTdmMTY0NjBkYWIzYzM0YzE3YmZjM2VlMWQyZiJ9fX0="}]}}}}],DisabledSlots:4144959,Rotation:[180f,0f],CustomNameVisible:1,CustomName:'{"text":"Cobblestone Minion","color":"gray","bold":false}',Small:1b,HandItems:[{id:"stone_pickaxe",Count:1b}]}
