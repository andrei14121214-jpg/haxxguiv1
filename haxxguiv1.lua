loadstring([[
local player = game.Players.LocalPlayer
if player.PlayerGui:FindFirstChild("HaxGui") then player.PlayerGui.HaxGui:Destroy() end
local gui = Instance.new("ScreenGui")
gui.Name = "HaxGui"
gui.ResetOnSpawn = true
gui.Parent = player.PlayerGui
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 300, 0, 180)
main.Position = UDim2.new(0.5, -150, 0.5, -90)
main.BackgroundColor3 = Color3.fromRGB(50,50,50)
main.BackgroundTransparency = 0.3
main.Active = true
main.Draggable = true
main.Parent = gui
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,20)
title.BackgroundColor3 = Color3.new(0,0,0)
title.Text = "Haxxx Gui V1"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 14
title.Parent = main

local speedL = Instance.new("TextLabel")
speedL.Size = UDim2.new(0,100,0,25)
speedL.Position = UDim2.new(0,10,0,30)
speedL.BackgroundColor3 = Color3.new(0,0,0)
speedL.Text = "speed: 16"
speedL.TextColor3 = Color3.new(1,1,1)
speedL.Parent = main
local minusSp = Instance.new("TextButton")
minusSp.Size = UDim2.new(0,25,0,25)
minusSp.Position = UDim2.new(0,115,0,30)
minusSp.Text = "-"
minusSp.BackgroundColor3 = Color3.fromRGB(112,112,112)
minusSp.Parent = main
local plusSp = Instance.new("TextButton")
plusSp.Size = UDim2.new(0,25,0,25)
plusSp.Position = UDim2.new(0,145,0,30)
plusSp.Text = "+"
plusSp.BackgroundColor3 = Color3.fromRGB(112,112,112)
plusSp.Parent = main
local fly = Instance.new("TextButton")
fly.Size = UDim2.new(0,55,0,25)
fly.Position = UDim2.new(0,190,0,30)
fly.Text = "FLY"
fly.BackgroundColor3 = Color3.new(0,0,0)
fly.TextColor3 = Color3.new(1,1,1)
fly.Parent = main

local jpL = Instance.new("TextLabel")
jpL.Size = UDim2.new(0,100,0,25)
jpL.Position = UDim2.new(0,10,0,65)
jpL.BackgroundColor3 = Color3.new(0,0,0)
jpL.Text = "jp: 7.2"
jpL.TextColor3 = Color3.new(1,1,1)
jpL.Parent = main
local minusJp = Instance.new("TextButton")
minusJp.Size = UDim2.new(0,25,0,25)
minusJp.Position = UDim2.new(0,115,0,65)
minusJp.Text = "-"
minusJp.BackgroundColor3 = Color3.fromRGB(112,112,112)
minusJp.Parent = main
local plusJp = Instance.new("TextButton")
plusJp.Size = UDim2.new(0,25,0,25)
plusJp.Position = UDim2.new(0,145,0,65)
plusJp.Text = "+"
plusJp.BackgroundColor3 = Color3.fromRGB(112,112,112)
plusJp.Parent = main
local noclip = Instance.new("TextButton")
noclip.Size = UDim2.new(0,70,0,25)
noclip.Position = UDim2.new(0,190,0,65)
noclip.Text = "NOCLIP"
noclip.BackgroundColor3 = Color3.new(0,0,0)
noclip.TextColor3 = Color3.new(1,1,1)
noclip.Parent = main

local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0,100,0,25)
espBtn.Position = UDim2.new(0,10,0,100)
espBtn.Text = "ESP OFF"
espBtn.BackgroundColor3 = Color3.new(0,0,0)
espBtn.TextColor3 = Color3.new(1,1,1)
espBtn.Parent = main

local hubs = Instance.new("TextButton")
hubs.Size = UDim2.new(0,100,0,25)
hubs.Position = UDim2.new(0,120,0,100)
hubs.Text = "HUBS"
hubs.BackgroundColor3 = Color3.new(0,0,0)
hubs.TextColor3 = Color3.new(1,1,1)
hubs.Parent = main

-- Хабфрейм
local hubFrame = Instance.new("Frame")
hubFrame.Size = UDim2.new(0,150,0,180)
hubFrame.Position = UDim2.new(0, main.Position.X.Offset + main.Size.X.Offset + 10, main.Position.Y.Scale, main.Position.Y.Offset)
hubFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
hubFrame.BackgroundTransparency = 0.2
hubFrame.Visible = false
hubFrame.Parent = gui
local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1,0,0,20)
hubTitle.BackgroundColor3 = Color3.new(0,0,0)
hubTitle.Text = "hubs"
hubTitle.TextColor3 = Color3.new(1,1,1)
hubTitle.Parent = hubFrame
local hubContent = Instance.new("TextLabel")
hubContent.Size = UDim2.new(1,0,1,-20)
hubContent.Position = UDim2.new(0,0,0,20)
hubContent.BackgroundTransparency = 1
hubContent.Text = "Содержимое хабов"
hubContent.TextColor3 = Color3.new(1,1,1)
hubContent.Parent = hubFrame

-- Перетаскивание
local drag = false
local dragStart, startPos
title.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = true
        dragStart = inp.Position
        startPos = main.Position
        inp.Changed:Connect(function()
            if inp.UserInputState == Enum.UserInputState.End then drag = false end
        end)
    end
end)
title.InputChanged:Connect(function(inp)
    if drag and inp.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = inp.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        hubFrame.Position = UDim2.new(0, main.Position.X.Offset + main.Size.X.Offset + 10, main.Position.Y.Scale, main.Position.Y.Offset)
    end
end)

-- Логика скорости
local function updateSpeed(v) speedL.Text = "speed: " .. math.floor(v) end
local function getSpeed() local c = player.Character if not c then return 16 end local h = c:FindFirstChild("Humanoid") return h and h.WalkSpeed or 16 end
local function setSpeed(v) v = math.clamp(v,0,500) local c = player.Character if c then local h = c:FindFirstChild("Humanoid") if h then h.WalkSpeed = v updateSpeed(v) end end end
plusSp.MouseButton1Click:Connect(function() setSpeed(getSpeed()+1) end)
minusSp.MouseButton1Click:Connect(function() setSpeed(getSpeed()-1) end)

-- Прыжок +1/-1
local function updateJump(v) jpL.Text = "jp: " .. string.format("%.1f", v) end
local function getJump() local c = player.Character if not c then return 7.2 end local h = c:FindFirstChild("Humanoid") return h and h.JumpPower or 7.2 end
local function setJump(v) v = math.clamp(v,7.2,200) local c = player.Character if c then local h = c:FindFirstChild("Humanoid") if h then h.UseJumpPower = true h.JumpPower = v updateJump(v) end end end
plusJp.MouseButton1Click:Connect(function() setJump(getJump()+1) end)
minusJp.MouseButton1Click:Connect(function() setJump(getJump()-1) end)

-- FLY
local flying = false
local bv, bg, conn
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local function startFly()
    local c = player.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    local hum = c:FindFirstChildOfClass("Humanoid")
    if not hrp then return end
    if hum then hum.PlatformStand = true hum:ChangeState(Enum.HumanoidStateType.Freefall) end
    bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
    bg.P = 9e4
    bg.D = 1000
    bg.Parent = hrp
    bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(9e9,9e9,9e9)
    bv.Velocity = Vector3.new(0,5,0)
    bv.Parent = hrp
    conn = rs.RenderStepped:Connect(function()
        if not flying then return end
        local cam = workspace.CurrentCamera
        local cf = cam.CFrame
        bg.CFrame = cf
        local move = Vector3.new(0,0,0)
        if uis:IsKeyDown(Enum.KeyCode.W) then move = move + cf.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.S) then move = move - cf.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.A) then move = move - cf.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.D) then move = move + cf.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
        if uis:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0,1,0) end
        if move.Magnitude > 0 then move = move.Unit * 80 end
        bv.Velocity = move
    end)
end
local function stopFly()
    if bg then bg:Destroy() end
    if bv then bv:Destroy() end
    if conn then conn:Disconnect() end
    local c = player.Character
    if c then
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false hum:ChangeState(Enum.HumanoidStateType.Landed) end
    end
end
fly.MouseButton1Click:Connect(function()
    flying = not flying
    fly.Text = flying and "UNFLY" or "FLY"
    if flying then startFly() else stopFly() end
end)
player.CharacterAdded:Connect(function()
    if flying then stopFly() flying = false fly.Text = "FLY" end
end)

-- NOCLIP
local noclipOn = false
local noclipConn
local function noclipLoop()
    if not noclipOn then return end
    local c = player.Character
    if not c then return end
    for _, part in pairs(c:GetDescendants()) do
        if part:IsA("BasePart") then part.CanCollide = false end
    end
end
local function stopNoclip()
    if noclipConn then noclipConn:Disconnect() end
    local c = player.Character
    if c then
        for _, part in pairs(c:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = true end
        end
    end
end
noclip.MouseButton1Click:Connect(function()
    noclipOn = not noclipOn
    noclip.Text = noclipOn and "CLIP" or "NOCLIP"
    if noclipOn then
        if noclipConn then noclipConn:Disconnect() end
        noclipConn = rs.Stepped:Connect(noclipLoop)
    else
        stopNoclip()
    end
end)
player.CharacterAdded:Connect(function()
    if noclipOn then
        stopNoclip()
        noclipOn = false
        noclip.Text = "NOCLIP"
    end
end)

-- ESP (простой)
local espActive = false
local highlights = {}
local function updateESP()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            if not highlights[plr] then
                local hl = Instance.new("Highlight")
                hl.FillColor = Color3.fromRGB(255,0,0)
                hl.FillTransparency = 0.6
                hl.OutlineColor = Color3.new(1,1,0)
                hl.Adornee = plr.Character
                hl.Parent = plr.Character
                highlights[plr] = hl
            end
        elseif highlights[plr] then
            highlights[plr]:Destroy()
            highlights[plr] = nil
        end
    end
end
local function clearESP()
    for _, hl in pairs(highlights) do hl:Destroy() end
    highlights = {}
end
espBtn.MouseButton1Click:Connect(function()
    espActive = not espActive
    espBtn.Text = espActive and "ESP ON" or "ESP OFF"
    if espActive then
        updateESP()
        if not espConn then
            espConn = rs.RenderStepped:Connect(function()
                if espActive then updateESP() end
            end)
        end
    else
        if espConn then espConn:Disconnect() espConn = nil end
        clearESP()
    end
end)

-- HUBS
local hubsOpen = false
hubs.MouseButton1Click:Connect(function()
    hubsOpen = not hubsOpen
    hubFrame.Visible = hubsOpen
    hubs.Text = hubsOpen and "HUBS ↑" or "HUBS"
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

print("Haxxx Gui V1 запущен (упрощённая версия)")
]])()
