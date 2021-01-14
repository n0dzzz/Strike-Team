include("shared.lua")

local function Draw3DText( pos, ang, scale, text, flipView )
	if ( flipView ) then
		-- Flip the angle 180 degrees around the UP axis
		ang:RotateAroundAxis( Vector( 0, 0, 1 ), 180 )
	end

    cam.Start3D2D( pos, ang, scale )
    
        draw.DrawText( text, "HUDNumber5", 0, 0, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
        
    cam.End3D2D()
    
end

function ENT:Draw()

	-- Draw the model
	self:DrawModel()

	local text = "Ammo Kit" 

	local mins, maxs = self:GetModelBounds()
	local pos = self:GetPos() + Vector( 0, 0, maxs.z + 15 )

	local ang = Angle( 0, SysTime() * 100 % 360, 90 )

	Draw3DText( pos, ang, 0.2, text, false )
    Draw3DText( pos, ang, 0.2, text, true )
end
