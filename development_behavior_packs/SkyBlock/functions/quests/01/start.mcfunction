# Announce new objective
tellraw @a {"rawtext":[{"text":"§6§lNEW OBJECTIVE"},{"text":"\n"},{"text":"§r§fBreak a log"}]}

# Set the Quest ID
scoreboard players set @a quest-id 1
# Set the Quest Objective
# n/a (covered in Collections)

# [Bossbar] "Objective: Break a log"
#bossbar add skyblock:bossbar-log [{"text":"Objective: "},{"text":"Break a log","color":"yellow"}]
#bossbar set skyblock:bossbar-log color yellow
#bossbar set skyblock:bossbar-log value 100
#bossbar set skyblock:bossbar-log players @a
