-- haxxguiv1: кнопка KNIFE (удалён MORPH), исправлены вылезания текста
local player = game.Players.LocalPlayer
if player.PlayerGui:FindFirstChild("haxxguiv1") then player.PlayerGui.haxxguiv1:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "haxxguiv1"
gui.ResetOnSpawn = true
gui.Parent = player:WaitForChild("PlayerGui")

-- КОНТЕЙНЕР (основное окно + кнопка HUBS)
local container = Instance.new("Frame")
container.Size = UDim2.new(0, 370, 0, 170)  -- шире на 25
container.Position = UDim2.new(0.5, -185, 0.5, -85)
container.BackgroundTransparency = 1
container.Active = true
container.Draggable = true
container.Parent = gui

-- ОСНОВНОЕ ОКНО
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 345, 0, 170)  -- шире
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

-- === КНОПКИ ESP, INVIS, KNIFE (шире, чтобы текст влезал) ===
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, 70, 0, 25)
espBtn.Position = UDim2.new(0, 10, 0, 100)
espBtn.Text = "ESP OFF"
espBtn.BackgroundColor3 = Color3.new(0,0,0)
espBtn.TextColor3 = Color3.new(1,1,1)
espBtn.TextSize = 12
espBtn.Parent = main

local invisBtn = Instance.new("TextButton")
invisBtn.Size = UDim2.new(0, 70, 0, 25)
invisBtn.Position = UDim2.new(0, 90, 0, 100)
invisBtn.Text = "INVIS"
invisBtn.BackgroundColor3 = Color3.new(0,0,0)
invisBtn.TextColor3 = Color3.new(1,1,1)
invisBtn.TextSize = 12
invisBtn.Parent = main

local knifeBtn = Instance.new("TextButton")
knifeBtn.Size = UDim2.new(0, 70, 0, 25)
knifeBtn.Position = UDim2.new(0, 170, 0, 100)
knifeBtn.Text = "KNIFE"
knifeBtn.BackgroundColor3 = Color3.new(0,0,0)
knifeBtn.TextColor3 = Color3.new(1,1,1)
knifeBtn.TextSize = 12
knifeBtn.Parent = main

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

-- === ОКНО HUBS ===
local hubframe = Instance.new("Frame")
hubframe.Size = UDim2.new(0, 150, 0, 170)
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

local iyBtn = Instance.new("TextButton")
iyBtn.Size = UDim2.new(0, 130, 0, 30)
iyBtn.Position = UDim2.new(0.5, -65, 0, 40)
iyBtn.Text = "Infinity Yield"
iyBtn.BackgroundColor3 = Color3.new(0,0,0)
iyBtn.TextColor3 = Color3.new(1,1,1)
iyBtn.TextSize = 14
iyBtn.Parent = hubframe

iyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
end)

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

-- === НОЖ (Tool) ===
local knife = nil
local function giveKnife()
    if knife and knife.Parent then
        knife:Destroy()
    end
    
    knife = Instance.new("Tool")
    knife.Name = "Knife"
    knife.RequiresHandle = true
    knife.CanBeDropped = false
    knife.Parent = player.Backpack
    
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(0.5, 0.1, 1.2)
    handle.Shape = Enum.PartType.Block
    handle.Material = Enum.Material.Metal
    handle.Color = Color3.fromRGB(192, 192, 192)
    handle.CanCollide = false
    handle.Parent = knife
    
    local blade = Instance.new("Part")
    blade.Name = "Blade"
    blade.Size = Vector3.new(0.4, 0.05, 1.5)
    blade.Position = Vector3.new(0, 0, 0.8)
    blade.Material = Enum.Material.Metal
    blade.Color = Color3.fromRGB(220, 220, 255)
    blade.CanCollide = false
    blade.Parent = handle
    
    knife.Handle = handle
    
    local debounce = false
    knife.Activated:Connect(function()
        if debounce then return end
        debounce = true
        
        local char = player.Character
        if char and handle then
            local originalCF = handle.CFrame
            handle.CFrame = handle.CFrame * CFrame.Angles(0, 0, math.rad(-60))
            task.wait(0.05)
            handle.CFrame = originalCF
            task.wait(0.1)
            
            for _, plr in ipairs(game.Players:GetPlayers()) do
                if plr ~= player and plr.Character then
                    local targetChar = plr.Character
                    local hrp = targetChar:FindFirstChild("HumanoidRootPart")
                    if hrp and (hrp.Position - handle.Position).Magnitude < 5 then
                        local humanoid = targetChar:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:TakeDamage(20)
                            local blood = Instance.new("ParticleEmitter")
                            blood.Rate = 50
                            blood.Lifetime = NumberRange.new(0.5)
                            blood.SpreadAngle = Vector2.new(360, 360)
                            blood.Speed = NumberRange.new(2)
                            blood.Parent = handle
                            task.wait(0.2)
                            blood:Destroy()
                        end
                    end
                end
            end
        end
        
        task.wait(0.3)
        debounce = false
    end)
    
    knifeBtn.Text = "KNIFE OUT"
end

local function removeKnife()
    if knife then
        knife:Destroy()
        knife = nil
    end
    knifeBtn.Text = "KNIFE"
end

knifeBtn.MouseButton1Click:Connect(function()
    if not knife or knife.Parent == nil then
        giveKnife()
    else
        removeKnife()
    end
end)

player.CharacterAdded:Connect(function()
    if knife then
        removeKnife()
    end
    invisible = false
    invisBtn.Text = "INVIS"
    originalMaterials = {}
    originalTransparencies = {}
end)

-- ========== ЛОГИКА (speed, jump, fly, noclip, esp) ==========
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

-- ESP
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
    espBtn.Text = espActive and "ESP ON" or "ESP OFF"
    if espActive then
        updateESP()
        if espConn then espConn:Disconnect() end
        espConn = runService.RenderStepped:Connect(function()
            if espActive then updateESP() end
        end)
    else
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

-- === Функции перемещения контейнера и окна HUBS ===
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

-- Обновление отображения при появлении персонажа
local function onChar(char)
    local hum = char:WaitForChild("Humanoid")
    updateSpeed(hum.WalkSpeed)
    updateJump(hum.JumpPower)
    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function() updateSpeed(hum.WalkSpeed) end)
    hum:GetPropertyChangedSignal("JumpPower"):Connect(function() updateJump(hum.JumpPower) end)
end
if player.Character then onChar(player.Character) else player.CharacterAdded:Connect(onChar) end

print("Haxxx Gui V1: кнопка MORPH удалена, добавлена KNIFE, текст не вылезает")
