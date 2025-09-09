-- PastebinHub GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PastebinHub"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Главное окно (Frame)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 420, 0, 500)
Frame.Position = UDim2.new(0.3, 0, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Visible = false
Frame.Active = true -- важно для drag
Frame.Draggable = true -- старый метод (работает в большинстве случаев)
Frame.Parent = ScreenGui

-- Скругление фрейма
local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 6)
UICorner2.Parent = Frame

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1, -50, 0, 40) -- -50, чтобы не залезало под кнопку [X]
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "PastebinHub"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка закрытия [X]
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0, 40, 0, 30)
CloseButton.Position = UDim2.new(1, -45, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    Frame.Visible = false
end)

-- Кнопка "Open PastebinHub"
local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0, 180, 0, 40)
OpenButton.Position = UDim2.new(0, 10, 0, 10)
OpenButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
OpenButton.Text = "Open PastebinHub"
OpenButton.Font = Enum.Font.Gotham
OpenButton.TextSize = 18
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.Parent = ScreenGui

-- Скругление кнопки
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = OpenButton

-- Функция открытия/закрытия
OpenButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

--------------------------------------------------------------------
-- Функция для кнопок
local function CreateButton(name, posY)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 380, 0, 35)
    Btn.Position = UDim2.new(0, 20, 0, posY)
    Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Btn.Text = name
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 18
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Parent = Frame
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Btn

    Btn.MouseButton1Click:Connect(function()
        print("Нажата кнопка: " .. name)
    end)

    return Btn
end

--------------------------------------------------------------------
-- Кнопки PastebinHub
CreateButton("Destroy Injured/Stun", 50)
CreateButton("TP START", 90)
CreateButton("TP SAFE PLACE", 130)
CreateButton("Save Random Player", 170)
CreateButton("Red Light, Green Light", 210)
CreateButton("Dalgona", 250)
CreateButton("Lights Out / Special Game", 290)
CreateButton("Tug Of War", 330)
CreateButton("Hide 'N' Seek", 370)
CreateButton("JumpRope", 410)
CreateButton("Glass Bridge", 450)
--------------------------------------------------------------------
