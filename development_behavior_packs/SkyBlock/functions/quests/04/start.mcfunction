# Announce new objective
tellraw @a {"rawtext":[{"text":"§6§lNEW OBJECTIVE"},{"text":"\n"},{"text":"§r§fTalk to Jerry"}]}

# Set the Quest ID
scoreboard players set @a quest_id 4
# Set the Quest Objective
scoreboard objectives add talked-to-jerry dummy

# [Bossbar] "Objective: Talk to Jerry"
summon skyblock:bossbar ~ ~60 ~ skyblock:full "Objective: §eTalk to Jerry"
