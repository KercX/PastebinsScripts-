local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Очистка предыдущего GUI
if PlayerGui:FindFirstChild("KIBORGHUB") then
    PlayerGui.KIBORGHUB:Destroy()
end

-- Основной GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KIBORGHUB"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

-- Главный фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 400, 0, 450)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -225)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

-- Закругление углов
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- Верхняя панель
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
TopBar.BorderSizePixel = 0

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 15)
TopBarCorner.Parent = TopBar

-- Заголовок KIBORG HUB
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = TopBar
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "KIBORG HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold

-- UI Drag Detector
local UIDragDetector = Instance.new("TextButton")
UIDragDetector.Name = "UIDragDetector"
UIDragDetector.Parent = TopBar
UIDragDetector.Size = UDim2.new(1, 0, 1, 0)
UIDragDetector.BackgroundTransparency = 1
UIDragDetector.Text = ""
UIDragDetector.ZIndex = 10

-- Кнопка закрытия
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0.5, -15)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.GothamBold
CloseButton.ZIndex = 11

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

-- Scrollable Frame для контента
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Parent = MainFrame
ScrollFrame.Size = UDim2.new(1, -20, 1, -70)
ScrollFrame.Position = UDim2.new(0, 10, 0, 60)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 3, 0)

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Parent = ScrollFrame
ContentLayout.Padding = UDim.new(0, 10)
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Функция создания секции
local function createSection(title)
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Size = UDim2.new(1, 0, 0, 30)
    sectionFrame.BackgroundTransparency = 1
    
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Size = UDim2.new(1, 0, 1, 0)
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Text = "┣ " .. title
    sectionTitle.TextColor3 = Color3.fromRGB(0, 150, 255)
    sectionTitle.TextSize = 14
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionTitle.Parent = sectionFrame
    
    return sectionFrame
end

-- Функция создания кнопки
local function createButton(text, color)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 35)
    button.BackgroundColor3 = color
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.Gotham
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = button
    
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(
            math.min(color.R * 255 + 20, 255),
            math.min(color.G * 255 + 20, 255), 
            math.min(color.B * 255 + 20, 255)
        ) / 255
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = color
    end)
    
    return button
end

-- Функция создания текстового поля
local function createTextBox(placeholder)
    local textBoxFrame = Instance.new("Frame")
    textBoxFrame.Size = UDim2.new(1, 0, 0, 35)
    textBoxFrame.BackgroundTransparency = 1
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1, 0, 1, 0)
    textBox.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.PlaceholderText = placeholder
    textBox.Text = ""
    textBox.TextSize = 14
    textBox.Font = Enum.Font.Gotham
    textBox.ClearTextOnFocus = false
    
    local textBoxCorner = Instance.new("UICorner")
    textBoxCorner.CornerRadius = UDim.new(0, 8)
    textBoxCorner.Parent = textBox
    
    textBox.Parent = textBoxFrame
    return textBoxFrame, textBox
end

-- Создаем элементы интерфейса
local movementSection = createSection("MOVEMENT")
movementSection.Parent = ScrollFrame

local speedTextBoxFrame, speedTextBox = createTextBox("Скорость (16 = норма)")
speedTextBoxFrame.Parent = ScrollFrame

local speedButton = createButton("⚡ SET SPEED", Color3.fromRGB(0, 100, 200))
speedButton.Parent = ScrollFrame

local flySection = createSection("FLY")
flySection.Parent = ScrollFrame

local flySpeedTextBoxFrame, flySpeedTextBox = createTextBox("Скорость полета (50)")
flySpeedTextBoxFrame.Parent = ScrollFrame

local flyButton = createButton("🕊️ TOGGLE FLY", Color3.fromRGB(150, 0, 200))
flyButton.Parent = ScrollFrame

local noclipSection = createSection("NOCLIP")
noclipSection.Parent = ScrollFrame

local noclipButton = createButton("🚀 TOGGLE NOCLIP", Color3.fromRGB(200, 150, 0))
noclipButton.Parent = ScrollFrame

local teleportSection = createSection("TELEPORT")
teleportSection.Parent = ScrollFrame

local baseButton = createButton("🏠 TELEPORT TO BASE", Color3.fromRGB(0, 150, 150))
baseButton.Parent = ScrollFrame

local weaponSection = createSection("WEAPONS")
weaponSection.Parent = ScrollFrame

local weaponButton = createButton("🔫 GET WEAPON", Color3.fromRGB(150, 0, 0))
weaponButton.Parent = ScrollFrame

local utilitySection = createSection("UTILITY")
utilitySection.Parent = ScrollFrame

local invisibleButton = createButton("👻 TOGGLE INVISIBLE", Color3.fromRGB(100, 100, 200))
invisibleButton.Parent = ScrollFrame

local skyButton = createButton("🌌 TELEPORT TO SKY", Color3.fromRGB(1
