AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

surface.CreateFont("HUDFont", {
	font = "DermaDefault",
	outline = true,
	size = 40
})

surface.CreateFont("BIGAMMO", {
	font = "DermaDefault",
	outline = true,
	size = 50
})

local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudAmmo"] = true
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then
		return false
	end
end )

hook.Add("HUDPaint", "HUDHOOK", function()

    draw.RoundedBox(0, 0, surface.ScreenHeight() / 1500, surface.ScreenWidth(), 40, Color(25, 25, 25, 135))   
    draw.RoundedBox(30, 0 - 10, surface.ScreenHeight() / 1500, 1950 *(LocalPlayer():GetNWInt("PlayerEXP") / LocalPlayer():GetNWInt("MaxPlayerEXP")), 40, Color(52, 180, 235, 200))

    draw.DrawText("Level: " .. LocalPlayer():GetNWInt("PlayerLVL"), "DermaDefaultBold", surface.ScreenWidth() / 2.3, surface.ScreenHeight() / 80, Color(255,255,255,255), TEXT_ALIGN_LEFT)
    draw.DrawText("EXP: " .. LocalPlayer():GetNWInt("PlayerEXP"), "DermaDefaultBold", surface.ScreenWidth() / 1.9, surface.ScreenHeight() / 80, Color(255,255,255,255), TEXT_ALIGN_LEFT)

	-- XP Bar

	if (IsValid(LocalPlayer())) then

		if (LocalPlayer():Alive()) then

			draw.DrawText("HP: " .. LocalPlayer():Health(), "HUDFont", 10, surface.ScreenHeight() / 1.25, Color(255,255,255,255), TEXT_ALIGN_LEFT)
			draw.DrawText("ARMOR: " .. LocalPlayer():Armor(), "HUDFont", 10, surface.ScreenHeight() / 1.18, Color(255,255,255,255), TEXT_ALIGN_LEFT)
			draw.DrawText("BARRICADES: " .. LocalPlayer():Armor(), "HUDFont", 10, surface.ScreenHeight() / 1.115, Color(255,255,255,255), TEXT_ALIGN_LEFT)	

			if (IsValid(LocalPlayer():GetActiveWeapon())) then

				if (LocalPlayer():GetActiveWeapon():Clip1() > -1) then

					draw.DrawText( LocalPlayer():GetActiveWeapon():Clip1() .. " / " .. LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()), "BIGAMMO", surface.ScreenWidth() - 235, surface.ScreenHeight() / 1.2, Color(255,255,255,255), TEXT_ALIGN_LEFT)

					draw.DrawText( LocalPlayer():GetActiveWeapon():GetPrintName(), "HUDFont", surface.ScreenWidth() - 235, surface.ScreenHeight() / 1.12, Color(255,255,255,255), TEXT_ALIGN_LEFT)

				end

			end

		end

	end
	-- Main Display
end)