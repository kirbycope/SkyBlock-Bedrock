# Oak Logs
execute @a[scores={oak_log_mined=1}] ~ ~ ~ tellraw @a {"rawtext":[{"text":"§6§lCOLLECTION UNLOCKED"},{"text":" Oak Wood"}]}
tag @a[tag=!collected_wood,scores={oak_log_mined=1}] add collected_wood
execute @a[scores={oak_wood_mined=1}] ~ ~ ~ tellraw @a {"rawtext":[{"text":"§6§lCOLLECTION UNLOCKED"},{"text":" Oak Wood"}]}
tag @a[tag=!collected_wood,scores={oak_wood_mined=1}] add collected_wood
