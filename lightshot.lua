-- Помести это в LocalScript (StarterGui)

-- Создаём ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LightShotUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Open Button
local OpenButton = Instance.new("TextButton")
OpenButton.Name = "OpenButton"
OpenButton.Text = "LIGHTSHOT"
OpenButton.Size = UDim2.new(0, 120, 0, 40)
OpenButton.Position = UDim2.new(0.05, 0, 0.3, 0)
OpenButton.Parent = ScreenGui
OpenButton.AutoButtonColor = true
OpenButton.TextScaled = true

local OpenUICorner = Instance.new("UICorner")
OpenUICorner.CornerRadius = UDim.new(0, 10)
OpenUICorner.Parent = OpenButton

-- Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
MainFrame.Visible = false
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 12)
FrameCorner.Parent = MainFrame

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Text = "<b>LightShot</b>"
Title.RichText = true
Title.Font = Enum.Font.FredokaOne
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Parent = MainFrame

-- ScrollFrame (для функций)
local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, 0, 1, -40)
Scroll.Position = UDim2.new(0, 0, 0, 40)
Scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
Scroll.ScrollBarThickness = 6
Scroll.Parent = MainFrame

local ScrollCorner = Instance.new("UICorner")
ScrollCorner.CornerRadius = UDim.new(0, 8)
ScrollCorner.Parent = Scroll

-- Шаблон кнопки
local function CreateButton(name, y)
    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.Font = Enum.Font.FredokaOne
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.TextScaled = true
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Parent = Scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = btn

    return btn
end

-- Кнопки
local SpeedBtn = CreateButton("Speed (On/Off)", 10)
local JumpBtn = CreateButton("JumpPower (On/Off)", 60)
local VIPBtn = CreateButton("VIP (On/Off)", 110)

-- Close Button
local CloseBtn = CreateButton("Close", 160)

-- Функции
local player = game.Players.LocalPlayer
local humanoid = player.Character:WaitForChild("Humanoid")

local speedEnabled = false
local jumpEnabled = false
local vipEnabled = false

SpeedBtn.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    humanoid.WalkSpeed = speedEnabled and 150 or 16
end)

JumpBtn.MouseButton1Click:Connect(function()
    jumpEnabled = not jumpEnabled
    humanoid.JumpPower = jumpEnabled and 100 or 50
end)

VIPBtn.MouseButton1Click:Connect(function()
    vipEnabled = not vipEnabled
    if vipEnabled then
        warn("VIP включён: всё бесплатно (визуально, но зависит от игры).")
    else
        warn("VIP выключен.")
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)

-- Перетаскивание окна
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

MainFrame.Active = true
MainFrame.Draggable = true
