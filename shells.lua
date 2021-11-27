-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()

minetest.register_node(modname .. ":shell", {
		description = "Shell",
		drawtype = "nodebox",
		tiles = {"nc_terrain_sand.png^nc_sponge.png"},
		color = "salmon",
		paramtype = "light",
		node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.1875, 0.125, -0.4375, 0.1875}, -- NodeBox1
			{-0.1875, -0.5, -0.125, 0.1875, -0.4375, 0.125}, -- NodeBox2
		}
	},
		sunlight_propagates = true,
		walkable = false,
		groups = {
			snappy = 1,
			pebble = 1,
			stack_as_node = 1,
			falling_node = 1
		},
		sounds = nodecore.sounds("nc_terrain_stony"),
		selection_box = nodecore.fixedbox({-3/8, -1/2, -3/8, 3/8, 1/4, 3/8}),
		drop = "nc_stonework:chip"
	})

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"nc_terrain:sand"},
    sidelen = 4,
    fill_ratio = 0.001,
    y_max = 100,
    y_min = -31000,
    flags = "all_floors",
    decoration = modname ..":shell",
    rotation = "random",
})


