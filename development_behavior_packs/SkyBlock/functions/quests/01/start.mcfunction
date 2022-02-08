# Announce new objective
tellraw @a ["",{"text":"NEW OBJECTIVE","bold":true,"color":"gold"},{"text":"\n"},{"text":"Break a log","color":"white"}]

# Set the Quest ID
scoreboard players set @a quest-id 1
# Set the Quest Objective
# n/a (covered in Collections)

# [Bossbar] "Objective: Break a log"
#bossbar add skyblock:bossbar-log [{"text":"Objective: "},{"text":"Break a log","color":"yellow"}]
#bossbar set skyblock:bossbar-log color yellow
#bossbar set skyblock:bossbar-log value 100
#bossbar set skyblock:bossbar-log players @a
