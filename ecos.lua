local group = 5066297
local checkerEnabled = true

local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua"))()

local window0 = engine.new({
    text =  'CHECKING FOR MODS',
    size = UDim2.new(200, 5),
    color = Color3.new(0,0,0)
})
window0.close()

local function modChecker()
    for i,plr in pairs(game.Players:GetPlayers()) do
        pcall(function()
            if plr:GetRankInGroup(group) > 1 and checkerEnabled == true then
                warn('Mod Detected')
                game.Players.LocalPlayer:Kick('Mod Detected')
            end
        end)
    end
end modChecker()

game.Players.PlayerAdded:Connect(function(player)
    local rank = player:GetRankInGroup(group)
    if rank > 1 then
        warn('Mod Detected')
        game.Players.LocalPlayer:Kick('Mod Detected')
    end

    player.AncestryChanged:Connect(function(_, parent)
        if parent ~= nil then return end
    end)
end)

window0.transparency = 1
window0.setPosition(UDim2.new(10,0,10,0))
local window1 = engine.new({
    text =  'ECOS: La Brea',
    size = UDim2.new(1000, 800),
    color = Color3.new(0,0,0)
})

window1.open()

--Character
local tab1 = window1.new({
    text = "Character"
})


local function checkChar()
    if game.Players.LocalPlayer.Character:FindFirstChild("ControlMain") then
        return true
    end
    return false
end

local walkFolder = tab1.new('folder', {
    text = "walk",
})

local walkSpeed = walkFolder.new("slider", {
    text = "walkSpeed",
    min = 3,
    max = 500,
    value = 3,
    rounding = 1,
})
walkSpeed.event:Connect(function(x)
    if checkChar then
        local m = require(game.Players.LocalPlayer.Character.ControlMain)
        m.walkSpeed = x
    end
end)

local walkGrazeSpeed = walkFolder.new("slider", {
    text = "walkGrazeSpeed",
    min = 3,
    max = 500,
    value = 3,
    rounding = 1,
})
walkGrazeSpeed.event:Connect(function(x)
    if checkChar then
        local m = require(game.Players.LocalPlayer.Character.ControlMain)
        m.walkGrazeSpeed = x
    end
end)

local walkBackwardSpeed = walkFolder.new("slider", {
    text = "walkBackwardSpeed",
    min = 2,
    max = 500,
    value = 3,
    rounding = 1,
})
walkBackwardSpeed.event:Connect(function(x)
    if checkChar then
        local m = require(game.Players.LocalPlayer.Character.ControlMain)
        m.walkBackwardSpeed = x
    end
end)

local sprintFolder = tab1.new('folder', {
    text = "sprint",
})

local sprintSpeed = sprintFolder.new("slider", {
    text = "sprintSpeed",
    min = 40,
    max = 500,
    value = 3,
    rounding = 1,
})
sprintSpeed.event:Connect(function(x)
    if checkChar then
        local m = require(game.Players.LocalPlayer.Character.ControlMain)
        m.sprintSpeed = x
    end
end)

local trotFolder = tab1.new('folder', {
    text = "trot",
})

local trotSpeed = trotFolder.new("slider", {
    text = "trotSpeed",
    min = 12,
    max = 500,
    value = 3,
    rounding = 1,
})
trotSpeed.event:Connect(function(x)
    if checkChar then
        local m = require(game.Players.LocalPlayer.Character.ControlMain)
        m.trotSpeed = x
    end
end)

local crouchFolder = tab1.new('folder', {
    text = "crouch",
})

local crouchSpeed = crouchFolder.new("slider", {
    text = "crouchSpeed",
    min = 1,
    max = 500,
    value = 3,
    rounding = 1,
})
crouchSpeed.event:Connect(function(x)
    if checkChar then
        local m = require(game.Players.LocalPlayer.Character.ControlMain)
        m.crouchSpeed = x
    end
end)

local crouchTrotSpeed = crouchFolder.new("slider", {
    text = "crouchTrotSpeed",
    min = 8,
    max = 500,
    value = 3,
    rounding = 1,
})
crouchTrotSpeed.event:Connect(function(x)
    if checkChar then
        local m = require(game.Players.LocalPlayer.Character.ControlMain)
        m.crouchTrotSpeed = x
    end
end)

local swimFolder = tab1.new('folder', {
    text = "swim",
})

local swimSpeed = swimFolder.new("slider", {
    text = "swimSpeed",
    min = 6,
    max = 500,
    value = 3,
    rounding = 1,
})
swimSpeed.event:Connect(function(x)
    if checkChar then
        local m = require(game.Players.LocalPlayer.Character.ControlMain)
        m.swimSpeed = x
    end
end)

local jumpFolder = tab1.new('folder', {
    text = "jump",
})

local jumpPower = jumpFolder.new("slider", {
    text = "jumpPower",
    min = 50,
    max = 500,
    value = 3,
    rounding = 1,
})
jumpPower.event:Connect(function(x)
    if checkChar then
        local m = require(game.Players.LocalPlayer.Character.ControlMain)
        m.jumpPower = x
    end
end)

local infStatsOn = false
local infStam = tab1.new("switch", {
    text = "infStats",
})
infStam.set(false)
infStam.event:Connect(function(bool)
    if checkChar() then
        infStatsOn = bool
    end
end)

local infHealth = tab1.new("button", {
    text = "infHealth",
})
infHealth.event:Connect(function()
    if checkChar() then
        game:GetService("ReplicatedStorage").Events.TakeDamage:FireServer(-math.huge)
    end
end)

local suicide = tab1.new("button", {
    text = "Suicide",
})
suicide.event:Connect(function()
    if checkChar() then
        game:GetService("ReplicatedStorage").Events.TakeDamage:FireServer(math.huge)
    end
end)

--Spawns
local animalP = ""
local genderP = ""
local skinP = ""

local tab2 = window1.new({
    text = "Spawns"
})

local animal = tab2.new("dropdown", {
    text = "Animal",
})
animal.new("Bison")
animal.new("Western Horse")
animal.new("Dire Wolf")
animal.new("Smilodon")
animal.event:Connect(function(name)
    animalP = name
end)

local gender = tab2.new("dropdown", {
    text = "Gender",
})
gender.new("Male")
gender.new("Female")
gender.event:Connect(function(name)
    genderP = name
end)

local skin = tab2.new("dropdown", {
    text = "Skin",
})
skin.new("Default")
skin.event:Connect(function(name)
    skinP = name
end)

local spawn = tab2.new("button", {
    text = "Spawn",
})
spawn.event:Connect(function()
    local remote = game:GetService("ReplicatedStorage").Events.Spawn

    local arguments = {
        [1] = animalP,
        [2] = genderP,
        [3] = skinP
    }

    remote:FireServer(unpack(arguments))
end)

--ESP
local highlightInnerTransparency = 0.5
local highlightOutlineTransparency = 0
local highlightFillColor = Color3.new(1,0,0)
local highlightOutlineColor = Color3.new(1,1,1)

local espEnabled = false

local function initalizeESP()
    for i,v in pairs(workspace.Characters:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            if v:FindFirstChild('Highlight') then
            else
                local newHighlight = Instance.new('Highlight')
                newHighlight.FillTransparency = highlightInnerTransparency
                newHighlight.OutlineTransparency = highlightOutlineTransparency
                newHighlight.FillColor = highlightFillColor
                newHighlight.OutlineColor = highlightOutlineColor
                newHighlight.Parent = v
            end
        end
    end
end

local function disableESP()
    for i,v in pairs(workspace.Characters:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= "HighlightPlayers" then
            if v:FindFirstChild('Highlight') then
                v.Highlight:Destroy()
            end
        end
    end
end

local function change()
    for i,v in pairs(workspace.Characters:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            if v:FindFirstChild('Highlight') then
                local Highlight = v.Highlight
                Highlight.FillTransparency = highlightInnerTransparency
                Highlight.OutlineTransparency = highlightOutlineTransparency
                Highlight.FillColor = highlightFillColor
                Highlight.OutlineColor = highlightOutlineColor
                Highlight.Parent = v
            end
        end
    end
end

local tab3 = window1.new({
    text = "ESP"
})

local enable = tab3.new("switch", {
    text = "Enable ESP";
})
enable.set(false)
enable.event:Connect(function(bool)
    if bool == true then
        initalizeESP()
    else
        disableESP()
    end
    espEnabled = bool
end)

local fillcolor = tab3.new("color", {
    color = Color3.new(1, 0, 0),
    text = "highlightFillColor",
})
fillcolor.event:Connect(function(color)
    highlightFillColor = color
    change()
end)

local outlinecolor = tab3.new("color", {
    color = Color3.new(1, 1, 1),
    text = "highlightOutlineColor",
})
outlinecolor.event:Connect(function(color)
    highlightOutlineColor = color
    change()
end)

local outlineTrans = tab3.new("slider", {
    text = "highlightOutlineTransparency",
    min = 0,
    max = 100,
    value = 1,
    rounding = 1,
})
outlineTrans.event:Connect(function(x)
    highlightOutlineTransparency = x*0.01
    change()
end)

local fillTrans = tab3.new("slider", {
    text = "highlightFillTransparency",
    min = 0,
    max = 100,
    value = 1,
    rounding = 1,
})
fillTrans.event:Connect(function(x)
    highlightInnerTransparency = x*0.01
    change()
end)

workspace.Characters.ChildAdded:Connect(function(c)
    if c.Name ~= "HighlightedPlayers" and espEnabled == true then
        initalizeESP()
    end
end)

--Settings
local tab4 = window1.new({
    text = "Settings"
})

local close = tab4.new("button", {
    text = "Close",
})
close.event:Connect(function()
    window1.close()
end)

local remotespy = tab4.new("button", {
    text = "Load RemoteSpy",
})
remotespy.event:Connect(function()
    loadstring(game:HttpGetAsync("https://github.com/richie0866/remote-spy/releases/latest/download/RemoteSpy.lua"))()
end)

local dex = tab4.new("button", {
    text = "Load Dex",
})
dex.event:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
end)

tab1.show()
game:GetService("RunService").RenderStepped:Connect(function()
    if checkChar() then
        if infStatsOn == true then
            local char = game.Players.LocalPlayer.Character
            local att = char.Attributes

            att:SetAttribute("Hunger", math.huge)
            att:SetAttribute("Thirst", math.huge)
            att:SetAttribute("Stamina", math.huge)
        end
    else
        infStatsOn = false
    end
end)
