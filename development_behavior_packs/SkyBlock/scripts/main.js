import { EquipmentSlot, system, world } from "@minecraft/server";

// What the old player.json override did through run_command events, which no longer exist: the SkyBlock Menu
// opens while the Menu Star is in hand and closes when it is put away, holding a crafting table or a wooden pickaxe
// completes the quest that asks for one, and the sidebar clock follows the time of day.
const HOURS = ["6am", "7am", "8am", "9am", "10am", "11am", "12pm", "1pm", "2pm", "3pm", "4pm", "5pm",
	"6pm", "7pm", "8pm", "9pm", "10pm", "11pm", "12am", "1am", "2am", "3am", "4am", "5am"];
const holding = new Map();
let hour;

system.runInterval(() => {
	const now = Math.floor(world.getTimeOfDay() / 1000) % 24;
	if (now !== hour) {
		hour = now;
		world.getDimension("overworld").runCommand(`function clock/${HOURS[now]}`);
	}
	for (const player of world.getAllPlayers()) {
		const held = player.getComponent("minecraft:equippable")?.getEquipment(EquipmentSlot.Mainhand)?.typeId;
		const star = held === "skyblock:menu_star";
		if (star) player.runCommand("function menus/chest-menu-open");
		else if (holding.get(player.id)) player.runCommand("function menus/chest-menu-close");
		holding.set(player.id, star);
		if (held === "minecraft:crafting_table") player.runCommand("execute as @a[scores={quest_id=2}] run scoreboard players set @a table_crafted 1");
		if (held === "minecraft:wooden_pickaxe") player.runCommand("execute as @a[scores={quest_id=3}] run scoreboard players set @a pickaxe_crafted 1");
	}
}, 1);

world.afterEvents.playerLeave.subscribe(({ playerId }) => holding.delete(playerId));
