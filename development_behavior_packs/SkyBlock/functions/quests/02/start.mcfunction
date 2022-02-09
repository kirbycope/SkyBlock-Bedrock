# Announce new objective
tellraw @a {"rawtext":[{"text":"§6§lNEW OBJECTIVE"},{"text":"\n"},{"text":"§r§fCraft a workbench"}]}

# Set the Quest ID
scoreboard players set @a quest-id 2
# Set the Quest Objective
scoreboard objectives add table-crafted dummy

# [Bossbar] "Objective: Craft a workbench"
#bossbar add skyblock:bossbar-workbench [{"text":"Objective: "},{"text":"Craft a workbench","color":"yellow"}]
#bossbar set skyblock:bossbar-workbench color yellow
#bossbar set skyblock:bossbar-workbench value 100
#bossbar set skyblock:bossbar-workbench players @a
