-- LUALOCALS < ---------------------------------------------------------
local ItemStack, minetest, nodecore
    = ItemStack, minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------

local modname = minetest.get_current_modname()

local adzedef
adzedef = {
	description = "Shell-Tipped Adze",
	inventory_image = "nc_woodwork_adze.png^(nc_stonework_tip_adze.png^[colorize:pink:100)",
	groups = {
		firestick = 2,
		flammable = 2
	},
	tool_capabilities = nodecore.toolcaps({
			choppy = 2,
			crumbly = 2
		}),
	sounds = nodecore.sounds("nc_tree_sticky"),
	after_use = function(_, who)
		nodecore.toolbreakeffects(who, adzedef)
		return ItemStack("nc_woodwork:adze")
	end
}
minetest.register_tool(modname .. ":adze_shell", adzedef)

nodecore.register_craft({
		label = "assemble shell adze",
		action = "stackapply",
		wield = {name = modname .. ":shell"},
		consumewield = 1,
		indexkeys = {"nc_woodwork:adze"},
		nodes = {
			{
				match = {
					name = "nc_woodwork:adze",
					wear = 0.05
				},
				replace = "air"
			},
		},
		items = {
			{name = modname .. ":adze_shell"}
		},
	})

--nodecore.register_craft({
--		label = "assemble shell adze",
--		action = "stackapply",
--		wield = {name = {modname .. ":shell"}},
--		consumewield = 1,
--		indexkeys = {"nc_woodwork:adze"},
--		nodes = {
--			{
--				match = {
--					name = "nc_woodwork:adze",
--					wear = 0.05
--				}
--			},
--		},
--		items = {
--			{name = modname .. ":adze_shell"}
--		},
--		after = function(pos, data)
--			nodecore.set_loud(pos, {name = data.wield:get_name()})
--		end
--	})

