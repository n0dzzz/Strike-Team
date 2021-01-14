AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )

include( "shared.lua" )

hook.Add("PlayerInitialSpawn", "InitSpawn", function(ply)

    if (ply:GetPData("PlayerLVL") == nil) then
		ply:SetNWInt("PlayerLVL", 1)
	else
		ply:SetNWInt("PlayerLVL", tonumber(ply:GetPData("PlayerLVL")))
	end
	
	if (ply:GetPData("PlayerEXP") == nil) then
		ply:SetNWInt("PlayerEXP", 0)
	else
		ply:SetNWInt("PlayerEXP", tonumber(ply:GetPData("PlayerEXP")))
    end
    
end)

hook.Add("PlayerSpawn", "InitSpawn", function(ply)

    CheckLevel(ply)

    if (ply:GetNWInt("PlayerLVL") <= 0) then
       ply:SetNWInt("PlayerLVL", 1)
    end

end)

hook.Add("OnNPCKilled", "NPCKill", function(npc, attacker, inflictor)

    attacker:SetNWInt("PlayerEXP", attacker:GetNWInt("PlayerEXP") + 500)

    CheckLevel(attacker)

end)

hook.Add("PlayerDeath", "PlayerKill", function(victim, inflictor, attacker)

    if (victim != attacker) then

        attacker:SetNWInt("PlayerEXP", attacker:GetNWInt("PlayerEXP") + 500)
    
        CheckLevel(attacker)
        
    end

end)

hook.Add("PlayerDisconnected", "PlayerDC", function(ply)
    
    ply:SetPData("PlayerLVL", ply:GetNWInt("PlayerLVL"))
	ply:SetPData("PlayerEXP", ply:GetNWInt("PlayerEXP"))

end)

hook.Add("ShutDown", "ServerShutDown", function()

    for k, v in pairs(player.GetAll()) do
		v:SetPData("PlayerLVL", v:GetNWInt("PlayerLVL"))
		v:SetPData("PlayerEXP", v:GetNWInt("PlayerEXP"))
	end

end)

function CheckLevel(ply)

    ply:SetNWInt("MaxPlayerEXP", 2500 * ply:GetNWInt("PlayerLVL") )

    if (ply:GetNWInt("PlayerEXP") >= ply:GetNWInt("MaxPlayerEXP")) then
        ply:SetNWInt("PlayerLVL", ply:GetNWInt("PlayerLVL") + 1)
        ply:SetNWInt("PlayerEXP", ply:GetNWInt("PlayerEXP") - ply:GetNWInt("MaxPlayerEXP"))
        sound.Play("garrysmod/save_load1.wav", ply:GetPos(), 75, 100, 50) -- LEVEL UP SOUND, NOTE: Not very good sound
    end

end