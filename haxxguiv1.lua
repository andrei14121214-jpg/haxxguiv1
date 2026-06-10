-- haxxguiv1 для MM2: ESP на убийцу (красный) и шерифа (синий), прыжок +1/-1, расширенные кнопки
local player = game.Players.LocalPlayer
if player.PlayerGui:FindFirstChild("haxxguiv1") then player.PlayerGui.haxxguiv1:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "haxxguiv1"
gui.ResetOnSpawn = true
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 320, 0, 140)
main.Position = UDim2.new(0.5, -160, 0.5, -70)
main.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
main.BackgroundTransparency = 0.2
main.Active = true
main.Draggable = true
main.Parent = gui

-- Заголовок
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.new(0,0,0)
title.Text = "Haxxx Gui V1"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 14
title.Parent = main

-- === Строка скорости ===
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 110, 0, 25)
speedLabel.Position = UDim2.new(0, 10, 0, 30)
speedLabel.BackgroundColor3 = Color3.new(0,0,0)
speedLabel.Text = "speed: 16"
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.TextSize = 14
speedLabel.Parent = main

local speedMinus = Instance.new("TextButton")
speedMinus.Size = UDim2.new(0, 25, 0, 25)
speedMinus.Position = UDim2.new(0, 125, 0, 30)
speedMinus.Text = "-"
speedMinus.BackgroundColor3 = Color3.fromRGB(112,112,112)
speedMinus.TextColor3 = Color3.new(0,0,0)
speedMinus.TextSize = 16
speedMinus.Parent = main

local speedPlus = Instance.new("TextButton")
speedPlus.Size = UDim2.new(0, 25, 0, 25)
speedPlus.Position = UDim2.new(0, 155, 0, 30)
speedPlus.Text = "+"
speedPlus.BackgroundColor3 = Color3.fromRGB(112,112,112)
speedPlus.TextColor3 = Color3.new(0,0,0)
speedPlus.TextSize = 16
speedPlus.Parent = main

local flyBtn = Instance.new("TextButton")
flyBtn.Size = UDim2.new(0, 55, 0, 25)
flyBtn.Position = UDim2.new(0, 200, 0, 30)
flyBtn.Text = "FLY"
flyBtn.BackgroundColor3 = Color3.new(0,0,0)
flyBtn.TextColor3 = Color3.new(1,1,1)
flyBtn.TextSize = 14
flyBtn.Parent = main

-- === Строка прыжка ===
local jpLabel = Instance.new("TextLabel")
jpLabel.Size = UDim2.new(0, 110, 0, 25)
jpLabel.Position = UDim2.new(0, 10, 0, 65)
jpLabel.BackgroundColor3 = Color3.new(0,0,0)
jpLabel.Text = "jp: 7.2"
jpLabel.TextColor3 = Color3.new(1,1,1)
jpLabel.TextSize = 14
jpLabel.Parent = main

local jumpMinus = Instance.new("TextButton")
jumpMinus.Size = UDim2.new(0, 25, 0, 25)
jumpMinus.Position = UDim2.new(0, 125, 0, 65)
jumpMinus.Text = "-"
jumpMinus.BackgroundColor3 = Color3.fromRGB(112,112,112)
jumpMinus.TextColor3 = Color3.new(0,0,0)
jumpMinus.TextSize = 16
jumpMinus.Parent = main

local jumpPlus = Instance.new("TextButton")
jumpPlus.Size = UDim2.new(0, 25, 0, 25)
jumpPlus.Position = UDim2.new(0, 155, 0, 65)
jumpPlus.Text = "+"
jumpPlus.BackgroundColor3 = Color3.fromRGB(112,112,112)
jumpPlus.TextColor3 = Color3.new(0,0,0)
jumpPlus.TextSize = 16
jumpPlus.Parent = main

local noclipBtn = Instance.new("TextButton")
noclipBtn.Size = UDim2.new(0, 70, 0, 25)
noclipBtn.Position = UDim2.new(0, 200, 0, 65)
noclipBtn.Text = "NOCLIP"
noclipBtn.BackgroundColor3 = Color3.new(0,0,0)
noclipBtn.TextColor3 = Color3.new(1,1,1)
noclipBtn.TextSize = 14
noclipBtn.Parent = main

-- === Кнопка ESP ===
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, 120, 0, 25)
espBtn.Position = UDim2.new(0.5, -60, 0, 105)
espBtn.Text = "ESP OFF"
espBtn.BackgroundColor3 = Color3.new(0,0,0)
espBtn.TextColor3 = Color3.new(1,1,1)
espBtn.TextSize = 14
espBtn.Parent = main

-- Drag
local dragEnabled = false
local dragStart, startPos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragEnabled = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragEnabled = false
            end
        end)
    end
end)
title.InputChanged:Connect(function(input)
    if dragEnabled and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

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
speedPlus.MouseButton1Click:Connect(function() setSpeed(getSpeed() + 1) end)
speedMinus.MouseButton1Click:Connect(function() setSpeed(getSpeed() - 1) end)

local function updateJump(v)
    jpLabel.Text = "jp: " .. string.format("%.1f", v)
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
jumpPlus.MouseButton1Click:Connect(function() setJump(getJump() + 1) end)
jumpMinus.MouseButton1Click:Connect(function() setJump(getJump() - 1) end)

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
local function stopNoclip()
    if noclipConn then
        noclipConn:Disconnect()
        noclipConn = nil
    end
    local char = player.Character
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
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
player.CharacterAdded:Connect(function()
    if noclipOn then
        stopNoclip()
        noclipOn = false
        noclipBtn.Text = "NOCLIP"
    end
end)

-- ========== ESP для Murder Mystery 2 (убийца – красный, шериф – синий) ==========
local function getRole(plr)
    -- Попытка получить роль через Data (наиболее часто)
    if plr:FindFirstChild("Data") and plr.Data:FindFirstChild("Role") then
        return plr.Data.Role.Value
    end
    -- Альтернативный путь через PlayerGui
    local gui = plr:FindFirstChild("PlayerGui")
    if gui then
        local mainGui = gui:FindFirstChild("MainGui")
        if mainGui and mainGui:FindFirstChild("Role") then
            return mainGui.Role.Text
        end
    end
    return nil
end

local espActive = false
local espHighlights = {}
local espConnection = nil

local function updateESP()
    if not espActive then return end
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr ~= player then
            local char = plr.Character
            if char then
                local role = getRole(plr)
                local color = nil
                if role == "Murderer" then
                    color = Color3.fromRGB(255, 0, 0) -- красный
                elseif role == "Sheriff" then
                    color = Color3.fromRGB(0, 0, 255) -- синий
                end
                if color then
                    if not espHighlights[plr] or espHighlights[plr].Parent ~= char then
                        if espHighlights[plr] then espHighlights[plr]:Destroy() end
                        local hl = Instance.new("Highlight")
                        hl.FillColor = color
                        hl.FillTransparency = 0.6
                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                        hl.OutlineTransparency = 0
                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        hl.Adornee = char
                        hl.Parent = char
                        espHighlights[plr] = hl
                    end
                else
                    if espHighlights[plr] then
                        espHighlights[plr]:Destroy()
                        espHighlights[plr] = nil
                    end
                end
            else
                if espHighlights[plr] then
                    espHighlights[plr]:Destroy()
                    espHighlights[plr] = nil
                end
            end
        end
    end
end

local function clearESP()
    for _, hl in pairs(espHighlights) do
        if hl then hl:Destroy() end
    end
    espHighlights = {}
end

local function toggleESP()
    espActive = not espActive
    espBtn.Text = espActive and "ESP ON" or "ESP OFF"
    if espActive then
        updateESP()
        if espConnection then espConnection:Disconnect() end
        espConnection = runService.RenderStepped:Connect(function()
            if espActive then updateESP() end
        end)
    else
        if espConnection then espConnection:Disconnect(); espConnection = nil end
        clearESP()
    end
end

espBtn.MouseButton1Click:Connect(toggleESP)
game.Players.PlayerRemoving:Connect(function(plr)
    if espHighlights[plr] then
        espHighlights[plr]:Destroy()
        espHighlights[plr] = nil
    end
end)
game.Players.PlayerAdded:Connect(function()
    if espActive then task.wait(0.5); updateESP() end
end)

-- Обновление дисплея при появлении персонажа
local function onChar(char)
    local hum = char:WaitForChild("Humanoid")
    updateSpeed(hum.WalkSpeed)
    updateJump(hum.JumpPower)
    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function() updateSpeed(hum.WalkSpeed) end)
    hum:GetPropertyChangedSignal("JumpPower"):Connect(function() updateJump(hum.JumpPower) end)
end
if player.Character then onChar(player.Character) else player.CharacterAdded:Connect(onChar) end

print("MM2 GUI: скорость +/-1, прыжок +/-1, ESP на убийцу (красный) и шерифа (синий), кнопки исправлены.")
