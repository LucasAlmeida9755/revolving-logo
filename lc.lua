
//──────  ──────────────────────────────
//╔╗─╔═╗  ╔══╗╔═╗╔╗─╔╗╔═╗╔╗─╔═╗╔═╗╔═╗╔═╗
//║║─║╔╝  ╚╗╗║║╦╝║╚╦╝║║╦╝║║─║║║║╬║║╦╝║╬║
//║╚╗║╚╗  ╔╩╝║║╩╗╚╗║╔╝║╩╗║╚╗║║║║╔╝║╩╗║╗╣
//╚═╝╚═╝  ╚══╝╚═╝─╚═╝─╚═╝╚═╝╚═╝╚╝─╚═╝╚╩╝
//──────  ──────────────────────────────



local screenW,screenH = guiGetScreenSize()
local resW, resH = 1280, 720
local x, y =  (screenW/resW), (screenH/resH)

rote = 0


function logP ()
        local aff = interpolateBetween(40, 0, 0, 255, 0, 0, ((getTickCount()) / TEMP), "SineCurve")
        dxDrawImage(x*1120, y*10, x*155, y*154, "logo.png", rote, 0, 0, tocolor(255, 255, 255, aff), false)
          rote = rote +12/12

--------------------------------------------
end
function toggleRadar()
     if isVisible then
          addEventHandler("onClientRender", root, logP)
     else
          removeEventHandler("onClientRender", root, logP)
     end
     isVisible = not isVisible
end
bindKey ("F11", "down", toggleRadar)

local pisTable = 
{
"ammo",
"armour",
"clock",
"health",
"money",
"weapon",
"wanted",
"area_name",
"vehicle_name",
"breath",
"clock"
}

addEventHandler("onClientRender", root, logP)
addEventHandler("onClientResourceStart", resourceRoot,
    function()
     for id, pisComponents in ipairs(pisTable) do
          setPlayerHudComponentVisible(pisComponents, false)
     end
    end
)

addEventHandler("onClientResourceStop", resourceRoot,
    function()
     for id, pisComponents in ipairs(pisTable) do
          setPlayerHudComponentVisible(pisComponents, true)
     end
    end
)

