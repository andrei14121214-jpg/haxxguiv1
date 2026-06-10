-- haxxguiv1 FIXED (абсолютные пиксельные размеры и координаты)
local player = game.Players.LocalPlayer
if player.PlayerGui:FindFirstChild("haxxguiv1") then player.PlayerGui.haxxguiv1:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "haxxguiv1"
gui.ResetOnSpawn = true
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Name = "main"
main.Position = UDim2.new(0, 100, 0, 100)  -- левый верхний угол (x=100, y=100)
main.Size = UDim2.new(0, 300, 0, 200)      -- ширина 300, высота 200
main.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
main.BackgroundTransparency = 0.6
main.Parent = gui

-- Заголовок "Haxxx Gui V1"
local title = Instance.new("TextLabel")
title.Text = "Haxxx Gui V1"
title.Position = UDim2.new(0, 0, 0, 0)
title.Size = UDim2.new(1, 0, 0, 20)
title.BackgroundColor3 = Color3.new(0,0,0)
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 14
title.Parent = main

-- speedinfo (метка скорости)
local speedInfo = Instance.new("TextLabel")
speedInfo.Name = "speedinfo"
speedInfo.Text = "speed: 16"
speedInfo.Position = UDim2.new(0, 10, 0, 30)
speedInfo.Size = UDim2.new(0, 100, 0, 20)
speedInfo.BackgroundColor3 = Color3.new(0,0,0)
speedInfo.TextColor3 = Color3.new(1,1,1)
speedInfo.TextSize = 14
speedInfo.Parent = main

-- Кнопка "-" скорости
local btnSpeedMinus = Instance.new("TextButton")
btnSpeedMinus.Name = "-"
btnSpeedMinus.Text = "-"
btnSpeedMinus.Position = UDim2.new(0, 5, 0, 30)
btnSpeedMinus.Size = UDim2.new(0, 20, 0, 20)
btnSpeedMinus.BackgroundColor3 = Color3.fromRGB(112,112,112)
btnSpeedMinus.TextColor3 = Color3.new(0,0,0)
btnSpeedMinus.TextSize = 14
btnSpeedMinus.Parent = main

-- Кнопка "+" скорости
local btnSpeedPlus = Instance.new("TextButton")
btnSpeedPlus.Name = "+"
btnSpeedPlus.Text = "+"
btnSpeedPlus.Position = UDim2.new(0, 115, 0, 30)
btnSpeedPlus.Size = UDim2.new(0, 20, 0, 20)
btnSpeedPlus.BackgroundColor3 = Color3.fromRGB(112,112,112)
btnSpeedPlus.TextColor3 = Color3.new(0,0,0)
btnSpeedPlus.TextSize = 14
btnSpeedPlus.Parent = main

-- jpinfo (метка прыжка)
local jpInfo = Instance.new("TextLabel")
jpInfo.Name = "jpinfo"
jpInfo.Text = "jp: 7.2"
jpInfo.Position = UDim2.new(0, 10, 0, 60)
jpInfo.Size = UDim2.new(0, 100, 0, 20)
jpInfo.BackgroundColor3 = Color3.new(0,0,0)
jpInfo.TextColor3 = Color3.new(1,1,1)
jpInfo.TextSize = 14
jpInfo.Parent = main

-- Кнопка "-2" прыжка
local btnJumpMinus = Instance.new("TextButton")
btnJumpMinus.Name = "-2"
btnJumpMinus.Text = "-"
btnJumpMinus.Position = UDim2.new(0, 5, 0, 60)
btnJumpMinus.Size = UDim2.new(0, 20, 0, 20)
btnJumpMinus.BackgroundColor3 = Color3.fromRGB(112,112,112)
btnJumpMinus.TextColor3 = Color3.new(0,0,0)
btnJumpMinus.TextSize = 14
btnJumpMinus.Parent = main

-- Кнопка "+2" прыжка
local btnJumpPlus = Instance.new("TextButton")
btnJumpPlus.Name = "+2"
btnJumpPlus.Text = "+"
btnJumpPlus.Position = UDim2.new(0, 115, 0, 60)
btnJumpPlus.Size = UDim2.new(0, 20, 0, 20)
btnJumpPlus.BackgroundColor3 = Color3.fromRGB(112,112,112)
btnJumpPlus.TextColor3 = Color3.new(0,0,0)
btnJumpPlus.TextSize = 14
btnJumpPlus.Parent = main

-- Flybttn
local flyBtn = Instance.new("TextButton")
flyBtn.Name = "Flybttn"
flyBtn.Text = "FLY"
flyBtn.Position = UDim2.new(0, 160, 0, 30)
flyBtn.Size = UDim2.new(0, 80, 0, 30)
flyBtn.BackgroundColor3 = Color3.new(0,0,0)
flyBtn.TextColor3 = Color3.new(1,1,1)
flyBtn.TextSize = 14
flyBtn.Parent = main

-- noclip
local noclipBtn = Instance.new("TextButton")
noclipBtn.Name = "noclip"
noclipBtn.Text = "NOCLIP"
noclipBtn.Position = UDim2.new(0, 160, 0, 60)
noclipBtn.Size = UDim2.new(0, 80, 0, 30)
noclipBtn.BackgroundColor3 = Color3.new(0,0,0)
noclipBtn.TextColor3 = Color3.new(1,1,1)
noclipBtn.TextSize = 14
noclipBtn.Parent = main

-- ========== ЛОГИКА ==========
local function updateSpeed(v)
    speedInfo.Text = "speed: " .. math.floor(v)
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
btnSpeedPlus.MouseButton1Click:Connect(function() setSpeed(getSpeed() + 1) end)
btnSpeedMinus.MouseButton1Click:Connect(function() setSpeed(getSpeed() - 1) end)

local function updateJump(v)
    jpInfo.Text = "jp: " .. string.format("%.1f", v)
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
btnJumpPlus.MouseButton1Click:Connect(function() setJump(getJump() + 2) end)
btnJumpMinus.MouseButton1Click:Connect(function() setJump(getJump() - 2) end)

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

local function onChar(char)
    local hum = char:WaitForChild("Humanoid")
    updateSpeed(hum.WalkSpeed)
    updateJump(hum.JumpPower)
    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function() updateSpeed(hum.WalkSpeed) end)
    hum:GetPropertyChangedSignal("JumpPower"):Connect(function() updateJump(hum.JumpPower) end)
end
if player.Character then onChar(player.Character) else player.CharacterAdded:Connect(onChar) end

print("GUI загружен с абсолютными координатами. Кнопки должны быть видны и активны.")
