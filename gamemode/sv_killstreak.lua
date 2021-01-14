include( "shared.lua" )

hook.Add("PlayerDeath", "KillStreakKill", function(victim, inflictor, attacker)

    if (attacker:IsValid()) then

        if (IsValid(attacker:GetActiveWeapon()) && attacker:GetActiveWeapon():GetPrintName() != "Milkor Mk1" && attacker:GetActiveWeapon():GetPrintName() != "Nitro Glycerine") then

            attacker:SetNWInt("KillStreak", attacker:GetNWInt("KillStreak") + 1)

        end
        
        victim:SetNWInt("KillStreak", 0)
        print(attacker:GetNWInt("KillStreak"))

        -- Killstreaks below you could easily edit these yourself  just look at the documentation

        if (attacker:GetNWInt("KillStreak") == 5) then -- Ammo Kit



        end

        if (attacker:GetNWInt("KillStreak") == 8) then -- Nitro Grenade

            attacker:Give("m9k_nitro")

        end

        if (attacker:GetNWInt("KillStreak") == 10) then -- Grende Launcher

            duration = 120

            attacker:Give("m9k_milkormgl")
            attacker:SetNWInt("KillStreak", 0)

        end

    end

end)