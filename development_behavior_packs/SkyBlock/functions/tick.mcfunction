# Initialize new players
execute as @a[tag=!init] at @s run function events/init-player


# ════ Collections ════ #

execute as @p at @s run execute as @e[name="Oak Log",rm=0,r=2] at @s run scoreboard players add @a oak_log_mined 1
execute as @p at @s run execute as @e[name="Oak Wood",rm=0,r=2] at @s run scoreboard players add @a oak_wood_mined 1

execute as @p[tag=!collected_wood,scores={oak_log_mined=1}] at @s run function collections/first-time
execute as @p[tag=!collected_wood,scores={oak_wood_mined=1}] at @s run function collections/first-time


# ════ NPCs ════ #

# Put Jerry in his place
tp @e[name="§fJerry §eCLICK"] 3 65 26

# ════ Menus ════ #

# Menu Star - Clear tossed stars
execute as @a[tag=init] at @s run kill @e[name="§aSkyBlock Menu §7(Right Click)"]


# ════ Quests ════ #

# 0 "Start"
execute as @a[scores={quest_id=0}] at @s run function quests/01/start

# 1 "Break a log"
execute as @a[scores={quest_id=1}] at @s run function quests/01/check-progress

# 2 "Craft a workbench"
execute as @a[scores={quest_id=2}] at @s run function quests/02/check-progress

# 3 "Craft a wood pickaxe"
execute as @a[scores={quest_id=3}] at @s run function quests/03/check-progress

# 4 "Talk to Jerry"
#execute @a[scores={quest_id=4}] ~ ~ ~ function quests/04/check-progress


# ════ UI Elements ════ #

# Sidebar - SKYBLOCK
execute as @a[tag=init] at @s run function sidebar/skyblock

# Actionbar - Health, Defense, and Mana
execute as @a[tag=init] at @s run function actionbar/health-defense-mana
