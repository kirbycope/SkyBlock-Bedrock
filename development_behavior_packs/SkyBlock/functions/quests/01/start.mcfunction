# Announce new objective
tellraw @a {"rawtext":[{"text":"§6§lNEW OBJECTIVE"},{"text":"\n"},{"text":"§r§fBreak a log"}]}

# Set the Quest ID
scoreboard players set @a quest_id 1
# Set the Quest Objective
# n/a (covered in Collections)

# [Bossbar] "Objective: Break a log"
summon skyblock:bossbar ~ ~60 ~ skyblock:full "Objective: §eBreak a log"
