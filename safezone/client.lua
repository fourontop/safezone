-- Define your circular zone
local zone = {
    center = Config.Location,  -- Center of the circle (x, y, z)
    radius = Config.Radius  -- Radius of the circle
}

-- Function to check if player is inside the circular zone
local function isPlayerInZone(playerCoords)
    local distance = #(playerCoords - zone.center)
    return distance <= zone.radius
end

-- Disable firing and specific control if the player is in the zone and draw the zone marker
CreateThread(function()
    while true do
        Wait(0)  -- Check every frame

        local playerPed = PlayerPedId()  -- Get player Ped
        local playerCoords = GetEntityCoords(playerPed)  -- Get player coordinates

        -- Draw a marker at the center of the zone
        if Config.Debug then
            DrawMarker(
                1,                            -- Marker type (Cylinder)
                zone.center.x, zone.center.y, zone.center.z - 1.0,  -- Coordinates (subtract 1.0 for ground placement)
                0, 0, 0,                      -- Direction
                0, 0, 0,                      -- Rotation
                zone.radius * 2.0, zone.radius * 2.0, 1.0,  -- Scale (width, depth, height)
                0, 255, 0, 100,               -- RGBA Color (Green, semi-transparent)
                false, true, 2, false, nil, nil, false  -- Other marker properties
            )
        end

        -- Check if player is inside the zone
        if isPlayerInZone(playerCoords) then
            DisablePlayerFiring(playerPed, true)  -- Disable firing
            DisableControlAction(0, 140, true)     -- Disable 'R' key (control index 44)
            lib.showTextUI("You're in safezone", { position = 'bottom-center', icon = 'shield-alt', iconColor = "green" })
        else
            lib.hideTextUI()
        end
    end
end)