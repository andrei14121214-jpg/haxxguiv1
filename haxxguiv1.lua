-- haxxguiv1: HUBS с ScrollingFrame + System Broken (встроенный)
local player = game.Players.LocalPlayer
if player.PlayerGui:FindFirstChild("haxxguiv1") then player.PlayerGui.haxxguiv1:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "haxxguiv1"
gui.ResetOnSpawn = true
gui.Parent = player:WaitForChild("PlayerGui")

-- КОНТЕЙНЕР (основное окно + кнопка HUBS)
local container = Instance.new("Frame")
container.Size = UDim2.new(0, 420, 0, 170)
container.Position = UDim2.new(0.5, -210, 0.5, -85)
container.BackgroundTransparency = 1
container.Active = true
container.Draggable = true
container.Parent = gui

-- ОСНОВНОЕ ОКНО
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 395, 0, 170)
main.Position = UDim2.new(0, 25, 0, 0)
main.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
main.BackgroundTransparency = 0.2
main.Parent = container

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
speedLabel.Size = UDim2.new(0, 80, 0, 25)
speedLabel.Position = UDim2.new(0, 10, 0, 30)
speedLabel.BackgroundColor3 = Color3.new(0,0,0)
speedLabel.Text = "speed: 16"
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.TextSize = 14
speedLabel.Parent = main

local speedMinus = Instance.new("TextButton")
speedMinus.Size = UDim2.new(0, 25, 0, 25)
speedMinus.Position = UDim2.new(0, 95, 0, 30)
speedMinus.Text = "-"
speedMinus.BackgroundColor3 = Color3.fromRGB(112,112,112)
speedMinus.TextColor3 = Color3.new(0,0,0)
speedMinus.TextSize = 16
speedMinus.Parent = main

local speedPlus = Instance.new("TextButton")
speedPlus.Size = UDim2.new(0, 25, 0, 25)
speedPlus.Position = UDim2.new(0, 125, 0, 30)
speedPlus.Text = "+"
speedPlus.BackgroundColor3 = Color3.fromRGB(112,112,112)
speedPlus.TextColor3 = Color3.new(0,0,0)
speedPlus.TextSize = 16
speedPlus.Parent = main

local flyBtn = Instance.new("TextButton")
flyBtn.Size = UDim2.new(0, 55, 0, 25)
flyBtn.Position = UDim2.new(0, 170, 0, 30)
flyBtn.Text = "FLY"
flyBtn.BackgroundColor3 = Color3.new(0,0,0)
flyBtn.TextColor3 = Color3.new(1,1,1)
flyBtn.TextSize = 14
flyBtn.Parent = main

-- === Строка прыжка ===
local jpLabel = Instance.new("TextLabel")
jpLabel.Size = UDim2.new(0, 80, 0, 25)
jpLabel.Position = UDim2.new(0, 10, 0, 65)
jpLabel.BackgroundColor3 = Color3.new(0,0,0)
jpLabel.Text = "jp: 7.2"
jpLabel.TextColor3 = Color3.new(1,1,1)
jpLabel.TextSize = 14
jpLabel.Parent = main

local jumpMinus = Instance.new("TextButton")
jumpMinus.Size = UDim2.new(0, 25, 0, 25)
jumpMinus.Position = UDim2.new(0, 95, 0, 65)
jumpMinus.Text = "-"
jumpMinus.BackgroundColor3 = Color3.fromRGB(112,112,112)
jumpMinus.TextColor3 = Color3.new(0,0,0)
jumpMinus.TextSize = 16
jumpMinus.Parent = main

local jumpPlus = Instance.new("TextButton")
jumpPlus.Size = UDim2.new(0, 25, 0, 25)
jumpPlus.Position = UDim2.new(0, 125, 0, 65)
jumpPlus.Text = "+"
jumpPlus.BackgroundColor3 = Color3.fromRGB(112,112,112)
jumpPlus.TextColor3 = Color3.new(0,0,0)
jumpPlus.TextSize = 16
jumpPlus.Parent = main

local noclipBtn = Instance.new("TextButton")
noclipBtn.Size = UDim2.new(0, 70, 0, 25)
noclipBtn.Position = UDim2.new(0, 170, 0, 65)
noclipBtn.Text = "NOCLIP"
noclipBtn.BackgroundColor3 = Color3.new(0,0,0)
noclipBtn.TextColor3 = Color3.new(1,1,1)
noclipBtn.TextSize = 14
noclipBtn.Parent = main

-- === Строка FOV ===
local fovLabel = Instance.new("TextLabel")
fovLabel.Size = UDim2.new(0, 80, 0, 25)
fovLabel.Position = UDim2.new(0, 10, 0, 100)
fovLabel.BackgroundColor3 = Color3.new(0,0,0)
fovLabel.Text = "fov: 70"
fovLabel.TextColor3 = Color3.new(1,1,1)
fovLabel.TextSize = 14
fovLabel.Parent = main

local fovMinus = Instance.new("TextButton")
fovMinus.Size = UDim2.new(0, 25, 0, 25)
fovMinus.Position = UDim2.new(0, 95, 0, 100)
fovMinus.Text = "-"
fovMinus.BackgroundColor3 = Color3.fromRGB(112,112,112)
fovMinus.TextColor3 = Color3.new(0,0,0)
fovMinus.TextSize = 16
fovMinus.Parent = main

local fovPlus = Instance.new("TextButton")
fovPlus.Size = UDim2.new(0, 25, 0, 25)
fovPlus.Position = UDim2.new(0, 125, 0, 100)
fovPlus.Text = "+"
fovPlus.BackgroundColor3 = Color3.fromRGB(112,112,112)
fovPlus.TextColor3 = Color3.new(0,0,0)
fovPlus.TextSize = 16
fovPlus.Parent = main

-- === КНОПКИ ESP, AIM, INVIS ===
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, 55, 0, 25)
espBtn.Position = UDim2.new(0, 170, 0, 100)
espBtn.Text = "ESP"
espBtn.BackgroundColor3 = Color3.new(0,0,0)
espBtn.TextColor3 = Color3.new(1,1,1)
espBtn.TextSize = 12
espBtn.Parent = main

local aimBtn = Instance.new("TextButton")
aimBtn.Size = UDim2.new(0, 55, 0, 25)
aimBtn.Position = UDim2.new(0, 230, 0, 100)
aimBtn.Text = "AIM"
aimBtn.BackgroundColor3 = Color3.new(0,0,0)
aimBtn.TextColor3 = Color3.new(1,1,1)
aimBtn.TextSize = 12
aimBtn.Parent = main

local invisBtn = Instance.new("TextButton")
invisBtn.Size = UDim2.new(0, 55, 0, 25)
invisBtn.Position = UDim2.new(0, 290, 0, 100)
invisBtn.Text = "INVIS"
invisBtn.BackgroundColor3 = Color3.new(0,0,0)
invisBtn.TextColor3 = Color3.new(1,1,1)
invisBtn.TextSize = 12
invisBtn.Parent = main

-- === ВЕРТИКАЛЬНАЯ КНОПКА HUBS ===
local hubsBtn = Instance.new("TextButton")
hubsBtn.Name = "HUBS"
hubsBtn.Size = UDim2.new(0, 25, 0, 170)
hubsBtn.Position = UDim2.new(0, 0, 0, 0)
hubsBtn.Text = "HUBS"
hubsBtn.TextSize = 12
hubsBtn.TextWrapped = true
hubsBtn.BackgroundColor3 = Color3.new(0,0,0)
hubsBtn.TextColor3 = Color3.new(1,1,1)
hubsBtn.Parent = container

-- === ОКНО HUBS С ScrollingFrame ===
local hubframe = Instance.new("Frame")
hubframe.Size = UDim2.new(0, 180, 0, 170)
hubframe.Position = UDim2.new(0, container.Position.X.Offset + container.Size.X.Offset + 10, 0, container.Position.Y.Offset)
hubframe.BackgroundColor3 = Color3.fromRGB(40,40,40)
hubframe.BackgroundTransparency = 0.2
hubframe.Visible = false
hubframe.Active = true
hubframe.Draggable = true
hubframe.Parent = gui

-- Заголовок
local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1, 0, 0, 20)
hubTitle.Position = UDim2.new(0, 0, 0, 0)
hubTitle.BackgroundColor3 = Color3.new(0,0,0)
hubTitle.Text = "hubs"
hubTitle.TextColor3 = Color3.new(1,1,1)
hubTitle.TextSize = 14
hubTitle.Parent = hubframe

-- ScrollingFrame
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

-- Функция добавления кнопок
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

-- === ВСТРОЕННЫЙ System Broken (полностью рабочий) ===
addHubButton("System Broken", function()
    -- System Broken by H20Calibre
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.Neon
            v.Color = Color3.fromRGB(255, 0, 0)
            local att = Instance.new("Attachment")
            att.Parent = v
            local smoke = Instance.new("Smoke")
            smoke.Color = Color3.fromRGB(255, 0, 0)
            smoke.Opacity = 0.5
            smoke.RiseVelocity = 10
            smoke.Enabled = true
            smoke.Parent = att
            local fire = Instance.new("Fire")
            fire.Size = 5
            fire.Heat = 10
            fire.Color = Color3.fromRGB(255, 0, 0)
            fire.SecondaryColor = Color3.fromRGB(100, 0, 0)
            fire.Enabled = true
            fire.Parent = att
        end
    end
    print("System Broken activated")
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

-- Обновление размера Canvas
local function updateCanvas()
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
end
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
task.wait(0.1)
updateCanvas()

-- === ФУНКЦИЯ НЕВИДИМОСТИ ===
local invisible = false
local originalMaterials = {}
local originalTransparencies = {}

local function setInvisible(state)
    local char = player.Character
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            if state then
                if originalMaterials[part] == nil then
                    originalMaterials[part] = part.Material
                    originalTransparencies[part] = part.Transparency
                end
                part.Material = Enum.Material.ForceField
                part.Transparency = 1
                part.CastShadow = false
            else
                if originalMaterials[part] then
                    part.Material = originalMaterials[part]
                    part.Transparency = originalTransparencies[part]
                else
                    part.Material = Enum.Material.Plastic
                    part.Transparency = 0
                end
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
            if handle and handle:IsA("BasePart") then
                if state then
                    handle.CastShadow = false
                    handle.Transparency = 1
                else
                    handle.CastShadow = true
                    handle.Transparency = 0
                end
            end
        end
    end
end

invisBtn.MouseButton1Click:Connect(function()
    invisible = not invisible
    invisBtn.Text = invisible and "VISIBLE" or "INVIS"
    setInvisible(invisible)
end)

-- === ЛОГИКА СКОРОСТИ ===
local function updateSpeed(v) speedLabel.Text = "speed: " .. math.floor(v) end
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

-- === ПРЫЖОК ===
local function updateJump(v) jpLabel.Text = "jp: " .. string.format("%.1f", v) end
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

-- === FOV ===
local camera = workspace.CurrentCamera
local function updateFOV(value)
    value = math.clamp(value, 50, 120)
    camera.FieldOfView = value
    fovLabel.Text = "fov: " .. math.floor(value)
end
fovPlus.MouseButton1Click:Connect(function() updateFOV(camera.FieldOfView + 5) end)
fovMinus.MouseButton1Click:Connect(function() updateFOV(camera.FieldOfView - 5) end)

-- === FLY ===
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

-- === NOCLIP ===
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
player.CharacterAdded:Connect(function()
    if noclipOn then
        stopNoclip()
        noclipOn = false
        noclipBtn.Text = "NOCLIP"
    end
end)

-- === ESP ===
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
    for _, hl in pairs(espHighlights) do hl:Destroy() end
    espHighlights = {}
    if espConn then espConn:Disconnect() end
end
espBtn.MouseButton1Click:Connect(function()
    espActive = not espActive
    if espActive then
        espBtn.Text = "ON"
        updateESP()
        if espConn then espConn:Disconnect() end
        espConn = runService.RenderStepped:Connect(function()
            if espActive then updateESP() end
        end)
    else
        espBtn.Text = "ESP"
        disableESP()
    end
end)
player.CharacterAdded:Connect(function()
    if espActive then
        disableESP()
        task.wait(1)
        updateESP()
        if espConn then espConn:Disconnect() end
        espConn = runService.RenderStepped:Connect(function()
            if espActive then updateESP() end
        end)
    end
end)

-- === AIM ===
local aimActive = false
local aimConnection = nil
local function getClosestPlayer()
    local closest = nil
    local minDist = math.huge
    local character = player.Character
    if not character then return nil end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local myPos = hrp.Position
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local targetHrp = plr.Character:FindFirstChild("HumanoidRootPart")
            if targetHrp then
                local dist = (targetHrp.Position - myPos).Magnitude
                if dist < minDist then
                    minDist = dist
                    closest = plr
                end
            end
        end
    end
    return closest
end

local function aimAt(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local targetHrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not targetHrp then return end
    local camera = workspace.CurrentCamera
    local targetPos = targetHrp.Position + Vector3.new(0, 1.5, 0)
    local currentPos = camera.CFrame.Position
    local cf = CFrame.new(currentPos, targetPos)
    camera.CFrame = cf
end

local function startAim()
    if aimConnection then aimConnection:Disconnect() end
    aimConnection = runService.RenderStepped:Connect(function()
        if aimActive then
            local target = getClosestPlayer()
            if target then
                aimAt(target)
            end
        end
    end)
end

local function stopAim()
    if aimConnection then
        aimConnection:Disconnect()
        aimConnection = nil
    end
end

aimBtn.MouseButton1Click:Connect(function()
    aimActive = not aimActive
    if aimActive then
        aimBtn.Text = "ON"
        startAim()
    else
        aimBtn.Text = "AIM"
        stopAim()
    end
end)

player.CharacterAdded:Connect(function()
    if aimActive then
        aimActive = false
        aimBtn.Text = "AIM"
        stopAim()
    end
end)

-- === DRAG ===
local function updateHubframePosition()
    if not container or not hubframe then return end
    local contPos = container.AbsolutePosition
    local contSize = container.AbsoluteSize
    hubframe.Position = UDim2.new(0, contPos.X + contSize.X + 10, 0, contPos.Y)
end

local dragContainer = false
local dragStart, startPos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragContainer = true
        dragStart = input.Position
        startPos = container.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragContainer = false
                if hubframe.Visible then updateHubframePosition() end
            end
        end)
    end
end)
title.InputChanged:Connect(function(input)
    if dragContainer and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        container.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        if hubframe.Visible then updateHubframePosition() end
    end
end)

local hubsOpen = false
hubsBtn.MouseButton1Click:Connect(function()
    hubsOpen = not hubsOpen
    hubframe.Visible = hubsOpen
    hubsBtn.Text = hubsOpen and "←" or "HUBS"
    if hubsOpen then updateHubframePosition() end
end)

-- Обновление дисплея
local function onChar(char)
    local hum = char:WaitForChild("Humanoid")
    updateSpeed(hum.WalkSpeed)
    updateJump(hum.JumpPower)
    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function() updateSpeed(hum.WalkSpeed) end)
    hum:GetPropertyChangedSignal("JumpPower"):Connect(function() updateJump(hum.JumpPower) end)
end
if player.Character then onChar(player.Character) else player.CharacterAdded:Connect(onChar) end

print("Haxxx Gui V1: HUBS с ScrollingFrame и System Broken (встроенный) загружены")
