-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()

minetest.register_node(modname .. ":stalactite", {
		description = "Stalactite",
		drawtype = "nodebox",
		tiles = {"nc_terrain_stone.png"},
		paramtype = "light",
		node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, 0.375, -0.3125, 0.3125, 0.5, 0.3125}, -- NodeBox1
			{-0.1875, 0.1875, -0.1875, 0.1875, 0.5, 0.1875}, -- NodeBox2
			{-0.0625, -0.25, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox3
			{-0.125, -0.0625, -0.125, 0.125, 0.5, 0.125}, -- NodeBox4
			{-0.25, 0.3125, -0.25, 0.25, 0.5, 0.25}, -- NodeBox5
		}
	},
		sunlight_propagates = true,
		walkable = false,
		groups = {
			snappy = 1,
			pebble = 1,
			rock = 1,
			stack_as_node = 1
		},
		sounds = nodecore.sounds("nc_terrain_stony"),
		drop = "nc_stonework:chip"
	})

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"nc_terrain:stone"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.1,
--    y_max = 31000,
--    y_min = -31000,
    flags = "all_ceilings",
    decoration = modname ..":stalactite",
    rotation = "random",
})


