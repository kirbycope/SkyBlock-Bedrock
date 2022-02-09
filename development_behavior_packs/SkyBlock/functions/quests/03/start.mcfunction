# Announce new objective
tellraw @a {"rawtext":[{"text":"§6§lNEW OBJECTIVE"},{"text":"\n"},{"text":"§r§fCraft a wood pickaxe"}]}

# Set the Quest ID
scoreboard players set @a quest-id 3
# Set the Quest Objective
scoreboard objectives add pickaxe-crafted dummy

# [Bossbar] "Objective: Craft a wood pickaxe"
#bossbar add skyblock:bossbar-pickaxe [{"text":"Objective: "},{"text":"Craft a wood pickaxe","color":"yellow"}]
#bossbar set skyblock:bossbar-pickaxe color yellow
#bossbar set skyblock:bossbar-pickaxe value 100
#bossbar set skyblock:bossbar-pickaxe players @a
