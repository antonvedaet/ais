% ONE ARGUMENT
tank(valentine_I).
tank(valentine_XI).
tank(valentine_IX).
tank(cromwell_V).
tank(cromwell_I).
tank(crusader_II).
tank(crusader_III).
tank(churchill_I).
tank(churchill_III).
tank(churchill_VII).
tank(staghound).
tank(crusader_aa).
tank(aec_aa).
tank(ystervark).
tank(bosvark).
tank(archer).
tank(achilles).
tank(tortoise).
tank(conway).

% TWO ARGUMENTS
category(light_tank, valentine_I).
category(light_tank, valentine_XI).
category(light_tank, valentine_IX).
category(medium_tank, cromwell_V).
category(medium_tank, cromwell_I).
category(light_tank, crusader_II).
category(light_tank, crusader_III).
category(heavy_tank, churchill_I).
category(heavy_tank, churchill_III).
category(heavy_tank, churchill_VII).
category(anti_air, staghound).
category(anti_air, crusader_aa).
category(anti_air, aec_aa).
category(anti_air, ystervark).
category(anti_air, bosvark).
category(anti_tank, archer).
category(anti_tank, achilles).
category(anti_tank, tortoise).
category(anti_tank, conway).
category(anti_tank, avenger).



% light_tank, it is likely designed for speed and reconnaissance.
designed_for_recon(Tank) :- category(light_tank, Tank).

% heavy_tank, it is likely heavily armored and designed for frontline combat.
designed_for_assault(Tank) :- category(heavy_tank, Tank).

% anti_air, it is designed to engage aerial targets.
engages_aircraft(Tank) :- category(anti_air, Tank).

% anti_tank, it is designed to destroy enemy tanks.
engages_tanks(Tank) :- category(anti_tank, Tank).

% medium_tank, it balances between firepower, armor, and mobility.
balanced_design(Tank) :- category(medium_tank, Tank).