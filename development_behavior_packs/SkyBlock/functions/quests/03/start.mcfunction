# Announce new objective
tellraw @a {"rawtext":[{"text":"§6§lNEW OBJECTIVE"},{"text":"\n"},{"text":"§r§fCraft a wood pickaxe"}]}

# Set the Quest ID
scoreboard players set @a quest_id 3
# Set the Quest Objective
scoreboard objectives add pickaxe_crafted dummy
scoreboard players set @a pickaxe_crafted 0

# [Bossbar] "Objective: Craft a wood pickaxe"
summon skyblock:bossbar ~ ~60 ~ skyblock:full "Objective: §eCraft a wood pickaxe"
