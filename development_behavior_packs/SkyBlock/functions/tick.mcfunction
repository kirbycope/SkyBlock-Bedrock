# Initialize new players
execute @a[tag=!init] ~ ~ ~ function events/init-player


# ════ Menus ════ #

# Menu Star - Clear tossed stars
execute @a[tag=init] ~ ~ ~ kill @e[name="§aSkyBlock Menu §7(Right Click)"]


# ════ UI Elements ════ #

# Sidebar - SKYBLOCK
execute @a[tag=init] ~ ~ ~ function sidebar/skyblock

# Actionbar - Health, Defense, and Mana
execute @a[tag=init] ~ ~ ~ function actionbar/health-defense-mana
