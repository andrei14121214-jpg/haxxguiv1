-- haxxguiv1 с улучшенным ESP (игроки + NPC, HP, ники, цвета команд)
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

-- Заголовок (для перетаскивания)
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
speedLabel.Size = UDim2.new(0, 100, 0, 25)
speedLabel.Position = UDim2.new(0, 10, 0, 30)
speedLabel.BackgroundColor3 = Color3.new(0,0,0)
speedLabel.Text = "speed: 16"
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.TextSize = 14
speedLabel.Parent = main

local speedMinus = Instance.new("TextButton")
speedMinus.Size = UDim2.new(0, 25, 0, 25)
speedMinus.Position = UDim2.new(0, 115, 0, 30)
speedMinus.Text = "-"
speedMinus.BackgroundColor3 = Color3.fromRGB(112,112,112)
speedMinus.TextColor3 = Color3.new(0,0,0)
speedMinus.TextSize = 16
speedMinus.Parent = main

local speedPlus = Instance.new("TextButton")
speedPlus.Size = UDim2.new(0, 25, 0, 25)
speedPlus.Position = UDim2.new(0, 145, 0, 30)
speedPlus.Text = "+"
speedPlus.BackgroundColor3 = Color3.fromRGB(112,112,112)
speedPlus.TextColor3 = Color3.new(0,0,0)
speedPlus.TextSize = 16
speedPlus.Parent = main

local flyBtn = Instance.new("TextButton")
flyBtn.Size = UDim2.new(0, 55, 0, 25)
flyBtn.Position = UDim2.new(0, 190, 0, 30)
flyBtn.Text = "FLY"
flyBtn.BackgroundColor3 = Color3.new(0,0,0)
flyBtn.TextColor3 = Color3.new(1,1,1)
flyBtn.TextSize = 14
flyBtn.Parent = main

-- === Строка прыжка ===
local jpLabel = Instance.new("TextLabel")
jpLabel.Size = UDim2.new(0, 100, 0, 25)
jpLabel.Position = UDim2.new(0, 10, 0, 65)
jpLabel.BackgroundColor3 = Color3.new(0,0,0)
jpLabel.Text = "jp: 7.2"
jpLabel.TextColor3 = Color3.new(1,1,1)
jpLabel.TextSize = 14
jpLabel.Parent = main

local jumpMinus = Instance.new("TextButton")
jumpMinus.Size = UDim2.new(0, 25, 0, 25)
jumpMinus.Position = UDim2.new(0, 115, 0, 65)
jumpMinus.Text = "-"
jumpMinus.BackgroundColor3 = Color3.fromRGB(112,112,112)
jumpMinus.TextColor3 = Color3.new(0,0,0)
jumpMinus.TextSize = 16
jumpMinus.Parent = main

local jumpPlus = Instance.new("TextButton")
jumpPlus.Size = UDim2.new(0, 25, 0, 25)
jumpPlus.Position = UDim2.new(0, 145, 0, 65)
jumpPlus.Text = "+"
jumpPlus.BackgroundColor3 = Color3.fromRGB(112,112,112)
jumpPlus.TextColor3 = Color3.new(0,0,0)
jumpPlus.TextSize = 16
jumpPlus.Parent = main

local noclipBtn = Instance.new("TextButton")
noclipBtn.Size = UDim2.new(0, 70, 0, 25)
noclipBtn.Position = UDim2.new(0, 190, 0, 65)
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

-- Drag (перетаскивание)
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

-- ========== ЛОГИКА СКОРОСТИ ==========
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

-- ========== ЛОГИКА ПРЫЖКА (шаг +1/-1) ==========
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

-- ========== FLY ==========
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

-- ========== NOCLIP ==========
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

-- ========== УЛУЧШЕННЫЙ ESP (игроки + NPC, HP, цвета команд) ==========
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local espEnabled = false
local allConnections = {}
local espObjects = {}

local DEFAULT_COLOR = Color3.new(1, 1, 1)
local NPC_COLOR = Color3.fromRGB(255, 165, 0)

local function getPlayerColor(plr)
    if plr.Team then
        return plr.Team.TeamColor.Color
    end
    return DEFAULT_COLOR
end

local function getDisplayName(key, model)
    if typeof(key) == "userdata" and key:IsA("Player") then
        return key.DisplayName
    end
    return model.Name
end

local function getEspColor(key)
    if typeof(key) == "userdata" and key:IsA("Player") then
        return getPlayerColor(key)
    end
    if typeof(key) == "string" then
        local model = workspace:FindFirstChild(key)
        if model then
            local attr = model:GetAttribute("EspColor")
            if attr then
                local r = tonumber(attr:match("(%d+),%d+,%d+")) or 255
                local g = tonumber(attr:match("%d+,(%d+),%d+")) or 165
                local b = tonumber(attr:match("%d+,%d+,(%d+)")) or 0
                return Color3.fromRGB(r, g, b)
            end
        end
    end
    return NPC_COLOR
end

local function removeEsp(key)
    local data = espObjects[key]
    if not data then return end
    if data.highlight then data.highlight:Destroy() end
    if data.billboard then data.billboard:Destroy() end
    espObjects[key] = nil
end

local function createEsp(key, model)
    if not model then return end
    if typeof(key) == "userdata" and key == player then return end
    if model == player.Character then return end
    removeEsp(key)
    local humanoid = model:FindFirstChildOfClass("Humanoid")
    local head = model:FindFirstChild("Head")
    if not humanoid then return end
    local color = getEspColor(key)
    local highlight = Instance.new("Highlight")
    highlight.Name = "EspHighlight"
    highlight.FillTransparency = 0.7
    highlight.OutlineTransparency = 0
    highlight.FillColor = color
    highlight.OutlineColor = color
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = model
    local billboard = nil
    local nameLabel = nil
    local healthLabel = nil
    if head then
        billboard = Instance.new("BillboardGui")
        billboard.Name = "EspBillboard"
        billboard.Adornee = head
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.MaxDistance = 500
        billboard.Parent = model
        nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        nameLabel.Position = UDim2.new(0, 0, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = getDisplayName(key, model)
        nameLabel.TextColor3 = color
        nameLabel.TextStrokeTransparency = 0.3
        nameLabel.TextStrokeColor3 = Color3.new(0,0,0)
        nameLabel.TextScaled = true
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.Parent = billboard
        healthLabel = Instance.new("TextLabel")
        healthLabel.Name = "HealthLabel"
        healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
        healthLabel.Position = UDim2.new(0, 0, 0.5, 0)
        healthLabel.BackgroundTransparency = 1
        healthLabel.Text = "HP: " .. math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
        healthLabel.TextColor3 = Color3.fromRGB(0,255,0)
        healthLabel.TextStrokeTransparency = 0.3
        healthLabel.TextStrokeColor3 = Color3.new(0,0,0)
        healthLabel.TextScaled = true
        healthLabel.Font = Enum.Font.GothamBold
        healthLabel.Parent = billboard
    end
    espObjects[key] = { model = model, highlight = highlight, billboard = billboard, nameLabel = nameLabel, healthLabel = healthLabel }
end

local function updateEspColor(key)
    local data = espObjects[key]
    if not data then return end
    local color = getEspColor(key)
    if data.highlight then
        data.highlight.FillColor = color
        data.highlight.OutlineColor = color
    end
    if data.nameLabel then
        data.nameLabel.TextColor3 = color
    end
end

local function updateHealth(key)
    local data = espObjects[key]
    if not data or not data.healthLabel then return end
    local model = data.model
    if not model or model.Parent == nil then return end
    local humanoid = model:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    local hp = math.floor(humanoid.Health)
    local maxHp = math.floor(humanoid.MaxHealth)
    data.healthLabel.Text = "HP: " .. hp .. "/" .. maxHp
    local ratio = humanoid.Health / humanoid.MaxHealth
    if ratio > 0.5 then
        data.healthLabel.TextColor3 = Color3.fromRGB(0,255,0)
    elseif ratio > 0.25 then
        data.healthLabel.TextColor3 = Color3.fromRGB(255,255,0)
    else
        data.healthLabel.TextColor3 = Color3.fromRGB(255,0,0)
    end
end

local function getPlayerFromModel(model)
    for _, pl in ipairs(Players:GetPlayers()) do
        if pl.Character == model then
            return pl
        end
    end
    return nil
end

local function scanNpcs()
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant:IsA("Model") and descendant:FindFirstChildOfClass("Humanoid") then
            local pl = getPlayerFromModel(descendant)
            if not pl and descendant ~= player.Character then
                createEsp(descendant.Name, descendant)
            end
        end
    end
end

local function setupPlayerTracking(pl)
    if pl == player then return end
    local charConn = pl.CharacterAdded:Connect(function(character)
        if espEnabled then
            task.wait(0.5)
            createEsp(pl, character)
        end
    end)
    local teamConn = pl:GetPropertyChangedSignal("Team"):Connect(function()
        if espEnabled then
            updateEspColor(pl)
        end
    end)
    if pl.Character then
        task.wait(0.1)
        createEsp(pl, pl.Character)
    end
    table.insert(allConnections, charConn)
    table.insert(allConnections, teamConn)
end

local function enableEsp()
    espEnabled = true
    for _, pl in ipairs(Players:GetPlayers()) do
        setupPlayerTracking(pl)
    end
    local playerAddedConn = Players.PlayerAdded:Connect(function(pl)
        if espEnabled then setupPlayerTracking(pl) end
    end)
    local playerRemovingConn = Players.PlayerRemoving:Connect(function(pl)
        removeEsp(pl)
    end)
    table.insert(allConnections, playerAddedConn)
    table.insert(allConnections, playerRemovingConn)
    scanNpcs()
    local npcAddedConn = workspace.DescendantAdded:Connect(function(desc)
        if not espEnabled then return end
        if desc:IsA("Humanoid") then
            task.wait(0.5)
            local model = desc.Parent
            if model and model:IsA("Model") then
                local pl = getPlayerFromModel(model)
                if not pl and model ~= player.Character then
                    createEsp(model.Name, model)
                end
            end
        end
    end)
    local npcRemovingConn = workspace.DescendantRemoving:Connect(function(desc)
        if desc:IsA("Model") and espObjects[desc.Name] then
            removeEsp(desc.Name)
        end
    end)
    local healthLoopConn = RunService.Heartbeat:Connect(function()
        if not espEnabled then return end
        for k, _ in pairs(espObjects) do
            updateHealth(k)
        end
    end)
    table.insert(allConnections, npcAddedConn)
    table.insert(allConnections, npcRemovingConn)
    table.insert(allConnections, healthLoopConn)
end

local function disableEsp()
    espEnabled = false
    for key, _ in pairs(espObjects) do
        removeEsp(key)
    end
    for _, conn in ipairs(allConnections) do
        pcall(function() conn:Disconnect() end)
    end
    allConnections = {}
end

espBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        espBtn.Text = "ESP ON"
        enableEsp()
    else
        espBtn.Text = "ESP OFF"
        disableEsp()
    end
end)

player.CharacterAdded:Connect(function()
    if espEnabled then
        disableEsp()
        task.wait(1)
        enableEsp()
    end
end)

-- Обновление отображения скорости и прыжка при появлении персонажа
local function onChar(char)
    local hum = char:WaitForChild("Humanoid")
    updateSpeed(hum.WalkSpeed)
    updateJump(hum.JumpPower)
    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function() updateSpeed(hum.WalkSpeed) end)
    hum:GetPropertyChangedSignal("JumpPower"):Connect(function() updateJump(hum.JumpPower) end)
end
if player.Character then onChar(player.Character) else player.CharacterAdded:Connect(onChar) end

print("Haxxx Gui V1 загружен: скорость +1/-1, прыжок +1/-1, FLY, NOCLIP, улучшенный ESP (игроки + NPC, HP, цвета команд)")
