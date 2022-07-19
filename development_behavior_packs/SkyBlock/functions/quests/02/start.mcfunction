# Announce new objective
tellraw @a {"rawtext":[{"text":"§6§lNEW OBJECTIVE"},{"text":"\n"},{"text":"§r§fCraft a workbench"}]}

# Set the Quest ID
scoreboard players set @a quest_id 2
# Set the Quest Objective
scoreboard objectives add table_crafted dummy
scoreboard players set @a table_crafted 0

# [Bossbar] "Objective: Craft a workbench"
summon skyblock:bossbar ~ ~60 ~ skyblock:full "Objective: §eCraft a workbench"
