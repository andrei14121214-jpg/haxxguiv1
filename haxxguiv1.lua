--[[
    ПОЛНЫЙ СКРИПТ ДЛЯ LOADSTRING
    Создаёт GUI "haxxguiv1" со всеми функциями:
    - speed (+ / -) шаг 5, мин 0 макс 500
    - jp (+2 / -2) шаг 2, мин 7.2 макс 200
    - FLY (переключатель, управление W A S D Space Ctrl)
    - NOCLIP (переключатель)
    Использует улучшенный код полёта и ноклипа из предоставленных скриптов.
    Вставь этот текст целиком на pastebin (raw) и выполняй:
    loadstring(game:HttpGet("ссылка_на_raw"))()
--]]

local player = game.Players.LocalPlayer

-- Удаляем старый GUI, если есть
local oldGui = player.PlayerGui:FindFirstChild("haxxguiv1")
if oldGui then oldGui:Destroy() end

-- Создаём ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "haxxguiv1"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Фрейм main
local main = Instance.new("Frame")
main.Name = "main"
main.Size = UDim2.new(0, 200, 0, 160)
main.Position = UDim2.new(0.1, 0, 0.2, 0)
main.BackgroundColor3 = Color3.fromRGB(40,40,40)
main.BackgroundTransparency = 0.2
main.BorderSizePixel = 0
main.Parent = gui

-- speedinfo (TextLabel)
local speedInfo = Instance.new("TextLabel")
speedInfo.Name = "speedinfo"
speedInfo.Size = UDim2.new(1,0, 0.2,0)
speedInfo.Position = UDim2.new(0,0, 0,0)
speedInfo.BackgroundTransparency = 1
speedInfo.Text = "speed: 16"
speedInfo.TextColor3 = Color3.new(1,1,1)
speedInfo.TextSize = 14
speedInfo.Font = Enum.Font.SourceSans
speedInfo.Parent = main

-- Кнопка "+"
local btnPlus = Instance.new("TextButton")
btnPlus.Name = "+"
btnPlus.Size = UDim2.new(0.5,-2, 0.2,0)
btnPlus.Position = UDim2.new(0,0, 0.2,0)
btnPlus.Text = "+"
btnPlus.BackgroundColor3 = Color3.fromRGB(0,150,0)
btnPlus.Parent = main

-- Кнопка "-"
local btnMinus = Instance.new("TextButton")
btnMinus.Name = "-"
btnMinus.Size = UDim2.new(0.5,-2, 0.2,0)
btnMinus.Position = UDim2.new(0.5,0, 0.2,0)
btnMinus.Text = "-"
btnMinus.BackgroundColor3 = Color3.fromRGB(150,0,0)
btnMinus.Parent = main

-- jpinfo (TextLabel)
local jpInfo = Instance.new("TextLabel")
jpInfo.Name = "jpinfo"
jpInfo.Size = UDim2.new(1,0, 0.2,0)
jpInfo.Position = UDim2.new(0,0, 0.4,0)
jpInfo.BackgroundTransparency = 1
jpInfo.Text = "jp: 7.2"
jpInfo.TextColor3 = Color3.new(1,1,1)
jpInfo.TextSize = 14
jpInfo.Font = Enum.Font.SourceSans
jpInfo.Parent = main

-- Кнопка "+2"
local btnPlus2 = Instance.new("TextButton")
btnPlus2.Name = "+2"
btnPlus2.Size = UDim2.new(0.5,-2, 0.2,0)
btnPlus2.Position = UDim2.new(0,0, 0.6,0)
btnPlus2.Text = "+2"
btnPlus2.BackgroundColor3 = Color3.fromRGB(0,150,0)
btnPlus2.Parent = main

-- Кнопка "-2"
local btnMinus2 = Instance.new("TextButton")
btnMinus2.Name = "-2"
btnMinus2.Size = UDim2.new(0.5,-2, 0.2,0)
btnMinus2.Position = UDim2.new(0.5,0, 0.6,0)
btnMinus2.Text = "-2"
btnMinus2.BackgroundColor3 = Color3.fromRGB(150,0,0)
btnMinus2.Parent = main

-- Кнопка Flybttn
local flyBtn = Instance.new("TextButton")
flyBtn.Name = "Flybttn"
flyBtn.Size = UDim2.new(0.5,-2, 0.2,0)
flyBtn.Position = UDim2.new(0,0, 0.8,0)
flyBtn.Text = "FLY"
flyBtn.BackgroundColor3 = Color3.fromRGB(0,100,200)
flyBtn.Parent = main

-- Кнопка noclip
local noclipBtn = Instance.new("TextButton")
noclipBtn.Name = "noclip"
noclipBtn.Size = UDim2.new(0.5,-2, 0.2,0)
noclipBtn.Position = UDim2.new(0.5,0, 0.8,0)
noclipBtn.Text = "NOCLIP"
noclipBtn.BackgroundColor3 = Color3.fromRGB(200,100,0)
noclipBtn.Parent = main

-- Объединённый LocalScript со всей логикой
local controller = Instance.new("LocalScript")
controller.Name = "Controller"
controller.Source = [=[
    local player = game.Players.LocalPlayer
    local main = script.Parent
    local speedInfo = main:WaitForChild("speedinfo")
    local btnPlus = main:WaitForChild("+")
    local btnMinus = main:WaitForChild("-")
    local jpInfo = main:WaitForChild("jpinfo")
    local btnPlus2 = main:WaitForChild("+2")
    local btnMinus2 = main:WaitForChild("-2")
    local flyBtn = main:WaitForChild("Flybttn")
    local noclipBtn = main:WaitForChild("noclip")

    -- ========== SPEED ==========
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

    -- ========== JUMP POWER ==========
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

    -- ========== FLY (улучшенный из твоего скрипта) ==========
    local flying = false
    local bodyGyro, bodyVelocity, flyConnection
    local flySpeed = 80

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
        bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bodyGyro.P = 9e4
        bodyGyro.D = 1000
        bodyGyro.Parent = hrp
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bodyVelocity.Velocity = Vector3.new(0, 5, 0)
        bodyVelocity.Parent = hrp
        flyConnection = game:GetService("RunService").RenderStepped:Connect(function()
            if not flying then return end
            local camera = workspace.CurrentCamera
            local camCF = camera.CFrame
            local lookVector = camCF.LookVector
            bodyGyro.CFrame = camCF
            local moveDir = Vector3.new(0,0,0)
            local uis = game:GetService("UserInputService")
            if uis:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + lookVector end
            if uis:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - lookVector end
            if uis:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCF.RightVector end
            if uis:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCF.RightVector end
            if uis:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0,1,0) end
            if uis:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0,1,0) end
            if moveDir.Magnitude > 0 then moveDir = moveDir.Unit * flySpeed end
            bodyVelocity.Velocity = moveDir
        end)
    end

    local function stopFly()
        if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
        if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
        if flyConnection then flyConnection:Disconnect() flyConnection = nil end
        local char = player.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.PlatformStand = false
                hum:ChangeState(Enum.HumanoidStateType.Landed)
            end
        end
    end

    local function toggleFly()
        flying = not flying
        if flying then
            flyBtn.Text = "UNFLY"
            startFly()
        else
            flyBtn.Text = "FLY"
            stopFly()
        end
    end
    flyBtn.MouseButton1Click:Connect(toggleFly)

    player.CharacterAdded:Connect(function()
        if flying then
            stopFly()
            flying = false
            flyBtn.Text = "FLY"
        end
    end)

    -- ========== NOCLIP (из твоего скрипта) ==========
    local noclipOn = false
    local noclipConnection = nil

    local function startNoclip()
        noclipConnection = game:GetService("RunService").Stepped:Connect(function()
            local char = player.Character
            if not char then return end
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    end

    local function stopNoclip()
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
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
            startNoclip()
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

    -- ========== ИНИЦИАЛИЗАЦИЯ ОТОБРАЖЕНИЯ ==========
    local function onCharAdded(character)
        local hum = character:WaitForChild("Humanoid")
        updateSpeed(hum.WalkSpeed)
        updateJump(hum.JumpPower)
        hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            updateSpeed(hum.WalkSpeed)
        end)
        hum:GetPropertyChangedSignal("JumpPower"):Connect(function()
            updateJump(hum.JumpPower)
        end)
    end
    if player.Character then
        onCharAdded(player.Character)
    else
        player.CharacterAdded:Connect(onCharAdded)
    end
]=]
controller.Parent = main

print("haxxguiv1 полностью загружен. Используй кнопки: speed +/-, JP +2/-2, FLY, NOCLIP")
