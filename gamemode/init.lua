AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

AddCSLuaFile( "cl_hud.lua" )
AddCSLuaFile( "sv_level.lua" )
AddCSLuaFile( "config/custom_classes.lua" )
AddCSLuaFile( "place_entities.lua" )
AddCSLuaFile( "sv_killstreak.lua" )
AddCSLuaFile( "cl_killstreak.lua" )

include( "shared.lua" )
include( "sv_level.lua" )
include( "config/custom_classes.lua" )
include( "place_entities.lua" )
include( "sv_killstreak.lua" )
include( "cl_killstreak.lua" )

local coolDown = {}

hook.Add("PlayerSetModel", "PlayerModel", function(ply) 

    local PlayerTeam = TEAMS[ply:GetNWInt("PlayerTeam")]

    ply:SetModel(PlayerTeam.models)

end)

hook.Add("PlayerSpawn", "SpawnStartup", function(ply)
    
    ply:SetNWInt("PlayerTeam", 1)

    ply:SetGravity(1)
    ply:SetWalkSpeed(250)

    local PlayerTeam = TEAMS[ply:GetNWInt("PlayerTeam")]

    for k, v in pairs(PlayerTeam.weapons) do

        -- Loop through every weapon a class has

        ply:Give(v)


    end

end)

hook.Add("PlayerDeath", "OnDeath", function(victim, inflictor, attacker)
    
   

end)