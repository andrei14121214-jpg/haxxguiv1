-- haxxguiv1 WORKING LOADSTRING (без вложенных LocalScript)
local player = game.Players.LocalPlayer
if player.PlayerGui:FindFirstChild("haxxguiv1") then player.PlayerGui.haxxguiv1:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "haxxguiv1"
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

local main = Instance.new("Frame")
main.Name = "main"
main.Size = UDim2.new(0, 200, 0, 160)
main.Position = UDim2.new(0.1, 0, 0.2, 0)
main.BackgroundColor3 = Color3.fromRGB(40,40,40)
main.BackgroundTransparency = 0.2
main.BorderSizePixel = 0
main.Parent = gui

local speedInfo = Instance.new("TextLabel")
speedInfo.Name = "speedinfo"
speedInfo.Size = UDim2.new(1,0,0.2,0)
speedInfo.Position = UDim2.new(0,0,0,0)
speedInfo.BackgroundTransparency = 1
speedInfo.Text = "speed: 16"
speedInfo.TextColor3 = Color3.new(1,1,1)
speedInfo.TextSize = 14
speedInfo.Font = Enum.Font.SourceSans
speedInfo.Parent = main

local btnPlus = Instance.new("TextButton")
btnPlus.Name = "+"
btnPlus.Size = UDim2.new(0.5,-2,0.2,0)
btnPlus.Position = UDim2.new(0,0,0.2,0)
btnPlus.Text = "+"
btnPlus.BackgroundColor3 = Color3.fromRGB(0,150,0)
btnPlus.Parent = main

local btnMinus = Instance.new("TextButton")
btnMinus.Name = "-"
btnMinus.Size = UDim2.new(0.5,-2,0.2,0)
btnMinus.Position = UDim2.new(0.5,0,0.2,0)
btnMinus.Text = "-"
btnMinus.BackgroundColor3 = Color3.fromRGB(150,0,0)
btnMinus.Parent = main

local jpInfo = Instance.new("TextLabel")
jpInfo.Name = "jpinfo"
jpInfo.Size = UDim2.new(1,0,0.2,0)
jpInfo.Position = UDim2.new(0,0,0.4,0)
jpInfo.BackgroundTransparency = 1
jpInfo.Text = "jp: 7.2"
jpInfo.TextColor3 = Color3.new(1,1,1)
jpInfo.TextSize = 14
jpInfo.Font = Enum.Font.SourceSans
jpInfo.Parent = main

local btnPlus2 = Instance.new("TextButton")
btnPlus2.Name = "+2"
btnPlus2.Size = UDim2.new(0.5,-2,0.2,0)
btnPlus2.Position = UDim2.new(0,0,0.6,0)
btnPlus2.Text = "+2"
btnPlus2.BackgroundColor3 = Color3.fromRGB(0,150,0)
btnPlus2.Parent = main

local btnMinus2 = Instance.new("TextButton")
btnMinus2.Name = "-2"
btnMinus2.Size = UDim2.new(0.5,-2,0.2,0)
btnMinus2.Position = UDim2.new(0.5,0,0.6,0)
btnMinus2.Text = "-2"
btnMinus2.BackgroundColor3 = Color3.fromRGB(150,0,0)
btnMinus2.Parent = main

local flyBtn = Instance.new("TextButton")
flyBtn.Name = "Flybttn"
flyBtn.Size = UDim2.new(0.5,-2,0.2,0)
flyBtn.Position = UDim2.new(0,0,0.8,0)
flyBtn.Text = "FLY"
flyBtn.BackgroundColor3 = Color3.fromRGB(0,100,200)
flyBtn.Parent = main

local noclipBtn = Instance.new("TextButton")
noclipBtn.Name = "noclip"
noclipBtn.Size = UDim2.new(0.5,-2,0.2,0)
noclipBtn.Position = UDim2.new(0.5,0,0.8,0)
noclipBtn.Text = "NOCLIP"
noclipBtn.BackgroundColor3 = Color3.fromRGB(200,100,0)
noclipBtn.Parent = main

-- ========== ЛОГИКА (без отдельного LocalScript) ==========
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
btnPlus.MouseButton1Click:Connect(function() setSpeed(getSpeed() + 5) end)
btnMinus.MouseButton1Click:Connect(function() setSpeed(getSpeed() - 5) end)

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
btnPlus2.MouseButton1Click:Connect(function() setJump(getJump() + 2) end)
btnMinus2.MouseButton1Click:Connect(function() setJump(getJump() - 2) end)

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

-- Инициализация отображения
local function onChar(char)
    local hum = char:WaitForChild("Humanoid")
    updateSpeed(hum.WalkSpeed)
    updateJump(hum.JumpPower)
    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function() updateSpeed(hum.WalkSpeed) end)
    hum:GetPropertyChangedSignal("JumpPower"):Connect(function() updateJump(hum.JumpPower) end)
end
if player.Character then onChar(player.Character) else player.CharacterAdded:Connect(onChar) end

print("haxxguiv1 рабочий GUI загружен. Кнопки должны работать.")
