AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local coolDown = {  }

function ENT:Initialize()

    self:SetModel("models/Items/BoxMRounds.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    phys:Wake()

end

function ENT:Use(activator, caller)

    if IsValid(caller) and caller:IsPlayer() and coolDown[caller] == nil or coolDown[caller] + 1 < CurTime() then
        
        local wep = caller:GetActiveWeapon():GetPrimaryAmmoType()

        if wep and wep != -1 then
            
            if (caller:GetAmmoCount(wep) < 450) then

                local ammo = game.GetAmmoName(wep)
                local amount = math.Clamp(caller:GetActiveWeapon():GetMaxClip1() * 5, 1, 80)

                caller:GiveAmmo(amount, ammo)
                
                caller:SetNWInt("KitUses", caller:GetNWInt("KitUses") + 1)

                if (caller:GetNWInt("KitUses") > 8) then

                    self:Remove()
                    caller:SetNWInt("KitUses", 0)
                    
                end

                coolDown[caller] = CurTime()
                
            else

                caller:ChatPrint("Ammo Full")
                coolDown[caller] = CurTime()

            end


		else
			caller:ChatPrint("Equip a Weapon to Refill")
			coolDown[caller] = CurTime()
        end
        
    end
    
end