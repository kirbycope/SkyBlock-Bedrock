# https://wiki.bedrock.dev/commands/loading-commands.html#world-load
scoreboard objectives add loaded dummy
scoreboard players add global loaded 0
scoreboard players operation @s loaded = global loaded
execute @s[scores={loaded=0}] ~ ~ ~ function events/init-world
