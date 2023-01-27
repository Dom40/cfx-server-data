-- NC PROTECT+
client_scripts { '@nc_PROTECT+/exports/cl.lua' }

fx_version 'adamant' 
game 'gta5'

client_scripts {
    "vehicle_names.lua",
}

files {

	'data/**/carcols.meta',
	'data/**/carvariations.meta',
	'data/**/handling.meta',
	'data/**/vehiclelayouts.meta',
	'data/**/vehicles.meta',
}

data_file 'VEHICLE_LAYOUTS_FILE'	'data/**/vehiclelayouts.meta'
data_file 'HANDLING_FILE'			'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE'	'data/**/vehicles.meta'
data_file 'CARCOLS_FILE'			'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE'	'data/**/carvariations.meta'