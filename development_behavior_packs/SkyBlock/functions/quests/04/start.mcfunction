# Announce new objective
tellraw @a {"rawtext":[{"text":"§6§lNEW OBJECTIVE"},{"text":"\n"},{"text":"§r§fTalk to Jerry"}]}

# Set the Quest ID
scoreboard players set @a quest-id 4
# Set the Quest Objective
scoreboard objectives add talked-to-jerry dummy

# [Bossbar] "Objective: Talk to Jerry"
#bossbar add skyblock:bossbar-villager [{"text":"Objective: "},{"text":"Talk to Jerry","color":"yellow"}]
#bossbar set skyblock:bossbar-villager color yellow
#bossbar set skyblock:bossbar-villager value 100
#bossbar set skyblock:bossbar-villager players @a
