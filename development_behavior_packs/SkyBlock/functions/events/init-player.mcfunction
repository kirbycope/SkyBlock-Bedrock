# Tag the player so this only runs once
tag @a[tag=!init] add init

# Set Quest tracker to 0
scoreboard players set @s quest-id 0

# Chest Menu - Menu Item
replaceitem entity @s slot.hotbar 8 skyblock:menu_star 1 0 {"item_lock": { "mode": "lock_in_inventory" }, "keep_on_death": {} }

# Welcome message
tellraw @a {"rawtext":[{"text":"§e▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂\n"},{"text":"§fWelcome to SkyBlock!\n"},{"text":"§eThis is your island! The SkyBlock universe has many lands to discover, secrets to uncover, and people to meet. Collect resources, craft items, and complete objectives to advance your way through SkyBlock.\nHave fun!\n"},{"text":"§e▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂"}]}

# Start the first quest
function quests/01/start

# Collections
#scoreboard objectives add oak-log-mined minecraft.mined:minecraft.oak_log
#scoreboard objectives add oak-wood-mined minecraft.mined:minecraft.oak_wood
