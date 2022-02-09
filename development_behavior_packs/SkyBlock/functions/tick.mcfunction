# Initialize new players
execute @a[tag=!init] ~ ~ ~ function events/init-player


# ════ Collections ════ #
execute @a[tag=!collected-wood,scores={oak-log-mined=1}] ~ ~ ~ function collections/first-time
execute @a[tag=!collected-wood,scores={oak-wood-mined=1}] ~ ~ ~ function collections/first-time


# ════ Menus ════ #

# Menu Star - Clear tossed stars
execute @a[tag=init] ~ ~ ~ kill @e[name="§aSkyBlock Menu §7(Right Click)"]


# ════ Quests ════ #

# 1 "Break a log"
execute @a[scores={quest-id=1}] ~ ~ ~ function quests/01/check-progress

# 2 "Craft a workbench"
execute @a[scores={quest-id=2}] ~ ~ ~ function quests/02/check-progress

# 3 "Craft a wood pickaxe"
execute @a[scores={quest-id=3}] ~ ~ ~ function quests/03/check-progress

# 4 "Talk to Jerry"
#execute @a[scores={quest-id=4}] ~ ~ ~ function quests/04/check-progress


# ════ UI Elements ════ #

# Sidebar - SKYBLOCK
execute @a[tag=init] ~ ~ ~ function sidebar/skyblock

# Actionbar - Health, Defense, and Mana
execute @a[tag=init] ~ ~ ~ function actionbar/health-defense-mana
