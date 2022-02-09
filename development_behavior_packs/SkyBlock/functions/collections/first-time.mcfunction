# Oak Logs
execute @a[scores={oak-log-mined=1}] ~ ~ ~ tellraw @a {"rawtext":[{"text":"§6§lCOLLECTION UNLOCKED"},{"text":" Oak Wood"}]}
tag @a[tag=!collected-wood,scores={oak-log-mined=1}] add collected-wood
execute @a[scores={oak-wood-mined=1}] ~ ~ ~ tellraw @a {"rawtext":[{"text":"§6§lCOLLECTION UNLOCKED"},{"text":" Oak Wood"}]}
tag @a[tag=!collected-wood,scores={oak-wood-mined=1}] add collected-wood
