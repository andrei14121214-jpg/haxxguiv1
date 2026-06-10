-- haxxguiv1: ESP выключается при респавне, GUI не пропадает
local player = game.Players.LocalPlayer
if player.PlayerGui:FindFirstChild("haxxguiv1") then player.PlayerGui.haxxguiv1:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "haxxguiv1"
gui.ResetOnSpawn = true
gui.Parent = player:WaitForChild("PlayerGui")

-- ===== ПЛАВАЮЩАЯ КНОПКА-ТОГГЛ "H v1" =====
local toggleHolder = Instance.new("Frame")
toggleHolder.Name = "ToggleHolder"
toggleHolder.Size = UDim2.new(0, 50, 0, 50)
toggleHolder.Position = UDim2.new(1, -60, 0, 10)
toggleHolder.BackgroundTransparency = 1
toggleHolder.Parent = gui

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(1, 0, 1, 0)
toggleBtn.Text = "H"
toggleBtn.TextSize = 28
toggleBtn.TextColor3 = Color3.new(1,1,1)
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toggleBtn.BackgroundTransparency = 0.3
toggleBtn.BorderSizePixel = 0
toggleBtn.Parent = toggleHolder

local v1Label = Instance.new("TextLabel")
v1Label.Size = UDim2.new(1, 0, 0.3, 0)
v1Label.Position = UDim2.new(0, 0, 0.7, 0)
v1Label.BackgroundTransparency = 1
v1Label.Text = "v1"
v1Label.TextSize = 10
v1Label.TextColor3 = Color3.new(1,1,1)
v1Label.TextXAlignment = Enum.TextXAlignment.Right
v1Label.Parent = toggleBtn

-- Перетаскивание кнопки H
local dragToggle = false
local dragToggleStart, dragTogglePos
toggleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragToggleStart = input.Position
        dragTogglePos = toggleHolder.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)
toggleBtn.InputChanged:Connect(function(input)
    if dragToggle and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragToggleStart
        toggleHolder.Position = UDim2.new(dragTogglePos.X.Scale, dragTogglePos.X.Offset + delta.X,
                                          dragTogglePos.Y.Scale, dragTogglePos.Y.Offset + delta.Y)
    end
end)

-- ===== ОСНОВНОЙ КОНТЕЙНЕР (меню) =====
local container = Instance.new("Frame")
container.Name = "Container"
container.Size = UDim2.new(0, 650, 0, 220)
container.Position = UDim2.new(0.5, -325, 0.5, -110)
container.BackgroundTransparency = 1
container.Visible = true
container.Parent = gui

-- ОСНОВНОЕ ОКНО
local main = Instance.new("Frame")
main.Size = UDim2.new(1, 0, 1, 0)
main.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
main.BackgroundTransparency = 0.2
main.Parent = container

-- Заголовок (для перетаскивания всего окна)
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.new(0,0,0)
title.Text = "Haxxx Gui V1"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 14
title.Parent = main

-- ===== ЛЕВАЯ КОЛОНКА (speed, jump, fov) =====
local leftColumn = Instance.new("Frame")
leftColumn.Size = UDim2.new(0, 200, 1, 0)
leftColumn.Position = UDim2.new(0, 10, 0, 20)
leftColumn.BackgroundTransparency = 1
leftColumn.Parent = main

local leftLayout = Instance.new("UIListLayout")
leftLayout.Padding = UDim.new(0, 10)
leftLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
leftLayout.VerticalAlignment = Enum.VerticalAlignment.Top
leftLayout.Parent = leftColumn

-- speed
local speedFrame = Instance.new("Frame")
speedFrame.Size = UDim2.new(1, 0, 0, 30)
speedFrame.BackgroundTransparency = 1
speedFrame.Parent = leftColumn

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 70, 1, 0)
speedLabel.BackgroundColor3 = Color3.new(0,0,0)
speedLabel.Text = "speed: 16"
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.TextSize = 12
speedLabel.Parent = speedFrame

local speedMinus = Instance.new("TextButton")
speedMinus.Size = UDim2.new(0, 25, 1, 0)
speedMinus.Position = UDim2.new(0, 75, 0, 0)
speedMinus.Text = "-"
speedMinus.BackgroundColor3 = Color3.fromRGB(112,112,112)
speedMinus.TextColor3 = Color3.new(0,0,0)
speedMinus.TextSize = 16
speedMinus.Parent = speedFrame

local speedPlus = Instance.new("TextButton")
speedPlus.Size = UDim2.new(0, 25, 1, 0)
speedPlus.Position = UDim2.new(0, 105, 0, 0)
speedPlus.Text = "+"
speedPlus.BackgroundColor3 = Color3.fromRGB(112,112,112)
speedPlus.TextColor3 = Color3.new(0,0,0)
speedPlus.TextSize = 16
speedPlus.Parent = speedFrame

-- jump
local jumpFrame = Instance.new("Frame")
jumpFrame.Size = UDim2.new(1, 0, 0, 30)
jumpFrame.BackgroundTransparency = 1
jumpFrame.Parent = leftColumn

local jpLabel = Instance.new("TextLabel")
jpLabel.Size = UDim2.new(0, 70, 1, 0)
jpLabel.BackgroundColor3 = Color3.new(0,0,0)
jpLabel.Text = "jp: 7.2"
jpLabel.TextColor3 = Color3.new(1,1,1)
jpLabel.TextSize = 12
jpLabel.Parent = jumpFrame

local jumpMinus = Instance.new("TextButton")
jumpMinus.Size = UDim2.new(0, 25, 1, 0)
jumpMinus.Position = UDim2.new(0, 75, 0, 0)
jumpMinus.Text = "-"
jumpMinus.BackgroundColor3 = Color3.fromRGB(112,112,112)
jumpMinus.TextColor3 = Color3.new(0,0,0)
jumpMinus.TextSize = 16
jumpMinus.Parent = jumpFrame

local jumpPlus = Instance.new("TextButton")
jumpPlus.Size = UDim2.new(0, 25, 1, 0)
jumpPlus.Position = UDim2.new(0, 105, 0, 0)
jumpPlus.Text = "+"
jumpPlus.BackgroundColor3 = Color3.fromRGB(112,112,112)
jumpPlus.TextColor3 = Color3.new(0,0,0)
jumpPlus.TextSize = 16
jumpPlus.Parent = jumpFrame

-- fov
local fovFrame = Instance.new("Frame")
fovFrame.Size = UDim2.new(1, 0, 0, 30)
fovFrame.BackgroundTransparency = 1
fovFrame.Parent = leftColumn

local fovLabel = Instance.new("TextLabel")
fovLabel.Size = UDim2.new(0, 70, 1, 0)
fovLabel.BackgroundColor3 = Color3.new(0,0,0)
fovLabel.Text = "fov: 70"
fovLabel.TextColor3 = Color3.new(1,1,1)
fovLabel.TextSize = 12
fovLabel.Parent = fovFrame

local fovMinus = Instance.new("TextButton")
fovMinus.Size = UDim2.new(0, 25, 1, 0)
fovMinus.Position = UDim2.new(0, 75, 0, 0)
fovMinus.Text = "-"
fovMinus.BackgroundColor3 = Color3.fromRGB(112,112,112)
fovMinus.TextColor3 = Color3.new(0,0,0)
fovMinus.TextSize = 16
fovMinus.Parent = fovFrame

local fovPlus = Instance.new("TextButton")
fovPlus.Size = UDim2.new(0, 25, 1, 0)
fovPlus.Position = UDim2.new(0, 105, 0, 0)
fovPlus.Text = "+"
fovPlus.BackgroundColor3 = Color3.fromRGB(112,112,112)
fovPlus.TextColor3 = Color3.new(0,0,0)
fovPlus.TextSize = 16
fovPlus.Parent = fovFrame

-- ===== ПРАВАЯ КОЛОНКА (кнопки-переключатели) =====
local rightColumn = Instance.new("Frame")
rightColumn.Size = UDim2.new(0, 400, 1, 0)
rightColumn.Position = UDim2.new(0, 220, 0, 20)
rightColumn.BackgroundTransparency = 1
rightColumn.Parent = main

local gridLayout = Instance.new("UIGridLayout")
gridLayout.CellSize = UDim2.new(0, 90, 0, 30)
gridLayout.CellPadding = UDim2.new(0, 5, 0, 8)
gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
gridLayout.VerticalAlignment = Enum.VerticalAlignment.Top
gridLayout.Parent = rightColumn

local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(1, 0, 1, 0)
espBtn.Text = "ESP"
espBtn.BackgroundColor3 = Color3.new(0,0,0)
espBtn.TextColor3 = Color3.new(1,1,1)
espBtn.TextSize = 12
espBtn.Parent = rightColumn

local aimBtn = Instance.new("TextButton")
aimBtn.Size = UDim2.new(1, 0, 1, 0)
aimBtn.Text = "AIM"
aimBtn.BackgroundColor3 = Color3.new(0,0,0)
aimBtn.TextColor3 = Color3.new(1,1,1)
aimBtn.TextSize = 12
aimBtn.Parent = rightColumn

local flyBtn = Instance.new("TextButton")
flyBtn.Size = UDim2.new(1, 0, 1, 0)
flyBtn.Text = "FLY"
flyBtn.BackgroundColor3 = Color3.new(0,0,0)
flyBtn.TextColor3 = Color3.new(1,1,1)
flyBtn.TextSize = 12
flyBtn.Parent = rightColumn

local noclipBtn = Instance.new("TextButton")
noclipBtn.Size = UDim2.new(1, 0, 1, 0)
noclipBtn.Text = "NOCLIP"
noclipBtn.BackgroundColor3 = Color3.new(0,0,0)
noclipBtn.TextColor3 = Color3.new(1,1,1)
noclipBtn.TextSize = 12
noclipBtn.Parent = rightColumn

local antiLagBtn = Instance.new("TextButton")
antiLagBtn.Size = UDim2.new(1, 0, 1, 0)
antiLagBtn.Text = "A-LAG"
antiLagBtn.BackgroundColor3 = Color3.new(0,0,0)
antiLagBtn.TextColor3 = Color3.new(1,1,1)
antiLagBtn.TextSize = 12
antiLagBtn.Parent = rightColumn

local antiAfkBtn = Instance.new("TextButton")
antiAfkBtn.Size = UDim2.new(1, 0, 1, 0)
antiAfkBtn.Text = "A-AFK"
antiAfkBtn.BackgroundColor3 = Color3.new(0,0,0)
antiAfkBtn.TextColor3 = Color3.new(1,1,1)
antiAfkBtn.TextSize = 12
antiAfkBtn.Parent = rightColumn

local invisBtn = Instance.new("TextButton")
invisBtn.Size = UDim2.new(1, 0, 1, 0)
invisBtn.Text = "INVIS"
invisBtn.BackgroundColor3 = Color3.new(0,0,0)
invisBtn.TextColor3 = Color3.new(1,1,1)
invisBtn.TextSize = 12
invisBtn.Parent = rightColumn

local hubsBtn = Instance.new("TextButton")
hubsBtn.Size = UDim2.new(1, 0, 1, 0)
hubsBtn.Text = "HUBS"
hubsBtn.BackgroundColor3 = Color3.new(0,0,0)
hubsBtn.TextColor3 = Color3.new(1,1,1)
hubsBtn.TextSize = 12
hubsBtn.Parent = rightColumn

-- ===== ОКНО HUBS (справа, перетаскивается отдельно) =====
local hubframe = Instance.new("Frame")
hubframe.Size = UDim2.new(0, 200, 0, 220)
hubframe.Position = UDim2.new(0, container.Position.X.Offset + container.Size.X.Offset + 10, 0, container.Position.Y.Offset)
hubframe.BackgroundColor3 = Color3.fromRGB(40,40,40)
hubframe.BackgroundTransparency = 0.2
hubframe.Visible = false
hubframe.Active = true
hubframe.Draggable = true
hubframe.Parent = gui

local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1, 0, 0, 20)
hubTitle.Position = UDim2.new(0, 0, 0, 0)
hubTitle.BackgroundColor3 = Color3.new(0,0,0)
hubTitle.Text = "hubs"
hubTitle.TextColor3 = Color3.new(1,1,1)
hubTitle.TextSize = 14
hubTitle.Parent = hubframe

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, -20)
scrollFrame.Position = UDim2.new(0, 0, 0, 20)
scrollFrame.BackgroundTransparency = 1
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ScrollBarThickness = 8
scrollFrame.Parent = hubframe

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 5)
listLayout.Parent = scrollFrame

local function addHubButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Text = text
    btn.BackgroundColor3 = Color3.new(0,0,0)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextSize = 12
    btn.Parent = scrollFrame
    btn.MouseButton1Click:Connect(callback)
end

addHubButton("System Broken", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
end)

addHubButton("Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

addHubButton("CMD-X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()
end)

addHubButton("Dex Explorer", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end)

addHubButton("Remote Spy", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Remote-Spy-V2/main/Source.lua"))()
end)

addHubButton("FPS Unlocker", function()
    setfpscap(999)
    print("FPS cap removed")
end)

addHubButton("Speed Boost x5", function()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = char.Humanoid.WalkSpeed * 5
    end
end)

addHubButton("Jump Boost x3", function()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = char.Humanoid.JumpPower * 3
    end
end)

local function updateCanvas()
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
end
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
task.wait(0.1)
updateCanvas()

-- ===== ЛОГИКА ФУНКЦИЙ =====
-- SPEED
local function updateSpeed(v) speedLabel.Text = "speed: " .. math.floor(v) end
local function getSpeed() local c = player.Character if not c then return 16 end local h = c:FindFirstChild("Humanoid") return h and h.WalkSpeed or 16 end
local function setSpeed(v) v = math.clamp(v, 0, 500) local c = player.Character if c then local h = c:FindFirstChild("Humanoid") if h then h.WalkSpeed = v updateSpeed(v) end end end
speedPlus.MouseButton1Click:Connect(function() setSpeed(getSpeed() + 1) end)
speedMinus.MouseButton1Click:Connect(function() setSpeed(getSpeed() - 1) end)

-- JUMP
local function updateJump(v) jpLabel.Text = "jp: " .. string.format("%.1f", v) end
local function getJump() local c = player.Character if not c then return 7.2 end local h = c:FindFirstChild("Humanoid") return h and h.JumpPower or 7.2 end
local function setJump(v) v = math.clamp(v, 7.2, 200) local c = player.Character if c then local h = c:FindFirstChild("Humanoid") if h then h.UseJumpPower = true h.JumpPower = v updateJump(v) end end end
jumpPlus.MouseButton1Click:Connect(function() setJump(getJump() + 1) end)
jumpMinus.MouseButton1Click:Connect(function() setJump(getJump() - 1) end)

-- FOV
local camera = workspace.CurrentCamera
local function updateFOV(v) v = math.clamp(v, 50, 120) camera.FieldOfView = v fovLabel.Text = "fov: " .. math.floor(v) end
fovPlus.MouseButton1Click:Connect(function() updateFOV(camera.FieldOfView + 5) end)
fovMinus.MouseButton1Click:Connect(function() updateFOV(camera.FieldOfView - 5) end)

-- FLY
local flying = false
local bodyGyro, bodyVelocity, flyConn
local flySpeed = 80
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local function startFly()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp then return end
    if hum then
        hum.PlatformStand = true
        hum:ChangeState(Enum.HumanoidStateType.Freefall)
    end
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(9e9,9e9,9e9)
    bodyGyro.P = 9e4
    bodyGyro.D = 1000
    bodyGyro.Parent = hrp
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(9e9,9e9,9e9)
    bodyVelocity.Velocity = Vector3.new(0,5,0)
    bodyVelocity.Parent = hrp
    flyConn = runService.RenderStepped:Connect(function()
        if not flying then return end
        local cam = workspace.CurrentCamera
        local cf = cam.CFrame
        bodyGyro.CFrame = cf
        local move = Vector3.new(0,0,0)
        if uis:IsKeyDown(Enum.KeyCode.W) then move = move + cf.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.S) then move = move - cf.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.A) then move = move - cf.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.D) then move = move + cf.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
        if uis:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0,1,0) end
        if move.Magnitude > 0 then move = move.Unit * flySpeed end
        bodyVelocity.Velocity = move
    end)
end
local function stopFly()
    if bodyGyro then bodyGyro:Destroy() end
    if bodyVelocity then bodyVelocity:Destroy() end
    if flyConn then flyConn:Disconnect() end
    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.PlatformStand = false
            hum:ChangeState(Enum.HumanoidStateType.Landed)
        end
    end
end
flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    flyBtn.Text = flying and "UNFLY" or "FLY"
    if flying then startFly() else stopFly() end
end)

-- NOCLIP
local noclipOn = false
local noclipConn = nil
local function noclipLoop()
    if not noclipOn then return end
    local char = player.Character
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then part.CanCollide = false end
    end
end
local function stopNoclip()
    if noclipConn then noclipConn:Disconnect() end
    local char = player.Character
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = true end
        end
    end
end
local function toggleNoclip()
    noclipOn = not noclipOn
    if noclipOn then
        noclipBtn.Text = "CLIP"
        if noclipConn then noclipConn:Disconnect() end
        noclipConn = runService.Stepped:Connect(noclipLoop)
    else
        noclipBtn.Text = "NOCLIP"
        stopNoclip()
    end
end
noclipBtn.MouseButton1Click:Connect(toggleNoclip)

-- ESP (с возможностью принудительного сброса)
local espActive = false
local espHighlights = {}
local espConn = nil
local function updateESP()
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            if not espHighlights[plr] then
                local hl = Instance.new("Highlight")
                hl.FillColor = Color3.fromRGB(255,0,0)
                hl.FillTransparency = 0.6
                hl.OutlineColor = Color3.new(1,1,0)
                hl.Adornee = plr.Character
                hl.Parent = plr.Character
                espHighlights[plr] = hl
            end
        elseif espHighlights[plr] then
            espHighlights[plr]:Destroy()
            espHighlights[plr] = nil
        end
    end
end
local function disableESP()
    espActive = false
    for _, hl in pairs(espHighlights) do hl:Destroy() end
    espHighlights = {}
    if espConn then espConn:Disconnect() end
    espConn = nil
    espBtn.Text = "ESP"
end
espBtn.MouseButton1Click:Connect(function()
    if not espActive then
        espActive = true
        espBtn.Text = "ON"
        updateESP()
        if espConn then espConn:Disconnect() end
        espConn = runService.RenderStepped:Connect(function() if espActive then updateESP() end end)
    else
        disableESP()
    end
end)

-- AIM
local aimActive = false
local aimConnection = nil
local function getClosestPlayer()
    local closest, minDist = nil, math.huge
    local char = player.Character
    if not char then return nil end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local myPos = hrp.Position
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local targetHrp = plr.Character:FindFirstChild("HumanoidRootPart")
            if targetHrp then
                local dist = (targetHrp.Position - myPos).Magnitude
                if dist < minDist then minDist = dist closest = plr end
            end
        end
    end
    return closest
end
local function aimAt(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local targetHrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not targetHrp then return end
    local cam = workspace.CurrentCamera
    cam.CFrame = CFrame.new(cam.CFrame.Position, targetHrp.Position + Vector3.new(0,1.5,0))
end
local function startAim()
    if aimConnection then aimConnection:Disconnect() end
    aimConnection = runService.RenderStepped:Connect(function()
        if aimActive then local target = getClosestPlayer() if target then aimAt(target) end end
    end)
end
local function stopAim()
    if aimConnection then aimConnection:Disconnect() end
end
aimBtn.MouseButton1Click:Connect(function()
    aimActive = not aimActive
    aimBtn.Text = aimActive and "ON" or "AIM"
    if aimActive then startAim() else stopAim() end
end)

-- ANTI-LAG
local antiLagActive = false
local function applyAntiLag(state)
    if state then
        settings().Rendering.QualityLevel = 1
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            elseif v:IsA("Decal") then
                v.Transparency = 1
            end
        end
    else
        settings().Rendering.QualityLevel = 21
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = true
            elseif v:IsA("Decal") then
                v.Transparency = 0
            end
        end
    end
end
antiLagBtn.MouseButton1Click:Connect(function()
    antiLagActive = not antiLagActive
    antiLagBtn.Text = antiLagActive and "A-L ON" or "A-LAG"
    applyAntiLag(antiLagActive)
end)

-- ANTI-AFK
local antiAfkActive = false
local antiAfkConnection = nil
local lastMove = tick()
local function simulateActivity()
    if not antiAfkActive then return end
    if tick() - lastMove > 50 then
        local cam = workspace.CurrentCamera
        local cf = cam.CFrame
        cam.CFrame = cf * CFrame.Angles(0, math.rad(1), 0)
        task.wait(0.1)
        cam.CFrame = cf
        lastMove = tick()
    end
end
local function startAntiAfk()
    if antiAfkConnection then antiAfkConnection:Disconnect() end
    antiAfkConnection = runService.Heartbeat:Connect(simulateActivity)
end
local function stopAntiAfk()
    if antiAfkConnection then antiAfkConnection:Disconnect() end
end
antiAfkBtn.MouseButton1Click:Connect(function()
    antiAfkActive = not antiAfkActive
    antiAfkBtn.Text = antiAfkActive and "A-A ON" or "A-AFK"
    if antiAfkActive then startAntiAfk() else stopAntiAfk() end
end)

-- INVIS
local invisible = false
local origMaterials = {}
local origTransps = {}
local function setInvisible(state)
    local char = player.Character
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            if state then
                if origMaterials[part] == nil then
                    origMaterials[part] = part.Material
                    origTransps[part] = part.Transparency
                end
                part.Material = Enum.Material.ForceField
                part.Transparency = 1
                part.CastShadow = false
            else
                part.Material = origMaterials[part] or Enum.Material.Plastic
                part.Transparency = origTransps[part] or 0
                part.CastShadow = true
            end
        elseif part:IsA("Decal") or part:IsA("Texture") then
            part.Visible = not state
        end
    end
    for _, acc in ipairs(char:GetChildren()) do
        if acc:IsA("Accessory") or acc:IsA("Hat") or acc:IsA("Clothing") then
            acc.Visible = not state
            local handle = acc:FindFirstChild("Handle")
            if handle then
                if state then handle.CastShadow = false handle.Transparency = 1
                else handle.CastShadow = true handle.Transparency = 0 end
            end
        end
    end
end
invisBtn.MouseButton1Click:Connect(function()
    invisible = not invisible
    invisBtn.Text = invisible and "VISIBLE" or "INVIS"
    setInvisible(invisible)
end)

-- ===== DRAG ОСНОВНОГО ОКНА =====
local function updateHubframePosition()
    if not container or not hubframe then return end
    local contPos = container.AbsolutePosition
    local contSize = container.AbsoluteSize
    hubframe.Position = UDim2.new(0, contPos.X + contSize.X + 10, 0, contPos.Y)
end

local dragMain = false
local dragMainStart, dragMainPos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragMain = true
        dragMainStart = input.Position
        dragMainPos = container.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragMain = false
                if hubframe.Visible then updateHubframePosition() end
            end
        end)
    end
end)
title.InputChanged:Connect(function(input)
    if dragMain and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragMainStart
        container.Position = UDim2.new(dragMainPos.X.Scale, dragMainPos.X.Offset + delta.X,
                                       dragMainPos.Y.Scale, dragMainPos.Y.Offset + delta.Y)
        if hubframe.Visible then updateHubframePosition() end
    end
end)

-- ===== ТОГГЛ МЕНЮ =====
local menuVisible = true
toggleBtn.MouseButton1Click:Connect(function()
    menuVisible = not menuVisible
    container.Visible = menuVisible
    if not menuVisible then
        hubframe.Visible = false
        hubsOpen = false
        hubsBtn.Text = "HUBS"
    end
end)

-- ===== HUBS =====
local hubsOpen = false
hubsBtn.MouseButton1Click:Connect(function()
    hubsOpen = not hubsOpen
    hubframe.Visible = hubsOpen
    hubsBtn.Text = hubsOpen and "←" or "HUBS"
    if hubsOpen then updateHubframePosition() end
end)

-- ===== ОБРАБОТКА РЕСПАВНА (ESP выключается, GUI остаётся) =====
player.CharacterAdded:Connect(function()
    -- Выключаем ESP, если он был активен
    if espActive then
        disableESP()
    end
    -- Сбрасываем состояние невидимости (персонаж появляется видимым)
    if invisible then
        invisible = false
        invisBtn.Text = "INVIS"
        setInvisible(false)
        origMaterials = {}
        origTransps = {}
    end
    -- Обновляем отображение скорости и прыжка для нового персонажа
    local char = player.Character
    if char then
        task.wait(0.5) -- даём персонажу время загрузиться
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            updateSpeed(hum.WalkSpeed)
            updateJump(hum.JumpPower)
        end
    end
end)

-- Обновление дисплея при появлении персонажа (первый раз)
local function onChar(char)
    local hum = char:WaitForChild("Humanoid")
    updateSpeed(hum.WalkSpeed)
    updateJump(hum.JumpPower)
    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function() updateSpeed(hum.WalkSpeed) end)
    hum:GetPropertyChangedSignal("JumpPower"):Connect(function() updateJump(hum.JumpPower) end)
end
if player.Character then onChar(player.Character) else player.CharacterAdded:Connect(onChar) end

print("Haxxx Gui V1: ESP выключается при респавне, GUI не пропадает")
