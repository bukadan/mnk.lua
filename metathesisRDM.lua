-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------


---F9 is MELEE set TOGGLE (dont really use)
---f10 is PDT set TOGGLE (hit once to activate)
---F11 is MDT set TOGGLE (hit once to activate)
---F12 is CHECK sets (click to see what sets are up)
---ALT + F12 is REMOVE PDT OR MDT SETS 



-- Initialization function for this job file.
function get_sets()
	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
	state.Buff.Sublimation = buffactive['Sublimation: Activated'] or false

	addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
		"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

	update_active_strategems()
end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	options.CastingModes = {'Normal', 'Resistant'}
	options.OffenseModes = {'Normal'}
	options.DefenseModes = {'Normal'}
	options.WeaponskillModes = {'Normal'}
	options.IdleModes = {'Normal', 'PDT', 'Stun'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.Defense.PhysicalMode = 'PDT'


	-- Default macro set/book
	set_macro_page(2, 9)
end


-- Called when this job file is unloaded (eg: job change)
function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets

	-- Precast sets to enhance JAs

	sets.precast.JA['Tabula Rasa'] = {legs="Argute Pants +2"}


	-- Fast cast sets for spells
	
	sets.precast.FC ={
    main={ name="Lehbrailg +1", augments={'DMG:+18','CHR+1','"Fast Cast"+4',}},
    sub="Vivid Strap",
    ammo="Incantor Stone",
    head="Nahtirah Hat",
    body="Anhur Robe",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" potency +4%',}},
    legs="Artsieq Hose",
    feet="Estoqueur's Houseaux +2",
    neck="Dualism Collar",
    waist="Witful Belt",
    left_ear="Andoaa Earring",
    right_ear="Loquac. Earring",
    left_ring="Sangoma Ring",
    right_ring="Prolix Ring",
    back="Swith Cape",
}

	sets.precast.FC['Enhancing Magic'] = {
    main={ name="Lehbrailg +1", augments={'DMG:+18','CHR+1','"Fast Cast"+4',}},
    sub="Vivid Strap",
    ammo="Incantor Stone",
    head="Nahtirah Hat",
    body="Anhur Robe",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" potency +4%',}},
    legs="Artsieq Hose",
    feet="Estoqueur's Houseaux +2",
    neck="Enhancing Torque",
    waist="Witful Belt",
    left_ear="Andoaa Earring",
    right_ear="Loquac. Earring",
    left_ring="Acumen Ring",
    right_ring="Strendu Ring",
    back="Swith Cape",
}

	sets.precast.FC.ElementalMagic = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris",Back="Pahtli Cape"})

	sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.Impact = set_combine(sets.precast.FC.ElementalMagic, {head=empty,body="Twilight Cloak"})

	sets.midcast['Flurry II'] = {
    main={ name="Lehbrailg +1", augments={'DMG:+18','CHR+1','"Fast Cast"+4',}},
    sub="Vivid Strap",
    ammo="Hasty Pinion",
    head="Nahtirah Hat",
    body="Hedera Cotehardie",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" potency +4%',}},
    legs="Artsieq Hose",
    feet="Umbani Boots",
    neck="Dualism Collar",
    waist="Witful Belt",
    left_ear="Gwati Earring",
    right_ear="Gifted Earring",
    left_ring="Sangoma Ring",
    right_ring="Prolix Ring",
    back="Swith Cape",
}	
	
	sets.midcast['Refresh II'] = {
    main={ name="Lehbrailg +1", augments={'DMG:+18','CHR+1','"Fast Cast"+4',}},
    sub="Vivid Strap",
    ammo="Hasty Pinion",
    head="Nahtirah Hat",
    body="Hedera Cotehardie",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" potency +4%',}},
    legs="Artsieq Hose",
    feet="Estoqueur's Houseaux +2",
    neck="Dualism Collar",
    waist="Witful Belt",
    left_ear="Gwati Earring",
    right_ear="Gifted Earring",
    left_ring="Sangoma Ring",
    right_ring="Prolix Ring",
    back="Swith Cape",
}	
	-- Midcast Sets
	sets.midcast['Haste II'] = {
    main={ name="Lehbrailg +1", augments={'DMG:+18','CHR+1','"Fast Cast"+4',}},
    sub="Vivid Strap",
    ammo="Hasty Pinion",
    head="Nahtirah Hat",
    body="Hedera Cotehardie",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" potency +4%',}},
    legs="Artsieq Hose",
    feet="Estoqueur's Houseaux +2",
    neck="Dualism Collar",
    waist="Witful Belt",
    left_ear="Gwati Earring",
    right_ear="Gifted Earring",
    left_ring="Sangoma Ring",
    right_ring="Prolix Ring",
    back="Swith Cape",
}
	
	sets.midcast.FastRecast = {
    main={ name="Lehbrailg +1", augments={'DMG:+18','CHR+1','"Fast Cast"+4',}},
    sub="Vivid Strap",
    ammo="Hasty Pinion",
    head="Nahtirah Hat",
    body="Hedera Cotehardie",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" potency +4%',}},
    legs="Artsieq Hose",
    feet="Estoqueur's Houseaux +2",
    neck="Dualism Collar",
    waist="Witful Belt",
    left_ear="Gwati Earring",
    right_ear="Gifted Earring",
    left_ring="Sangoma Ring",
    right_ring="Prolix Ring",
    back="Swith Cape",
}

	sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",ammo="Kalboron Stone",
		head="Gendewitha Caubeen +1",neck="Phrenic Torque",ear1="Gifted Earring",ear2="Novia Earring",
		body="Gendewitha Bilaut +1",hands="Gendewitha Gages +1",ring1="Sangoma Ring",ring2="Prolix Ring",
		back="Errant Cape",waist="Penitent's rope",legs="Praeco Slacks",feet="Pedagogy Loafers"}

	sets.midcast.CureWithLightWeather = {main="Chatoyant Staff",sub="Dominie's Grip",ammo="Clarus Stone",
		head="Gendewitha Caubeen +1",neck="Phrenic Torque",ear1="Gwati Earring",ear2="Novia Earring",
		body="Gendewitha Bilaut +1",hands="Bokwus Gloves",ring1="Sangoma Ring",ring2="Prolix Ring",
		back="Twilight Cape",waist="Penitent's rope",legs="Nares Trews",feet="Gendewitha Galoshes +1"}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Regen = {head="Savant's Bonnet +2"}

	sets.midcast.Cursna = {
		neck="Malison Medallion",
		hands="Hieros Mittens",ring1="Ephedra Ring",
		feet="Gendewitha Galoshes"}

	sets.midcast['Enhancing Magic'] = {
    main={ name="Lehbrailg +1", augments={'DMG:+18','CHR+1','"Fast Cast"+4',}},
    sub="Fulcio Grip",
    ammo="Hasty Pinion",
    head="Umuthi Hat",
    body="Anhur Robe",
    hands="Ayao's Gages",
    legs="Artsieq Hose",
    feet="Estoqueur's Houseaux +2",
    neck="Enhancing Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Gifted Earring",
    left_ring="Sangoma Ring",
    right_ring="Prolix Ring",
    back="Merciful Cape",
}
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

	sets.midcast.Haste = {
    main={ name="Lehbrailg +1", augments={'DMG:+18','CHR+1','"Fast Cast"+4',}},
    sub="Vivid Strap",
    ammo="Hasty Pinion",
    head="Nahtirah Hat",
    body="Hedera Cotehardie",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" potency +4%',}},
    legs="Artsieq Hose",
    feet="Chelona Boots",
    neck="Dualism Collar",
    waist="Witful Belt",
    left_ear="Gwati Earring",
    right_ear="Gifted Earring",
    left_ring="Sangoma Ring",
    right_ring="Prolix Ring",
    back="Merciful Cape",
}
	
	sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers"})

	sets.midcast.Protect = {ring1="Sheltered Ring"}
	sets.midcast.Protectra = sets.midcast.Protect

	sets.midcast.Shell = {ring1="Sheltered Ring"}
	sets.midcast.Shellra = sets.midcast.Shell


	-- Custom spell classes
	sets.midcast['Enfeebling Magic'] = {
    main={ name="Lehbrailg +2", augments={'DMG:+16','Magic crit. hit rate +3','Mag. Acc.+30',}},
    sub="Mephitis Grip",
    ammo="Kalboron Stone",
    head="Vitivation Chapeau +1",
    body={ name="Artsieq Jubbah", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    hands={ name="Artsieq Cuffs", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    legs={ name="Artsieq Hose", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    feet={ name="Artsieq Boots", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    neck="Weike Torque",
    waist="Ovate Rope",
    left_ear="Psystorm Earring",
    right_ear="Lifestorm Earring",
    left_ring="Sangoma Ring",
    right_ring="Perception Ring",
    back="Refraction Cape",
}

	sets.midcast.IntEnfeebles ={
    main={ name="Lehbrailg +2", augments={'DMG:+16','Magic crit. hit rate +3','Mag. Acc.+30',}},
    sub="Mephitis Grip",
    ammo="Kalboron Stone",
    head="Vitivation Chapeau +1",
    body={ name="Artsieq Jubbah", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    hands={ name="Artsieq Cuffs", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    legs={ name="Artsieq Hose", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    feet={ name="Artsieq Boots", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    neck="Weike Torque",
    waist="Ovate Rope",
    left_ear="Psystorm Earring",
    right_ear="Lifestorm Earring",
    left_ring="Sangoma Ring",
    right_ring="Perception Ring",
    back="Refraction Cape",
}
		
	sets.midcast.ElementalEnfeeble ={
    main={ name="Lehbrailg +2", augments={'DMG:+16','Magic crit. hit rate +3','Mag. Acc.+30',}},
    sub="Mephitis Grip",
    ammo="Kalboron Stone",
    head={ name="Hagondes Hat +1", augments={'Phys. dmg. taken -2%','Mag. Acc.+18',}},
    body={ name="Artsieq Jubbah", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    hands={ name="Artsieq Cuffs", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    legs={ name="Artsieq Hose", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    feet={ name="Artsieq Boots", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    neck="Weike Torque",
    waist="Ovate Rope",
    left_ear="Psystorm Earring",
    right_ear="Lifestorm Earring",
    left_ring="Sangoma Ring",
    right_ring="Perception Ring",
    back="Refraction Cape",
}

	sets.midcast.DarkMagic = {
    main={ name="Lehbrailg +2", augments={'DMG:+16','Magic crit. hit rate +3','Mag. Acc.+30',}},
    sub="Mephitis Grip",
    ammo="Kalboron Stone",
    head={ name="Hagondes Hat +1", augments={'Phys. dmg. taken -2%','Mag. Acc.+18',}},
    body={ name="Artsieq Jubbah", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    hands={ name="Artsieq Cuffs", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    legs={ name="Artsieq Hose", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    feet={ name="Artsieq Boots", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    neck="Weike Torque",
    waist="Ovate Rope",
    left_ear="Psystorm Earring",
    right_ear="Lifestorm Earring",
    left_ring="Sangoma Ring",
    right_ring="Perception Ring",
    back="Refraction Cape",
}

	sets.midcast.Kaustra = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Dosis Tathlum",
		head="Nahtirah Hat",neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Hagondes Coat +1",hands="Hagondes Cuffs +1",ring1="Sangoma Ring",ring2="Strendu Ring",
		back="Toro Cape",waist="Fucho-no-Obi",legs="Hagondes Pants +1",feet="Gendewitha Galoshes +1"}
		
	sets.midcast.Drain ={
    main={ name="Lehbrailg +2", augments={'DMG:+17','"Conserve MP"+1','"Mag.Atk.Bns."+20',}},
    sub="Mephitis Grip",
    ammo="Dosis Tathlum",
    head={ name="Hagondes Hat +1", augments={'Phys. dmg. taken -2%','Mag. Acc.+18',}},
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    hands="Otomi Gloves",
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    feet={ name="Hag. Sabots +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+12',}},
    neck="Eddy Necklace",
    waist="Aswang Sash",
    left_ear="Strophadic Earring",
    right_ear="Novio Earring",
    left_ring="Acumen Ring",
    right_ring="Strendu Ring",
    back="Toro Cape",
}
	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = {main="Lehbrailg +2",sub="Arbuda Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Dark Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Hedera Cotehardie",hands="Gendewitha Gages +1",ring1="Prolix Ring",ring2="Sangoma Ring",
		back="Swith Cape",waist="Witful Belt",legs="Artsieq Hose",feet="Pedagogy Loafers"}

	sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Atinian Staff"})


	-- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast['Elemental Magic'] ={
    main={ name="Lehbrailg +2", augments={'DMG:+17','"Conserve MP"+1','"Mag.Atk.Bns."+20',}},
    sub="Mephitis Grip",
    ammo="Dosis Tathlum",
    head="Hagondes Hat +1",
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    hands="Otomi Gloves",
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    feet={ name="Hag. Sabots +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+12',}},
    neck="Eddy Necklace",
    waist="Aswang Sash",
    left_ear="Strophadic Earring",
    right_ear="Novio Earring",
    left_ring="Acumen Ring",
    right_ring="Strendu Ring",
    back="Toro Cape",
}

	sets.midcast['Elemental Magic'].Resistant ={
    main={ name="Lehbrailg +2", augments={'DMG:+17','"Conserve MP"+1','"Mag.Atk.Bns."+20',}},
    sub="Mephitis Grip",
    ammo="Dosis Tathlum",
    head={ name="Hagondes Hat +1", augments={'Phys. dmg. taken -2%','Mag. Acc.+18',}},
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    hands="Otomi Gloves",
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    feet={ name="Hag. Sabots +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+12',}},
    neck="Eddy Necklace",
    waist="Aswang Sash",
    left_ear="Strophadic Earring",
    right_ear="Novio Earring",
    left_ring="Acumen Ring",
    right_ring="Strendu Ring",
    back="Toro Cape",
}


	-- Custom classes for high-tier nukes.
	sets.midcast.HighTierNuke = {
    main={ name="Lehbrailg +2", augments={'DMG:+17','"Conserve MP"+1','"Mag.Atk.Bns."+20',}},
    sub="Mephitis Grip",
    ammo="Dosis Tathlum",
    head="Hagondes Hat +1",
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    hands="Hagondes Cuffs +1",
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    feet={ name="Hag. Sabots +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+12',}},
    neck="Eddy Necklace",
    waist="Aswang Sash",
    left_ear="Strophadic Earring",
    right_ear="Novio Earring",
    left_ring="Acumen Ring",
    right_ring="Strendu Ring",
    back="Toro Cape",
}


	sets.midcast.HighTierNuke.Resistant = {
    main={ name="Lehbrailg +2", augments={'DMG:+17','"Conserve MP"+1','"Mag.Atk.Bns."+20',}},
    sub="Mephitis Grip",
    ammo="Dosis Tathlum",
    head="Hagondes Hat +1",
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    hands="Hagondes Cuffs +1",
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    feet={ name="Hag. Sabots +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+12',}},
    neck="Eddy Necklace",
    waist="Aswang Sash",
    left_ear="Strophadic Earring",
    right_ear="Novio Earring",
    left_ring="Acumen Ring",
    right_ring="Strendu Ring",
    back="Toro Cape",
}
	
	-- Sets for helixes
	sets.midcast.Helix =  {
    main={ name="Lehbrailg +2", augments={'DMG:+17','"Conserve MP"+1','"Mag.Atk.Bns."+20',}},
    sub="Mephitis Grip",
    ammo="Dosis Tathlum",
    head="Hagondes Hat",
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    hands="Hagondes Cuffs +1",
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    feet={ name="Hag. Sabots +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+12',}},
    neck="Eddy Necklace",
    waist="Olympus Sash",
    left_ear="Strophadic Earring",
    right_ear="Novio Earring",
    left_ring="Acumen Ring",
    right_ring="Irrwisch Ring",
    back="Toro Cape",
}


	sets.midcast.Helix.Resistant =  {
    main={ name="Lehbrailg +2", augments={'DMG:+17','"Conserve MP"+1','"Mag.Atk.Bns."+20',}},
    sub="Mephitis Grip",
    ammo="Dosis Tathlum",
    head={ name="Hagondes Hat +1", augments={'Phys. dmg. taken -2%','Mag. Acc.+18',}},
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    hands="Hagondes Cuffs +1",
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    feet={ name="Hag. Sabots +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+12',}},
    neck="Eddy Necklace",
    waist="Olympus Sash",
    left_ear="Strophadic Earring",
    right_ear="Novio Earring",
    left_ring="Acumen Ring",
    right_ring="Irrwisch Ring",
    back="Toro Cape",
}

	sets.midcast.Impact = {main="Atinian Staff",sub="Mephitis Grip",ammo="Dosis Tathlum",
		head=empty,neck="Stoicheion Medal",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Twilight Cloak",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Strendu Ring",
		back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Bokwus Boots"}


	-- Sets to return to when not performing an action.

---F9 is MELEE set TOGGLE (dont really use)
---f10 is PDT set TOGGLE (hit once to activate)
---F11 is MDT set TOGGLE (hit once to activate)
---F12 is CHECK sets (click to see what sets are up)
---ALT + F12 is REMOVE PDT OR MDT SETS 
	
	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Mephitis Grip",
		head="Nefer Khat +1",neck="Wiglen Gorget",
		body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		waist="Austerity Belt",legs="Nares Tres",feet="Serpentes Sabots"}
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle.Town = {
    main="Bolelabunga",
    sub={ name="Genbu's Shield", augments={'"Cure" potency +3%','"Cure" spellcasting time -5%',}},
    ammo="Brigantia Pebble",
    head="Vitivation Chapeau +1",
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" potency +4%',}},
    legs="Nares Trews",
    feet={ name="Gende. Galosh. +1", augments={'Phys. dmg. taken -3%','"Cure" spellcasting time -3%',}},
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Flashward Earring",
    right_ear="Spellbr. Earring",
    left_ring={ name="Dark Ring", augments={'Enemy crit. hit rate -2','Magic dmg. taken -4%','Phys. dmg. taken -4%',}},
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -3%',}},
    back={ name="Umbra Cape", augments={'STR+2 DEX-1 VIT-1',}},
}
	
	sets.idle.Field = {
    main="Bolelabunga",
    sub={ name="Genbu's Shield", augments={'"Cure" potency +3%','"Cure" spellcasting time -5%',}},
    ammo="Brigantia Pebble",
    head="Vitivation Chapeau +1",
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" potency +4%',}},
    legs="Nares Trews",
    feet={ name="Gende. Galosh. +1", augments={'Phys. dmg. taken -3%','"Cure" spellcasting time -3%',}},
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Flashward Earring",
    right_ear="Spellbr. Earring",
    left_ring={ name="Dark Ring", augments={'Enemy crit. hit rate -2','Magic dmg. taken -4%','Phys. dmg. taken -4%',}},
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -3%',}},
    back={ name="Umbra Cape", augments={'STR+2 DEX-1 VIT-1',}},
}

	sets.idle.Field.PDT = 
{
    main={ name="Terra's Staff", augments={'Lightning resistance+15',}},
    sub="Volos Strap",
    ammo="Brigantia Pebble",
    head={ name="Gende. Caubeen +1", augments={'Phys. dmg. taken -3%','"Cure" potency +4%',}},
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" potency +4%',}},
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -4%','Song spellcasting time -3%',}},
    feet={ name="Gende. Galosh. +1", augments={'Phys. dmg. taken -3%','"Cure" spellcasting time -3%',}},
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Flashward Earring",
    right_ear="Impreg. Earring",
    left_ring={ name="Dark Ring", augments={'Enemy crit. hit rate -2','Magic dmg. taken -4%','Phys. dmg. taken -4%',}},
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -3%',}},
    back="Shadow Mantle",
}

	sets.idle.Field.Stun = {main="Bolelabunga",sub="Genbu's Shield",ammo="Brigantia Pebble",
		head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Flashward Earring",ear2="Spellbreaker Earring",
		body="Hagondes Coat +1",hands="Gendewitha Gages +1",ring1="Dark Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-Obi",legs="Hagondes Pants +1",feet="Gendewitha Galoshes +1"}


	sets.idle.Weak = {main="Terra's Staff",sub="Arbuda Grip",ammo="Brigantia Pebble",
		head="Nahtirah Hat",neck="Twilight Torque",ear1="Merman's Earring",ear2="Dawn Earring",
		body="Hagondes Coat +1",hands="Gendewitha Gages +1",ring1="Dark Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-Obi",legs="Gendewitha Spats +1",feet="Gendewitha Galoshes +1"}
	
	-- Defense sets

	sets.defense.PDT = {
    main={ name="Terra's Staff", augments={'Lightning resistance+15',}},
    sub="Volos Strap",
    ammo="Brigantia Pebble",
    head={ name="Gende. Caubeen +1", augments={'Phys. dmg. taken -3%','"Cure" potency +4%',}},
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+18',}},
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" potency +4%',}},
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -4%','Song spellcasting time -3%',}},
    feet={ name="Gende. Galosh. +1", augments={'Phys. dmg. taken -3%','"Cure" spellcasting time -3%',}},
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Flashward Earring",
    right_ear="Impreg. Earring",
    left_ring={ name="Dark Ring", augments={'Enemy crit. hit rate -2','Magic dmg. taken -4%','Phys. dmg. taken -4%',}},
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -3%',}},
    back="Shadow Mantle",
}

	sets.defense.MDT = {main="Terra's Staff",sub="Volos Strap",ammo="Brigantia Pebble",
		head="Nahtirah Hat",neck="Twilight Torque",ear1="Gwati Earring",ear2="Dawn Earring",
		body="Hagondes Coat +1",hands="Gendewitha Gages +1",ring1="Sangoma Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-Obi",legs="Nares Trews",feet="Gendewitha Galoshes +1"}	


---F9 is MELEE set TOGGLE (dont really use)
---f10 is PDT set TOGGLE (hit once to activate)
---F11 is MDT set TOGGLE (hit once to activate)
---F12 is CHECK sets (click to see what sets are up)
---ALT + F12 is REMOVE PDT OR MDT SETS 


	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Ebullience'] = {head="Savant's Bonnet +2"}
	sets.buff['Rapture'] = {head="Savant's Bonnet +2"}
	sets.buff['Perpetuance'] = {hands="Savant's Bracers +2"}
	sets.buff['Immanence'] = {hands="Savant's Bracers +2"}
	sets.buff['Penury'] = {legs="Savant's Pants +2"}
	sets.buff['Parsimony'] = {legs="Savant's Pants +2"}
	sets.buff['Celerity'] = {feet="Pedagogy Loafers"}
	sets.buff['Alacrity'] = {feet="Pedagogy Loafers"}

	sets.buff['Klimaform'] = {feet="Savant's Loafers +2"}


	--sets.buff['Sandstorm'] = {feet="Desert Boots"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spellMap == 'Cure' or spellMap == 'Curaga' then
		if world.weather_element == 'Light' then
			classes.CustomClass = 'CureWithLightWeather'
		end
	end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		equip(sets.midcast.FastRecast)
	end
end

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	if not spell.interrupted then
		if state.Buff[spell.english] ~= nil then
			state.Buff[spell.english] = true
		end
	end
end


-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
	if state.Buff.Sublimation then
		if state.IdleMode == 'Normal' then
			idleSet = set_combine(idleSet, sets.buff.FullSublimation)
		elseif state.IdleMode == 'PDT' then
			idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
		end
	end
	
	return idleSet
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if buff == "Sublimation: Activated" then
		state.Buff.Sublimation = gain
		handle_equipping_gear(player.status)
	elseif state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
	end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
	if cmdParams[1]:lower() == 'scholar' then
		handle_strategems(cmdParams)
		eventArgs.handled = true
	end
end


-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
	if cmdParams[1] == 'user' and not (buffactive['light arts']      or buffactive['dark arts'] or
					   buffactive['addendum: white'] or buffactive['addendum: black']) then
		if state.IdleMode == 'Stun' then
			send_command('@input /ja "Dark Arts" <me>')
		else
			send_command('@input /ja "Light Arts" <me>')
		end
	end
	
	update_active_strategems()
end


-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	local defenseString = ''
	if state.Defense.Active then
		local defMode = state.Defense.PhysicalMode
		if state.Defense.Type == 'Magical' then
			defMode = state.Defense.MagicalMode
		end

		defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
	end
	
	local meleeString = ''
	if state.OffenseMode == 'Normal' then
		meleeString = 'Melee: Weapons locked, '
	end

	add_to_chat(122,'Casting ['..state.CastingMode..'], '..meleeString..'Idle ['..state.IdleMode..'], '..defenseString..
		'Kiting: '..on_off_names[state.Kiting])

	eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
	state.Buff['Ebullience'] = buffactive['Ebullience'] or false
	state.Buff['Rapture'] = buffactive['Rapture'] or false
	state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
	state.Buff['Immanence'] = buffactive['Immanence'] or false
	state.Buff['Penury'] = buffactive['Penury'] or false
	state.Buff['Parsimony'] = buffactive['Parsimony'] or false
	state.Buff['Celerity'] = buffactive['Celerity'] or false
	state.Buff['Alacrity'] = buffactive['Alacrity'] or false

	state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end


-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
	if state.Buff.Perpetuance and spell.skill == 'Enhancing Magic' then
		equip(sets.buff['Perpetuance'])
	end
	if state.Buff.Rapture and spellMap == 'Cure' or spellMap == 'Curaga' then
		equip(sets.buff['Rapture'])
	end
	if spell.skill == 'ElementalMagic' and spellMap ~= 'ElementalEnfeeble' then
		if state.Buff.Ebullience and spell.english ~= 'Impact' then
			equip(sets.buff['Ebullience'])
		end
		if state.Buff.Immanence then
			equip(sets.buff['Immanence'])
		end
		if state.Buff.Klimaform and spell.element == world.weather_element then
			equip(sets.buff['Klimaform'])
		end
	end
	
	if state.Buff.Penury then equip(sets.buff['Penury']) end
	if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
	if state.Buff.Celerity then equip(sets.buff['Celerity']) end
	if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end


-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
	-- cmdParams[1] == 'scholar'
	-- cmdParams[2] == strategem to use
	
	if not cmdParams[2] then
		add_to_chat(123,'Error: No strategem command given.')
		return
	end
	local strategem = cmdParams[2]:lower()
	
	if buffactive['light arts'] or buffactive['addendum: white'] then
		if strategem == 'cost' then
			send_command('@input /ja Penury <me>')
		elseif strategem == 'speed' then
			send_command('@input /ja Celerity <me>')
		elseif strategem == 'aoe' then
			send_command('@input /ja Accession <me>')
		elseif strategem == 'power' then
			send_command('@input /ja Rapture <me>')
		elseif strategem == 'duration' then
			send_command('@input /ja Perpetuance <me>')
		elseif strategem == 'accuracy' then
			send_command('@input /ja Altruism <me>')
		elseif strategem == 'enmity' then
			send_command('@input /ja Tranquility <me>')
		elseif strategem == 'skillchain' then
			add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
		elseif strategem == 'addendum' then
			send_command('@input /ja "Addendum: White" <me>')
		else
			add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
		end
	elseif buffactive['dark arts']  or buffactive['addendum: black'] then
		if strategem == 'cost' then
			send_command('@input /ja Parsimony <me>')
		elseif strategem == 'speed' then
			send_command('@input /ja Alacrity <me>')
		elseif strategem == 'aoe' then
			send_command('@input /ja Manifestation <me>')
		elseif strategem == 'power' then
			send_command('@input /ja Ebullience <me>')
		elseif strategem == 'duration' then
			add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
		elseif strategem == 'accuracy' then
			send_command('@input /ja Focalization <me>')
		elseif strategem == 'enmity' then
			send_command('@input /ja Equanimity <me>')
		elseif strategem == 'skillchain' then
			send_command('@input /ja Immanence <me>')
		elseif strategem == 'addendum' then
			send_command('@input /ja "Addendum: Black" <me>')
		else
			add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
		end
	else
		add_to_chat(123,'No arts has been activated yet.')
	end
end


-- Gets the current number of available strategems based on the recast remaining
-- and the level of the sch.
function get_current_strategem_count()
	-- returns recast in seconds.
	local allRecasts = windower.ffxi.get_ability_recasts()
	local stratsRecast = allRecasts[231]
	
	local maxStrategems
	
	if player.main_job_level >= 90 then
		maxStrategems = 5
	elseif player.main_job_level >= 70 then
		maxStrategems = 4
	elseif player.main_job_level >= 50 then
		maxStrategems = 3
	elseif player.main_job_level >= 30 then
		maxStrategems = 2
	elseif player.main_job_level >= 10 then
		maxStrategems = 1
	else
		maxStrategems = 0
	end
	
	local fullRechargeTime = 4*60
	
	local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
	
	return currentCharges
end


