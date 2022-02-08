# Tag the player so this only runs once
tag @a[tag=!init] add init

# Chest Menu - Menu Item
replaceitem entity @s slot.hotbar 8 skyblock:menu_star 1 0 {"item_lock": { "mode": "lock_in_inventory" }, "keep_on_death": {} }
# Chest Menu - Menu Chest
summon skyblock:invisible_chest_minecart 0 64 0

# Welcome message
tellraw @a {"rawtext":[{"text":"§e▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂\n"},{"text":"§fWelcome to SkyBlock!\n"},{"text":"§eThis is your island! It is all you have. You are "},{"text":"§cstranded"},{"text":"§e. See how far you can progress without ever leaving your island! All collections are attainable, though some are harder to find than others.\nHave fun!\n"},{"text":"§e▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂"}]}
