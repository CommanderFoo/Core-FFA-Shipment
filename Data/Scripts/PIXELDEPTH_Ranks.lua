--[[
local level = math.floor((c + math.sqrt(c * c - 4 * c * (-xp) ))/ (2 * c))

I now use a long table of manual entries so it can be fine tubed.
]]

local RANKS = {}

RANKS[1] = {

	["name"] = "Private First Class",
	["xp"] = 0

}

RANKS[2] = {

	["name"] = "Private First Class I",
	["xp"] = 30
	
}

RANKS[3] = {

	["name"] = "Private First Class II",
	["xp"] = 120
	
}

RANKS[4] = {

	["name"] = "Lance Corporal",
	["xp"] = 270
	
}

RANKS[5] = {

	["name"] = "Lance Corporal I",
	["xp"] = 480
	
}

RANKS[6] = {

	["name"] = "Lance Corporal II",
	["xp"] = 750
	
}

RANKS[7] = {

	["name"] = "Corporal",
	["xp"] = 1080
	
}

RANKS[8] = {

	["name"] = "Corporal I",
	["xp"] = 1470
	
}

RANKS[9] = {

	["name"] = "Corporal II",
	["xp"] = 1920
	
}

RANKS[10] = {

	["name"] = "Sergeant",
	["xp"] = 2430
	
}

RANKS[11] = {

	["name"] = "Sergeant I",
	["xp"] = 3000
	
}

RANKS[12] = {

	["name"] = "Sergeant II",
	["xp"] = 3650
	
}

RANKS[13] = {

	["name"] = "Staff Sergeant",
	["xp"] = 4380
	
}

RANKS[14] = {

	["name"] = "Staff Sergeant I",
	["xp"] = 5190
	
}

RANKS[15] = {

	["name"] = "Staff Sergeant II",
	["xp"] = 6080
	
}

RANKS[16] = {

	["name"] = "Gunnery Sergeant",
	["xp"] = 7050
	
}

RANKS[17] = {

	["name"] = "Gunnery Sergeant I",
	["xp"] = 8100
	
}

RANKS[18] = {

	["name"] = "Gunnery Sergeant II",
	["xp"] = 9230
	
}

RANKS[19] = {

	["name"] = "Master Sergeant",
	["xp"] = 10440
	
}

RANKS[20] = {

	["name"] = "Master Sergeant I",
	["xp"] = 11730
	
}

RANKS[21] = {

	["name"] = "Master Sergeant II",
	["xp"] = 13100
	
}

RANKS[22] = {

	["name"] = "Master Gunnery Sergeant",
	["xp"] = 14550
	
}

RANKS[23] = {

	["name"] = "Master Gunnery Sergeant I",
	["xp"] = 16080
	
}

RANKS[24] = {

	["name"] = "Master Gunnery Sergeant II",
	["xp"] = 17690
	
}

RANKS[25] = {

	["name"] = "Second Lieutenant",
	["xp"] = 19380
	
}

RANKS[26] = {

	["name"] = "Second Lieutenant I",
	["xp"] = 21150
	
}

RANKS[27] = {

	["name"] = "Second Lieutenant II",
	["xp"] = 23000
	
}

RANKS[28] = {

	["name"] = "First Lieutenant",
	["xp"] = 24930
	
}

RANKS[29] = {

	["name"] = "First Lieutenant I",
	["xp"] = 26940
	
}

RANKS[30] = {

	["name"] = "First Lieutenant II",
	["xp"] = 29030
	
}

RANKS[31] = {

	["name"] = "Captain",
	["xp"] = 31240
	
}

RANKS[32] = {

	["name"] = "Captain I",
	["xp"] = 33570
	
}

RANKS[33] = {

	["name"] = "Captain II",
	["xp"] = 36020
	
}

RANKS[34] = {

	["name"] = "Major",
	["xp"] = 38590
	
}

RANKS[35] = {

	["name"] = "Major I",
	["xp"] = 41280
	
}

RANKS[36] = {

	["name"] = "Major II",
	["xp"] = 44090
	
}

RANKS[37] = {

	["name"] = "Lieutenant Colonel",
	["xp"] = 47020
	
}

RANKS[38] = {

	["name"] = "Lieutenant Colonel I",
	["xp"] = 50070
	
}

RANKS[39] = {

	["name"] = "Lieutenant Colonel II",
	["xp"] = 53240
	
}

RANKS[40] = {

	["name"] = "Colonel",
	["xp"] = 56530
	
}

RANKS[41] = {

	["name"] = "Colonel I",
	["xp"] = 59940
	
}

RANKS[42] = {

	["name"] = "Colonel II",
	["xp"] = 63470
	
}

RANKS[43] = {

	["name"] = "Brigadier General",
	["xp"] = 67120
	
}

RANKS[44] = {

	["name"] = "Brigadier General I",
	["xp"] = 70890
	
}

RANKS[45] = {

	["name"] = "Brigadier General II",
	["xp"] = 74780
	
}

RANKS[46] = {

	["name"] = "Major General",
	["xp"] = 78790
	
}

RANKS[47] = {

	["name"] = "Major General I",
	["xp"] = 82920
	
}

RANKS[48] = {

	["name"] = "Major General II",
	["xp"] = 87170
	
}

RANKS[49] = {

	["name"] = "Lieutenant General",
	["xp"] = 91540
	
}

RANKS[50] = {

	["name"] = "Lieutenant General I",
	["xp"] = 96030
	
}

RANKS[51] = {

	["name"] = "Lieutenant General II",
	["xp"] = 100640
	
}

RANKS[52] = {

	["name"] = "General",
	["xp"] = 105370
	
}

RANKS[53] = {

	["name"] = "General I",
	["xp"] = 110220
	
}

RANKS[54] = {

	["name"] = "General II",
	["xp"] = 115190
	
}

RANKS[55] = {

	["name"] = "Commander",
	["xp"] = 120280
	
}

return RANKS