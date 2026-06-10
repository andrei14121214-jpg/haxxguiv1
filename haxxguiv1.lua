-- haxxguiv1 ULTRA SIMPLE (без лишних украшений)
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Удаляем старый GUI
local old = playerGui:FindFirstChild("haxxguiv1")
if old then old:Destroy() end

-- Создаём экран
local gui = Instance.new("ScreenGui")
gui.Name = "haxxguiv1"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Основная панель (серый фон)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0, 100, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(80,80,80)
frame.BorderSizePixel = 1
frame.BorderColor3 = Color3.new(0,0,0)
frame.Parent = gui

-- Заголовок
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 25)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.new(0,0,0)
title.Text = "Haxxx Gui V1"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 16
title.Parent = frame

-- speedinfo
local speedLabel = Instance.new("TextLabel")
speedLabel.Name = "speedinfo"
speedLabel.Size = UDim2.new(0, 100, 0, 25)
speedLabel.Position = UDim2.new(0, 10, 0, 35)
speedLabel.BackgroundColor3 = Color3.new(0,0,0)
speedLabel.Text = "speed: 16"
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.TextSize = 14
speedLabel.Parent = frame

-- кнопка "-"
local minusSpeed = Instance.new("TextButton")
minusSpeed.Size = UDim2.new(0, 25, 0, 25)
minusSpeed.Position = UDim2.new(0, 5, 0, 35)
minusSpeed.Text = "-"
minusSpeed.BackgroundColor3 = Color3.fromRGB(150,150,150)
minusSpeed.TextColor3 = Color3.new(0,0,0)
minusSpeed.TextSize = 16
minusSpeed.Parent = frame

-- кнопка "+"
local plusSpeed = Instance.new("TextButton")
plusSpeed.Size = UDim2.new(0, 25, 0, 25)
plusSpeed.Position = UDim2.new(0, 115, 0, 35)
plusSpeed.Text = "+"
plusSpeed.BackgroundColor3 = Color3.fromRGB(150,150,150)
plusSpeed.TextColor3 = Color3.new(0,0,0)
plusSpeed.TextSize = 16
plusSpeed.Parent = frame

-- jpinfo
local jumpLabel = Instance.new("TextLabel")
jumpLabel.Name = "jpinfo"
jumpLabel.Size = UDim2.new(0, 100, 0, 25)
jumpLabel.Position = UDim2.new(0, 10, 0, 70)
jumpLabel.BackgroundColor3 = Color3.new(0,0,0)
jumpLabel.Text = "jp: 7.2"
jumpLabel.TextColor3 = Color3.new(1,1,1)
jumpLabel.TextSize = 14
jumpLabel.Parent = frame

-- кнопка "-2"
local minusJump = Instance.new("TextButton")
minusJump.Size = UDim2.new(0, 25, 0, 25)
minusJump.Position = UDim2.new(0, 5, 0, 70)
minusJump.Text = "-2"
minusJump.BackgroundColor3 = Color3.fromRGB(150,150,150)
minusJump.TextColor3 = Color3.new(0,0,0)
minusJump.TextSize = 14
minusJump.Parent = frame

-- кнопка "+2"
local plusJump = Instance.new("TextButton")
plusJump.Size = UDim2.new(0, 25, 0, 25)
plusJump.Position = UDim2.new(0, 115, 0, 70)
plusJump.Text = "+2"
plusJump.BackgroundColor3 = Color3.fromRGB(150,150,150)
plusJump.TextColor3 = Color3.new(0,0,0)
plusJump.TextSize = 14
plusJump.Parent = frame

-- FLY кнопка
local flyBtn = Instance.new("TextButton")
flyBtn.Name = "Flybttn"
flyBtn.Size = UDim2.new(0, 80, 0, 30)
flyBtn.Position = UDim2.new(0, 160, 0, 35)
flyBtn.Text = "FLY"
flyBtn.BackgroundColor3 = Color3.new(0,0,0)
flyBtn.TextColor3 = Color3.new(1,1,1)
flyBtn.TextSize = 14
flyBtn.Parent = frame

-- NOCLIP кнопка
local noclipBtn = Instance.new("TextButton")
noclipBtn.Name = "noclip"
noclipBtn.Size = UDim2.new(0, 80, 0, 30)
noclipBtn.Position = UDim2.new(0, 160, 0, 70)
noclipBtn.Text = "NOCLIP"
noclipBtn.BackgroundColor3 = Color3.new(0,0,0)
noclipBtn.TextColor3 = Color3.new(1,1,1)
noclipBtn.TextSize = 14
noclipBtn.Parent = frame

-- ========== ЛОГИКА ==========
local function updateSpeed(v)
    speedLabel.Text = "speed: " .. math.floor(v)
end
local function getSpeed()
    local c = player.Character
    if not c then return 16 end
    local h = c:FindFirstChild("Humanoid")
    return h and h.WalkSpeed or 16
end
local function setSpeed(v)
    v = math.clamp(v, 0, 500)
    local c = player.Character
    if c then
        local h = c:FindFirstChild("Humanoid")
        if h then
            h.WalkSpeed = v
            updateSpeed(v)
        end
    end
end
plusSpeed.MouseButton1Click:Connect(function() setSpeed(getSpeed() + 1) end)
minusSpeed.MouseButton1Click:Connect(function() setSpeed(getSpeed() - 1) end)

local function updateJump(v)
    jumpLabel.Text = "jp: " .. string.format("%.1f", v)
end
local function getJump()
    local c = player.Character
    if not c then return 7.2 end
    local h = c:FindFirstChild("Humanoid")
    return h and h.JumpPower or 7.2
end
local function setJump(v)
    v = math.clamp(v, 7.2, 200)
    local c = player.Character
    if c then
        local h = c:FindFirstChild("Humanoid")
        if h then
            h.UseJumpPower = true
            h.JumpPower = v
            updateJump(v)
        end
    end
end
plusJump.MouseButton1Click:Connect(function() setJump(getJump() + 2) end)
minusJump.MouseButton1Click:Connect(function() setJump(getJump() - 2) end)

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
player.CharacterAdded:Connect(function()
    if flying then
        stopFly()
        flying = false
        flyBtn.Text = "FLY"
    end
end)

-- NOCLIP
local noclipOn = false
local noclipConn = nil
local function noclipLoop()
    if not noclipOn then return end
    local char = player.Character
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end
noclipBtn.MouseButton1Click:Connect(function()
    noclipOn = not noclipOn
    noclipBtn.Text = noclipOn and "CLIP" or "NOCLIP"
    if noclipOn then
        if noclipConn then noclipConn:Disconnect() end
        noclipConn = runService.Stepped:Connect(noclipLoop)
    else
        if noclipConn then noclipConn:Disconnect() end
        local char = player.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = true end
            end
        end
    end
end)
player.CharacterAdded:Connect(function()
    if noclipOn then
        if noclipConn then noclipConn:Disconnect() end
        noclipOn = false
        noclipBtn.Text = "NOCLIP"
    end
end)

local function onCharacterAdded(character)
    local hum = character:WaitForChild("Humanoid")
    updateSpeed(hum.WalkSpeed)
    updateJump(hum.JumpPower)
    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function() updateSpeed(hum.WalkSpeed) end)
    hum:GetPropertyChangedSignal("JumpPower"):Connect(function() updateJump(hum.JumpPower) end)
end
if player.Character then
    onCharacterAdded(player.Character)
else
    player.CharacterAdded:Connect(onCharacterAdded)
end

print("Простой GUI загружен. Должен быть виден серый прямоугольник с кнопками.")
