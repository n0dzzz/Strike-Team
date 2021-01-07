
AddCSLuaFile( "cl_hud.lua" )
AddCSLuaFile( "sv_level.lua" )
AddCSLuaFile( "sv_team.lua" )
AddCSLuaFile( "cl_team.lua" )
AddCSLuaFile( "sh_team.lua" )

include( "shared.lua" )
include( "cl_hud.lua" )
include( "sv_level.lua" )
--include( "sv_team.lua" )
--include( "cl_team.lua" )
--include( "sh_team.lua" )

-------------------------- To-Do

    -- Teams { OPERATORS, TERRORISTS/CRIMINALS }

    -- Team based default loadouts

    -- HUD

    -- Rounds

    -- Barricade Entities

-------------------------- Setup

print("Strike Team Game Started on " .. util.DateStamp())

timer.Create("Annoucments", 200, 1, function()

    print( "Wessslcome to Strike Team still in Development" )
    print( "More on the Website: striketeam.github.io" )

end) 

------------------------- Start Funcs 