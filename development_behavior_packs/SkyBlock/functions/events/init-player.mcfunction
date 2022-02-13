# Tag the player so this only runs once
tag @a[tag=!init] add init

# Chest Menu - Menu Item
replaceitem entity @s slot.hotbar 8 skyblock:menu_star 1 0 {"item_lock": { "mode": "lock_in_inventory" }, "keep_on_death": {} }

# Welcome message
tellraw @s {"rawtext":[{"text":"§e▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂\n"},{"text":"§fWelcome to SkyBlock!\n"},{"text":"§eThis is your island! The SkyBlock universe has many lands to discover, secrets to uncover, and people to meet. Collect resources, craft items, and complete objectives to advance your way through SkyBlock.\nHave fun!\n"},{"text":"§e▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂"}]}
