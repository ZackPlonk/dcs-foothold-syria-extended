mysamSyria = MANTIS:New("Syria", "Red SAM", "Red EWR", "HQ Fixed", "red", true, "Red EWR Awacs")
mysamSyria:SetSAMRange(110)
mysamSyria:SetDetectInterval(10)

ZoneTable_Mantis = SET_ZONE:New():FilterPrefixes("Scoot"):FilterStart()
mysamSyria:AddScootZones(ZoneTable_Mantis, 3, true, "Cone")
--mysamSyria:SetMaxActiveSAMs(3, 3, 3, 3, 3)
mysamSyria:Start()

