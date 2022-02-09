# Initialize new players
execute @a[tag=!init] ~ ~ ~ function events/init-player


# ════ Collections ════ #
execute @a[tag=!collected_wood,scores={oak_log_mined=1}] ~ ~ ~ function collections/first-time
execute @a[tag=!collected_wood,scores={oak_wood_mined=1}] ~ ~ ~ function collections/first-time


# ════ Menus ════ #

# Put Jerry in his place
tp @e[name="§fJerry §eCLICK"] 3 65 26

# ════ Menus ════ #

# Menu Star - Clear tossed stars
execute @a[tag=init] ~ ~ ~ kill @e[name="§aSkyBlock Menu §7(Right Click)"]


# ════ Quests ════ #

# 0 "Start"
execute @a[scores={quest_id=0}] ~ ~ ~ function quests/01/start

# 1 "Break a log"
execute @a[scores={quest_id=1}] ~ ~ ~ function quests/01/check-progress

# 2 "Craft a workbench"
execute @a[scores={quest_id=2}] ~ ~ ~ function quests/02/check-progress

# 3 "Craft a wood pickaxe"
execute @a[scores={quest_id=3}] ~ ~ ~ function quests/03/check-progress

# 4 "Talk to Jerry"
#execute @a[scores={quest_id=4}] ~ ~ ~ function quests/04/check-progress


# ════ UI Elements ════ #

# Sidebar - SKYBLOCK
execute @a[tag=init] ~ ~ ~ function sidebar/skyblock

# Actionbar - Health, Defense, and Mana
execute @a[tag=init] ~ ~ ~ function actionbar/health-defense-mana
