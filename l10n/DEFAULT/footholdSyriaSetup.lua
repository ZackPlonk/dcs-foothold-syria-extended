function merge(tbls)
	local res = {}
	for i,v in ipairs(tbls) do
		for i2,v2 in ipairs(v) do
			table.insert(res,v2)
		end
	end
	
	return res
end

function allExcept(tbls, except)
	local tomerge = {}
	for i,v in pairs(tbls) do
		if i~=except then
			table.insert(tomerge, v)
		end
	end
	return merge(tomerge)
end

upgrades = {
	ships = {
		blue = {'blueShip', 'blueShip', 'blueShip'},
		red = {'Molniya','Molniya','Rezky','Rezky','Neustrashimy','Neustrashimy'}
	},
	ships2 = {
		blue = {'blueShip'},
		red = {'Molniya','Molniya','Rezky','Rezky','Moskva'}
	},
	carrier = {
		blue = {'blueShip', 'blueShip', 'blueShip'},
		red = {'Molniya'}
	},
	carrierFixed = {
		blue = {'blueShip-Fixed-1', 'blueShip-Fixed-2', 'blueShip-Fixed-3'},
		red = {'Molniya'}
	},
	airfield = {
		blue = {'blueInfantry','bluePD2', 'bluePD1'},
		red = {'redInfantry', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 2' , 'Red SAM AAA', 'Red Armor Group3', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15','Red Armor Group5','Red Arty 2'}
	},
	airfield2palmyra = {
		blue = {'blueInfantry','bluePD2', 'bluePD1'},
		red = {'redInfantry','Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 2' , 'Red SAM AAA','Red Armor Group3', 'Red SAM AAA 2', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 2' , 'Red SAM SA-11'}
	},  
	
	airfield2 = {
		blue = {'blueInfantry','bluePD2', 'bluePD1'},
		red = {'redInfantry','Red Armor Group', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 2' ,'Red SAM AAA', 'Red SAM AAA 2', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 2','Red Armor Group3', 'Red Arty 2'}
	},  
	
	airfield3 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD2', 'bluePD1'},
		red = {'redInfantry','Red SAM AAA', 'Red SAM AAA 2', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 2' , 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 2' , 'Red SAM SA-6 Fixed Duhur','Red Armor Group5','Red Armor Group4', 'Red Arty 2'}
	},							 
   	generic = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD2'},
		red = {'redInfantry','Red Armor Group2','Red Armor Group3', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 2' }
	},
	deltafixed = {
		blue = {'bluePD2', 'blueMERAD'},
		red = { 'Red Armor Group2', 'Red SAM SA-6 Fixed Delta','Red Armor Group3', 'Red SAM SHORAD SA-19 Fixed delta', 'Red SAM SHORAD SA-8 Fixed delta','Red SAM SHORAD SA-15 Fixed delta'}
	},
	bravofixed = {
		blue = {'bluePD2', 'blueMERAD'},
		red = { 'Red Armor Group2','Red SAM SHORAD SA-15 Fixed Bravo','Red Armor Group3', 'Red SAM SHORAD SA-19 Fixed Bravo-3','Red SAM SHORAD Fixed SA-8 Bravo','Red SAM SA-3 Fixed Bravo'}
	},
	juliettFixed = {
		blue = {'bluePD2', 'blueMERAD', 'bluePD1', 'blueArmor'},
		red = {'Red SAM AAA Fixed juliett-1', 'Red SAM SHORAD SA-15 Fixed juliett-2', 'Red SAM AAA Fixed juliett-2', 'Red SAM SA-2 Fixed juliett', 'Red SAM SHORAD SA-8 Fixed-juliett'}
	},
	indiaFixed = {
		blue = {'bluePD2', 'blueMERAD', 'bluePD1'},
		red = {'Red SAM AAA Fixed india-1','Red SAM AAA Fixed india-3','Red SAM SA-15 Fixed india-2','Red SAM SA-15 Fixed india-3','Red SAM SA-2 Fixed India'}
	},
	HotelFixed = {
		blue = {'bluePD2', 'blueMERAD', 'bluePD1'},
		red = {'Red SAM SHORAD SA-19 Fixed Hotel', 'Red SAM SA-2 Fixed Hotel', 'Red SAM SA-15 Fixed Hotel', 'Red SAM AAA Fixed Hotel'}
	},
	sa5 = {
		blue = {'bluePD2', 'bluePD1'},
		red = {'Red Armor Group2','Red SAM AAA Fixed SAITE','Red SAM SHORAD SA-15 SAITE Fixed','Red Armor Group3','Red SAM SA-15 Fixed SAITE','Red SAM SA-5 Fixed'}
	},
	insAirfield = {
		blue = {'blueInfantry','bluePD2', 'bluePD1'},
		red = {'insInfantry','Red Armor Group2','Red SAM AAA', 'Red SAM AAA 2','Red SAM SHORAD SA-19','Red Armor Group3', 'Red SAM SHORAD SA-19 2', 'Red Arty 2' }
	},
	insGeneric = {
		blue = {'blueInfantry','bluePD2', 'blueArmor'},
		red = {'insInfantry','Red Armor Group2','Red SAM AAA', 'Red SAM AAA 2','Red Armor Group3','Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 2' }
	},
	damupgrade = {
		blue = {'blueInfantry','bluePD2', 'blueArmor'},
		red = {'insInfantry','Red Armor Group4','Red SAM AAA 3', 'Red SAM AAA 4','Red Armor Group5','Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 2' }
	},
	insGenericFoxtrotFixed = {
		blue = {'blueInfantry','bluePD2', 'blueArmor'},
		red = {'insInfantry','Red Armor Group2','insInfantry','Red SAM AAA 2','Red SAM SHORAD Fixed Foxtrot'}
	},
	insMaximum = {
		blue = {'blueInfantry'},
		red = {'insInfantry','Red SAM AAA', 'Red SAM AAA 2', 'insInfantry','Red Armor Group2','Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 2' ,'Red Armor Group3','Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 2'}
	},
	insMinimum = {
		blue = {'blueInfantry','bluePD2'},
		red = {'insInfantry','Red SAM AAA', 'Red SAM AAA 2','Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 2' }
	},
	insSAM = {
		blue = {'bluePD2', 'blueMERAD', 'bluePD1'},
		red = {'Red SAM AAA', 'Red SAM AAA 2', 'Red Armor Group2', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 2' ,'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 2'}
	},
	ewr = {
		blue = {'blueInfantry'},
		red = {'Red EWR','Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 2' }
	},
	ewrcharlie = {
		blue = {'blueInfantry'},
		red = {'Red EWR','Red SAM SHORAD SA-8 Fixed Charlie','Red SAM SHORAD SA-15 Fixed Charlie'}
	},
	milbase = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry','Red Armor Group2', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 2' ,'Red Armor Group3','Red Armor Group3'}
	},
	milbase2 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry', 'Red SAM AAA', 'Red SAM AAA 2', 'Red SAM SHORAD SA-8','Red Armor Group3', 'Red SAM SHORAD SA-8 2' ,'Red Armor Group3','Red Armor Group2'}
	},
	bigSAM = {
		blue = {'blueAmmo', 'blueAmmo', 'blueAmmo', 'blueLORAD'},
		red = {'redAmmo','redAmmo', 'Red SAM SA-11'}
	},
	PapaFixed = {
		blue = {'blueAmmo', 'blueAmmo', 'blueAmmo', 'blueAmmo', 'blueAmmo', 'blueAmmo', 'bluePD1', 'blueMERAD'},
		red = {'Red SAM AAA Fixed Papa', 'Red SAM SHORAD SA-15 Fixed Papa-2', 'Red SAM SHORAD SA-15 Fixed Papa-3', 'Red SAM SA-11 Fixed Papa'}
	},
	radarstrike = {
		blue = {'blueInfantry'},
		red = {'redRadar'}
	},
	insOutpost = {
		blue = {'blueInfantry'},
		red = {'insOutpost'}
	},
	insAmbush = {
		blue = {'blueInfantry'},
		red = {'insAmbush'}
	},
	minimal = {
		blue = {'blueInfantry'},
		red = {'redInfantry'}
	},
	bengurionDefence = {
		blue = {},
		red = {'Red SAM SHORAD SA-15 Fixed BenGurion','Red SAM SA-10 Fixed Benguriondefence', 'Red SAM SHORAD SA-19 Fixed Benguriondefence'}
	},
	SilkDefence = {
		blue = {},
		red = {'Silmworm Fixed 1','Red SAM AAA Silk Fixed','Red SAM SHORAD SA-15 Fixed'}
	},
	haifaDefence = {
		blue = {},
		red = {'Red SAM SA-10 Fixed haifadefence', 'Red SAM SHORAD Fixed haifadefence'}
	},
	ramatdavidDefence = {
		blue = {},
		red = {'Red SAM SHORAD SA-15 Fixed ramatdaviddefence','Red SAM SHORAD SA-19 Fixed ramatdaviddefence','Red SAM AAA Fixed ramatdaviddefence','Red SAM SA-11 Fixed ramatdaviddefence'}
	},
	jordanDefence = {
		blue = {},
		red = {'Red SAM SA-2 Fixed Jordandefence', 'Red SAM SA-2 Fixed Jordandefence-1', 'Red SAM SA-2 Fixed Jordandefence-2', 'Red SAM SHORAD SA-19 jordandefence Fixed', 
		'Red SAM AAA jordandefence Fixed', 'Red SAM SHORAD SA-15 jordandefence Fixed'}
	},

	incirlikdefence = {
		blue = {},
		red = {'Red Armor Group5','Red SAM SA-11 Fixed Incirlikdefence','Red SAM SHORAD SA-19 Fixed','Red SAM SHORAD Fixed incirlikdefence'}
	},

	hidden1Group = {
		blue = {},
		red = {'Red EWR north Fixed', 'Red EWR Cyprus Fixed', 'Red EWR-southeast Fixed', 'Red EWR-south Fixed', 'HQ Fixed', 
		'Red SAM SHORAD SA-15 Fixed HiddenGroup South', 'Red SAM SHORAD SA-15 EWR Group Fixed'}
	},
	hidden2Group = {
		blue = {},
		red = {'HiddenGroup-Fixed-1', 'HiddenGroup-Fixed-2', 'Red SAM SA-3 HiddenGroup Fixed', 'HiddenGroup-Fixed-3'}
	},
	hidden3Group = {
		blue = {},
		red = {'Red EWR north Fixed Coldwar', 'Red EWR Cyprus Fixed Coldwar', 'Red EWR-southeast Fixed Coldwar', 'Red EWR-south Fixed Coldwar', 'HQ Fixed', 
		'Red SAM SHORAD SA-15 Fixed HiddenGroup South', 'Red SAM SHORAD SA-15 EWR Group Fixed'}
	}

}




local cwSwap = {
	['Red Armor Group2']  = 'Red Armor Group6',
	['Red Armor Group3']  = 'Red Armor Group7',
	['Red Armor Group4']  = 'Red Armor Group8',
	['Red Armor Group5']  = 'Red Armor Group9',
	['Neustrashimy']  = 'Molniya',
	['bluePD2']  = 'bluePD2 Coldwar',
	['bluePD1']  = 'bluePD1 Coldwar',
}

local function deepSwap(t,s)
	for k,v in pairs(t) do
		if type(v)=='table' then
			deepSwap(v,s)
		elseif s[v] then
			t[k]=s[v]
		end
	end
end

if Era == 'Coldwar' then
	deepSwap(upgrades,cwSwap)
end


local SamSwap = {
	['Red SAM SHORAD SA-15 Fixed delta']                  = 'Red SAM SHORAD SA-8 Fixed delta-2',
	['Red SAM SHORAD SA-15 Fixed Bravo']                  = 'Red SAM SHORAD SA-19 Fixed Bravo',
	['Red SAM SHORAD SA-15 Fixed juliett-2']              = 'Red SAM SHORAD SA-8 Fixed juliett-2',
	['Red SAM SHORAD SA-15 Fixed-juliett-3']              = 'Red SAM SHORAD SA-8 Fixed-juliett',
	['Red SAM SA-15 Fixed india-2']                       = 'Red SAM SA-8 Fixed india-2',
	['Red SAM SA-15 Fixed india-3']                       = 'Red SAM SA-19 Fixed india-3',
	['Red SAM SA-15 Fixed Hotel']                         = 'Red SAM SA-8 Fixed Hotel',
	['Red SAM SHORAD SA-15 SAITE Fixed']                  = 'Red SAM SHORAD SA-8 SAITE Fixed',
	['Red SAM SA-15 Fixed SAITE']                         = 'Red SAM SHORAD SA-19 Fixed SAITE',
	['Red SAM SHORAD SA-15 Fixed Charlie']                = 'Red SAM SHORAD SA-8 Fixed Charlie 2',
	['Red SAM SHORAD SA-15 Fixed Papa-2']                 = 'Red SAM SHORAD SA-8 Fixed Papa-2',
	['Red SAM SHORAD SA-15 Fixed Papa-3']                 = 'Red SAM SHORAD SA-8 Fixed Papa-3',
	['Red SAM SHORAD SA-15 Fixed']                        	= 'Red SAM SHORAD SA-8 Fixed',
	['Red SAM SHORAD SA-15 Fixed ramatdaviddefence']     	= 'Red SAM SHORAD SA-8 Fixed ramatdaviddefence',
	['Red SAM SHORAD SA-15 jordandefence Fixed']          	= 'Red SAM SHORAD SA-8 jordandefence Fixed',
	['Red SAM SHORAD SA-15 Fixed HiddenGroup South']      	= 'Red SAM SHORAD SA-8 Fixed HiddenGroup South',
	['Red SAM SHORAD SA-15 EWR Group Fixed']              	= 'Red SAM SHORAD SA-8 EWR Group Fixed',
	['Red SAM SHORAD SA-15 Fixed BenGurion']              	= 'Red SAM SHORAD SA-8 Fixed BenGurion',

    ['Red SAM SA-11 Fixed Papa']              				= 'Red SAM SA-3 Papa Fixed','Red SAM SA-6 Papa Fixed',
    ['Red SAM SA-11 Fixed ramatdaviddefence'] 				= 'Red SAM SA-6 Fixed ramatdaviddefence',
    ['Red SAM SA-11 Fixed Incirlikdefence']   				= 'Red SAM SA-3 Fixed Incirlikdefence',
    ['Red SAM SA-10 Fixed Benguriondefence']  				= 'Red SAM SA-2 Fixed Benguriondefence',
    ['Red SAM SA-10 Fixed haifadefence']      				= 'Red SAM SA-2 Fixed haifadefence',


}

local function deepSwapAgain(t,s)
	for k,v in pairs(t) do
		if type(v)=='table' then
			deepSwapAgain(v,s)
		elseif s[v] then
			t[k]=s[v]
		end
	end
end

if NoSA10AndSA11 == true then
	deepSwapAgain(upgrades,SamSwap)
end



-- redInfantry, Red Armor Group, Red SAM SHORAD SA-8, Red SAM SA-3, Red SAM SHORAD SA-15, redSA5, Red EWR
-- insInfantry, Red Armor Group2, Red SAM SHORAD SA-19
-- blueInfantry, blueArmor, blueRed SAM SHORAD, blueMERAD, blueLORAD, bluePD
-- blueShip

flavor = {
    akrotiri = 'WPT 1\nStart zone',
    paphos = 'WPT 2\n',
    polis = 'WPT 3\n',
    karavostasi = 'WPT 4\n',
    pinarbashi = 'WPT 5\n',
    gecitkale = 'WPT 6\n',
    ercan = 'WPT 7\n',
    larnaca = 'WPT 8\n',
    redcarrier = 'WPT 9\n Take out the ship and the silkworm Site and we shall have CVN crusing here.',
    incirlik = 'WPT 10\n',
    alpha = 'WPT 11\n',
    hatay = 'WPT 12\n',
    bravo = 'WPT 13\n',
    charlie = 'WPT 14\nEWR Site, can not be captured, destroy for 500 credits and reduced enemy patrols',
    minakh = 'WPT 15\n',
    gaziantep = 'WPT 16\n',
    manbij = 'WPT 17\n',
    aleppo = 'WPT 18\n',
    delta = 'WPT 19\n',
    taftanaz = 'WPT 20\nProvides Helicopter spawns for players if captured',
    powerplant = 'WPT 21\n+180 credits/hour',
    hotel = 'WPT 22\nSAM site',
    alassad = 'WPT 23\n',
    substationwest = 'WPT 24\nStrike target, can not be captured, destroy for 500 credits',
    victor = 'WPT 25\nCrashed Blackhawk, ambushed by local insurgents, clear for 500 credits',
    alduhur = 'WPT 26\nProvides Plane and Helicopter spawns for players if captured',
    tango = 'WPT 27\nInsurgent outpost, can not be captured, clear for 1000 credits',
    substationnorth = 'WPT 28\nStrike target, can not be captured, destroy for 500 credits',
    jirah = 'WPT 29\nProvides Helicopter spawns for players if captured',
    foxtrot = 'WPT 30\n',
    durayhim = 'WPT 31\n',
    papa = 'WPT 32\nSpawns SA-11 or Patriot at max level',
    factory = 'WPT 33\n+180 credits/hour',
    india = 'WPT 34\nSAM site',
    romeo = 'WPT 35\n',
    hama = 'WPT 36\n',
    foblima = 'WPT 37\nProvides Helicopter spawns for players if captured',
    sierra = 'WPT 38\nStrike target, can not be captured, destroy for 500 credits',
    golf = 'WPT 39\n',
    dam = 'WPT 40\n+180 credits/hour',
    raqqa = 'WPT 41\n',
    tabqa = 'WPT 42\n',
    tv = 'WPT 43\nStrike target, can not be captured, destroy for 500 credits',
    juliett = 'WPT 44\nSAM site',
    november = 'WPT 45\n',
    radio = 'WPT 46\nStrike target, can not be captured, destroy for 500 credits',
    kilo = 'WPT 47\nEWR Site, can not be captured, destroy for 500 credits and reduced enemy patrols',
    refinery = 'WPT 48\n+180 credits/hour',
    uniform = 'WPT 49\nInsurgent outpost, can not be captured, clear for 1000 credits',
    fobmike = 'WPT 50\nProvides Helicopter spawns for players if captured',
    milbase = 'WPT 51\n',
    oscar = 'WPT 52\n',
    sa5 = 'WPT 53\n',
    palmyra = 'WPT 54\n',
    tiyas = 'WPT 55\n',
    shayrat = 'WPT 56\nStrike target, can not be captured, destroy for 500 credits',
    alqusayr = 'WPT 57\n',
    renemouawad = 'WPT 58\n',
    wujah = 'WPT 59\n',
    beirut = 'WPT 60\n',
    rayak = 'WPT 61\n',
    annasiriyah = 'WPT 62\n',
    damascus = 'WPT 63\n',
    roshpina = 'WPT 64\n',
    ramatdavid = 'WPT 65\n',
    thalah = 'WPT 66\n',
    kinghussein = 'WPT 67\n',
    princehassan = 'WPT 68\n',
    muwaffaq = 'WPT 69\n',
    marka = 'WPT 70\n',
    bengurion = 'WPT 71\n',

    benguriondefence = 'WPT \nBen Gurion Defence Zone',
    incirlikdefence = 'WPT \nIncirlik Defence Zone',
    jordandefence = 'WPT \nJordan Defence Zone',
    ramatdaviddefence = 'WPT \nRamat David Defence Zone',
    silkworm = 'WPT \nSilkworm Site'
}


WaypointList = {
    Akrotiri = ' (1)',
    Paphos = ' (2)',
    Polis = ' (3)',
    Karavostasi = ' (4)',
    Pinarbashi = ' (5)',
    Gecitkale = ' (6)',
    Ercan = ' (7)',
    Larnaca = ' (8)',
    ["Red Carrier"] = ' (9)',
    Incirlik = ' (10)',
    ["FOB Alpha"] = ' (11)',
    Hatay = ' (12)',
    Bravo = ' (13)',
    Charlie = ' (14)',
    Minakh = ' (15)',
    Gaziantep = ' (16)',
    Manbij = ' (17)',
    Aleppo = ' (18)',
    Delta = ' (19)',
    Taftanaz = ' (20)',
    ["Power Plant"] = ' (21)',
    Hotel = ' (22)',
    ["Bassel Al-Assad"] = ' (23)',
    ["Substation West"] = ' (24)',
    Victor = ' (25)',
    ["Abu al-Duhur"] = ' (26)',
    Tango = ' (27)',
    ["Substation North"] = ' (28)',
    Jirah = ' (29)',
    Foxtrot = ' (30)',
    Durayhim = ' (31)',
    Papa = ' (32)',
    Factory = ' (33)',
	India = ' (34)',
    Romeo = ' (35)',
    Hama = ' (36)',
    ["FOB Lima"] = ' (37)',
    Sierra = ' (38)',
    Golf = ' (39)',
	Dam = ' (40)',
    Raqqa = ' (41)',
    Tabqa = ' (42)',
	["TV Tower"] = ' (43)',
    Juliett = ' (44)',
    November = ' (45)',
    ["Radio Tower"] = ' (46)',
    Kilo = ' (47)',
	Refinery = ' (48)',
	Uniform = ' (49)',
	["FOB Mike"] = ' (50)',
	["Military Base"] = ' (51)',
    Oscar = ' (52)',
    ["SA-5"] = ' (53)',
    Palmyra = ' (54)',
    Tiyas = ' (55)',
    Shayrat = ' (56)',
    ["Al Qusayr"] = ' (57)',
    ["Rene Mouawad"] = ' (58)',
    Wujah = ' (59)',
    Beirut = ' (60)',
    Rayak = ' (61)',
    ["An Nasiriyah"] = ' (62)',
    Damascus = ' (63)',
    ["Rosh Pina"] = ' (64)',
    ["Ramat David"] = ' (65)',
    Thalah = ' (66)',
    ["King Hussein Air College"] = ' (67)',
    ["Prince Hassan"] = ' (68)',
    ["Muwaffaq Salti"] = ' (69)',
    Marka = ' (70)',
    ["Ben Gurion"] = ' (71)',
}

local filepath = (Era == 'Coldwar') and 'footholdSyria_Extended_0.1_coldwar.lua' or 'footholdSyria_Extended_0.1.lua'
env.info('[DEBUG] Era='..tostring(Era)..'  ->  '..filepath)
if lfs then 
	local dir = lfs.writedir()..'Missions/Saves/'
	lfs.mkdir(dir)
	filepath = dir..filepath
	env.info('Foothold - Save file path: '..filepath)
end
bc = BattleCommander:new(filepath, 10, 60)

Hunt = true

zones = {
	akrotiri = ZoneCommander:new({zone='Akrotiri', side=2, level=5, upgrades=upgrades.airfield, crates={}, flavorText=flavor.akrotiri}),
    paphos = ZoneCommander:new({zone='Paphos', side=1, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.paphos}),
    polis = ZoneCommander:new({zone='Polis', side=1, level=20, upgrades=upgrades.insSAM, crates={}, flavorText=flavor.polis}),
	karavostasi = ZoneCommander:new({zone='Karavostasi', side=1, level=20, upgrades=upgrades.milbase2, crates={}, flavorText=flavor.karavostasi}),	
    larnaca = ZoneCommander:new({zone='Larnaca', side=1, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.larnaca}),	
    ercan = ZoneCommander:new({zone='Ercan', side=1, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.ercan}),
    pinarbashi = ZoneCommander:new({zone='Pinarbashi', side=1, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.pinarbashi}),
	gecitkale = ZoneCommander:new({zone='Gecitkale', side=1, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.gecitkale}),
	incirlik = ZoneCommander:new({zone='Incirlik', side=1, level=20, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.incirlik}),
	hatay = ZoneCommander:new({zone='Hatay', side=1, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.hatay}),
	minakh = ZoneCommander:new({zone='Minakh', side=0, level=5, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.minakh, NeutralAtStart=true}),
	aleppo = ZoneCommander:new({zone='Aleppo', side=0, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.aleppo, NeutralAtStart=true}),
	taftanaz = ZoneCommander:new({zone='Taftanaz', side=0, level=5, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.taftanaz, NeutralAtStart=true}),
	jirah = ZoneCommander:new({zone='Jirah', side=0, level=5, upgrades=upgrades.insAirfield, crates={}, flavorText=flavor.jirah, NeutralAtStart=true}),
	tabqa = ZoneCommander:new({zone='Tabqa', side=0, level=5, upgrades=upgrades.insAirfield, crates={}, flavorText=flavor.tabqa, NeutralAtStart=true}),
	alduhur = ZoneCommander:new({zone='Abu al-Duhur', side=0, level=5, upgrades=upgrades.airfield3, crates={}, flavorText=flavor.alduhur, NeutralAtStart=true}),
	alassad = ZoneCommander:new({zone='Bassel Al-Assad', side=1, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.alassad}),
	hama = ZoneCommander:new({zone='Hama', side=0, level=3, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.hama, NeutralAtStart=true}),
	palmyra = ZoneCommander:new({zone='Palmyra', side=0, level=4, upgrades=upgrades.airfield2palmyra, crates={}, flavorText=flavor.palmyra, NeutralAtStart=true}),
	powerplant = ZoneCommander:new({zone='Power Plant', side=0, level=5, upgrades=upgrades.generic, crates={}, flavorText=flavor.powerplant, income=0.5, NeutralAtStart=true}),
	alpha = ZoneCommander:new({zone='FOB Alpha', side=1, level=1, upgrades=upgrades.minimal, crates={}, flavorText=flavor.alpha}),
	bravo = ZoneCommander:new({zone='Bravo', side=1, level=20, upgrades=upgrades.bravofixed, crates={}, flavorText=flavor.bravo}),
	charlie = ZoneCommander:new({zone='Charlie', side=0, level=20, upgrades=upgrades.ewrcharlie, crates={}, flavorText=flavor.charlie, NeutralAtStart=true}),
	delta = ZoneCommander:new({zone='Delta', side=0, level=5, upgrades=upgrades.deltafixed, crates={}, flavorText=flavor.delta, NeutralAtStart=true}),
	redcarrier = ZoneCommander:new({zone='Red Carrier', side=1, level=20, upgrades=upgrades.ships, crates={}, flavorText=flavor.redcarrier}),
	foxtrot = ZoneCommander:new({zone='Foxtrot', side=0, level=5, upgrades=upgrades.insGenericFoxtrotFixed, crates={}, flavorText=flavor.foxtrot, NeutralAtStart=true}),
	golf = ZoneCommander:new({zone='Golf', side=0, level=5, upgrades=upgrades.insSAM, crates={}, flavorText=flavor.golf, NeutralAtStart=true}),
	hotel = ZoneCommander:new({zone='Hotel', side=1, level=20, upgrades=upgrades.HotelFixed, crates={}, flavorText=flavor.hotel}),
	india = ZoneCommander:new({zone='India', side=0, level=6, upgrades=upgrades.indiaFixed, crates={}, flavorText=flavor.india, NeutralAtStart=true}),
	juliett = ZoneCommander:new({zone='Juliett', side=0, level=5, upgrades=upgrades.juliettFixed, crates={}, flavorText=flavor.juliett, NeutralAtStart=true}),
	kilo = ZoneCommander:new({zone='Kilo', side=1, level=3, upgrades=upgrades.ewr, crates={}, flavorText=flavor.kilo}),
	foblima = ZoneCommander:new({zone='FOB Lima', side=0, level=0, upgrades=upgrades.minimal, crates={}, flavorText=flavor.foblima, NeutralAtStart=true}),
	fobmike = ZoneCommander:new({zone='FOB Mike', side=0, level=0, upgrades=upgrades.minimal, crates={}, flavorText=flavor.fobmike, NeutralAtStart=true}),
	november = ZoneCommander:new({zone='November', side=0, level=5, upgrades=upgrades.generic, crates={}, flavorText=flavor.november, NeutralAtStart=true}),
	oscar = ZoneCommander:new({zone='Oscar', side=0, level=2, upgrades=upgrades.insMinimum, crates={}, flavorText=flavor.oscar, NeutralAtStart=true}),
	papa = ZoneCommander:new({zone='Papa', side=1, level=20, upgrades=upgrades.PapaFixed, crates={}, flavorText=flavor.papa}),
	romeo = ZoneCommander:new({zone='Romeo', side=1, level=20, upgrades=upgrades.generic, crates={}, flavorText=flavor.romeo}),
	sierra = ZoneCommander:new({zone='Sierra', side=1, level=20, upgrades=upgrades.radarstrike, crates={}, flavorText=flavor.sierra}),
	tango = ZoneCommander:new({zone='Tango', side=1, level=20, upgrades=upgrades.insOutpost, crates={}, flavorText=flavor.tango}),
	uniform = ZoneCommander:new({zone='Uniform', side=0, level=20, upgrades=upgrades.insOutpost, crates={}, flavorText=flavor.uniform, NeutralAtStart=true}),
	victor = ZoneCommander:new({zone='Victor', side=1, level=20, upgrades=upgrades.insAmbush, crates={}, flavorText=flavor.victor}),
	substationnorth = ZoneCommander:new({zone='Substation North', side=1, level=20, upgrades=upgrades.insMinimum, crates={}, flavorText=flavor.substationnorth}),
	durayhim = ZoneCommander:new({zone='Durayhim', side=0, level=5, upgrades=upgrades.insGeneric, crates={}, flavorText=flavor.durayhim, NeutralAtStart=true}),
	raqqa = ZoneCommander:new({zone='Raqqa', side=0, level=8, upgrades=upgrades.insMaximum, crates={}, flavorText=flavor.raqqa, NeutralAtStart=true}),
	dam = ZoneCommander:new({zone='Dam', side=0, level=5, upgrades=upgrades.damupgrade, crates={}, flavorText=flavor.dam, income=0.5, NeutralAtStart=true}),
	tv = ZoneCommander:new({zone='TV Tower', side=0, level=20, upgrades=upgrades.insMinimum, crates={}, flavorText=flavor.tv, NeutralAtStart=true}),
	sa5 = ZoneCommander:new({zone='SA-5', side=0, level=6, upgrades=upgrades.sa5, crates={}, flavorText=flavor.sa5, NeutralAtStart=true}),
	milbase = ZoneCommander:new({zone='Military Base', side=0, level=5, upgrades=upgrades.milbase, crates={}, flavorText=flavor.milbase, NeutralAtStart=true}),
	carrier = ZoneCommander:new({zone='Carrier Group', side=2, level=5, upgrades=upgrades.carrierFixed, crates={}, flavorText=flavor.carrier}),
	refinery = ZoneCommander:new({zone='Refinery', side=0, level=3, upgrades=upgrades.generic, crates={}, flavorText=flavor.refinery, income=0.5, NeutralAtStart=true}),
	factory = ZoneCommander:new({zone='Factory', side=1, level=3, upgrades=upgrades.generic, crates={}, flavorText=flavor.factory, income=0.5}),
	substationwest = ZoneCommander:new({zone='Substation West', side=1, level=3, upgrades=upgrades.generic, crates={}, flavorText=flavor.substationwest}),
	radio = ZoneCommander:new({zone='Radio Tower', side=1, level=3, upgrades=upgrades.generic, crates={}, flavorText=flavor.radio}),
	renemouawad = ZoneCommander:new({zone='Rene Mouawad', side=1, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.renemouawad}),
	wujah = ZoneCommander:new({zone='Wujah', side=1, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.wujah}),
	beirut = ZoneCommander:new({zone='Beirut', side=1, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.beirut}),
	rayak = ZoneCommander:new({zone='Rayak', side=1, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.rayak}),
	alqusayr = ZoneCommander:new({zone='Al Qusayr', side=0, level=20, upgrades=upgrades.airfield, crates={}, flavorText=flavor.alqusayr, NeutralAtStart=true}),
	tiyas = ZoneCommander:new({zone='Tiyas', side=0, level=5, upgrades=upgrades.generic, crates={}, flavorText=flavor.tiyas, NeutralAtStart=true}),
	damascus = ZoneCommander:new({zone='Damascus', side=0, level=5, upgrades=upgrades.airfield, crates={}, flavorText=flavor.damascus, NeutralAtStart=true}),
	annasiriyah = ZoneCommander:new({zone='An Nasiriyah', side=0, level=5, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.annasiriyah, NeutralAtStart=true}),
	thalah = ZoneCommander:new({zone='Thalah', side=0, level=3, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.thalah, NeutralAtStart=true}),

	kinghussein = ZoneCommander:new({zone='King Hussein Air College', side=0, level=3, upgrades=upgrades.airfield, crates={}, flavorText=flavor.kinghussein, NeutralAtStart=true}),
	muwaffaq = ZoneCommander:new({zone='Muwaffaq Salti', side=0, level=4, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.muwaffaq, NeutralAtStart=true}),
	princehassan = ZoneCommander:new({zone='Prince Hassan', side=0, level=4, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.princehassan, NeutralAtStart=true}),
	bengurion = ZoneCommander:new({zone='Ben Gurion', side=1, level=20, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.bengurion}),
	ramatdavid = ZoneCommander:new({zone='Ramat David', side=0, level=3, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.ramatdavid, NeutralAtStart=true}),
	roshpina = ZoneCommander:new({zone='Rosh Pina', side=1, level=20, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.roshpina}),
	marka = ZoneCommander:new({zone='Marka', side=0, level=3, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.marka, NeutralAtStart=true}),
	gaziantep = ZoneCommander:new({zone='Gaziantep', side=0, level=3, upgrades=upgrades.airfield, crates={}, flavorText=flavor.gaziantep, NeutralAtStart=true}),
	manbij = ZoneCommander:new({zone='Manbij', side=0, level=3, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.manbij, NeutralAtStart=true}),
	shayrat = ZoneCommander:new({zone='Shayrat', side=0, level=3, upgrades=upgrades.airfield, crates={}, flavorText=flavor.shayrat, NeutralAtStart=true}),


	benguriondefence = ZoneCommander:new({zone='Ben Gurion Defence', side=1, level=4, upgrades=upgrades.bengurionDefence, crates={}, flavorText=flavor.benguriondefence}),
	ramatdaviddefence = ZoneCommander:new({zone='Ramat David Defence', side=1, level=20, upgrades=upgrades.ramatdavidDefence, crates={}, flavorText=flavor.ramatdaviddefence}),
	jordandefence = ZoneCommander:new({zone='Jordan Defence', side=0, level=20, upgrades=upgrades.jordanDefence, crates={}, flavorText=flavor.jordandefence, NeutralAtStart=true}),
	incirlikdefence = ZoneCommander:new({zone='Incirlik Defence', side=1, level=4, upgrades=upgrades.incirlikdefence, crates={}, flavorText=flavor.incirlikdefence}),
	
	silkworm = ZoneCommander:new({zone='Silkworm Site', side=1, level=3, upgrades=upgrades.SilkDefence, crates={}, flavorText=flavor.silkworm}),
	hidden1 = ZoneCommander:new({zone='Hidden1', side=1, level=15, upgrades=upgrades.hidden1Group, crates={}, flavorText=flavor.hidden1}),
	hidden2 = ZoneCommander:new({zone='Hidden2', side=0, level=15, upgrades=upgrades.hidden2Group, crates={}, flavorText=flavor.hidden2, NeutralAtStart=true})


}
zones.akrotiri:addGroups({
	GroupCommander:new({name='akrotiri-supply-paphos-blue', mission='supply', targetzone='Paphos'}),
	GroupCommander:new({name='akrotiri-supply-larnaca-blue', mission='supply', targetzone='Larnaca'})
})
zones.paphos:addGroups({
	GroupCommander:new({name='paphos-supply-polis-blue', mission='supply', targetzone='Polis'})
})
zones.polis:addGroups({
	GroupCommander:new({name='polis-supply-paphos', mission='supply', targetzone='Paphos'}),
	GroupCommander:new({name='polis-supply-karavostasi', mission='supply', targetzone='Karavostasi'}),
	GroupCommander:new({name='polis-supply-karavostasi-blue', mission='supply', targetzone='Karavostasi'}),
	GroupCommander:new({name='Polis-attack-Paphos-convoy', mission='attack', targetzone='Polis', type='Paphos'})
})
zones.karavostasi:addGroups({
	GroupCommander:new({name='karavostasi-supply-polis', mission='supply', targetzone='Polis'}),
	GroupCommander:new({name='karavostasi-supply-pinarbashi', mission='supply', targetzone='Pinarbashi'}),
	GroupCommander:new({name='karavostasi-supply-pinarbashi-blue', mission='supply', targetzone='Pinarbashi'})
})
zones.pinarbashi:addGroups({
	GroupCommander:new({name='pinarbashi-supply-Karavostasi', mission='supply', targetzone='Karavostasi'}),
	GroupCommander:new({name='pinarbashi-supply-Ercan-blue', mission='supply', targetzone='Ercan'})
})
zones.ercan:addGroups({
	GroupCommander:new({name='ercan-supply-Larnaca-blue', mission='supply', targetzone='Larnaca'}),
	GroupCommander:new({name='ercan-supply-Gecitkale-blue', mission='supply', targetzone='Gecitkale'}),
	GroupCommander:new({name='ercan-attack-Polis-Sa8', mission='attack', targetzone='Polis', type='surface', diceChance = 30}),
	GroupCommander:new({name='Ercan-patrol-Ercan', mission='patrol', MissionType='CAP', targetzone='Ercan'}),
	GroupCommander:new({name='Ercan-attack-Paphos', mission='patrol', MissionType='CAP', targetzone='Paphos', condition = function() return not zones.pinarbashi.wasBlue end})
})
zones.gecitkale:addGroups({
	GroupCommander:new({name='gecitkale-supply-Ercan', mission='supply', targetzone='Ercan'}),
	GroupCommander:new({name='gecitkale-supply-Pinarbashi', mission='supply', targetzone='Pinarbashi'}),
	GroupCommander:new({name='gecitkale-supply-Larnaca', mission='supply', targetzone='Larnaca'}),
	GroupCommander:new({name='gecitkale-attak-Pinabashi', mission='attack', targetzone='Pinabashi'})
	})
zones.redcarrier:addGroups({
	GroupCommander:new({name='tarawa-supply-Incirlik-Blue', mission='supply', targetzone='Incirlik', urgent = function() return zones.incirlik.side == 0 end, ForceUrgent = true}),
})
zones.larnaca:addGroups({
	GroupCommander:new({name='larnaca-patrol-larnaca', mission='patrol', targetzone='Larnaca'}),
	GroupCommander:new({name='Larnaca-supply-Red-Carrier-blue-Boat', mission='supply', targetzone='Red Carrier', type='surface', condition = function() return not zones.silkworm.active end, urgent = function() return zones.redcarrier.side == 0 end, ForceUrgent = true})

})
zones.incirlik:addGroups({
	GroupCommander:new({name='incirlik-supply-Hatay-blue', mission='supply', targetzone='Hatay'}),
	GroupCommander:new({name='incirlik-supply-FOB Alpha-blue', mission='supply', targetzone='FOB Alpha'}),
	GroupCommander:new({name='incirlik-supply-incirlik-defence', mission='supply', targetzone='Incirlik Defence', type='surface'}),
	GroupCommander:new({name='Incirlik-patrol-Incirlik-F16', mission='patrol',MissionType='CAP', Era='Modern', targetzone='Red Carrier'}),
	GroupCommander:new({name='Incirlik-patrol-Incirlik-F16-Coldwar', mission='patrol',MissionType='CAP', Era='Coldwar', targetzone='Red Carrier'}),
	GroupCommander:new({name='Incirlik-attack-Gecitkale-F16', mission='attack',MissionType='CAP', Era='Modern', targetzone='Gecitkale'}),
	GroupCommander:new({name='Incirlik-attack-Gecitkale-Coldwar', mission='attack',MissionType='CAP', Era='Coldwar', targetzone='Gecitkale'}),
})
zones.hatay:addGroups({
	GroupCommander:new({name='hatay-supply-Minakh-blue', mission='supply', targetzone='Minakh'}),
	GroupCommander:new({name='hatay-supply-Taftanaz-blue', mission='supply', targetzone='Taftanaz'}),
	GroupCommander:new({name='hatay-supply-Minakh', mission='supply', targetzone='Minakh', condition = function() return zones.incirlik.wasBlue end}),
	GroupCommander:new({name='hatay-supply-Taftanaz', mission='supply', targetzone='Taftanaz', condition = function() return zones.incirlik.wasBlue end}),
	GroupCommander:new({name='hatay-supply-Al-Assad', mission='supply', targetzone='Bassel Al-Assad'}),
	GroupCommander:new({name='hatay-supply-Bravo-blue', mission='supply', targetzone='Bravo'}),
	GroupCommander:new({name='hatay-supply-Bravo', mission='supply', targetzone='Bravo'}),
	GroupCommander:new({name='hatay-patrol-Incirlik', mission='attack', MissionType='CAP', targetzone='Incirlik'}),
	GroupCommander:new({name='hatay-patrol-hatay-blue', mission='patrol',Era='Modern', targetzone='Hatay'}),
	GroupCommander:new({name='hatay-patrol-hatay-blue-Coldwar', mission='patrol',Era='Coldwar', targetzone='Hatay'}),
	GroupCommander:new({name='hatay-attack-Incirlik', mission='attack', targetzone='Incirlik'})
})
zones.durayhim:addGroups({
	GroupCommander:new({name='durayhim-attack-Duhur-1', mission='attack', targetzone='Abu al-Duhur', type='surface', spawnDelayFactor = 2}),
	GroupCommander:new({name='durayhim-attack-Duhur-2', mission='attack', targetzone='Abu al-Duhur', type='surface'}),
	GroupCommander:new({name='durayhim-attack-Duhur-3', mission='attack', targetzone='Abu al-Duhur', type='surface', spawnDelayFactor = 1.5})
})
zones.gaziantep:addGroups({
	GroupCommander:new({name='Gaziantep-patrol-Gaziantep', mission='patrol', MissionType='CAP', targetzone='Gaziantep'})
})

zones.minakh:addGroups({
	GroupCommander:new({name='minakh-supply-Hatay-blue', mission='supply', targetzone='Hatay'}),
	GroupCommander:new({name='minakh-supply-Aleppo-blue', mission='supply', targetzone='Aleppo'}),
	GroupCommander:new({name='minakh-supply-Hatay', mission='supply', targetzone='Hatay'}),
	GroupCommander:new({name='minakh-supply-Aleppo', mission='supply', targetzone='Aleppo'}),
	GroupCommander:new({name='minakh-supply-Charlie', mission='supply', targetzone='Charlie'}),
	GroupCommander:new({name='minakh-attack-Taftanaz', mission='attack', targetzone='Taftanaz'}),
	GroupCommander:new({name='minakh-attack-Aleppo-blue', mission='attack', targetzone='Aleppo'}),
	GroupCommander:new({name='minakh-supply-Gaziantep', mission='supply', targetzone='Gaziantep', condition = function() return zones.incirlik.wasBlue end, urgent = zones.gaziantep.side == 0}),
	GroupCommander:new({name='minakh-supply-Gaziantep-blue', mission='supply', targetzone='Gaziantep'}),
	GroupCommander:new({name='minakh-supply-Manbij-blue', mission='supply', targetzone='Manbij'})
})

zones.aleppo:addGroups({
	GroupCommander:new({name='aleppo-supply-Minakh-blue', mission='supply', targetzone='Minakh'}),
	GroupCommander:new({name='aleppo-supply-Taftanaz-blue', mission='supply', targetzone='Taftanaz'}),
	GroupCommander:new({name='aleppo-supply-Jirah-blue', mission='supply', targetzone='Jirah'}),
	GroupCommander:new({name='aleppo-supply-Duhur-blue', mission='supply', targetzone='Abu al-Duhur'}),
	GroupCommander:new({name='aleppo-supply-Minakh', mission='supply', targetzone='Minakh', condition = function() return zones.incirlik.wasBlue end}),
	GroupCommander:new({name='aleppo-supply-Jirah', mission='supply', targetzone='Jirah', condition = function() return zones.incirlik.wasBlue end, urgent = zones.jirah.side == 0}),
	GroupCommander:new({name='aleppo-supply-Duhur', mission='supply', targetzone='Abu al-Duhur', condition = function() return zones.incirlik.wasBlue end, urgent = zones.alduhur.side == 0}),
	GroupCommander:new({name='aleppo-supply-Delta-blue', mission='supply', targetzone='Delta'}),
	GroupCommander:new({name='aleppo-supply-Delta', mission='supply', targetzone='Delta', condition = function() return zones.incirlik.wasBlue end, urgent = zones.delta.side == 0}),
	GroupCommander:new({name='aleppo-patrol-Taftanaz', mission='patrol', MissionType='CAP', targetzone='Taftanaz'}),
	GroupCommander:new({name='aleppo-patrol-Charlie', mission='attack', MissionType='CAP', targetzone='Hatay', condition = function() return zones.charlie.wasBlue end}),
	GroupCommander:new({name='aleppo-supply-Manbij', mission='supply', targetzone='Manbij', condition = function() return zones.incirlik.wasBlue end, urgent = zones.manbij.side == 0}),
	GroupCommander:new({name='aleppo-attack-bravo', mission='attack', targetzone='Bravo'}),
	GroupCommander:new({name='aleppo-attack-Duhur', mission='attack', targetzone='Abu al-Duhur', type='surface'}),
	GroupCommander:new({name='aleppo-attack-Duhur-blue', mission='attack', targetzone='Abu al-Duhur'}),
	GroupCommander:new({name='aleppo-patrol-Duhur', mission='patrol', targetzone='Abu al-Duhur'})
})

zones.taftanaz:addGroups({
	GroupCommander:new({name='taftanaz-supply-Hatay-blue', mission='supply', targetzone='Hatay'}),
	GroupCommander:new({name='taftanaz-supply-Aleppo-blue', mission='supply', targetzone='Aleppo'}),
	GroupCommander:new({name='taftanaz-supply-Duhur-blue', mission='supply', targetzone='Abu al-Duhur'}),
	GroupCommander:new({name='taftanaz-supply-Hatay', mission='supply', targetzone='Hatay'}),
	GroupCommander:new({name='taftanaz-supply-Duhur', mission='supply', targetzone='Abu al-Duhur', condition = function() return zones.incirlik.wasBlue end, urgent = zones.alduhur.side == 0}),
	GroupCommander:new({name='taftanaz-supply-Delta-blue', mission='supply', targetzone='Delta'}),
	GroupCommander:new({name='taftanaz-supply-Delta', mission='supply', targetzone='Delta'}),
	GroupCommander:new({name='taftanaz-supply-Power Plant-blue', mission='supply', targetzone='Power Plant'}),
	GroupCommander:new({name='taftanaz-supply-Power Plant', mission='supply', targetzone='Power Plant', condition = function() return zones.incirlik.wasBlue end, urgent = zones.powerplant.side == 0}),
	GroupCommander:new({name='taftanaz-attack-Hatay', mission='attack', targetzone='Hatay'}),
	GroupCommander:new({name='taftanaz-attack-Minakh', mission='attack', targetzone='Minakh'}),
	GroupCommander:new({name='taftanaz-attack-Power Plant', mission='attack', targetzone='Power Plant'}),
	GroupCommander:new({name='taftanaz-attack-Duhur', mission='attack', targetzone='Abu al-Duhur'}),
	GroupCommander:new({name='taftanaz-attack-Power Plant-blue', mission='attack', targetzone='Power Plant'}),
	GroupCommander:new({name='taftanaz-attack-Duhur-blue', mission='attack', targetzone='Abu al-Duhur'})
})
zones.juliett:addGroups({
	GroupCommander:new({name='Juliett-supply-Refinery-blue', mission='supply', targetzone='Refinery'}),
})
zones.jirah:addGroups({
	GroupCommander:new({name='jirah-supply-Aleppo-blue', mission='supply', targetzone='Aleppo'}),
	GroupCommander:new({name='jirah-supply-Tabqa-blue', mission='supply', targetzone='Tabqa'}),
	GroupCommander:new({name='jirah-supply-Duhur-blue', mission='supply', targetzone='Abu al-Duhur'}),
	GroupCommander:new({name='jirah-supply-Aleppo', mission='supply', targetzone='Aleppo'}),
	GroupCommander:new({name='jirah-supply-Tabqa', mission='supply', targetzone='Tabqa'}),
	GroupCommander:new({name='jirah-supply-Duhur', mission='supply', targetzone='Abu al-Duhur'}),
	GroupCommander:new({name='jirah-supply-Durayhim-blue', mission='supply', targetzone='Durayhim'}),
	GroupCommander:new({name='jirah-supply-Durayhim', mission='supply', targetzone='Durayhim', condition = function() return zones.minakh.wasBlue or zones.taftanaz.wasBlue end, urgent = zones.durayhim.side == 0}),
	GroupCommander:new({name='jirah-supply-foxtrot-blue', mission='supply', targetzone='Foxtrot'}),
	GroupCommander:new({name='jirah-supply-foxtrot', mission='supply', targetzone='Foxtrot', condition = function() return zones.minakh.wasBlue or zones.taftanaz.wasBlue or zones.aleppo.wasBlue end, urgent = zones.foxtrot.side == 0}),
	GroupCommander:new({name='jirah-attack-Hatay', mission='attack', MissionType='CAP', targetzone='Hatay', spawnDelayFactor = 1.5}),
	GroupCommander:new({name='jirah-attack-Hama', mission='attack', MissionType='CAP', targetzone='Hama'}),
	GroupCommander:new({name='jirah-attack-Aleppo', mission='attack', targetzone='Aleppo'}),
	GroupCommander:new({name='jirah-attack-Duhur', mission='attack', targetzone='Abu al-Duhur', spawnDelayFactor = 2}),
	GroupCommander:new({name='jirah-attack-Tabqa', mission='attack', targetzone='Tabqa'}),
	GroupCommander:new({name='jirah-attack-Juliett', mission='attack', targetzone='Juliett'}),
	GroupCommander:new({name='jirah-attack-Aleppo-surface', mission='attack', targetzone='Aleppo', type='surface'}),
	GroupCommander:new({name='jirah-attack-Durayhim', mission='attack', targetzone='Durayhim', type='surface'})
})

zones.tabqa:addGroups({
	GroupCommander:new({name='tabqa-supply-Jirah-blue', mission='supply', targetzone='Jirah'}),
	GroupCommander:new({name='tabqa-supply-Jirah', mission='supply', targetzone='Jirah'}),
	GroupCommander:new({name='tabqa-supply-foxtrot', mission='supply', targetzone='Foxtrot', condition = function() return zones.minakh.wasBlue or zones.aleppo.wasBlue end, urgent = zones.foxtrot.side == 0}),
	GroupCommander:new({name='tabqa-supply-foxtrot-blue', mission='supply', targetzone='Foxtrot'}),
	GroupCommander:new({name='tabqa-supply-Raqqa-blue', mission='supply', targetzone='Raqqa'}),
	GroupCommander:new({name='tabqa-supply-Raqqa', mission='supply', targetzone='Raqqa', condition = function() return zones.alduhur.wasBlue or zones.jirah.wasBlue end, urgent = zones.raqqa.side == 0}),
	GroupCommander:new({name='tabqa-supply-Golf', mission='supply', targetzone='Golf', condition = function() return zones.alduhur.wasBlue end, urgent = zones.golf.side == 0}),
	GroupCommander:new({name='tabqa-supply-Golf-blue', mission='supply', targetzone='Golf'}),
	GroupCommander:new({name='tabqa-supply-Dam-blue', mission='supply', targetzone='Dam'}),
	GroupCommander:new({name='tabqa-supply-Dam', mission='supply', targetzone='Dam', condition = function() return zones.alduhur.wasBlue or zones.jirah.wasBlue end, urgent = zones.dam.side == 0}),
	GroupCommander:new({name='tabqa-supply-millbase-blue', mission='supply', targetzone='Military Base'}),
	GroupCommander:new({name='tabqa-supply-millbase', mission='supply', targetzone='Military Base', condition = function() return zones.alduhur.wasBlue end, urgent = zones.milbase.side == 0}),
	GroupCommander:new({name='tabqa-supply-Juliett-blue', mission='supply', targetzone='Juliett'}),
	GroupCommander:new({name='tabqa-supply-Juliett', mission='supply', targetzone='Juliett', condition = function() return zones.aleppo.wasBlue or zones.alduhur.wasBlue end, urgent = zones.juliett.side == 0}),
	GroupCommander:new({name='tabqa-supply-Oscar-blue', mission='supply', targetzone='Oscar'}),
	GroupCommander:new({name='tabqa-supply-Oscar', mission='supply', targetzone='Oscar'}),
	GroupCommander:new({name='tabqa-patrol-Tabqa', mission='patrol', MissionType='CAP', targetzone='Tabqa'}),
	GroupCommander:new({name='tabqa-patrol-Palmyra', mission='patrol', MissionType='CAP', targetzone='Palmyra'}),
	GroupCommander:new({name='tabqa-attack-Foxtrot', mission='attack', targetzone='Foxtrot', spawnDelayFactor = 1.5, diceChance = 50}),
	GroupCommander:new({name='tabqa-attack-Golf', mission='attack', targetzone='Golf'}),
	GroupCommander:new({name='tabqa-attack-Raqqa', mission='attack', targetzone='Raqqa'}),
	GroupCommander:new({name='tabqa-attack-Dam', mission='attack', targetzone='Dam'}),
	GroupCommander:new({name='tabqa-attack-millbase', mission='attack', targetzone='Military Base'}),
	GroupCommander:new({name='tabqa-attack-Taftanaz', mission='attack', MissionType='CAP', targetzone='Taftanaz', spawnDelayFactor = 1.5})
})

zones.milbase:addGroups({
	GroupCommander:new({name='milbase-supply-Oscar-blue', mission='supply', targetzone='Oscar', type='surface'}),
	GroupCommander:new({name='milbase-supply-Oscar', mission='supply', targetzone='Oscar', type='surface'}),
	GroupCommander:new({name='milbase-attack-Juliett', mission='attack', targetzone='Juliett', type='surface', spawnDelayFactor = 4}),
	GroupCommander:new({name='milbase-attack-Juliett-2', mission='attack', targetzone='Juliett', type='surface'}),
	GroupCommander:new({name='milbase-supply-Palmyra-Blue', mission='supply', targetzone='Palmyra'})
})

zones.alduhur:addGroups({
	GroupCommander:new({name='alduhur-supply-Aleppo-blue', mission='supply', targetzone='Aleppo'}),
	GroupCommander:new({name='alduhur-supply-Taftanaz-blue', mission='supply', targetzone='Taftanaz'}),
	GroupCommander:new({name='alduhur-supply-Jirah-blue', mission='supply', targetzone='Jirah'}),
	GroupCommander:new({name='alduhur-supply-Hama-blue', mission='supply', targetzone='Hama'}),
	GroupCommander:new({name='alduhur-supply-Al-Assad-blue', mission='supply', targetzone='Bassel Al-Assad'}),
	GroupCommander:new({name='alduhur-supply-Aleppo', mission='supply', targetzone='Aleppo'}),
	GroupCommander:new({name='alduhur-supply-Taftanaz', mission='supply', targetzone='Taftanaz'}),
	GroupCommander:new({name='alduhur-supply-Jirah', mission='supply', targetzone='Jirah'}),
	GroupCommander:new({name='alduhur-supply-Hama', mission='supply', targetzone='Hama'}),
	GroupCommander:new({name='alduhur-supply-Al-Assad', mission='supply', targetzone='Bassel Al-Assad'}),
	GroupCommander:new({name='alduhur-supply-India', mission='supply', targetzone='India', condition = function() return zones.hatay.wasBlue end, urgent = zones.india.side == 0}),
	GroupCommander:new({name='alduhur-supply-India-blue', mission='supply', targetzone='India'}),
	GroupCommander:new({name='alduhur-supply-Factory-blue', mission='supply', targetzone='Factory'}),
	GroupCommander:new({name='alduhur-supply-Factory', mission='supply', targetzone='Factory'}),
	GroupCommander:new({name='alduhur-supply-November-blue', mission='supply', targetzone='November'}),
	GroupCommander:new({name='alduhur-supply-November', mission='supply', targetzone='November'}),
	GroupCommander:new({name='alduhur-supply-Papa', mission='supply', targetzone='Papa', type='surface'}),
	GroupCommander:new({name='alduhur-supply-Papa-blue', mission='supply', targetzone='Papa', type='surface'}),
	GroupCommander:new({name='alduhur-attack-Al-Assad', mission='attack', targetzone='Bassel Al-Assad'}),
	GroupCommander:new({name='alduhur-patrol-Al-Assad', mission='patrol', MissionType='CAP', targetzone='Bassel Al-Assad'}),
	GroupCommander:new({name='alduhur-attack-Factory', mission='attack', targetzone='Factory'}),
	GroupCommander:new({name='alduhur-attack-Hotel', mission='attack', Era='Modern', targetzone='Hotel'}),
	GroupCommander:new({name='alduhur-attack-Hotel-Coldwar', mission='attack', Era='Coldwar', targetzone='Hotel'}),
	GroupCommander:new({name='alduhur-patrol-Duhur', mission='patrol', MissionType='CAP', targetzone='Abu al-Duhur'})
})

zones.alassad:addGroups({
	GroupCommander:new({name='alassad-supply-Hatay-blue', mission='supply', targetzone='Hatay'}),
	GroupCommander:new({name='alassad-supply-Hama-blue', mission='supply', targetzone='Hama'}),
	GroupCommander:new({name='alassad-supply-Duhur-blue', mission='supply', targetzone='Abu al-Duhur'}),
	GroupCommander:new({name='alassad-supply-Hatay', mission='supply', targetzone='Hatay'}),
	GroupCommander:new({name='alassad-supply-Hama', mission='supply', targetzone='Hama', condition = function() return zones.incirlik.wasBlue end, urgent = zones.alduhur.side == 0}),
	GroupCommander:new({name='alassad-supply-Duhur', mission='supply', targetzone='Abu al-Duhur', condition = function() return zones.incirlik.wasBlue end, urgent = zones.alduhur.side == 0}),
	GroupCommander:new({name='alassad-patrol-alduhur', mission='attack', MissionType='CAP',Era='Modern', targetzone='Hatay'}),
	GroupCommander:new({name='alassad-patrol-alduhur-Coldwar', mission='attack', MissionType='CAP',Era='Coldwar', targetzone='Hatay'}),
	GroupCommander:new({name='alassad-supply-Hotel', mission='supply', targetzone='Hotel'}),
	GroupCommander:new({name='alassad-supply-Hotel-blue', mission='supply', targetzone='Hotel'}),
	GroupCommander:new({name='alassad-supply-Romeo-blue', mission='supply', targetzone='Romeo'}),
	GroupCommander:new({name='alassad-supply-Romeo', mission='supply', targetzone='Romeo'}),
	GroupCommander:new({name='alassad-patrol-Echo', mission='patrol', targetzone='Red Carrier'}),
	GroupCommander:new({name='alassad-patrol-hotel', mission='patrol', MissionType='CAP',Era='Modern', targetzone='Hotel'}),
	GroupCommander:new({name='alassad-patrol-hotel-Coldwar', mission='patrol', MissionType='CAP',Era='Coldwar', targetzone='Hotel'}),
	GroupCommander:new({name='alassad-patrol-Al-Assad-blue2', mission='patrol', targetzone='Bassel Al-Assad'}),
	GroupCommander:new({name='alassad-patrol-Al-Assad-blue', mission='patrol', targetzone='Bassel Al-Assad'}),
	--GroupCommander:new({name='alassad-supply-incirlik', mission='supply', targetzone='Incirlik'}),
	GroupCommander:new({name='alassad-patrol-india', mission='patrol', MissionType='CAP', targetzone='India'})
})

zones.hama:addGroups({
	GroupCommander:new({name='hama-supply-Al-Assad-blue', mission='supply', targetzone='Bassel Al-Assad', condition = function() return zones.hatay.wasBlue end}),
	GroupCommander:new({name='hama-supply-Duhur-blue', mission='supply', targetzone='Abu al-Duhur'}),
	GroupCommander:new({name='hama-supply-Palmyra-blue', mission='supply', targetzone='Palmyra'}),
	GroupCommander:new({name='hama-supply-Al-Assad', mission='supply', targetzone='Bassel Al-Assad'}),
	GroupCommander:new({name='hama-supply-Duhur', mission='supply', targetzone='Abu al-Duhur'}),
	GroupCommander:new({name='hama-supply-Palmyra', mission='supply', targetzone='Palmyra', condition = function() return zones.alduhur.wasBlue end, urgent = zones.palmyra.side == 0}),
	GroupCommander:new({name='hama-supply-India', mission='supply', targetzone='India'}),
	GroupCommander:new({name='hama-supply-India-blue', mission='supply', targetzone='India'}),
	GroupCommander:new({name='hama-supply-November-blue', mission='supply', targetzone='November'}),
	GroupCommander:new({name='hama-supply-November', mission='supply', targetzone='November'}),
	GroupCommander:new({name='hama-supply-Romeo-blue', mission='supply', targetzone='Romeo'}),
	GroupCommander:new({name='hama-supply-Romeo', mission='supply', targetzone='Romeo'}),
	GroupCommander:new({name='hama-patrol-India', mission='patrol', MissionType='CAP', targetzone='India'}),
	GroupCommander:new({name='hama-patrol-Hama', mission='patrol', MissionType='CAP', targetzone='Hama'}),
	GroupCommander:new({name='hama-attack-Factory', mission='attack', targetzone='Factory'}),
	GroupCommander:new({name='hama-attack-Romeo', mission='attack', targetzone='Romeo'}),
	GroupCommander:new({name='hama-attack-Duhur-blue', mission='attack', targetzone='Abu al-Duhur'})
})
zones.november:addGroups({
	GroupCommander:new({name='november-attack-Duhur', mission='attack', targetzone='Abu al-Duhur', type='surface'}),
	GroupCommander:new({name='november-attack-hama', mission='attack', targetzone='Hama', type='surface'}),
	GroupCommander:new({name='november-attack-india', mission='attack', targetzone='India', type='surface'})
})
zones.palmyra:addGroups({
	GroupCommander:new({name='palmyra-supply-Hama-blue', mission='supply', targetzone='Hama'}),
	GroupCommander:new({name='palmyra-supply-Hama', mission='supply', targetzone='Hama'}),
	GroupCommander:new({name='palmyra-supply-SA5-blue', mission='supply', targetzone='SA-5'}),
	GroupCommander:new({name='palmyra-supply-SA5', mission='supply', targetzone='SA-5', urgent = zones.sa5.side == 0, spawnDelayFactor = 2}),
	GroupCommander:new({name='palmyra-supply-millbase-blue', mission='supply', targetzone='Military Base'}),
	GroupCommander:new({name='palmyra-supply-millbase', mission='supply', targetzone='Military Base', condition = function() return zones.alduhur.wasBlue or zones.tabqa.wasBlue end, urgent = zones.milbase.side == 0}),
	GroupCommander:new({name='palmyra-patrol-SA5', mission='patrol', targetzone='SA-5',era='Modern', spawnDelayFactor = 2}),
	GroupCommander:new({name='palmyra-patrol-SA5-Cold-War', mission='patrol', targetzone='SA-5',era='Coldwar', spawnDelayFactor = 2}),
	GroupCommander:new({name='palmyra-attack-Hama', mission='attack', targetzone='Hama'}),
	GroupCommander:new({name='palmyra-attack-Tabqa', mission='attack', targetzone='Tabqa'}),
	GroupCommander:new({name='palmyra-supply-Refinery-blue', mission='supply', targetzone='Refinery'}),
	GroupCommander:new({name='palmyra-supply-Refinery', mission='supply', targetzone='Refinery', urgent = function() return zones.refinery.side == 0 end}), -- I wish to remove this, (testing it)
	GroupCommander:new({name='palmyra-patrol-Kilo', mission='patrol', MissionType='CAP', targetzone='Kilo'}),
	GroupCommander:new({name='palmyra-attack-Refinery-surface', mission='attack', targetzone='Refinery', type='surface'}),
	GroupCommander:new({name='palmyra-patrol-Refinery', mission='patrol', MissionType='CAP',Era='Modern', targetzone='Refinery', spawnDelayFactor = 1.5}),
	GroupCommander:new({name='palmyra-patrol-Palmyra-blue', mission='patrol', targetzone='Palmyra'}),
	GroupCommander:new({name='palmyra-attack-Hama-surface', mission='attack', targetzone='Hama', type='surface'}),
	GroupCommander:new({name='palmyra-supply-Tiyas-blue', mission='supply', targetzone='Tiyas'}),
	GroupCommander:new({name='palmyra-supply-Tiyas', mission='supply', targetzone='Tiyas', urgent = zones.tiyas.side == 0})	
})
zones.tiyas:addGroups({
	GroupCommander:new({name='Tiyas-attack-Refinery', mission='patrol', MissionType='CAP',Era='Coldwar', targetzone='Refinery'}),
	GroupCommander:new({name='Tiyas-supply-Shayrat', mission='supply', targetzone='Shayrat'})
})
zones.refinery:addGroups({
	GroupCommander:new({name='refinery-supply-Palmyra-surface', mission='supply', targetzone='Palmyra', type='surface', condition = function() return zones.alduhur.wasBlue end, urgent = zones.palmyra.side == 0}),
	GroupCommander:new({name='refinery-supply-Palmyra-blue', mission='supply', targetzone='Palmyra', type='surface'}),
	GroupCommander:new({name='refinery-supply-Juliett-surface', mission='supply', targetzone='Juliett', type='surface', condition = function() return zones.aleppo.wasBlue end, urgent = zones.juliett.side == 0}),
	GroupCommander:new({name='refinery-supply-Juliett-blue', mission='supply', targetzone='Juliett', type='surface'})
})
zones.factory:addGroups({
	GroupCommander:new({name='factory-supply-Hama-surface', mission='supply', targetzone='Hama', type='surface', condition = function() return zones.hatay.wasBlue end}),
	GroupCommander:new({name='factory-supply-Hama-blue', mission='supply', targetzone='Hama', type='surface'})
})
zones.romeo:addGroups({
	GroupCommander:new({name='romeo-attack-Factory-blue', mission='attack', targetzone='Factory', type='surface'}),
	GroupCommander:new({name='romeo-attack-Hama-blue', mission='attack', targetzone='Hama', type='surface'}),
	GroupCommander:new({name='romeo-supply-Factory-blue', mission='supply', targetzone='Factory', type='surface'}),
	GroupCommander:new({name='romeo-supply-Hama-blue', mission='supply', targetzone='Hama', type='surface'})
})
zones.carrier:addGroups({
	GroupCommander:new({name='carrier-supply-Romeo', mission='supply', targetzone='Romeo', type='carrier_air'}),
	GroupCommander:new({name='carrier-supply-Bassel Al-Assad', mission='supply', targetzone='Bassel Al-Assad', type='carrier_air'})
	
})
zones.alpha:addGroups({
	GroupCommander:new({name='Alpha-supply-Hatay-blue', mission='supply', targetzone='Hatay'})
})
zones.raqqa:addGroups({
	GroupCommander:new({name='raqqa-supply-Foxtrot', mission='supply', targetzone='Foxtrot', type='surface', condition = function() return zones.minakh.wasBlue or zones.aleppo.wasBlue end, urgent = zones.foxtrot.side == 0}),
	GroupCommander:new({name='raqqa-supply-Dam', mission='supply', targetzone='Dam', type='surface', condition = function() return zones.alduhur.wasBlue end, urgent = zones.dam.side == 0}),
	GroupCommander:new({name='raqqa-supply-Tabqa', mission='supply', targetzone='Tabqa', type='surface'})
})
zones.dam:addGroups({
	GroupCommander:new({name='dam-attack-Jirah', mission='attack', targetzone='Jirah', type='surface', spawnDelayFactor = 2}),
	GroupCommander:new({name='dam-attack-Foxtrot', mission='attack', targetzone='Foxtrot', type='surface', spawnDelayFactor = 1.5})
})

zones.beirut:addGroups({
	GroupCommander:new({name='beirut-patrol-beirut', mission='patrol', MissionType='CAP',Era='Modern', targetzone='Beirut', spawnDelayFactor = 1.5}),
	GroupCommander:new({name='beirut-patrol-beirut-Coldwar', mission='patrol', MissionType='CAP',Era='Coldwar', targetzone='Beirut', spawnDelayFactor = 1.5})
})
zones.renemouawad:addGroups({
	GroupCommander:new({name='renemouawad-patrol-renemouawad', mission='patrol', MissionType='CAP',Era='Modern', targetzone='Rene Mouawad'}),
	GroupCommander:new({name='renemouawad-patrol-renemouawad-Coldwar', mission='patrol', MissionType='CAP',Era='Coldwar', targetzone='Rene Mouawad'})
})
zones.tiyas:addGroups({
	GroupCommander:new({name='Tiyas-supply-Shayrat-blue', mission='supply', targetzone='Shayrat'})
})
zones.shayrat:addGroups({
	GroupCommander:new({name='shayrat-supply-Al-Qusayr-blue', mission='supply', targetzone='Al Qusayr'}),
	GroupCommander:new({name='shayrat-supply-An-Nasiriyah-blue', mission='supply', targetzone='An Nasiriyah'}),
	GroupCommander:new({name='shayrat-supply-Tiyas', mission='supply', targetzone='Tiyas'}),
	GroupCommander:new({name='Shayrat-attack-palmyra', mission='attack',MissionType='CAP', targetzone='Palmyra', Era='Modern', spawnDelayFactor = 2.0}),
	GroupCommander:new({name='Shayrat-attack-palmyra-Cold-War', mission='attack',MissionType='CAP', targetzone='Palmyra', Era='Coldwar', spawnDelayFactor = 2.0}),
	GroupCommander:new({name='Shayrat-attack-Hama', mission='attack',MissionType='CAP', targetzone='Hama', spawnDelayFactor = 2.0})
	
})
zones.marka:addGroups({
	GroupCommander:new({name='Marka-Supply-King-hussein-air-college', mission='supply', targetzone='King Hussein Air College', condition = function() return zones.palmyra.wasBlue end, urgent = zones.kinghussein.side == 0, spawnDelayFactor = 1.5}),
	GroupCommander:new({name='Marka-Supply-Muwaffaq-Salti', mission='supply', targetzone='Muwaffaq Salti', condition = function() return zones.palmyra.wasBlue end, urgent = zones.muwaffaq.side == 0}),
	GroupCommander:new({name='Marka-Supply-Prince-Hassan', mission='supply', targetzone='Prince Hassan', condition = function() return zones.palmyra.wasBlue end, urgent = zones.princehassan.side == 0}),
	GroupCommander:new({name='Marka-patrol-king-hussein', mission='attack', targetzone='Thalah', MissionType='CAP',Era='Modern', spawnDelayFactor = 1.5, function() return not zones.kinghussein.wasBlue end}),
	GroupCommander:new({name='Marka-patrol-king-hussein-Coldwar', mission='attack', targetzone='Thalah', MissionType='CAP',Era='Coldwar', spawnDelayFactor = 1.5, function() return not zones.kinghussein.wasBlue end}),
	GroupCommander:new({name='Marka-attack-king-hussein', mission='attack', targetzone='King Hussein Air College', spawnDelayFactor = 3}),
	GroupCommander:new({name='Marka-attack-king-hussein-Coldwar', mission='attack', targetzone='King Hussein Air College',Era='Coldwar', spawnDelayFactor = 3}),
	GroupCommander:new({name='Marka-Supply-Ben-Gurion', mission='supply', targetzone='Ben Gurion', spawnDelayFactor = 1.5}),
	GroupCommander:new({name='Marka-Supply-Ben-Gurion-blue', mission='supply', targetzone='Ben Gurion'})


})
zones.kinghussein:addGroups({
	GroupCommander:new({name='King-hussein-air-college-supply-marka', mission='supply', targetzone='Marka', condition = function() return zones.annasiriyah.wasBlue end, urgent = zones.marka.side == 0}),
	GroupCommander:new({name='King-hussein-air-college-supply-prince-hassan', mission='supply', targetzone='Prince Hassan', condition = function() return zones.annasiriyah.wasBlue end, urgent = zones.princehassan.side == 0}),
	GroupCommander:new({name='King-hussein-air-college-supply-Muwaffaq-salti', mission='supply', targetzone='Muwaffaq Salti', condition = function() return zones.annasiriyah.wasBlue end, urgent = zones.muwaffaq.side == 0}),
	GroupCommander:new({name='King-hussein-air-college-supply-thalah', mission='supply', targetzone='Thalah'}),
	GroupCommander:new({name='King-hussein-air-college-supply-marka-blue', mission='supply', targetzone='Marka'}),
	GroupCommander:new({name='King-hussein-air-college-supply-prince-hassan-blue', mission='supply', targetzone='Prince Hassan'})

})
zones.princehassan:addGroups({
	GroupCommander:new({name='hassan-supply-muwaffaq', mission='supply', targetzone='Muwaffaq Salti'}),
	GroupCommander:new({name='hassan-supply-muwaffaq-blue', mission='supply', targetzone='Muwaffaq Salti'}),
	GroupCommander:new({name='hassan-supply-marka', mission='supply', targetzone='Marka'}),
	GroupCommander:new({name='hassan-supply-King-hussein-air-college-marka', mission='supply', targetzone='King Hussein Air College'})

})
zones.alqusayr:addGroups({
	GroupCommander:new({name='Qusayr-supply-shayrat-surface', mission='supply', targetzone='Shayrat', type='surface', condition = function() return zones.alduhur.wasBlue end, urgent = zones.shayrat.side == 0, spawnDelayFactor = 1.7}),
	GroupCommander:new({name='Qusayr-supply-shayrat-blue', mission='supply', targetzone='Shayrat'}),
	GroupCommander:new({name='Qusayr-supply-mouawad', mission='supply', targetzone='Rene Mouawad'}),
	GroupCommander:new({name='Qusayr-supply-Rene Mouawad-blue', mission='supply', targetzone='Rene Mouawad'}),
	GroupCommander:new({name='Qusayr-attack-palmyra', mission='attack', targetzone='Palmyra', spawnDelayFactor = 1.6}),
	GroupCommander:new({name='qusayr-attack-palmyra-sead', mission='attack', targetzone='Palmyra'})
})
zones.rayak:addGroups({
	GroupCommander:new({name='Rayak-supply-nasiriyah', mission='supply', targetzone='An Nasiriyah', condition = function() return zones.hama.wasBlue end, urgent = zones.annasiriyah.side == 0}),
	GroupCommander:new({name='Rayak-supply-beirut', mission='supply', targetzone='Beirut'})
})		
zones.annasiriyah:addGroups({
	GroupCommander:new({name='nasiriyah-supply-damascus', mission='supply', targetzone='Damascus', condition = function() return zones.palmyra.wasBlue end, urgent = zones.damascus.side == 0}),
	GroupCommander:new({name='nasiriyah-supply-damascus-blue', mission='supply', targetzone='Damascus'}),
	GroupCommander:new({name='nasiriyah-supply-shayrat', mission='supply', targetzone='Shayrat'}),
	GroupCommander:new({name='Nasiriyah-attack-Palmyra', mission='attack', targetzone='Palmyra'})
	
})		
zones.damascus:addGroups({
	GroupCommander:new({name='damascus-supply-roshpina', mission='supply', targetzone='Rosh Pina'}),
	GroupCommander:new({name='damascus-supply-roshpina-blue', mission='supply', targetzone='Rosh Pina'}),
	GroupCommander:new({name='Damascus-patrol-Nasiriyah', mission='supply', targetzone='An Nasiriyah'})
	
})
zones.thalah:addGroups({
	GroupCommander:new({name='Thalah-supply-king-hussein', mission='supply', targetzone='King Hussein Air College', condition = function() return zones.annasiriyah.wasBlue end, urgent = zones.kinghussein.side == 0}),
	GroupCommander:new({name='Thalah-supply-king-hussein-blue', mission='supply', targetzone='King Hussein Air College'})
	
})
zones.roshpina:addGroups({
	GroupCommander:new({name='roshpina-supply-ramat-david-blue', mission='supply', targetzone='Ramat David'}),
	GroupCommander:new({name='roshpina-supply-ramat-david', mission='supply', targetzone='Ramat David', condition = function() return zones.palmyra.wasBlue end, urgent = zones.ramatdavid.side == 0})
})
zones.ramatdavid:addGroups({
	GroupCommander:new({name='ramatdavid-supply-thalah-blue', mission='supply', targetzone='Thalah'}),
	GroupCommander:new({name='ramatdavid-supply-thalah', mission='supply', targetzone='Thalah', condition = function() return zones.palmyra.wasBlue end, urgent = zones.thalah.side == 0})
})
zones.muwaffaq:addGroups({
	GroupCommander:new({name='Muwaffaq-patrol-king-hussein', mission='patrol', MissionType='CAP',Era='Modern', targetzone='King Hussein Air College'}),
	GroupCommander:new({name='Muwaffaq-patrol-king-hussein-Coldwar', mission='patrol', MissionType='CAP',Era='Coldwar', targetzone='King Hussein Air College'}),
	GroupCommander:new({name='Muwaffaq-patrol-king-marka', mission='patrol', MissionType='CAP',Era='Modern', targetzone='Marka', spawnDelayFactor = 1.5}),
	GroupCommander:new({name='Muwaffaq-patrol-king-marka-Coldwar', mission='patrol', MissionType='CAP',Era='Coldwar', targetzone='Marka', spawnDelayFactor = 1.5}),
	

})
zones.bengurion:addGroups({
	GroupCommander:new({name='Ben-gurion-patrol-ben-gurion', mission='patrol', MissionType='CAP',Era='Modern', targetzone='Ben Gurion'}),
	GroupCommander:new({name='Ben-gurion-patrol-ben-gurion-Coldwar', mission='patrol', MissionType='CAP',Era='Coldwar', targetzone='Ben Gurion'}),
	GroupCommander:new({name='Ben-Gurion--supply-ramat-david', mission='supply', targetzone='Ramat David', condition = function() return zones.palmyra.wasBlue end, urgent = zones.ramatdavid.side == 0}),
	GroupCommander:new({name='Ben-Gurion-supply-marka', mission='supply', targetzone='Marka', condition = function() return zones.annasiriyah.wasBlue end, urgent = zones.marka.side == 0})
	
})


function SpawnFriendlyAssets()

	if zones.redcarrier.wasBlue and not IsGroupActive('CVN-73') then
		activateGroupIfNotActive('CVN-73')
		activateGroupIfNotActive('Tarawa')
		destroyGroupIfActive('CVN-72')
		timer.scheduleFunction(function()
		activateGroupIfNotActive('Shel103Y')
		end, {}, timer.getTime() + 3)
	end
	if zones.alpha.side == 2 then
		activateGroupIfNotActive('FOB ALPHA')
		activateGroupIfNotActive('Naval-2')			
	end
	if zones.silkworm.active and zones.redcarrier.side == 0 then
		trigger.action.outText("Our ships are standing to capture red carrier zone but the Silkworm is still active", 15)
		trigger.action.outSoundForCoalition(2, "admin.ogg")
	end
		
	if zones.redcarrier.wasBlue and zones.larnaca.wasBlue and not zones.incirlik.wasBlue then
		SpawnGroupIfNotActive('Navy-Tanker-1')
		SpawnGroupIfNotActive('AirForce Tanker-1')
		
	end
	if zones.aleppo.wasBlue and not zones.palmyra.wasBlue then		
		SpawnGroupIfNotActive('AirForce Tanker')
		SpawnGroupIfNotActive('Navy-Tanker')
	end
	
	if zones.incirlik.wasBlue and not zones.taftanaz.firstCaptureByRed and 
	not zones.minakh.firstCaptureByRed then
		zones.taftanaz:MakeZoneRedAndUpgrade()
		zones.minakh:MakeZoneRedAndUpgrade()
		zones.alpha:MakeZoneBlue()
		zones.charlie:MakeZoneRedAndUpgrade()
		zones.aleppo:MakeZoneRedAndUpgrade()
		destroyGroupIfActive('Navy-Tanker-1')
		destroyGroupIfActive('AirForce Tanker-1')		
	end
	if not zones.hidden2.firstCaptureByRed and zones.incirlik.wasBlue then
		zones.hidden2:MakeZoneRedAndUpgrade()
	end
	if zones.alduhur.wasBlue or zones.tabqa.wasBlue and not zones.november.firstCaptureByRed and 
	not zones.tabqa.firstCaptureByRed then
		zones.palmyra:MakeZoneRedAndUpgrade()
		zones.tabqa:MakeZoneRedAndUpgrade()
		zones.november:MakeZoneRedAndUpgrade()
		zones.juliett:MakeZoneRedAndUpgrade()
		zones.hama:MakeZoneRedAndUpgrade()
		zones.india:MakeZoneRedAndUpgrade()
		zones.sa5:MakeZoneRedAndUpgrade()
		zones.alqusayr:MakeZoneRedAndUpgrade()
		zones.tv:MakeZoneRedAndUpgrade()
		zones.uniform:MakeZoneRedAndUpgrade()
	end
	
	if zones.incirlik.wasBlue and not zones.palmyra.wasBlue then
		SpawnGroupIfNotActive('awacs2')
		destroyGroupIfActive('awacs1')
	end

	if zones.incirlik.wasBlue and zones.palmyra.wasBlue then
		SpawnGroupIfNotActive('AirForce Tanker-2')
		SpawnGroupIfNotActive('Navy-Tanker-2')	
		SpawnGroupIfNotActive('awacs3')
		destroyGroupIfActive('awacs1')
		destroyGroupIfActive('awacs2')
		destroyGroupIfActive('AirForce Tanker')
		destroyGroupIfActive('Navy-Tanker')
		destroyGroupIfActive('Red EWR Awacs')
		SpawnGroupIfNotActive('Red EWR Awacs-1')
	end
	if zones.incirlik.wasBlue then
		destroyGroupIfActive('Red SAM SA-10-deterent')
		destroyGroupIfActive('Red SAM SA-10-deterent-2')
		destroyGroupIfActive('Red SAM SA-10-deterent-3')
		destroyGroupIfActive('Red SAM SA-10-deterent-4')
		destroyGroupIfActive('Red SAM SA-10-deterent-5')
		destroyGroupIfActive('Red SAM SA-10-deterent-6')
		destroyGroupIfActive('Red SAM SA-10-deterent-7')
		destroyGroupIfActive('Red SAM SA-10-deterent-8')
		destroyGroupIfActive('Red SAM SA-10-deterent-9')
		destroyGroupIfActive('Red SAM SA-10-deterent-10')
		
	end

	if zones.hama.wasBlue and not zones.palmyra.firstCaptureByRed then
		zones.palmyra:MakeZoneRedAndUpgrade()
	end
	if zones.hama.wasBlue and not zones.sa5.firstCaptureByRed then
		zones.sa5:MakeZoneRedAndUpgrade()
	end

	if zones.annasiriyah.side == 1 and not zones.jordandefence.firstCaptureByRed then
		zones.jordandefence:MakeZoneRedAndUpgrade()
	end
	
	if zones.redcarrier.wasBlue then

		trigger.action.setMarkupTypeLine(zones.carrier.index, 0)
	end
end
SCHEDULER:New(nil,SpawnFriendlyAssets,{},2,0)

function checkAndDisableFriendlyZones()

	if zones.alduhur.wasBlue and (not CustomFlags["AlduhurFlag"] or CustomFlags["AlduhurFlag"] == false) then
		CustomFlags["AlduhurFlag"] = true				
	end
	if zones.alduhur.side == 1 and CustomFlags["AlduhurFlag"] == true
		then CustomFlags["AlduhurFlag"] = false
		trigger.action.setUserFlag(2, false) -- make the tankers switch back to waypoint 2
		trigger.action.setUserFlag(1, false)
		zones.taftanaz:RecaptureBlueZone()
		zones.aleppo:RecaptureBlueZone()
		zones.hatay:RecaptureBlueZone()
	end
	if zones.hatay.wasBlue and (not CustomFlags["HatayFlag"] or CustomFlags["HatayFlag"] == false) then
		CustomFlags["HatayFlag"] = true
		zones.alpha:disableFriendlyZone()
		
	end

	if zones.hatay.side == 1 and CustomFlags["HatayFlag"] == true
		then CustomFlags["HatayFlag"] = false
		zones.alpha:RecaptureBlueZone()	
	end

	if zones.aleppo.wasBlue and zones.taftanaz.wasBlue and zones.minakh.wasBlue and
	   zones.hatay.side == 2 and not (CustomFlags["AlduhurFlag"] == false) then
		zones.hatay:disableFriendlyZone()
		zones.incirlik:disableFriendlyZone()
		zones.bravo:disableFriendlyZone()
	end
	if  zones.minakh.active and	zones.alduhur.wasBlue and zones.jirah.wasBlue and 
		zones.delta.wasBlue and zones.gaziantep.wasBlue and zones.manbij.wasBlue and
		zones.minakh.wasBlue and zones.minakh.active then
		zones.delta:disableFriendlyZone()
		zones.minakh:disableFriendlyZone()
	end
	if  zones.powerplant.wasBlue and zones.taftanaz.wasBlue and zones.taftanaz.active and
		zones.alduhur.wasBlue then
		zones.powerplant:disableFriendlyZone()
		--zones.taftanaz:disableFriendlyZone()
	end
	if  zones.taftanaz.wasBlue and zones.taftanaz.active and zones.refinery.wasBlue and
		zones.durayhim.wasBlue then
		zones.taftanaz:disableFriendlyZone()
	end
	if  zones.jirah.wasBlue and zones.aleppo.wasBlue and zones.manbij.active and
		zones.manbij.wasBlue and zones.gaziantep.wasBlue and zones.minakh.wasBlue then
		zones.manbij:disableFriendlyZone()
		zones.gaziantep:disableFriendlyZone()
	end
	if  zones.alassad.wasBlue and zones.hotel.wasBlue then
		zones.hotel:disableFriendlyZone()
	end
	if  zones.aleppo.wasBlue and zones.alduhur.wasBlue and zones.aleppo.active and
		zones.jirah.wasBlue then
		zones.aleppo:disableFriendlyZone()
		zones.raqqa:MakeZoneRedAndUpgrade()
	end	
	if  zones.durayhim.wasBlue and zones.jirah.wasBlue and zones.durayhim.active and
		zones.alduhur.wasBlue and zones.golf.wasBlue then
		zones.durayhim:disableFriendlyZone()
	end
	if  zones.hama.wasBlue and zones.juliett.wasBlue and zones.alassad.wasBlue and
		zones.india.wasBlue and zones.taftanaz.wasBlue and zones.romeo.wasBlue then
		zones.alassad:disableFriendlyZone()
		zones.india:disableFriendlyZone()
		zones.taftanaz:disableFriendlyZone()
		zones.romeo:disableFriendlyZone()
	end
	if  zones.alduhur.wasBlue and zones.tabqa.wasBlue and zones.milbase.wasBlue and
		zones.palmyra.wasBlue and zones.oscar.wasBlue and zones.sa5.wasBlue and 
		zones.juliett.wasBlue and zones.hama.wasBlue then 
		zones.alduhur:disableFriendlyZone()
		zones.tabqa:disableFriendlyZone()
		zones.juliett:disableFriendlyZone()
		zones.sa5:disableFriendlyZone()
		zones.hama:disableFriendlyZone()
		zones.milbase:disableFriendlyZone()
		zones.oscar:disableFriendlyZone()
		zones.fobmike:disableFriendlyZone()
		zones.refinery:disableFriendlyZone()
		zones.foblima:disableFriendlyZone()
		zones.papa:disableFriendlyZone()
		zones.november:disableFriendlyZone()
		zones.factory:disableFriendlyZone()
	end
	if zones.annasiriyah.wasBlue and zones.renemouawad.wasBlue and 
       zones.wujah.wasBlue then
	   zones.palmyra:disableFriendlyZone()
	   zones.tiyas:disableFriendlyZone()
	   zones.alqusayr:disableFriendlyZone()
	   zones.shayrat:disableFriendlyZone()
	   zones.renemouawad:disableFriendlyZone()
	   
    end
	if  zones.jirah.active and zones.tabqa.wasBlue and zones.raqqa.wasBlue and
		zones.dam.wasBlue and zones.foxtrot.wasBlue and zones.golf.wasBlue and
		zones.jirah.wasBlue then
		zones.foxtrot:disableFriendlyZone()
		zones.raqqa:disableFriendlyZone()
		zones.golf:disableFriendlyZone()
		zones.dam:disableFriendlyZone()
		zones.jirah:disableFriendlyZone()
		
	end
	if  zones.paphos.wasBlue and zones.paphos.active and zones.polis.wasBlue and 
		zones.pinarbashi.wasBlue and zones.karavostasi.wasBlue and zones.larnaca.wasBlue and 
		zones.ercan.wasBlue	and zones.gecitkale.wasBlue and zones.incirlik.wasBlue and 
		zones.paphos.active then

		zones.akrotiri:disableFriendlyZone()
		zones.paphos:disableFriendlyZone()
		zones.polis:disableFriendlyZone()
		zones.karavostasi:disableFriendlyZone()
		zones.larnaca:disableFriendlyZone()
		zones.ercan:disableFriendlyZone()
		zones.pinarbashi:disableFriendlyZone()
		zones.gecitkale:disableFriendlyZone()
	end
end

SCHEDULER:New(nil,checkAndDisableFriendlyZones,{},3,0)

zones.powerplant:addCriticalObject('PowerPlant1')
zones.powerplant:addCriticalObject('PowerPlant2')

zones.substationnorth:addCriticalObject('substation3')
zones.substationnorth:addCriticalObject('substation4')

zones.substationwest:addCriticalObject('substationW1')
zones.substationwest:addCriticalObject('substationW2')

zones.dam:addCriticalObject('dam1')
zones.dam:addCriticalObject('dam2')

zones.refinery:addCriticalObject('ref1')
zones.refinery:addCriticalObject('ref2')
zones.refinery:addCriticalObject('ref3')
zones.refinery:addCriticalObject('ref4')

zones.factory:addCriticalObject('factory1')
zones.factory:addCriticalObject('factory2')
zones.factory:addCriticalObject('factory3')
zones.factory:addCriticalObject('factory4')

zones.tv:addCriticalObject('tv1')

zones.radio:addCriticalObject('radioTower1')

zones.milbase:addCriticalObject('com_center')
zones.milbase:addCriticalObject('ammo_depot')


zones.incirlik.isHeloSpawn = true
zones.akrotiri.isHeloSpawn = true
zones.alpha.isHeloSpawn = true
zones.minakh.isHeloSpawn = true
zones.alduhur.isHeloSpawn = true
zones.hatay.isHeloSpawn = true
zones.alassad.isHeloSpawn = true
zones.hama.isHeloSpawn = true
zones.jirah.isHeloSpawn = true
zones.tabqa.isHeloSpawn = true
zones.aleppo.isHeloSpawn = true
zones.taftanaz.isHeloSpawn = true
zones.palmyra.isHeloSpawn = true
zones.foblima.isHeloSpawn = true
zones.fobmike.isHeloSpawn = true
zones.juliett.isHeloSpawn = true
zones.foxtrot.isHeloSpawn = true
zones.milbase.isHeloSpawn = true
zones.radio.isHeloSpawn = true
zones.india.isHeloSpawn = true
zones.durayhim.isHeloSpawn = true
zones.hotel.isHeloSpawn = true
zones.carrier.isHeloSpawn = true
zones.thalah.isHeloSpawn = true
zones.bengurion.isHeloSpawn = true
zones.ramatdavid.isHeloSpawn = true
zones.marka.isHeloSpawn = true
zones.gaziantep.isHeloSpawn = true
zones.kinghussein.isHeloSpawn = true
zones.princehassan.isHeloSpawn = true
zones.muwaffaq.isHeloSpawn = true
zones.roshpina.isHeloSpawn = true
zones.redcarrier.isHeloSpawn = true

zones.damascus.isHeloSpawn = true
zones.annasiriyah.isHeloSpawn = true
zones.rayak.isHeloSpawn = true
zones.beirut.isHeloSpawn = true
zones.wujah.isHeloSpawn = true
zones.renemouawad.isHeloSpawn = true
zones.alqusayr.isHeloSpawn = true
zones.shayrat.isHeloSpawn = true
zones.tiyas.isHeloSpawn = true
zones.paphos.isHeloSpawn = true
zones.pinarbashi.isHeloSpawn = true
zones.ercan.isHeloSpawn = true
zones.gecitkale.isHeloSpawn = true
zones.larnaca.isHeloSpawn = true
zones.karavostasi.isHeloSpawn = true
zones.polis.isHeloSpawn = true


zones.incirlik.airbaseName = 'Incirlik'
zones.minakh.airbaseName = 'Minakh'
zones.alduhur.airbaseName = 'Abu al-Duhur'
zones.hatay.airbaseName = 'Hatay'
zones.alassad.airbaseName = 'Bassel Al-Assad'
zones.hama.airbaseName = 'Hama'
zones.jirah.airbaseName = 'Jirah'
zones.tabqa.airbaseName = 'Tabqa'
zones.aleppo.airbaseName = 'Aleppo'
zones.taftanaz.airbaseName = 'Taftanaz'
zones.palmyra.airbaseName = 'Palmyra'
zones.foblima.airbaseName = 'FOB LIMA'
zones.fobmike.airbaseName = 'FOB MIKE'
zones.foxtrot.airbaseName = 'FOB FOXTROT'
zones.juliett.airbaseName = 'FOB JULIETT'
zones.milbase.airbaseName = 'FOB Military Base'
zones.india.airbaseName = 'FOB INDIA'
zones.polis.airbaseName = 'FOB POLIS'
zones.karavostasi.airbaseName = 'FOB KARAVOSTASI'
zones.durayhim.airbaseName = 'FOB DURAYHIM'
zones.hotel.airbaseName = 'FOB HOTEL'
zones.thalah.airbaseName = "Tha'lah"
zones.bengurion.airbaseName = 'Ben Gurion'
zones.ramatdavid.airbaseName = 'Ramat David'
zones.marka.airbaseName = 'Marka'
zones.gaziantep.airbaseName = 'Gaziantep'
zones.kinghussein.airbaseName = 'King Hussein Air College'
zones.princehassan.airbaseName = 'Prince Hassan'
zones.muwaffaq.airbaseName = 'Muwaffaq Salti'
zones.roshpina.airbaseName = 'Rosh Pina'

zones.damascus.airbaseName = 'Damascus'
zones.annasiriyah.airbaseName = 'An Nasiriyah'
zones.rayak.airbaseName = 'Rayak'
zones.beirut.airbaseName = "Beirut-Rafic Hariri"
zones.wujah.airbaseName = 'Wujah Al Hajar'
zones.renemouawad.airbaseName = 'Rene Mouawad'
zones.alqusayr.airbaseName = 'Al Qusayr'
zones.shayrat.airbaseName = 'Shayrat'
zones.tiyas.airbaseName = "Tiyas"


zones.paphos.airbaseName = 'Paphos'
zones.pinarbashi.airbaseName = 'Pinarbashi'
zones.ercan.airbaseName = 'Ercan'
zones.gecitkale.airbaseName = 'Gecitkale'
zones.larnaca.airbaseName = "Larnaca"
zones.akrotiri.airbaseName = 'Akrotiri'


for i,v in pairs(zones) do
	bc:addZone(v)
end

missions = {
}

bc:addConnection("Incirlik","Hatay")
bc:addConnection("Incirlik","FOB Alpha")
bc:addConnection("FOB Alpha","Hatay")
bc:addConnection("Hatay","Taftanaz")
bc:addConnection("Hatay","Minakh")
bc:addConnection("Hatay","Bravo")
bc:addConnection("Hatay","Bassel Al-Assad")
bc:addConnection("Minakh","Aleppo")
bc:addConnection("Minakh","Charlie")

bc:addConnection("Minakh","Gaziantep")
bc:addConnection("Gaziantep","Manbij")
bc:addConnection("Aleppo","Manbij")
bc:addConnection("Manbij","Jirah")

bc:addConnection("Aleppo","Delta")
bc:addConnection("Aleppo","Jirah")
bc:addConnection("Aleppo","Abu al-Duhur")
bc:addConnection("Taftanaz","Abu al-Duhur")
bc:addConnection("Taftanaz","Delta")
bc:addConnection("Taftanaz","Power Plant")
bc:addConnection("Jirah","Tabqa")
bc:addConnection("Jirah","Abu al-Duhur")
bc:addConnection("Bassel Al-Assad","Hama")
bc:addConnection("Bassel Al-Assad","Hotel")
bc:addConnection("Abu al-Duhur","Hama")
bc:addConnection("Abu al-Duhur","Bassel Al-Assad")
bc:addConnection("Hama","Palmyra")
bc:addConnection("Hama","India")
bc:addConnection("India","Abu al-Duhur")
bc:addConnection("SA-5","Palmyra")
bc:addConnection("Jirah","Durayhim")
bc:addConnection("Jirah","Foxtrot")
bc:addConnection("Tabqa","Foxtrot")
bc:addConnection("Tabqa","Raqqa")
bc:addConnection("Tabqa","Golf")
bc:addConnection("Tabqa","Dam")
bc:addConnection("Military Base","Palmyra")
bc:addConnection("Military Base","Tabqa")

--bc:addConnection("Carrier Group","Romeo")
bc:addConnection("Juliett","Tabqa")
bc:addConnection("Palmyra", "Refinery")
bc:addConnection("Juliett", "Refinery")
bc:addConnection("Abu al-Duhur", "Factory")
bc:addConnection("Abu al-Duhur", "November")
bc:addConnection("Hama", "November")
bc:addConnection("Oscar", "Tabqa")
bc:addConnection("Oscar", "Military Base")
bc:addConnection("Abu al-Duhur", "Papa")
bc:addConnection("Romeo", "Hama")
bc:addConnection("Romeo", "Bassel Al-Assad")
bc:addConnection("Foxtrot","Raqqa")
bc:addConnection("Dam","Raqqa")
bc:addConnection("Incirlik","Red Carrier")
bc:addConnection("Red Carrier","Incirlik")
bc:addConnection("Carrier Group","Akrotiri")
bc:addConnection("Akrotiri","Paphos")
bc:addConnection("Paphos","Polis")
bc:addConnection("Polis","Karavostasi")
bc:addConnection("Karavostasi", "Pinarbashi")

bc:addConnection("Pinarbashi","Gecitkale")
bc:addConnection("Gecitkale","Ercan")
bc:addConnection("Ercan","Larnaca")
bc:addConnection("Larnaca","Red Carrier")
bc:addConnection("Gecitkale","Silkworm Site")

bc:addConnection("Romeo", "Bassel Al-Assad")



bc:addConnection("Palmyra","Tiyas")
bc:addConnection("Tiyas","Shayrat")
bc:addConnection("Shayrat","Al Qusayr")

bc:addConnection("Al Qusayr","Rene Mouawad")
bc:addConnection("Rene Mouawad","Wujah")
bc:addConnection("Wujah","Beirut")
bc:addConnection("Beirut","Rayak")
bc:addConnection("Rayak","An Nasiriyah")


bc:addConnection("An Nasiriyah","Damascus")
bc:addConnection("Damascus","Rosh Pina")
bc:addConnection("Rosh Pina","Ramat David")
bc:addConnection("Ramat David","Ramat David Defence")
bc:addConnection("Ramat David","Thalah")



bc:addConnection("Thalah","King Hussein Air College")
bc:addConnection("King Hussein Air College","Prince Hassan")
bc:addConnection("Prince Hassan","Muwaffaq Salti")
bc:addConnection("Muwaffaq Salti","Marka")
bc:addConnection("Marka","Ben Gurion")
bc:addConnection("Ben Gurion","Ben Gurion Defence")

local missionCompleted = false
local checkMissionComplete = function(event, sender)
	if missionCompleted then return end
	local done = true
	for i, v in ipairs(bc:getZones()) do
		if not v.zone:lower():find("hidden") and v.side == 1 then
			done = false
			break
		end
	end
	if done then
		missionCompleted = true
		trigger.action.setUserFlag(180, true)
		trigger.action.outText("Enemy has been defeated.\n\nMission Complete.\n\nYou can restart the mission from the radio menu.", 120)

		timer.scheduleFunction(function()
			trigger.action.outSoundForCoalition(2, "BH.ogg")
		end, {}, timer.getTime() + 5)

			local subMenu = missionCommands.addSubMenuForCoalition(2, "Restart and Reset?", nil)
			missionCommands.addCommandForCoalition(2, "Yes", subMenu, function()
					Utils.saveTable(bc.saveFile, 'zonePersistance', {})
					if resetSaveFileAndFarp then
					resetSaveFileAndFarp()
					end
				trigger.action.outText("Restarting now..", 120)
				timer.scheduleFunction(function()
					trigger.action.setUserFlag(181, true)
				end, {}, timer.getTime() + 5)
			end)
			missionCommands.addCommandForCoalition(2, "No", subMenu, function()
		end)
	end
end

for i,v in ipairs(bc:getZones()) do
	v:registerTrigger('lost', checkMissionComplete, 'missioncompleted')
end


SCHEDULER:New(nil,function()
	checkMissionComplete(nil, nil)
	bc:roamGroupsToLocalSubZone({
		"Red Armor Group2 #",
		"Red Armor Group5 #",
		"Red Armor Group6 #",
		"Red Armor Group7 #",
		"Red Armor Group8 #",
		"Red Armor Group9 #",
		"Red SAM AAA #",
		"Red SAM SHORAD SA-15 #",
		"Red Armor Group3 #",
		"Red SAM SHORAD SA-8 #",
		"Red SAM SHORAD SA-19 #",
		"Molniya #",
		"Rezky #",
		"Neustrashimy #"
	}, 30, { "Dam" })
end,{},5,0)

zones.charlie:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Early warning radar destroyed.\nEnemy patrols in the area reduced.\n+500 credits',20)
end, 'disableCharlie')

zones.kilo:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Early warning radar destroyed.\nEnemy patrols in the area reduced.\n+500 credits',20)
end, 'disableKilo')

zones.substationnorth:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
end, 'disablesubn1')

zones.substationnorth:registerTrigger('destroyed', function(event, sender) 
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Substation disabled\n+500 credits',20)
end, 'disablesubn2')

zones.tv:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
end, 'disabletv1')

zones.tv:registerTrigger('destroyed', function(event, sender) 
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'TV Tower disabled\n+500 credits',20)
end, 'disabletv2')

zones.substationwest:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
end, 'disablesubw1')

zones.substationwest:registerTrigger('destroyed', function(event, sender) 
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Substation disabled\n+500 credits',20)
end, 'disablesubw2')

zones.radio:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
end, 'disableradio1')

zones.radio:registerTrigger('destroyed', function(event, sender) 
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Radio Tower disabled\n+500 credits',20)
end, 'disableradio2')

zones.sierra:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
end, 'disableradar1')

zones.sierra:registerTrigger('destroyed', function(event, sender) 
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Radar disabled\n+500 credits',20)
end, 'disableradar2')

zones.tango:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
end, 'disableins1')

zones.tango:registerTrigger('destroyed', function(event, sender) 
	bc:addFunds(2,1000)
	trigger.action.outTextForCoalition(2,'Insurgents cleared\n+1000 credits',20)
end, 'disableins2')

zones.uniform:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
end, 'disableins3')

zones.uniform:registerTrigger('destroyed', function(event, sender) 
	bc:addFunds(2,1000)
	trigger.action.outTextForCoalition(2,'Insurgents cleared\n+1000 credits',20)
end, 'disableins4')

zones.victor:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
end, 'disableins5')

zones.victor:registerTrigger('destroyed', function(event, sender) 
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Blackhawk crew rescued\n+500 credits',20)
end, 'disableins6')

--------------------------------------- cutsom disable ''''''''''''''''''''''''''''''''''''''''''

zones.benguriondefence:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Ben Gurion defences is destroyed\n+200 credits',20)
end, 'disablebenguriondefence')

zones.ramatdaviddefence:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Ramat David defences is destroyed\n+200 credits',20)
end, 'disableramatdaviddefence')

zones.jordandefence:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Jordan defences is destroyed\n+200 credits',20)
end, 'disablejordandefence')

zones.incirlikdefence:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Incirlik defences is destroyed\n+200 credits',20)
end, 'disableincirlikdefence')

zones.silkworm:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Silkworm defences is destroyed\n+200 credits',20)
end, 'disablesilkworm')


--------------------------------------- cutsom disable ''''''''''''''''''''''''''''''''''''''''''


bc:addMonitoredROE('cruise1')
local cruiseMissileTargetMenu = nil
bc:registerShopItem('cruisemsl', 'Cruise Missile Strike', 500, function(sender)
	if cruiseMissileTargetMenu then
		return 'Choose target zone from F10 menu'
	end
	
	local launchAttack = function(target)
		if cruiseMissileTargetMenu then
			local err = bc:fireAtZone(target, 'cruise1', true, 8)
			if err then
				return err
			end
			
			cruiseMissileTargetMenu = nil
			trigger.action.outTextForCoalition(2, 'Launching cruise missiles at '..target, 15)
		end
	end
	
	cruiseMissileTargetMenu = bc:showTargetZoneMenu(2, 'Cruise Missile Target', launchAttack, 1)
	
	trigger.action.outTextForCoalition(2, 'Cruise missiles ready. Choose target zone from F10 menu', 15)
end,
function (sender, params)
	if params.zone and params.zone.side == 1 then
		local err = bc:fireAtZone(params.zone.zone, 'cruise1', true, 8)
		if err then
			return err
		end
		
		trigger.action.outTextForCoalition(2, 'Launching cruise missiles at '..params.zone.zone, 15)
	else
		return 'Can only target enemy zone'
	end
end)

local upgradeMenu = nil
bc:registerShopItem('supplies2', 'Resupply friendly Zone', 200, function(sender)
    if upgradeMenu then
        return 'Choose zone from F10 menu'
    end

    local upgradeZone = function(target)
        if upgradeMenu then
            local zn = bc:getZoneByName(target)
            if zn and zn.side == 2 then
                zn:upgrade()
            else
                return 'Zone not friendly'
            end
            
            upgradeMenu = nil
        end
    end


    upgradeMenu = bc:showTargetZoneMenu(2, 'Select Zone to resupply', upgradeZone, 2, true)
    
    trigger.action.outTextForCoalition(2, 'Supplies prepared. Choose zone from F10 menu', 15)
end,
function(sender, params)
    if params.zone and params.zone.side == 2 then
        params.zone:upgrade()
    else
        return 'Can only target friendly zone'
    end
end)

local fullyUpgradeMenu=nil
bc:registerShopItem('supplies','Fully Upgrade Friendly Zone',1000,
function(sender)
    if fullyUpgradeMenu then
        return'Choose zone from F10 menu to fully upgrade'
    end
    local fullyUpgradeZone
    fullyUpgradeZone=function(target)
        if fullyUpgradeMenu then
            local zn=bc:getZoneByName(target)
            if zn and zn.side==2 then
                local function repairs()
                    local n=0
                    for _,v in pairs(zn.built)do
                        local g=Group.getByName(v)
                        if g then
                            if g:getSize()<g:getInitialSize() then n=n+1
                            else
                                for _,u in ipairs(g:getUnits())do
                                    if u and u:isExist() and u:getLife()<u:getLife0() then n=n+1 break end
                                end
                            end
                        end
                    end
                    return n
                end
                local upgs=zn.upgrades.blue or{}
                local todo=repairs()+(#upgs-Utils.getTableSize(zn.built))
                if todo>0 then
                    local function loop()
                        local before=Utils.getTableSize(zn.built)
                        zn:upgrade()
                        local now=Utils.getTableSize(zn.built)
                        if repairs()>0 or now<#upgs then
                            SCHEDULER:New(nil,loop,{},2,0)
                        else
                            trigger.action.outTextForCoalition(2,target..' is now fully upgraded!',15)
                        end
                    end
                    loop()
                else
                    trigger.action.outTextForCoalition(2,target..' is already fully upgraded',15)
                end
            else
                return'Zone not friendly'
            end
            fullyUpgradeMenu=nil
        end
    end
    fullyUpgradeMenu=bc:showTargetZoneMenu(2,'Select Zone to Fully Upgrade',fullyUpgradeZone,2,true)
    trigger.action.outTextForCoalition(2,'Preparing to full upgrade and repair. Choose zone from F10 menu',15)
end,
function(sender,params)
    if params.zone and params.zone.side==2 then
        local zn=params.zone
        local upgs=zn.upgrades.blue or{}
        local function repairs()
            local n=0
            for _,v in pairs(zn.built)do
                local g=Group.getByName(v)
                if g then
                    if g:getSize()<g:getInitialSize() then n=n+1
                    else
                        for _,u in ipairs(g:getUnits())do
                            if u and u:isExist() and u:getLife()<u:getLife0() then n=n+1 break end
                        end
                    end
                end
            end
            return n
        end
        local function loop()
            local before=Utils.getTableSize(zn.built)
            zn:upgrade()
            local now=Utils.getTableSize(zn.built)
            if repairs()>0 or now<#upgs then
                SCHEDULER:New(nil,loop,{},2,0)
			else
				trigger.action.outTextForCoalition(2,params.zone.zone..' is now fully upgraded!',15)
			end
        end
        loop()
    else
        return'Can only target friendly zone'
    end
end)

--[[ 
Group.getByName('f16cap1'):destroy()
Group.getByName('f16cap2'):destroy()
Group.getByName('f16cap3'):destroy()
Group.getByName('f16cap4'):destroy()
Group.getByName('f16cap5'):destroy()
Group.getByName('f16cap6'):destroy()
bc:registerShopItem('capnorth', 'CAP (F-16C)', 250, function(sender) 
	local grname = 'f16cap1'
	if not zones.incirlik.wasBlue and zones.redcarrier.wasBlue and not zones.hatay.wasBlue then
		grname = 'f16cap6'
	elseif zones.incirlik.wasBlue and zones.hatay.wasBlue and not zones.alduhur.wasBlue then
		grname = 'f16cap2'
	elseif not zones.tabqa.wasBlue and zones.taftanaz.wasBlue and zones.alduhur.wasBlue then
		grname = 'f16cap3'
	elseif zones.tabqa.wasBlue and not zones.palmyra.wasBlue and zones.alduhur.wasBlue then
		grname = 'f16cap4'
	elseif zones.tabqa.wasBlue and zones.palmyra.wasBlue and zones.alduhur.wasBlue then
		grname = 'f16cap5'
	end

	
	local gr = Group.getByName(grname)
	if Utils.isGroupActive(gr) then 
		return 'CAP mission still in progress'
	end
	RespawnGroup(grname)
	trigger.action.setUserFlag(1000, true)
end,
function (sender, params)
	local grname = 'f16cap1'
	if not zones.incirlik.wasBlue and zones.redcarrier.wasBlue and not zones.hatay.wasBlue then
		grname = 'f16cap6'
	elseif zones.incirlik.wasBlue and zones.hatay.wasBlue and not zones.alduhur.wasBlue then
		grname = 'f16cap2'
	elseif not zones.tabqa.wasBlue and zones.taftanaz.wasBlue and zones.alduhur.wasBlue then
		grname = 'f16cap3'
	elseif zones.tabqa.wasBlue and not zones.palmyra.wasBlue and zones.alduhur.wasBlue then
		grname = 'f16cap4'
	elseif zones.tabqa.wasBlue and zones.palmyra.wasBlue and zones.alduhur.wasBlue then
		grname = 'f16cap5'
	end

	local gr = Group.getByName(grname)
	if Utils.isGroupActive(gr) then 
		return 'CAP mission still in progress'
	end
	RespawnGroup(grname)
	trigger.action.setUserFlag(1000, true)
end)
 ]]


--[[ 
local casTargetMenu = nil
Group.getByName('cas1'):destroy()
Group.getByName('cas2'):destroy()
Group.getByName('cas3'):destroy()
Group.getByName('cas4'):destroy()
Group.getByName('cas5'):destroy()
Group.getByName('cas6'):destroy()
bc:registerShopItem('cas', 'Ground Attack mission', 250, function(sender)
	local grname = 'cas1'
	if not zones.incirlik.wasBlue and zones.redcarrier.wasBlue and not zones.hatay.wasBlue then
		grname = 'cas6'
	elseif zones.incirlik.wasBlue and zones.hatay.wasBlue and not zones.alduhur.wasBlue then
		grname = 'cas2'
	elseif not zones.tabqa.wasBlue and zones.taftanaz.wasBlue and zones.alduhur.wasBlue then
		grname = 'cas3'
	elseif zones.tabqa.wasBlue and not zones.palmyra.wasBlue and zones.alduhur.wasBlue then
		grname = 'cas4'
	elseif zones.tabqa.wasBlue and zones.palmyra.wasBlue and zones.alduhur.wasBlue then
		grname = 'cas5'
	end


    local gr = Group.getByName(grname)
    if Utils.isGroupActive(gr) then
        return 'Ground attack mission still in progress'
    end

    RespawnGroup(grname)

    if casTargetMenu then
        return 'Choose target zone from F10 menu'
    end

    local launchAttack = function(target)
        if casTargetMenu then
            if Group.getByName(grname) then
                local err = bc:engageZone(target, grname)
                if err then
                    return err
                end

                trigger.action.outTextForCoalition(2, 'F-16C Vipers engaging groups at ' .. target, 15)
            else
                trigger.action.outTextForCoalition(2, 'Group has left the area or has been destroyed', 15)
            end

            casTargetMenu = nil
        end
    end

    casTargetMenu = bc:showTargetZoneMenu(2, 'F-16C Target', launchAttack, 1)

    trigger.action.outTextForCoalition(2, 'F-16C Vipers on route. Choose target zone from F10 menu for ' .. grname, 15)
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
	local grname = 'cas1'
	if not zones.incirlik.wasBlue and zones.redcarrier.wasBlue and not zones.hatay.wasBlue then
		grname = 'cas6'
	elseif zones.incirlik.wasBlue and zones.hatay.wasBlue and not zones.alduhur.wasBlue then
		grname = 'cas2'
	elseif not zones.tabqa.wasBlue and zones.taftanaz.wasBlue and zones.alduhur.wasBlue then
		grname = 'cas3'
	elseif zones.tabqa.wasBlue and not zones.palmyra.wasBlue and zones.alduhur.wasBlue then
		grname = 'cas4'
	elseif zones.tabqa.wasBlue and zones.palmyra.wasBlue and zones.alduhur.wasBlue then
		grname = 'cas5'
	end


        local gr = Group.getByName(grname)
        if gr and gr:getSize() > 0 and gr:getController():hasTask() then
            return 'Ground attack mission still in progress'
        end

        RespawnGroup(grname)
        timer.scheduleFunction(function(args)
   			local target = args[1]
            if Group.getByName(grname) then
                local err = bc:engageZone(target, grname)
                if err then
                    return err
                end

                trigger.action.outTextForCoalition(2, 'F-16C engaging groups at ' .. target, 15)
            end
        end,{params.zone.zone},timer.getTime()+2)
    else
        return 'Can only target enemy zone'
    end
end)
 ]]
-----------------------------------------------DYNAMIC SHOP ------------------------------------------


bc:registerShopItem('dynamiccap', 'Dynamic CAP', 250, function(sender)
    if capActive then
        return 'CAP mission still in progress'
    end
    buildCapMenu()
	trigger.action.outTextForCoalition(2, 'CAP is requested. Select spawn zone.', 10)
    return
end,
function (sender, params)
    if capActive then
        return 'CAP mission still in progress'
    end
    buildCapMenu()

	trigger.action.outTextForCoalition(2, 'CAP is requested. Select spawn zone.', 10)
    return
end)

bc:registerShopItem('dynamiccas', 'Dynamic CAS', 250,
function(sender)
    if casActive then
        return 'CAS mission still in progress'
    end
    local allow = {}
    for _, z in ipairs(bc:getZones()) do
        if z.side == 1 and findClosestBlueZoneOutside(z.zone, 25) then
            allow[z.zone] = true
        end
    end
    if not next(allow) then
        trigger.action.outTextForCoalition(2, 'No enemy zone is far enough (>25 NM) from the front line.', 10)
        return
    end
    CASTargetMenu = bc:showTargetZoneMenu(2, 'Select CAS Target', function(targetZoneName, menu)
        if casActive then return end
        local spawnZone = findClosestBlueZoneOutside(targetZoneName, 25)
        if not spawnZone then
            return 'No friendly zone available for CAS spawn 25+ NM away'
        end
        spawnCasAt(spawnZone, targetZoneName)
        CASTargetMenu = nil
    end, 1, nil, allow)
    trigger.action.outTextForCoalition(2, 'Select CAS target zone from F10', 10)
    return
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        if casActive then return 'CAS mission still in progress' end
        local closestBlue = findClosestBlueZoneOutside(params.zone.zone, 25)
        if not closestBlue then
            return 'No friendly zone available for CAS spawn.'
        end
        spawnCasAt(closestBlue, params.zone.zone)
        return
    else
        return 'Can only target enemy zone'
    end
end)

bc:registerShopItem('dynamicdecoy', 'Dynamic Decoy', 250,
function(sender)
    if decoyActive then
        return 'Decoy mission still in progress'
    end

    local allow = {}
    for _, z in ipairs(bc:getZones()) do
        if z.side == 1 and findClosestBlueZoneOutside(z.zone, 40) then
            allow[z.zone] = true
        end
    end
    if not next(allow) then
        trigger.action.outTextForCoalition(2, 'No enemy zone is far enough (>40 NM) from the front line.', 10)
        return
    end

    DECOYTargetMenu = bc:showTargetZoneMenu(2, 'Select Decoy Target', function(targetZoneName, menu)
        if decoyActive then return end
        local spawnZone = findClosestBlueZoneOutside(targetZoneName, 40)
        if not spawnZone then
            trigger.action.outTextForCoalition(2, 'No friendly zone available for Decoy spawn 40+ NM away.', 15)
            return
        end
        spawnDecoyAt(spawnZone, targetZoneName)
        DECOYTargetMenu = nil
    end, 1, nil, allow)

    trigger.action.outTextForCoalition(2, 'Select Decoy target zone from F10', 10)
    return
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        if decoyActive then
            return 'Decoy mission still in progress'
        end
        local closestBlue = findClosestBlueZoneOutside(params.zone.zone, 40)
        if not closestBlue then
            return 'No friendly zone available for Decoy spawn.'
        end
        spawnDecoyAt(closestBlue, params.zone.zone)
        return
    else
        return 'Can only target enemy zone'
    end
end)


bc:registerShopItem('dynamicsead', 'Dynamic SEAD', 250,
function(sender)
    if seadActive then
        return 'SEAD mission still in progress'
    end

    local allow = {}
    for _, z in ipairs(bc:getZones()) do
        if z.side == 1 and findClosestBlueZoneOutside(z.zone, 40) then
            allow[z.zone] = true
        end
    end
    if not next(allow) then
        trigger.action.outTextForCoalition(2, 'No enemy zone is far enough (>40 NM) from the front line.', 10)
        return
    end

    SEADTargetMenu = bc:showTargetZoneMenu(2, 'Select SEAD Target', function(targetZoneName, menu)
        if seadActive then return end
        local spawnZone = findClosestBlueZoneOutside(targetZoneName, 40)
        if not spawnZone then
            trigger.action.outTextForCoalition(2, 'No friendly zone available for SEAD spawn 40+ NM away.', 15)
            return
        end
        spawnSeadAt(spawnZone, targetZoneName)
        SEADTargetMenu = nil
    end, 1, nil, allow)

    trigger.action.outTextForCoalition(2, 'Select SEAD target zone from F10', 10)
    return
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        if seadActive then
            return 'SEAD mission still in progress'
        end
        local closestBlue = findClosestBlueZoneOutside(params.zone.zone, 40)
        if not closestBlue then
            return 'No friendly zone available for SEAD spawn.'
        end
        spawnSeadAt(closestBlue, params.zone.zone)
        return
    else
        return 'Can only target enemy zone'
    end
end)

bc:registerShopItem('dynamicbomb', 'Dynamic Bomb run', 250,
function(sender)
    if bomberActive then
        return 'Bomb mission still in progress'
    end

    local allow = {}
    for _, z in ipairs(bc:getZones()) do
        if z.side == 1 and findClosestBlueZoneOutside(z.zone, 25) then
            allow[z.zone] = true
        end
    end
    if not next(allow) then
        trigger.action.outTextForCoalition(2, 'No enemy zone is far enough (>25 NM) from the front line.', 10)
        return
    end

    BomberTargetMenu = bc:showTargetZoneMenu(2, 'Select bomb run target', function(targetZoneName, menu)
        if bomberActive then return end
        local spawnZone = findClosestBlueZoneOutside(targetZoneName, 25)
        if not spawnZone then
            trigger.action.outTextForCoalition(2, 'No friendly zone available for Bomb spawn 25+ NM away.', 15)
            return
        end
        spawnBomberAt(spawnZone, targetZoneName)
        BomberTargetMenu = nil
    end, 1, nil, allow)

    trigger.action.outTextForCoalition(2, 'Select bomb run target zone from F10', 10)
    return
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        if bomberActive then
            return 'Bomb run mission still in progress'
        end
        local closestBlue = findClosestBlueZoneOutside(params.zone.zone, 25)
        if not closestBlue then
            return 'No friendly zone available for bomb run spawn.'
        end
        spawnBomberAt(closestBlue, params.zone.zone)
        return
    else
        return 'Can only target enemy zone'
    end
end)


---------------------------------------------END DYNAMIC SHOP ------------------------------------------

--[[ for i = 1, 6 do
    local g1 = Group.getByName('sead'   .. i)
    if g1 then g1:destroy() end
    local g2 = Group.getByName('seadcw' .. i)
    if g2 then g2:destroy() end
end
local seadTargetMenu = nil
bc:registerShopItem('sead', 'SEAD mission', 250, function(sender)
	local prefix = Era=='Coldwar' and 'seadcw' or 'sead'
	local grname = prefix..'1'
	if not zones.incirlik.wasBlue and zones.redcarrier.wasBlue and not zones.hatay.wasBlue then
		grname = prefix..'6'
	elseif zones.incirlik.wasBlue and zones.hatay.wasBlue and not zones.alduhur.wasBlue then
		grname = prefix..'2'
	elseif not zones.tabqa.wasBlue and zones.taftanaz.wasBlue and zones.alduhur.wasBlue then
		grname = prefix..'3'
	elseif zones.tabqa.wasBlue and not zones.palmyra.wasBlue and zones.alduhur.wasBlue then
		grname = prefix..'4'
	elseif zones.tabqa.wasBlue and zones.palmyra.wasBlue and zones.alduhur.wasBlue then
		grname = prefix..'5'
	end

    local gr = Group.getByName(grname)
    if Utils.isGroupActive(gr) then
        return 'SEAD mission still in progress'
    end

    RespawnGroup(grname)

    if seadTargetMenu then
        return 'Choose target zone from F10 menu'
    end

    local launchAttack = function(target)
        if seadTargetMenu then
            if Group.getByName(grname) then
                local err = bc:engageSead(target, grname, AI.Task.WeaponExpend.ALL)
                if err then return err end
                trigger.action.outTextForCoalition(2,(Era=='Coldwar' and 'Tornado IDSs engaging SAMs at ' or 'F/A-18C Hornets engaging SAMs at ')..target,15)
            else
                trigger.action.outTextForCoalition(2,'Group has left the area or has been destroyed',15)
            end
            seadTargetMenu=nil
        end
    end
    seadTargetMenu = bc:showTargetZoneMenu(2, 'SEAD Target', launchAttack, 1)

    trigger.action.outTextForCoalition(2,(Era=='Coldwar' and 'Tornado IDSs on route. Choose target zone from F10 menu for ' or 'F/A-18C Hornets on route. Choose target zone from F10 menu for ')..grname,15)

end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        local prefix=Era=='Coldwar' and 'seadcw' or 'sead'
        local grname=prefix..'1'
	if not zones.incirlik.wasBlue and zones.redcarrier.wasBlue and not zones.hatay.wasBlue then
            grname=prefix..'6'
        elseif zones.incirlik.wasBlue and zones.hatay.wasBlue and not zones.alduhur.wasBlue then
            grname=prefix..'2'
        elseif not zones.tabqa.wasBlue and zones.taftanaz.wasBlue and zones.alduhur.wasBlue then
            grname=prefix..'3'
        elseif zones.tabqa.wasBlue and not zones.palmyra.wasBlue and zones.alduhur.wasBlue then
            grname=prefix..'4'
        elseif zones.tabqa.wasBlue and zones.palmyra.wasBlue and zones.alduhur.wasBlue then
            grname=prefix..'5'
        end

        local gr = Group.getByName(grname)
        if gr and gr:getSize() > 0 and gr:getController():hasTask() then
            return 'SEAD mission still in progress'
        end

        RespawnGroup(grname)
		timer.scheduleFunction(function(args)
		local target = args[1]
            if Group.getByName(grname) then
                local err = bc:engageZone(target, grname)
                if err then
                    return err
                end

                trigger.action.outTextForCoalition(2,(Era=='Coldwar' and 'Tornado IDSs engaging SAMs at ' or 'F/A-18C Hornets engaging SAMs at ')..target,15)
            end
        end, {params.zone.zone}, timer.getTime() + 2)
    else
        return 'Can only target enemy zone'
    end
end)

local bomberTargetMenu=nil
bc:registerShopItem('bombsnorth','Bombing run North',250,function(sender)
    local prefix=Era=='Coldwar' and 'bombercw' or 'bomber'
    local jet=Era=='Coldwar' and 'F-4E Phantoms' or 'F-15E Mudhens'
    local gr=Group.getByName(prefix)
    if Utils.isGroupActive(gr) then return'Bombing run still in progress' end
    RespawnGroup(prefix)
    if bomberTargetMenu then return'Choose target zone from F10 menu' end
    local launchAttack=function(target)
        if bomberTargetMenu then
            if Group.getByName(prefix) then
                local err=bc:engageZone(target,prefix); if err then return err end
                trigger.action.outTextForCoalition(2,jet..' engaging groups at '..target,15)
            else
                trigger.action.outTextForCoalition(2,'Group has left the area or has been destroyed',15)
            end
            bomberTargetMenu=nil
        end
    end
    bomberTargetMenu=bc:showTargetZoneMenu(2,'Bombing run North Target',launchAttack,1)
    trigger.action.outTextForCoalition(2,jet..' on route. Choose target zone from F10 menu',15)
end,
function(sender,params)
    if params.zone and params.zone.side==1 then
        local prefix=Era=='Coldwar' and 'bombercw' or 'bomber'
        local jet=Era=='Coldwar' and 'F-4E Phantoms' or 'F-15E Mudhens'
        local gr=Group.getByName(prefix)
        if Utils.isGroupActive(gr) then return'Bombing run still in progress' end
        RespawnGroup(prefix)
        SCHEDULER:New(nil,function(target)
            if Group.getByName(prefix) then
                local err=bc:engageZone(target,prefix); if err then return err end
                trigger.action.outTextForCoalition(2,jet..' engaging groups at '..target,15)
            end
        end,{params.zone.zone},2,0)
    else
        return'Can only target enemy zone'
    end
end)


local bomberTargetMenu=nil
bc:registerShopItem('bombssouth','Bombing run South',250,function(sender)
    local prefix=Era=='Coldwar' and 'bombercw2' or 'bomber2'
    local jet=Era=='Coldwar' and 'F-4E Phantoms' or 'AV-8B Harriers'
    local gr=Group.getByName(prefix)
    if Utils.isGroupActive(gr) then return'Bombing run still in progress' end
    RespawnGroup(prefix)
    if bomberTargetMenu then return'Choose target zone from F10 menu' end
    local launchAttack=function(target)
        if bomberTargetMenu then
            if Group.getByName(prefix) then
                local err=bc:engageZone(target,prefix); if err then return err end
                trigger.action.outTextForCoalition(2,jet..' engaging groups at '..target,15)
            else
                trigger.action.outTextForCoalition(2,'Group has left the area or has been destroyed',15)
            end
            bomberTargetMenu=nil
        end
    end
    bomberTargetMenu=bc:showTargetZoneMenu(2,'Bombing run South Target',launchAttack,1)
    trigger.action.outTextForCoalition(2,jet..' on route. Choose target zone from F10 menu',15)
end,
function(sender,params)
    if params.zone and params.zone.side==1 then
        local prefix=Era=='Coldwar' and 'bombercw2' or 'bomber2'
        local jet=Era=='Coldwar' and 'F-4E Phantoms' or 'AV-8B Harriers'
        local gr=Group.getByName(prefix)
        if Utils.isGroupActive(gr) then return'Bombing run still in progress' end
        RespawnGroup(prefix)
        SCHEDULER:New(nil,function(target)
            if Group.getByName(prefix) then
                local err=bc:engageZone(target,prefix); if err then return err end
                trigger.action.outTextForCoalition(2,jet..' engaging groups at '..target,15)
            end
        end,{params.zone.zone},2,0)
    else
        return'Can only target enemy zone'
    end
end)
 ]]

local jtacDrones
local jtacTargetMenu = nil
for _,n in ipairs({'jtacDroneColdwar1','jtacDroneColdwar2','jtacDrone1','jtacDrone2'}) do
    local g = Group.getByName(n)
    if g then g:destroy() end
end
if Era == 'Coldwar' then
jtacDrones = {JTAC:new({name = 'jtacDroneColdwar1'}),JTAC:new({name = 'jtacDroneColdwar2'})}
else
jtacDrones = {JTAC:new({name = 'jtacDrone1'}),JTAC:new({name = 'jtacDrone2'})}
end
bc:registerShopItem('jtac','MQ-9 Reaper JTAC mission',150,function(sender)
	if jtacTargetMenu then return 'Choose target zone from F10 menu' end
	local spawnAndOrbit = function(target)
		if jtacTargetMenu then
			local zn = bc:getZoneByName(target)
			for _,v in ipairs(jtacQueue) do
				if v.tgtzone and v.tgtzone.zone == zn.zone then
					trigger.action.outTextForCoalition(2,'JTAC already active over '..zn.zone..' Select another zone',10)
					return 'duplicate zone'
				end
			end
			if #jtacQueue == 2 then
				local old = table.remove(jtacQueue,1)
				local gr = Group.getByName(old.name)
				if gr then gr:destroy() end
			end
			local dr = jtacDrones[1]
			for i,v in ipairs(jtacDrones) do
				if not Utils.isGroupActive(Group.getByName(v.name)) then dr = v break end
			end
			dr:deployAtZone(zn)
			dr:showMenu()
			table.insert(jtacQueue,dr)
			if Era == 'Coldwar' then
				trigger.action.outTextForCoalition(2,'Friendly Tomcat deployed over '..target..' - JTACs active '..#jtacQueue..' / 2',15)
			else
				trigger.action.outTextForCoalition(2,'Reaper drone deployed over '..target..' - JTACs active '..#jtacQueue..' / 2',15)
			end
			jtacTargetMenu = nil
		end
	end
	jtacTargetMenu = bc:showTargetZoneMenu(2,'Deploy JTAC',spawnAndOrbit,1)
	trigger.action.outTextForCoalition(2,'Choose which zone to deploy JTAC at from F10 menu',15)
end,function(sender,params)
	if params.zone and params.zone.side == 1 then
		for _,v in ipairs(jtacQueue) do
			if v.tgtzone and v.tgtzone.zone == params.zone.zone then
				return 'JTAC already active over '..params.zone.zone..' Choose another zone'
			end
		end
		if #jtacQueue == 2 then
			local old = table.remove(jtacQueue,1)
			local gr  = Group.getByName(old.name)
			if gr then gr:destroy() end
		end
		local dr = jtacDrones[1]
		for i,v in ipairs(jtacDrones) do
			if not Utils.isGroupActive(Group.getByName(v.name)) then dr = v break end
		end
		dr:deployAtZone(params.zone)
		dr:showMenu()
		table.insert(jtacQueue,dr)
		if Era == 'Coldwar' then
			trigger.action.outTextForCoalition(2,'Friendly Tomcat deployed over '..params.zone.zone..' - JTACs active '..#jtacQueue..' / 2',15)
		else
			trigger.action.outTextForCoalition(2,'Reaper drone deployed over '..params.zone.zone..' - JTACs active '..#jtacQueue..' / 2',15)
		end
	else
		return 'Can only target enemy zone'
	end
end)
----------------------------------- START own 9 line jtac AM START ----------------------------------
local jtacZones = {}
local jtacTargetMenu2 = nil
local droneAM
Group.getByName('JTAC9lineamColdwar'):destroy()
Group.getByName('JTAC9lineam'):destroy()
if Era == 'Coldwar' then
droneAM = JTAC9line:new({name = 'JTAC9lineamColdwar'})
else
droneAM = JTAC9line:new({name = 'JTAC9lineam'})
end
bc:registerShopItem('9lineam', 'Jtac 9line AM', 0, function(sender)
    if jtacTargetMenu2 then
        return 'Choose target zone from F10 menu'
    end
    
    local spawnAndOrbit2 = function(target)
        if jtacTargetMenu2 then
            local zn = bc:getZoneByName(target)
            droneAM:deployAtZone(zn)
			jtacZones[target] = {drone = Era == 'Coldwar' and 'JTAC9lineamColdwar' or 'JTAC9lineam'}
			
		trigger.action.outTextForCoalition(2, 'Reaper drone deployed over ' .. target .. '. Contact Springfield on 241.00 AM ', 30)
        jtacTargetMenu2 = nil
		end
    end
    
    jtacTargetMenu2 = bc:showTargetZoneMenu(2, 'Deploy JTAC to Zone', spawnAndOrbit2, 1)
    trigger.action.outTextForCoalition(2, 'Choose which zone to deploy JTAC at from F10 menu', 15)
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        droneAM:deployAtZone(params.zone)
        jtacZones[params.zone.zone] = {drone = Era == 'Coldwar' and 'JTAC9lineamColdwar' or 'JTAC9lineam'}
		if Era == 'Coldwar' then
			trigger.action.outTextForCoalition(2, 'Friendly Tomcat deployed over ' .. params.zone.zone .. '. Contact Springfield on 241.00 AM ', 30)
        
    	else
			trigger.action.outTextForCoalition(2, 'Reaper drone deployed over ' .. params.zone.zone .. '. Contact Springfield on 241.00 AM ', 30)
		end
    else
        return 'Can only target enemy zone'
    end
end)

  ------------------------------ END 9 line jtac AM END ----------------------------------
  ----------------------------- START 9 line jtac fm START ---------------------------
Group.getByName('JTAC9linefmColdwar'):destroy()
Group.getByName('JTAC9linefm'):destroy()
local jtacTargetMenu3 = nil
local droneFM
if Era == 'Coldwar' then
droneFM = JTAC9line:new({name = 'JTAC9linefmColdwar'})
else
droneFM = JTAC9line:new({name = 'JTAC9linefm'})
end
bc:registerShopItem('9linefm', 'Jtac 9line FM', 0, function(sender)
    if jtacTargetMenu3 then
        return 'Choose target zone from F10 menu'
    end
    
    local spawnAndOrbit3 = function(target)
        if jtacTargetMenu3 then
            local zn = bc:getZoneByName(target)
            droneFM:deployAtZone(zn)
			
			jtacZones[target] = {drone = Era == 'Coldwar' and 'JTAC9linefmColdwar' or 'JTAC9linefm'}
			
		
		if Era == 'Coldwar' then
			trigger.action.outTextForCoalition(2, 'Friendly Tomcat deployed over ' .. target .. '. Contact Uzi on 31.00 FM ', 30)
		else
			trigger.action.outTextForCoalition(2, 'Reaper drone deployed over ' .. target .. '. Contact Uzi on 31.00 FM ', 30)  
		end            
            jtacTargetMenu3 = nil
        end
    end
    
    jtacTargetMenu3 = bc:showTargetZoneMenu(2, 'Deploy JTAC to Zone', spawnAndOrbit3, 1)
    trigger.action.outTextForCoalition(2, 'Choose which zone to deploy JTAC at from F10 menu', 15)
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        droneFM:deployAtZone(params.zone)
        jtacZones[params.zone.zone] = {drone = Era == 'Coldwar' and 'JTAC9linefmColdwar' or 'JTAC9linefm'}

		if Era == 'Coldwar' then
			trigger.action.outTextForCoalition(2, 'Friendly Tomcat deployed over ' .. params.zone.zone .. '. Contact Uzi on 31.00 FM ', 30)
        
    	else
			trigger.action.outTextForCoalition(2, 'Reaper drone deployed over ' .. params.zone.zone .. '. Contact Uzi on 31.00 FM ', 30)
		end
    else
        return 'Can only target enemy zone'
    end
end)

  -------------------------- END 9 line jtac FM END ----------------------------------

function CheckJtacStatus()
	 if jtacZones == nil then
			return false
		end

    local jtacFound = false
    
    for zoneName, jtacInfo in pairs(jtacZones) do
        local jtacGroup = Group.getByName(jtacInfo.drone)
        if jtacGroup and Utils.isGroupActive(jtacGroup) then
            local zone = bc:getZoneByName(zoneName)
            if zone and (zone.side == 0 or not zone.active) then
                jtacGroup:destroy()
                jtacZones[zoneName] = nil
                jtacFound = true
            end
        else
            jtacZones[zoneName] = nil
        end
    end

    return jtacFound
end

  -------------------------- END 9 line jtac FM END ----------------------------------
local smoketargets = function(tz)
	if not tz or not tz.built then return end
	local units = {}
	for i,v in pairs(tz.built) do
		local g = Group.getByName(v)
		if g and g:isExist() then
			local gUnits = g:getUnits()
			if gUnits then
				for i2,v2 in ipairs(gUnits) do
					table.insert(units,v2)
				end
			end
		end
	end
	local tgts = {}
	for i=1,3,1 do
		if #units > 0 then
			local selected = math.random(1,#units)
			table.insert(tgts,units[selected])
			table.remove(units,selected)
		end
	end
	for i,v in ipairs(tgts) do
		if v and v:isExist() then
			local pos = v:getPosition().p
			trigger.action.smoke(pos,1)
		end
	end
end


local smokeTargetMenu = nil
bc:registerShopItem('smoke', 'Smoke markers', 20, function(sender)
	if smokeTargetMenu then
		return 'Choose target zone from F10 menu'
	end
	
	local launchAttack = function(target)
		if smokeTargetMenu then
			local tz = bc:getZoneByName(target)
			smoketargets(tz)
			smokeTargetMenu = nil
			trigger.action.outTextForCoalition(2, 'Targets marked with RED smoke at '..target, 15)
		end
	end
	
	smokeTargetMenu = bc:showTargetZoneMenu(2, 'Smoke marker target', launchAttack, 1)
	
	trigger.action.outTextForCoalition(2, 'Choose target zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 1 then
		smoketargets(params.zone)
		trigger.action.outTextForCoalition(2, 'Targets marked with RED smoke at '..params.zone.zone, 15)
	else
		return 'Can only target enemy zone'
	end
end)

Group.getByName('ewAircraft'):destroy()
local jamMenu = nil
bc:registerShopItem('jam', 'Jam radars at zone', 500, function(sender)
	local gr = Group.getByName('ewAircraft')
	if Utils.isGroupActive(gr) then 
		return 'Jamming mission still in progress'
	end
	
	RespawnGroup('ewAircraft')
	
	if jamMenu then
		return 'Choose target zone from F10 menu'
	end
	
	local startJam = function(target)
		if jamMenu then
			bc:jamRadarsAtZone('ewAircraft', target)
			jamMenu = nil
			trigger.action.outTextForCoalition(2, 'Growler jamming radars at '..target, 15)
		end
	end
	
	jamMenu = bc:showTargetZoneMenu(2, 'Jamming target', startJam, 1)
	trigger.action.outTextForCoalition(2, 'Choose target zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 1 then
		local gr = Group.getByName('ewAircraft')
		if Utils.isGroupActive(gr) then 
			return 'Jamming mission still in progress'
		end
		
		RespawnGroup('ewAircraft')
		
		SCHEDULER:New(nil,function(target)
			local ew = Group.getByName('ewAircraft')
			if ew then
				local err = bc:jamRadarsAtZone('ewAircraft', target)
				if err then
					return err
				end
				
				trigger.action.outTextForCoalition(2, 'Growler jamming radars at '..target, 15)
			end
		end,{params.zone.zone},2,0)
		
	else
		return 'Can only target enemy zone'
	end
end)
Group.getByName('ca-tanks-Coldwar'):destroy()
Group.getByName('ca-tanks'):destroy()
tanksMenu = nil
bc:registerShopItem('armor', 'Deploy armor (for combined arms)', 100, function(sender)
	
	if tanksMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployTanks = function(target)
		if tanksMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup((Era == 'Coldwar') and 'ca-tanks-Coldwar' or 'ca-tanks')
			
			tanksMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly armor deployed at '..target, 15)
		end
	end
	
	tanksMenu = bc:showTargetZoneMenu(2, 'Deploy armor (Choose friendly zone)', deployTanks, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup((Era == 'Coldwar') and 'ca-tanks-Coldwar' or 'ca-tanks')
		trigger.action.outTextForCoalition(2, 'Friendly armor deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)
Group.getByName('ca-arty'):destroy()
artyMenu = nil
bc:registerShopItem('artillery', 'Deploy artillery (for combined arms)', 100, function(sender)
	
	if artyMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployArty = function(target)
		if artyMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-arty')
			
			artyMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly artillery deployed at '..target, 15)
		end
	end
	
	artyMenu = bc:showTargetZoneMenu(2, 'Deploy artillery (Choose friendly zone)', deployArty, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-arty')
		trigger.action.outTextForCoalition(2, 'Friendly artillery deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)
Group.getByName('ca-recon'):destroy()
reconMenu = nil
bc:registerShopItem('recon', 'Deploy recon group (for combined arms)', 50, function(sender)
	
	if reconMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployRecon = function(target)
		if reconMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-recon')
			
			reconMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly recon group deployed at '..target, 15)
		end
	end
	
	reconMenu = bc:showTargetZoneMenu(2, 'Deploy recon group (Choose friendly zone)', deployRecon, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-recon')
		trigger.action.outTextForCoalition(2, 'Friendly recon group deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)
Group.getByName('ca-airdef'):destroy()
airdefMenu = nil
bc:registerShopItem('airdef', 'Deploy air defence (for combined arms)', 150, function(sender)
	
	if airdefMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployAirDef = function(target)
		if airdefMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-airdef')
			
			airdefMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly air defence deployed at '..target, 15)
		end
	end
	
	airdefMenu = bc:showTargetZoneMenu(2, 'Deploy air defence (Choose friendly zone)', deployAirDef, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-airdef')
		trigger.action.outTextForCoalition(2, 'Friendly air defence deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)
-- new menu
local supplyMenu=nil
bc:registerShopItem('capture','Emergency capture neutral zone',500,
function(sender)
	if supplyMenu then
		return 'Choose a zone from F10 menu'
	end
    local cost=500
    trigger.action.outTextForCoalition(2,'Select zone from F10 menu',15)
    supplyMenu=bc:showEmergencyNeutralZoneMenu(2,'Select Zone for Emergency capture',
    function(zonename)
        if not zonename then
            bc:addFunds(2,cost)
            if supplyMenu then missionCommands.removeItemForCoalition(2,supplyMenu) end
            supplyMenu=nil
            trigger.action.outTextForCoalition(2,'No zone name selected, purchase refunded',10)
            return 'No zone name'
        end
        local chosenZone=bc:getZoneByName(zonename)
        if not chosenZone then
            bc:addFunds(2,cost)
            if supplyMenu then missionCommands.removeItemForCoalition(2,supplyMenu) end
            supplyMenu=nil
            trigger.action.outTextForCoalition(2,'Zone not found, purchase refunded',10)
            return 'Zone not found'
        end
        if chosenZone.side~=0 then
            bc:addFunds(2,cost)
            if supplyMenu then missionCommands.removeItemForCoalition(2,supplyMenu) end
            supplyMenu=nil
            trigger.action.outTextForCoalition(2,'Zone is not neutral anymore, purchase refunded',10)
            return 'Zone is no longer neutral!'
        end
        local bestCommander,status=findNearestAvailableSupplyCommander(chosenZone)
        if not bestCommander then
            bc:addFunds(2,cost)
            if supplyMenu then missionCommands.removeItemForCoalition(2,supplyMenu) end
            supplyMenu=nil
            if status=='inprogress' then
                trigger.action.outTextForCoalition(2,'Supply to '..chosenZone.zone..' already in progress, purchase refunded',10)
                return 'Supply mission in progress for this zone'
            else
                trigger.action.outTextForCoalition(2,'No suitable supply group found for '..chosenZone.zone..', purchase refunded',10)
                return 'No available supply convoys'
            end
        end
        bestCommander.targetzone=zonename
        bestCommander.state='preparing'
        bestCommander.urgent=true
        bestCommander.lastStateTime=timer.getAbsTime()-999999
        trigger.action.outTextForCoalition(2,'Emergency Capture from '..bestCommander.name..' heading to '..zonename,10)
        if supplyMenu then
            missionCommands.removeItemForCoalition(2,supplyMenu)
            supplyMenu=nil
        end
        return nil
    end)
    return nil
end,
function(sender,params)
    if not params.zone or params.zone.side~=0 then
        return 'Zone is not neutral'
    end
    local chosenZone=bc:getZoneByName(params.zone.zone)
    local bestCommander,status=findNearestAvailableSupplyCommander(chosenZone)
    if not bestCommander then
        if status=='inprogress' then
            return 'Supply mission in progress for this zone'
        else
            return 'No available supply convoys'
        end
    end
    bestCommander.targetzone=params.zone.zone
    bestCommander.state='preparing'
    bestCommander.urgent=true
    bestCommander.lastStateTime=timer.getAbsTime()-999999
    trigger.action.outTextForCoalition(2,'Emergency Capture from '..bestCommander.name..' heading to '..params.zone.zone,10)
    return nil
end)
--end of menu

local intelMenu=nil
bc:registerShopItem('intel','Intel on enemy zone',150,function(sender)
	if intelMenu then
		return 'Already choosing a zone'
	end
	local pickZone = function(targetZoneName)
		if intelMenu then
			local zoneObj = bc:getZoneByName(targetZoneName)
			if not zoneObj or zoneObj.side ~= 1 then
				return 'Must pick an enemy zone'
			end
			intelActiveZones[targetZoneName] = true
			trigger.action.outTextForCoalition(2, 'Intel available for '..targetZoneName..'. Check Zone status. Valid for 1 hour', 15)
			timer.scheduleFunction(function(args)
				local zName = args[1]
				local zn = bc:getZoneByName(zName)
				if not zn or zn.side ~= 1 then return end
				if intelActiveZones[zName] then
					intelActiveZones[zName] = false
					trigger.action.outTextForCoalition(2, 'Intel on '..zName..' has expired.', 10)
				end
			end, {targetZoneName}, timer.getTime()+60*60)
			intelMenu = nil
		end
	end
	intelMenu = bc:showTargetZoneMenu(2, 'Choose Enemy Zone for Intel', pickZone, 1)
	trigger.action.outTextForCoalition(2, 'Intel purchase started. Select enemy zone from F10 menu.', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 1 then
		intelActiveZones[params.zone.zone] = true
		trigger.action.outTextForCoalition(2, 'Intel available for '..params.zone.zone..'. Check Zone status. Valid for 1 hour', 15)
		SCHEDULER:New(nil,function(zName)
			if intelActiveZones[zName] then
				intelActiveZones[zName] = false
				trigger.action.outTextForCoalition(2, 'Intel on '..zName..' has expired.', 10)
			end
		end,{params.zone.zone},3600)
	else
		return 'Must pick an enemy zone'
	end
end)

bc:addShopItem(2, 'cruisemsl', 12)
bc:addShopItem(2, 'supplies', -1)
bc:addShopItem(2, 'supplies2', -1)
bc:addShopItem(2, 'jtac', -1)
bc:addShopItem(2, '9lineam', -1)
bc:addShopItem(2, '9linefm', -1)
bc:addShopItem(2, 'smoke', -1)
bc:addShopItem(2, 'jam', -1)
--bc:addShopItem(2, 'bombsnorth', -1)
--bc:addShopItem(2, 'capnorth', -1)
bc:addShopItem(2, 'dynamiccap', -1)
bc:addShopItem(2, 'dynamicsead', -1)
bc:addShopItem(2, 'dynamiccas', -1)
bc:addShopItem(2, 'dynamicdecoy', -1)
bc:addShopItem(2, 'dynamicbomb', -1)
--bc:addShopItem(2, 'awacsnorth', -1)
bc:addShopItem(2, 'sead', -1)
bc:addShopItem(2, 'intel', -1)

--bc:addShopItem(2, 'cas', -1)
--bc:addShopItem(2, 'bombssouth', -1)
--bc:addShopItem(2, 'capsouth', -1)
--bc:addShopItem(2, 'awacssouth', -1)

bc:addShopItem(2, 'armor', -1)
bc:addShopItem(2, 'artillery', -1)
bc:addShopItem(2, 'recon', -1)
bc:addShopItem(2, 'airdef', -1)
bc:addShopItem(2, 'capture', -1)



supplyZones = {
    'FOB Alpha', 
    'Incirlik', 
    'Carrier Group',
    'FOB Lima', 
    'FOB Mike', 
    'Taftanaz', 
    'Abu al-Duhur', 
    'Jirah',
    'Minakh',
    'Aleppo',
    'Tabqa',
    'Bassel Al-Assad',
    'Hama',
    'Palmyra',
    'Hatay',
    'India',
    'Juliett',
    'Military Base',
    'Akrotiri',
    'Paphos',
    'Polis',
    'Karavostasi',
    'Larnaca',
    'Ercan',
    'Pinarbashi',
    'Gecitkale',
    'Bravo',
    'Charlie',
    'Delta',
    'Red Carrier',
    'Foxtrot',
    'Golf',
    'Hotel',
    'Juliett',
    'Kilo',
    'November',
    'Oscar',
    'Papa',
    'Romeo',
    'Sierra',
    'Tango',
    'Uniform',
    'Victor',
    'Durayhim',
    'Raqqa',
    'Dam',
    'TV Tower',
    'SA-5',
    'Rene Mouawad',
    'Wujah',
    'Beirut',
    'Rayak',
    'Al Qusayr',
    'Tiyas',
    'Damascus',
    'An Nasiriyah',
    'Thalah',
    'King Hussein Air College',
    'Muwaffaq Salti',
    'Prince Hassan',
    'Ben Gurion',
    'Ramat David',
    'Rosh Pina',
    'Marka',
    'Gaziantep',
    'Manbij',
    'Shayrat'
}


lc = LogisticCommander:new({battleCommander = bc, supplyZones = supplyZones})
lc:init()

bc:loadFromDisk() --will load and overwrite default zone levels, sides, funds and available shop items
bc:init()
bc:startRewardPlayerContribution(15,{infantry = 10, ground = 10, sam = 30, airplane = 30, ship = 250, helicopter=30, crate=200, rescue = 300})
HercCargoDropSupply.init(bc)

bc:buildZoneDistanceCache()
buildSubZoneRoadCache()
bc:buildConnectionMap()
local HuntNumber = math.random(4,7)
bc:initHunter(HuntNumber)
evc = EventCommander:new({ decissionFrequency=30*60, decissionVariance=30*60, skipChance = 15})
evc:init()

Group.getByName('oscar-scud-1'):destroy()
evc:addEvent({
	id='scuds',
	action = function()

		 RespawnGroup('oscar-scud-1')
		
		timer.scheduleFunction(function(param, time)
			if Group.getByName('oscar-scud-1') then
				local tgts = {
					'Hatay',
					'Abu al-Duhur',
					'Hama',
					'Jirah',
					'Aleppo',
					'Taftanaz',
					'Palmyra',
					'Bassel Al-Assad'
				}
				
				local validtgts = {}
				for _,v in ipairs(tgts) do
					if bc:getZoneByName(v).side == 2 then
						table.insert(validtgts, v)
					end
				end
				
				if #validtgts == 0 then return time+(10*60) end
				
				local die = math.random(1,#validtgts)
				local choice = validtgts[die]
				bc:fireAtZone(choice, 'oscar-scud-1', false, 8)
				trigger.action.outTextForCoalition(2, 'SCUDS near Oscar are launching at '..choice, 15)
			end
		end, {}, timer.getTime()+(20*60))
	end,
	canExecute = function()
		local gr = Group.getByName('oscar-scud-1')
		if gr then return false end
		
		if bc:getZoneByName('Oscar').side ~= 1 then return false end
		
		local triggers = {'Abu al-Duhur', 'Aleppo', 'Palmyra', 'Hama'}
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side == 2 then
				return true
			end
		end
		
		return false
	end
})

Group.getByName('escort-me'):destroy()
Group.getByName('interceptor-1'):destroy()
Group.getByName('interceptor-2'):destroy()
evc:addEvent({
	id='escort',
	action = function()
		RespawnGroup('escort-me') 
		
	local function spawnIntercept(args)
		local groupname = args[1]
		--env.info('spawnIntercept called for '..tostring(groupname))
		if Group.getByName('escort-me') then
				local g = GROUP:FindByName(groupname,false)
				if not g then
					if math.random(1,100) > 30 then
						if math.random(1,100) > 50 then
							trigger.action.outTextForCoalition(2,'Enemy interceptor spotted heading for our cargo transport.',15)
						else
							trigger.action.outTextForCoalition(2,'The enemy has launched an intercept mission against our cargo transport',15)
						end
						RespawnGroup(groupname)
					end
				end
			end
		end
		local timers = {math.random(10*60,20*60), math.random(15*60,25*60)}
		timer.scheduleFunction(spawnIntercept, {'interceptor-1'}, timer.getTime() + timers[1])
		timer.scheduleFunction(spawnIntercept, {'interceptor-2'}, timer.getTime() + timers[2])
	end,
	canExecute = function()
		local gr = Group.getByName('escort-me')
		if gr then return false end
		
		local triggers = {'Abu al-Duhur', 'Hatay', 'Incirlik', 'Taftanaz', 'Hama'}
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side == 2 then
				return true
			end
		end
		
		return false
	end
})

local casGrp = Era=='Coldwar' and 'evt-CAScw' or 'evt-CAS'
Group.getByName('evt-CAS'):destroy()
Group.getByName('evt-CAScw'):destroy()
evc:addEvent({
	id='cas',
	action=function()
		RespawnGroup(casGrp)
		timer.scheduleFunction(function()
			local tgts={'Hatay','Abu al-Duhur','Hama','Jirah','Aleppo','Taftanaz','Palmyra','Bassel Al-Assad','Hotel','Juliett','Factory','India','Military Base',
		'An Nasiriyah','Al Qusayr','Rayak','Palmyra'}
			local valid={}
			for _,v in ipairs(tgts) do
				if bc:getZoneByName(v).side==2 then valid[#valid+1]=v end
			end
			if #valid~=0 then
				local choice=valid[math.random(1,#valid)]
				if Group.getByName(casGrp) then bc:engageZone(choice,casGrp) end
			end
		end,{},timer.getTime()+3)
	end,
	canExecute=function()
		if Group.getByName(casGrp) then return false end
		local triggers={'Abu al-Duhur','Aleppo','Hama','Tabqa','Palmyra'}
		if math.random(1,100)<70 then return false end
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side==2 then return true end
		end
		return false
	end
})
Group.getByName('evt-bomber'):destroy()
local escGrp = Era=='Coldwar' and 'EscortBomberCW' or 'EscortBomber'
evc:addEvent({
	id='bomb',
	action=function()
		RespawnGroup('evt-bomber')
		timer.scheduleFunction(function()
			startBomberAttack()
			RespawnGroup(escGrp)
			timer.scheduleFunction(function()
				local bomber=Group.getByName('evt-bomber')
				local escort=Group.getByName(escGrp)
				if bomber and escort then
					local c=escort:getController()
					c:popTask()
					c:pushTask({
						id='Escort',
						params={
							groupId=bomber:getID(),
							pos={x=-20,y=2000,z=50},
							lastWptIndexFlag=false,
							lastWptIndex=-1,
							engagementDistMax=12000,
							targetTypes={'Air'}
						}
					})
				end
			end,{},timer.getTime()+5)
		end,{},timer.getTime()+10)
	end,
	canExecute=function()
		if Group.getByName('evt-bomber') then return false end
		if math.random(1,100)<70 then return false end
		local trg={'Abu al-Duhur','Aleppo','Hama','Tabqa','Palmyra'}
		for _,v in ipairs(trg) do
			if bc:getZoneByName(v).side==2 then return true end
		end
		return false
	end
})

function startBomberAttack() -- called from bomber groups waypoint actions
	local tgts = {
		'Hatay',
		'Abu al-Duhur',
		'Hama',
		'Jirah',
		'Aleppo',
		'Taftanaz',
		'Palmyra',
		'Bassel Al-Assad',
		'Hotel',
		'Juliett',
		'Factory',
		'India',
		'Military Base',
		'Palmyra',
		
	}
	
	local validtgts = {}
	for _,v in ipairs(tgts) do
		if bc:getZoneByName(v).side == 2 then
			table.insert(validtgts, v)
		end
	end
	
	if #validtgts ~= 0 then
		local die = math.random(1,#validtgts)
		local choice = validtgts[die]
		
		if Group.getByName('evt-bomber') then
			bc:engageZone(choice, 'evt-bomber',  AI.Task.WeaponExpend.HALF)
		end
	end
end

Group.getByName('evt-shiptercept1'):destroy()
Group.getByName('evt-shiptercept2'):destroy()
Group.getByName('evt-shiptercept3'):destroy()
local shipDieEvent = nil

evc:addEvent({
  id = 'shiptercept',
  action = function()
    local ships = {'evt-shiptercept1','evt-shiptercept2','evt-shiptercept3'}
    local choice = math.random(1, #ships)
    RespawnGroup(ships[choice])
    shipDieEvent = EVENT:New()
    function shipDieEvent:OnEventDead(EventData)
      if EventData.IniGroup and EventData.IniGroup:GetName() and EventData.IniGroup:GetName():find('^evt%-shiptercept') then
        self:UnHandleEvent(EVENTS.Dead)
        shipDieEvent = nil
        trigger.action.outTextForCoalition(2, 'Enemy supply ship destroyed.\n+500 credits', 15)
        bc:addFunds(2, 500)
      end
    end
    shipDieEvent:HandleEvent(EVENTS.Dead)
  end,
  canExecute = function()
    if math.random(1, 100) < 70 then return false end
    if bc:getZoneByName('Red Carrier').side ~= 1 then return false end
    if Group.getByName('evt-shiptercept1') then return false end
    if Group.getByName('evt-shiptercept2') then return false end
    if Group.getByName('evt-shiptercept3') then return false end
    return true
  end
})


duhurForce = {
	['Aleppo'] = { 'evt-aleppo-duhur-attack' , 'evt-aleppo-duhur-deploy-1', 'evt-aleppo-duhur-deploy-2', 'evt-aleppo-duhur-deploy-3'},
	['Tabqa'] = { 'evt-tabqa-duhur-sead' },
	['November'] = { 'evt-november-duhur-arty', 'evt-november-duhur-arty2' },
	['Hama']            = (Era == 'Coldwar') and { 'evt-hama-duhur-cas-coldwar' }     or { 'evt-hama-duhur-cas' },
	['Bassel Al-Assad'] = (Era == 'Coldwar') and { 'evt-bassel-duhur-sead-Coldwar' } or { 'evt-bassel-duhur-sead' },
}
for i,v in pairs(duhurForce) do
	for _,v2 in ipairs(v) do
		Group.getByName(v2):destroy()
	end
end
evc:addEvent({
	id='duhurattack',
	action = function()
		for i,v in pairs(duhurForce) do
			if bc:getZoneByName(i).side == 1 then
				for _,v2 in ipairs(v) do
					 RespawnGroup(v2)
				end
			end
		end
	end,
	canExecute = function()
		if math.random(1,100) < 60 then return false end
		
		if bc:getZoneByName('Abu al-Duhur').side ~= 2 then return false end
		
		local canAttack = false
		for i,v in pairs(duhurForce) do
			if bc:getZoneByName(i).side == 1 then canAttack = true end
			
			for _,v2 in ipairs(v) do
				if Group.getByName(v2) then return false end
			end
		end
		
		return canAttack
	end
})

Group.getByName('evt-cargointercept1'):destroy()
Group.getByName('evt-cargointercept2'):destroy()
Group.getByName('evt-cargointercept3'):destroy()
local cargoDieEvent = nil
evc:addEvent({
	id='cargointercept',
	action = function()
		local planes = {'evt-cargointercept1','evt-cargointercept2','evt-cargointercept3'}
		local choice = math.random(1,#planes)
		RespawnGroup(planes[choice])
		cargoDieEvent = EVENT:New()
		function cargoDieEvent:OnEventDead(EventData)
			if EventData.IniGroup and EventData.IniGroup:GetName() and EventData.IniGroup:GetName():find('^evt%-cargointercept') then
				self:UnHandleEvent(EVENTS.Dead)
				cargoDieEvent = nil
				trigger.action.outTextForCoalition(2,'Enemy cargo plane destroyed.\n+500 credits',15)
				bc:addFunds(2,500)
			end
		end
		cargoDieEvent:HandleEvent(EVENTS.Dead)
	end,
	canExecute = function()
		if math.random(1,100) < 70 then return false end
		if bc:getZoneByName('Red Carrier').side ~= 1 then return false end
		if bc:getZoneByName('Bassel Al-Assad').side ~= 1 then return false end
		if Group.getByName('evt-cargointercept1') then return false end
		if Group.getByName('evt-cargointercept2') then return false end
		if Group.getByName('evt-cargointercept3') then return false end
		return true
	end
})


Group.getByName('GroundConvoy1'):destroy()
Group.getByName('GroundConvoy2'):destroy()
Group.getByName('GroundConvoy3'):destroy()
local Convoyintercept = nil
evc:addEvent({
	id='Convoyintercept',
	action = function()
		local convoy = {'GroundConvoy1','GroundConvoy2','GroundConvoy3'}
		local choice = math.random(1,#convoy)
		RespawnGroup(convoy[choice])
		local generalKilled = false
		Convoyintercept = EVENT:New()
		function Convoyintercept:OnEventDead(EventData)
			if EventData.IniUnit and EventData.IniUnit:GetName() and EventData.IniUnit:GetName():find('^GroundConvoyInfantry') and not generalKilled then
				generalKilled = true
				self:UnHandleEvent(EVENTS.Dead)
				Convoyintercept = nil
				trigger.action.outTextForCoalition(2,'The russian general is killed.\n+2500 credits',15)
				bc:addFunds(2,2500)
			end
		end
		Convoyintercept:HandleEvent(EVENTS.Dead)
	end,
	canExecute = function()
		if math.random(1,100) < 90 then return false end
		if bc:getZoneByName('Pinarbashi').side ~= 1 then return false end
		if Group.getByName('GroundConvoy1') then return false end
		if Group.getByName('GroundConvoy2') then return false end
		if Group.getByName('GroundConvoy3') then return false end
		return true
	end
})

mc = MissionCommander:new({side = 2, battleCommander = bc, checkFrequency = 60})
local sceneryList = {
    ["StrikeTarget"] = {SCENERY:FindByZoneName("StrikeTarget")},
    ["StrikeTarget1"] = {SCENERY:FindByZoneName("StrikeTarget1")},
    ["StrikeTarget2"] = {SCENERY:FindByZoneName("StrikeTarget2")},

}

SCHEDULER:New(nil, function()
    for name, sceneries in pairs(sceneryList) do
        local allBelow50 = true
        for _, scenery in ipairs(sceneries) do
            if scenery and scenery:GetRelativeLife() > 50 then
                allBelow50 = false
                break
            end
        end
        if allBelow50 then
            CustomFlags[name] = true
        end
    end
end, {}, 5, 20)

------------------------------------ custom missions --------------------------------

Group.getByName('StrikeTargetGroup'):destroy()
evc:addEvent({
	id='StrikeTarget',
	action = function()
	RespawnGroup('StrikeTargetGroup')
	end,
	canExecute = function()
		if math.random(1,100) < 70 then return false end
		if Group.getByName('StrikeTargetGroup') then return false end
		if CustomFlags["StrikeTarget"] then return false end
		if bc:getZoneByName('Red Carrier').side ~= 2 then return false end
		
		return true
end
})
mc:trackMission({
	title = "Strike the rebeles",
	description =
[[Rebels hideout have been found, 
East of Incirlik in the city of Adana.

Drop a bomb on the building!

Reward: 250

MGRS: 36 S YF 01234 99114
Lat long: N N 37°01'00" E 35°15'43"
Lat long Decimal Minutes: N 37°01.000' E 35°15.720'

Elevation 83 feet]],
	messageStart = "New strike mission: Strike the rebeles",
	messageEnd = "Strike mission ended: Strike the rebeles\n+250 credits",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
	end,
	reward = 250,
	isActive = function()
	if CustomFlags["StrikeTarget"] then return false end
	if IsGroupActive('StrikeTargetGroup') then return true end
	return false
	end,
})

Group.getByName('StrikeTargetGroup1'):destroy()
evc:addEvent({
	id='StrikeTarget1',
	action = function()
	RespawnGroup('StrikeTargetGroup1')

	end,
	canExecute = function()
		if math.random(1,100) < 70 then return false end
		if Group.getByName('StrikeTargetGroup1') then return false end
		if CustomFlags["StrikeTarget1"] then return false end
		if bc:getZoneByName('Hatay').side ~= 2 then return false end
		
		return true
end
})
mc:trackMission({
	title = "Strike the rebeles",
	description =
[[Another rebel hideout have been found, 
West of Aleppo airport, in the city of Aleppo.

Drop a bomb on the building!

Reward: 250

MGRS: 37 S CA 45592 05682
Lat long: N N N 36°11'01" E 37°16'58"
Lat long Decimal Minutes: N 36°11.017' E 37°16.972'

Elevation 1261 feet]],
	messageStart = "New strike mission: Strike the rebeles",
	messageEnd = "Strike mission ended: Strike the rebeles\n+250 credits",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
	end,
	reward = 250,
	isActive = function()
	if CustomFlags["StrikeTarget1"] then return false end
	if IsGroupActive('StrikeTargetGroup1') then return true end
	return false
	end,
})

Group.getByName('StrikeTargetGroup2'):destroy()
Group.getByName('StrikeTargetGroup3'):destroy()
Group.getByName('Red SAM SA-3 Fixed Event'):destroy()
local SecondManEvent = nil
evc:addEvent({
	id='StrikeTarget2',
	action = function()
		RespawnGroup('StrikeTargetGroup2')
		RespawnGroup('StrikeTargetGroup3')
		local secondManKilled = false
		SecondManEvent = EVENT:New()
		function SecondManEvent:OnEventDead(EventData)
			if EventData.IniGroup and EventData.IniGroup:GetName() and EventData.IniGroup:GetName():find('StrikeTargetGroup2') then
				if not IsGroupActive('StrikeTargetGroup2') and not secondManKilled then
					secondManKilled = true
					self:UnHandleEvent(EVENTS.Dead)
					SecondManEvent = nil
					trigger.action.outTextForCoalition(2, 'Splash!', 15)
					RespawnGroup('Red SAM SA-3 Fixed Event')
					bc:addFunds(2, 750)
				end
			end
		end
		SecondManEvent:HandleEvent(EVENTS.Dead)
	end,
	canExecute = function()
		if bc:getZoneByName('Abu al-Duhur').side ~= 2 then return false end
		if Group.getByName('StrikeTargetGroup2') then return false end
		if CustomFlags["StrikeTarget2"] then return false end
		return true
	end
})


mc:trackMission({
	title = "Strike the general",
description = 
[[We have the location on one of the generals. 
West of Paregaan, Take him out!

Coordinates:
MGRS: 40 R CS 89440 02522
Lat Long: N 28°02'36" E 55°52'30"
Lat long Decimal Minutes: N 28°02.605' E 55°52.507'
Elevation: 2272 feet

Reward: 750

Destroy the house and whoever is nearby.]],

	messageStart = "New strike mission: Strike the general",
	messageEnd = "Strike mission ended: Strike the general\n+750",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
	end,
	isActive = function()
		if CustomFlags["StrikeTarget2"] then return false end
		if Group.getByName('StrikeTargetGroup2') then return true end
		return false
	end
})


mc:trackMission({
    title = "Intercept cargo plane",
    description = "Find and destroy the enemy cargo plane near Red Carrier, heading for Bassel Al-Assad.",
    messageStart = "New mission: Intercept cargo plane",
    messageEnd = "Mission ended: Intercept cargo plane",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "radio1.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if Group.getByName('evt-cargointercept1') then return true end
        if Group.getByName('evt-cargointercept2') then return true end
        if Group.getByName('evt-cargointercept3') then return true end
        
        return false
    end
})

mc:trackMission({
    title = "Find the generals convoy",
    description =
[[Find the generals convoy!
he just left Pinarbashi in a convoy protected by SA-19,

find where he live and drop a bomb on the building]],
    messageStart = "New mission: Find the generals convoy.\nHe just left Pinarbashi headed north",
    messageEnd = "Mission ended: Find the generals convoy",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "radio1.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if Group.getByName('GroundConvoy1') then return true end
        if Group.getByName('GroundConvoy2') then return true end
        if Group.getByName('GroundConvoy3') then return true end
        
        return false
    end
})
mc:trackMission({
    title = "Escort cargo plane",
    description = "Friendly cargo plane is taking off from Incirlik. Protect it until it leaves the airspace.",
    messageStart = "New mission: Escort cargo plane",
    messageEnd = "Mission ended: Escort cargo plane",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if Group.getByName('escort-me') then return true end
        return false
    end
})
mc:trackMission({
    title = "Defend Abu al-Duhur",
    description = "The enemy is preparing an all out attack on Abu al-Duhur.\nDefend the airfield at all cost.",
    messageStart = "New mission: Defend Abu al-Duhur",
    messageEnd = "Mission ended: Defend Abu al-Duhur",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        for i, v in pairs(duhurForce) do
            for _, v2 in ipairs(v) do
                if Group.getByName(v2) then return true end
            end
        end
        return false
    end
})

mc:trackMission({
    title = "Destroy cargo ship at Red Carrier",
    description = "Find and destroy the enemy cargo ship at Red Carrier, heading towards Bassel Al-Assad",
    messageStart = "New mission: Destroy cargo ship",
    messageEnd = "Mission ended: Destroy cargo ship",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "radio2.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if Group.getByName('evt-shiptercept1') then return true end
        if Group.getByName('evt-shiptercept2') then return true end
        if Group.getByName('evt-shiptercept3') then return true end

        return false
    end
})

mc:trackMission({
    title = "Destroy SCUDS (52)",
    description = "SCUDS have been spotted at Oscar (52).\nDestroy them before they can launch their missiles",
    messageStart = "New mission: Destroy SCUDS",
    messageEnd = "Mission ended: Destroy SCUDS",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        local gr = Group.getByName('oscar-scud-1')
        if gr then return true else return false end
    end
})

mc:trackMission({
    title = "Destroy artillery",
    description = "Artillery has been spotted heading towards Aleppo from the direction of Jirah.\nDestroy them before they get in range.",
    messageStart = "New mission: Destroy artillery",
    messageEnd = "Mission ended: Destroy artillery\n+50 credits",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    reward = 50,
    isActive = function()
        local gr = Group.getByName('jirah-attack-7')
        if gr then return true else return false end
    end
})

mc:trackMission({
    title = "Destroy artillery",
    description = "Artillery has been spotted heading towards Durayhim from the direction of Jirah.\nDestroy them before they get in range.",
    messageStart = "New mission: Destroy artillery",
    messageEnd = "Mission ended: Destroy artillery\n+50 credits",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    reward = 50,
    isActive = function()
        local gr = Group.getByName('jirah-attack-8')
        if gr then return true else return false end
    end
})

mc:trackMission({
    title = "Destroy artillery",
    description = "Artillery has been spotted heading towards Abu al-Duhur from the direction of November.\nDestroy them before they get in range.",
    messageStart = "New mission: Destroy artillery",
    messageEnd = "Mission ended: Destroy artillery\n+50 credits",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    reward = 50,
    isActive = function()
        local gr = Group.getByName('november-attack-abu')
        if gr then return true else return false end
    end
})

mc:trackMission({
    title = "Destroy artillery",
    description = "Artillery has been spotted heading towards India from the direction of November.\nDestroy them before they get in range.",
    messageStart = "New mission: Destroy artillery",
    messageEnd = "Mission ended: Destroy artillery\n+50 credits",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    reward = 50,
    isActive = function()
        local gr = Group.getByName('november-attack-india')
        if gr then return true else return false end
    end
})

mc:trackMission({
	title = "Destroy artillery",
	description = "Artillery has been spotted heading towards Hama from the direction of November.\nDestroy them before they get in range.",
	messageStart = "New mission: Destroy artillery",
	messageEnd = "Mission ended: Destroy artillery\n+50 credits",
	startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
	reward = 50,
	isActive = function()
		local gr = Group.getByName('november-attack-hama')
		if gr then return true else return false end
	end
})

mc:trackMission({
	title = "Intercept Bombers",
	description = "Enemy bombers spotted to the north-east\nDestroy them before they get in range.",
	messageStart = "New mission: Intercept Bombers",
	messageEnd = "Mission ended: Intercept Bombers",
	startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
	isActive = function()
		local gr = Group.getByName('evt-bomber')
		if gr then return true else return false end
	end
})

mc:trackMission({
	title = "Intercept enemy airstrike",
	description = "Enemy aircraft conducting an airstrike from the south-east\nDestroy them before they get in range.",
	messageStart = "New mission: Intercept enemy airstrike",
	messageEnd = "Mission ended: Intercept enemy airstrike",
	startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
	isActive = function()
		local g1 = Group.getByName('evt-CAS')
		local g2 = Group.getByName('evt-CAScw')
		if g1 or g2 then
			return true
		else
			return false
		end
	end
})

resupplyTarget = nil
mc:trackMission({
    title = function()
        local wp = WaypointList[resupplyTarget] or ""
        return "Resupply " .. resupplyTarget .. wp
    end,
    description = function()
        return "Deliver supplies to " .. resupplyTarget end,
    messageStart = function()
        local wp = WaypointList[resupplyTarget] or ""
        return "New mission: Resupply " .. resupplyTarget .. wp
    end,
    messageEnd = function()
        return "Mission ended: Resupply " .. resupplyTarget end,
    startAction = function()
        if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
	resupplyTarget = nil
        if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if not resupplyTarget then return false end

        local targetzn = bc:getZoneByName(resupplyTarget)
        return targetzn:canRecieveSupply()
    end
})

attackTarget = nil
mc:trackMission({
    title = function()
        local wp = WaypointList[attackTarget] or ""
        return "Attack " .. attackTarget .. wp
    end,
    description = function()
        local wp = WaypointList[attackTarget] or ""
        return "Destroy enemy forces at " .. attackTarget end,
    messageStart = function()
        local wp = WaypointList[attackTarget] or ""
        return "New mission: Attack " .. attackTarget .. wp
    end,
    messageEnd = function()
        return "Mission ended: Attack " .. attackTarget end,
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cas.ogg")
        end
    end,
    endAction = function()
		attackTarget = nil
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if not attackTarget then return false end
        local targetzn = bc:getZoneByName(attackTarget)
        return targetzn.side == 1
    end
})

captureTarget = nil
mc:trackMission({
    title = function()
        local wp = WaypointList[captureTarget] or ""
        return "Capture " .. captureTarget .. wp
    end,
    description = function()
        return captureTarget .. " is neutral. Capture it by delivering supplies" end,
    messageStart = function()
        local wp = WaypointList[captureTarget] or ""
        return "New mission: Capture " .. captureTarget .. wp
    end,
    messageEnd = function()
        return "Mission ended: Capture " .. captureTarget end,
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
	captureTarget = nil
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if not captureTarget then return false end

        local targetzn = bc:getZoneByName(captureTarget)
        return targetzn.side == 0 and targetzn.active
    end
})



seadTarget = nil
function generateSEADMission()
    if seadTarget then return end
    if not attackTarget then return end

    local function isSEADZone(zone)
        local lname = zone.zone:lower()
        return zone.side == 1 and zone.active and (lname:find('sam') or lname:find('defence')
		or lname:find('papa') or lname:find('juliett') or lname:find('india') or lname:find('delta')
		or lname:find('bravo') or lname:find('hotel'))
    end


	local validSEADZones = {}
	local attackZone = bc:getZoneByName(attackTarget)

	if attackZone and attackZone.zone then
		local znA = attackZone.zone
		for _, zone in ipairs(bc.zones) do
			local znB = zone.zone
			local dist = ZONE_DISTANCES[znA] and ZONE_DISTANCES[znA][znB]
			if isSEADZone(zone) and dist and dist <= 24000 then
				table.insert(validSEADZones, zone.zone)
			end
		end
	end

    if #validSEADZones == 0 then
        for _, connection in ipairs(bc.connections) do
            local from = bc:getZoneByName(connection.from)
            local to = bc:getZoneByName(connection.to)

            if from.side ~= to.side and from.side ~= 0 and to.side ~= 0 then
                if isSEADZone(from) then
                    table.insert(validSEADZones, from.zone)
                end
                if isSEADZone(to) then
                    table.insert(validSEADZones, to.zone)
                end
            end
        end
    end

    if #validSEADZones == 0 then return end

    seadTarget = validSEADZones[math.random(#validSEADZones)]

    mc:trackMission({
        zone = seadTarget,
        missionType = "SEAD",
        title = function() return "SEAD mission at " .. seadTarget end,
        description = function() return "Neutralize enemy SAM/defences at " .. seadTarget end,
        messageStart = function() return "New SEAD mission: Engage SAM at " .. seadTarget end,
        messageEnd = function() return "SEAD mission ended" end,
        startAction = function()
            if not missionCompleted then
                trigger.action.outSoundForCoalition(2, "ding.ogg") end
        end,
        endAction = function()
            seadTarget = nil
            if not missionCompleted then
                trigger.action.outSoundForCoalition(2, "cancel.ogg") end
        end,
        isActive = function()
            if not seadTarget then return false end
            local zn = bc:getZoneByName(seadTarget)
            return zn and zn.side == 1
        end
    })
end

function generateCaptureMission()
    if captureTarget ~= nil then return end
    
    local validzones = {}
    for _, v in ipairs(bc.zones) do

        if v.active and v.side == 0 and (not v.NeutralAtStart or v.firstCaptureByRed) and 
           not string.find(v.zone, "Hidden") and (not v.zone:find("Red Carrier")) then
            table.insert(validzones, v.zone)
        end
    end
    
    if #validzones == 0 then return end
    
    local choice = math.random(1, #validzones)
    if validzones[choice] then
        captureTarget = validzones[choice]
        return true
    end
end
---------------------------------------------------------------------
--                          CAP MISSION                            --

capMissionTarget = nil
capKillsByPlayer = {}
capTargetPlanes = 0
capWinner = nil
capMissionCooldownUntil = 0

mc:trackMission({
    title = function() return "CAP mission" end,
    description = function()
        if not next(capKillsByPlayer) then
            return "Kill "..capTargetPlanes.." A/A targets without getting shot down, who wins?"
        else
            local scoreboard = "Current Kill Count:\n"
            for playerName, kills in pairs(capKillsByPlayer) do
                scoreboard = scoreboard .. string.format("%s: %d\n", playerName, kills)
            end
            return string.format("Kill %d A/A targets, who wins?\n\n%s", capTargetPlanes, scoreboard)
        end
    end,
    messageStart = function()
        return "New CAP mission: Kill "..capTargetPlanes.." A/A targets." end,
    messageEnd = function() return "Mission ended: CAP" end,
    startAction = function()
        if not missionCompleted then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
        if capWinner then
            local reward = capTargetPlanes * 100
            capMissionCooldownUntil = timer.getTime() + 1800
            trigger.action.outTextForCoalition(2, "["..capWinner.."] completed the CAP mission!\nReward: "..reward.." credits", 20)
            bc:addFunds(2, reward)
        end
        capMissionTarget = nil
        capKillsByPlayer = {}
        capWinner = nil
		capTargetPlanes = 0
        if not missionCompleted then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if not capMissionTarget then return false end
        return true
    end
})



--                    End of CAP MISSION                           --
---------------------------------------------------------------------


---------------------------------------------------------------------
--                      ESCORT MISSION                             --

function generateEscortMission(zoneName, groupName, groupID, group, mission)
    local mission = mission or missions[zoneName]
    if not mission then return false end

    missionGroupIDs[zoneName] = missionGroupIDs[zoneName] or {}
    missionGroupIDs[zoneName][groupID] = {
        groupID = groupID,
        group = group
    }
	    if IsGroupActive(mission.missionGroup) then
		trigger.action.outSoundForGroup(groupID, "ding.ogg")
		trigger.action.outTextForGroup(groupID, "Active mission is pending:\n\nEscort convoy from " .. mission.zone .. " to " .. mission.TargetZone, 30)
        return
    end
	if mc.missionFlags[zoneName] then
			trigger.action.outSoundForGroup(groupID, "ding.ogg")
			trigger.action.outTextForGroup(groupID, "Special mission available:\n\nEscort convoy from " .. mission.zone .. " to " .. mission.TargetZone, 30)
		return 
	end

    mc:trackMission({
        MainTitle = function() return "Escort mission" end,
        title = function() return "Escort mission" end,
		titleBefore = function(self)
			self.notified = true
			trigger.action.outSoundForGroup(groupID, "ding.ogg")
			trigger.action.outTextForGroup(groupID, "Special mission available:\n\nEscort convoy from " .. mission.zone .. " to " .. mission.TargetZone, 30)
		 end,
        description = function() return "\nEscort a convoy to " .. mission.TargetZone .. "\nThe roads are filled with hostile enemies." end,
        isEscortMission = true,
        accept = false,
        missionGroup = mission.missionGroup,
        zoneName = zoneName,
        reward = 1000,
        messageStart = function() return "Escort convoy to " .. mission.TargetZone end,
		missionFail = function(self)
		self.accept = false
		if not IsGroupActive(mission.missionGroup) then
			mc.missionFlags[zoneName] = nil
			if missionGroupIDs[zoneName] and next(missionGroupIDs[zoneName]) then
				for groupName, data in pairs(missionGroupIDs[zoneName]) do
					local groupID = data.groupID
					local group = data.group
					trigger.action.outSoundForGroup(groupID, "cancel.ogg")
					trigger.action.outTextForGroup(groupID, "Mission failed:\n\nConvoy was destroyed\n\nRestart the mission from the radio menu", 30)
					removeMissionMenuForAll(mission.zone, groupID)
					if trackedGroups[groupName] then
						trackedGroups[groupName] = nil
						handleMission(zoneName, groupName, groupID, group)
					end
				end
			else
				trigger.action.outSoundForCoalition(2, "cancel.ogg")
				trigger.action.outTextForCoalition(2, "Mission failed:\n\nConvoy was destroyed", 30)
				removeMissionMenuForAll(mission.zone, nil, true)
				destroyGroupIfActive(mission.missionGroup)
			end
			return true
		end
		return false
		end,
		startOver = function(self)
			timer.scheduleFunction(function()
		if missionGroupIDs[zoneName] then
			for groupName, data in pairs(missionGroupIDs[zoneName]) do
				local groupID = data.groupID
				local group = data.group
				handleMission(zoneName, groupName, groupID, group)
				return nil
			end
		end	
			end, nil, timer.getTime() + 10)
		end,
        startAction = function() return IsGroupActive(mission.missionGroup) end,
		endAction = function()
			local targetZone = bc:getZoneByName(mission.TargetZone)
			if targetZone.side == 2 and targetZone.active then
				if missionGroupIDs[zoneName] then
					for groupName, data in pairs(missionGroupIDs[zoneName]) do
						local groupID = data.groupID
						local group = data.group
						removeMissionMenuForAll(mission.zone, groupID)
						if trackedGroups[groupName] then
							trackedGroups[groupName] = nil
						end
						destroyGroupIfActive(mission.missionGroup)
						timer.scheduleFunction(function()
							handleMission(mission.TargetZone, groupName, groupID, group)
						end, nil, timer.getTime() + 30)
					end
				else
					removeMissionMenuForAll(mission.zone, nil, true)

					destroyGroupIfActive(mission.missionGroup)
				end
				mc.missionFlags[zoneName] = nil
				trigger.action.outSoundForCoalition(2, "ding.ogg")
				trigger.action.outTextForCoalition(2, "Escort mission complete!\n\nReward: 1000 credits", 20)
				return true
			end
			return false
		end,
        isActive = function()
            local targetZone = bc:getZoneByName(mission.TargetZone)
            if targetZone.side ~= 2 and targetZone.active then
                return true
            end
            return false
        end,
        returnAccepted = function(self)
            if not self.accept then return false end
            return IsGroupActive(mission.missionGroup)
        end,
    })

    mc.missionFlags[zoneName] = true
end
---------------------------------------------------------------------
--                     END OF ESCORT MISSION                       --

function generateAttackMission()
    if missionCompleted then return end
    if attackTarget ~= nil then return end

    local validzones = {}
    for _, v in ipairs(bc.connections) do
        local to = bc:getZoneByName(v.to)
        local from = bc:getZoneByName(v.from)

        local function checkValid(zone)
			local lname = zone.zone:lower()
            return zone.side == 1 and zone.active and not isZoneUnderSEADMission(zone.zone)
			and not lname:find('sam') and not lname:find('defence') and not lname:find('papa') and
			not lname:find('juliett') and not lname:find('india') and not lname:find('delta') and
			not lname:find('bravo') and not lname:find('hotel')
        end

        if from.side ~= to.side and from.side ~= 0 and to.side ~= 0 then
            if checkValid(from) then
                table.insert(validzones, from.zone)
            elseif checkValid(to) then
                table.insert(validzones, to.zone)
            end
        end
    end

    if #validzones == 0 then return end

    local choice = math.random(1, #validzones)
    attackTarget = validzones[choice]
    return true
end

function generateSupplyMission()
	if resupplyTarget ~= nil then return end
		
	local validzones = {}
	for _,v in ipairs(bc.zones) do
		if v.side == 2 and v:canRecieveSupply() then
			table.insert(validzones, v.zone)
		end
	end
	
	if #validzones == 0 then return end
	
	local choice = math.random(1, #validzones)
	if validzones[choice] then
		resupplyTarget = validzones[choice]
		return true
	end
end

timer.scheduleFunction(function(_, time)
	if generateCaptureMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 20)

timer.scheduleFunction(function(_, time)
	if generateAttackMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 35)

timer.scheduleFunction(function(_, time)
	if generateSEADMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 55)
timer.scheduleFunction(function(_, time)
	if generateSupplyMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 60)
timer.scheduleFunction(function(_,time)
   if checkAndGenerateCAPMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 60)

mc:init()

----------------------- FLAGS --------------------------

function checkZoneFlags()

    if zones.alduhur.wasBlue and zones.papa.wasBlue and trigger.misc.getUserFlag(2) == 0 and 
		trigger.misc.getUserFlag(1) == 0 then
        trigger.action.setUserFlag(1, true)
		trigger.action.setUserFlag(2, true)
	end
    if not zones.redcarrier.wasBlue and zones.larnaca.wasBlue and zones.gecitkale.wasBlue and
       zones.ercan.wasBlue and trigger.misc.getUserFlag(19) == 0 then
        trigger.action.setUserFlag(19, true)
    end
    if zones.redcarrier.wasBlue and not zones.incirlik.wasBlue and trigger.misc.getUserFlag(20) == 0 then
        trigger.action.setUserFlag(19, false)
		trigger.action.setUserFlag(20, true)
	end

	if zones.incirlik.side == 0 and zones.incirlik.firstCaptureByRed then
	zones.incirlik.firstCaptureByRed = false
    end
	if zones.tiyas.wasBlue and not zones.alqusayr.wasBlue and trigger.misc.getUserFlag(21) == 0 then
		trigger.action.setUserFlag(21, true)
	end  
	if zones.alqusayr.wasBlue and not zones.renemouawad.wasBlue and trigger.misc.getUserFlag(22) == 0 then
		trigger.action.setUserFlag(21, false)
		trigger.action.setUserFlag(22, true)		
	end
	if zones.renemouawad.wasBlue and not zones.annasiriyah.wasBlue and trigger.misc.getUserFlag(23) == 0 then
		trigger.action.setUserFlag(22, false)
		trigger.action.setUserFlag(21, false)
		trigger.action.setUserFlag(23, true)
	end	
	if zones.annasiriyah.wasBlue and zones.damascus.wasBlue and trigger.misc.getUserFlag(25) == 0 then
		trigger.action.setUserFlag(22, false)
		trigger.action.setUserFlag(21, false)
		trigger.action.setUserFlag(23, false)
        trigger.action.setUserFlag(25, true)
	end
	if IsGroupActive('CVN-73') then
		activateGroupIfNotActive('Shell113Y')
	end
end
timer.scheduleFunction(function()
    checkZoneFlags()
    return timer.getTime() + 30
end, {}, timer.getTime() + 2)

buildingCache = buildingCache or {}
for _, z in ipairs(bc:getZones()) do
	local c = CustomZone:getByName(z.zone)
	if c then c:getZoneBuildings() end
end
----------------------- END OF FLAGS --------------------------
--configure zone messages 


env.info("Mission Setup : is completed!")