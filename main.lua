-- SerenityUI Library - Fixed Version
-- Creator: Converted from GUI2Lua output

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local SerenityUI = {}
SerenityUI.__index = SerenityUI

-- Create main library object
function SerenityUI:Window(config)
    local self = setmetatable({}, SerenityUI)
    
    -- Configuration
    self.Title = config.Title or "Serenity"
    self.Visible = true
    self.Sections = {}
    self.CurrentSection = nil
    
    -- Create main GUI
    self:CreateMainGUI()
    self:SetupDragging()
    self:SetupToggleKey()
    
    return self
end

function SerenityUI:CreateMainGUI()
    -- Main ScreenGui
    self.Serenity = Instance.new("ScreenGui")
    self.Serenity.Name = "Serenity"
    self.Serenity.ResetOnSpawn = false
    self.Serenity.Parent = PlayerGui
    
    -- Main Frame
    self.Main = Instance.new("Frame")
    self.Main.Name = "Main"
    self.Main.Size = UDim2.new(0.36090004444122314, 0, 0.3680904507637024, 0)
    self.Main.Position = UDim2.new(0.31954947113990784, 0, 0.31532663106918335, 0)
    self.Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    self.Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.Main.BorderSizePixel = 0
    self.Main.AnchorPoint = Vector2.new(0, 0)
    self.Main.Parent = self.Serenity
    
    -- UI Corner for Main
    local UICorner = Instance.new("UICorner")
    UICorner.Parent = self.Main
    
    -- UI Stroke for Main
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Parent = self.Main
    
    -- Top Frame
    self.Top = Instance.new("Frame")
    self.Top.Name = "Top"
    self.Top.Size = UDim2.new(1, 0, 0.12627986073493958, 0)
    self.Top.Position = UDim2.new(0, 0, 0, 0)
    self.Top.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    self.Top.BackgroundTransparency = 1
    self.Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.Top.BorderSizePixel = 0
    self.Top.ZIndex = 100
    self.Top.AnchorPoint = Vector2.new(0, 0)
    self.Top.Parent = self.Main
    
    -- Title Label
    self.TitleLabel = Instance.new("TextLabel")
    self.TitleLabel.Name = "Title"
    self.TitleLabel.Size = UDim2.new(0.17657046020030975, 0, 1.0000001192092896, 0)
    self.TitleLabel.Position = UDim2.new(0.03805999830365181, 0, 0, 0)
    self.TitleLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    self.TitleLabel.BackgroundTransparency = 1
    self.TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.TitleLabel.BorderSizePixel = 0
    self.TitleLabel.Text = self.Title
    self.TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.TitleLabel.TextSize = 14
    self.TitleLabel.Font = Enum.Font.SourceSans
    self.TitleLabel.TextScaled = true
    self.TitleLabel.TextWrapped = true
    self.TitleLabel.AnchorPoint = Vector2.new(0, 0)
    self.TitleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    self.TitleLabel.Parent = self.Top
    
    -- Menu ScrollingFrame
    self.Menu = Instance.new("ScrollingFrame")
    self.Menu.Name = "Menu"
    self.Menu.Size = UDim2.new(0.18824277818202972, 0, 0.8375427722930908, 0)
    self.Menu.Position = UDim2.new(0.0118845971301198, 0, 0.12627986073493958, 0)
    self.Menu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.Menu.BackgroundTransparency = 1
    self.Menu.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.Menu.BorderSizePixel = 0
    self.Menu.ZIndex = 100
    self.Menu.AnchorPoint = Vector2.new(0, 0)
    self.Menu.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
    self.Menu.ScrollBarThickness = 0
    self.Menu.Active = true
    self.Menu.Parent = self.Main
    
    -- Menu UIListLayout
    self.MenuLayout = Instance.new("UIListLayout")
    self.MenuLayout.SortOrder = Enum.SortOrder.LayoutOrder
    self.MenuLayout.Parent = self.Menu
    
    -- Canvas Frame
    self.Canvas = Instance.new("Frame")
    self.Canvas.Name = "Canvas"
    self.Canvas.Size = UDim2.new(0.7613982558250427, 0, 0.8307167887687683, 0)
    self.Canvas.Position = UDim2.new(0.21463046967983246, 0, 0.12627986073493958, 0)
    self.Canvas.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    self.Canvas.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.Canvas.BorderSizePixel = 0
    self.Canvas.ZIndex = 100
    self.Canvas.AnchorPoint = Vector2.new(0, 0)
    self.Canvas.Parent = self.Main
    
    -- Canvas UICorner
    local CanvasCorner = Instance.new("UICorner")
    CanvasCorner.Parent = self.Canvas
    
    -- Modules ScrollingFrame
    self.Modules = Instance.new("ScrollingFrame")
    self.Modules.Name = "Modules"
    self.Modules.Size = UDim2.new(1, 0, 0.9226951003074646, 0)
    self.Modules.Position = UDim2.new(0, 0, 0.04032883793115616, 0)
    self.Modules.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.Modules.BackgroundTransparency = 1
    self.Modules.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.Modules.BorderSizePixel = 0
    self.Modules.AnchorPoint = Vector2.new(0, 0)
    self.Modules.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
    self.Modules.ScrollBarThickness = 0
    self.Modules.Active = true
    self.Modules.Parent = self.Canvas
    
    -- Modules UIListLayout
    self.ModulesLayout = Instance.new("UIListLayout")
    self.ModulesLayout.SortOrder = Enum.SortOrder.LayoutOrder
    self.ModulesLayout.Padding = UDim.new(0, 5)
    self.ModulesLayout.Parent = self.Modules
end

function SerenityUI:SetupDragging()
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    self.Top.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = self.Main.Position
        end
    end)
    
    self.Top.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - dragStart
            self.Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

function SerenityUI:SetupToggleKey()
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.RightShift then
            self:Toggle()
        end
    end)
end

function SerenityUI:Toggle()
    self.Visible = not self.Visible
    self.Main.Visible = self.Visible
end

function SerenityUI:Section(title)
    local section = {
        Title = title,
        Elements = {},
        Frame = nil,
        Selected = false,
        LayoutOrder = #self.Sections + 1
    }
    
    -- Create section button - REDUCED SIZE TO 0.4
    local sectionButton = Instance.new("TextButton")
    sectionButton.Name = "Section"
    sectionButton.Size = UDim2.new(1, 0, 0, 30) -- Fixed height instead of scale
    sectionButton.Position = UDim2.new(0, 0, 0, 0)
    sectionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    sectionButton.BackgroundTransparency = 1
    sectionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    sectionButton.BorderSizePixel = 0
    sectionButton.Text = title
    sectionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    sectionButton.TextSize = 16 -- Reduced from 24
    sectionButton.Font = Enum.Font.SourceSans
    sectionButton.AnchorPoint = Vector2.new(0, 0)
    sectionButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    sectionButton.LayoutOrder = section.LayoutOrder
    sectionButton.Parent = self.Menu
    
    -- Selected indicator
    local selected = Instance.new("Frame")
    selected.Name = "Selected"
    selected.Size = UDim2.new(0.06, 0, 0.6, 0)
    selected.Position = UDim2.new(0.1, 0, 0.2, 0)
    selected.BackgroundColor3 = Color3.fromRGB(51, 51, 255)
    selected.BorderColor3 = Color3.fromRGB(0, 0, 0)
    selected.BorderSizePixel = 0
    selected.AnchorPoint = Vector2.new(0, 0)
    selected.Visible = false
    selected.Parent = sectionButton
    
    local selectedCorner = Instance.new("UICorner")
    selectedCorner.Parent = selected
    
    section.Frame = sectionButton
    section.Selected = selected
    
    -- Section click handler
    sectionButton.MouseButton1Click:Connect(function()
        self:SelectSection(section)
    end)
    
    table.insert(self.Sections, section)
    
    -- Auto-select first section
    if #self.Sections == 1 then
        self:SelectSection(section)
    end
    
    self:UpdateMenuSize()
    
    return section
end

function SerenityUI:UpdateMenuSize()
    local totalHeight = #self.Sections * 35 -- 30 height + 5 padding
    self.Menu.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

function SerenityUI:SelectSection(targetSection)
    -- Hide all section indicators
    for _, section in pairs(self.Sections) do
        section.Selected.Visible = false
    end
    
    -- Show selected section indicator
    targetSection.Selected.Visible = true
    self.CurrentSection = targetSection
    
    -- Clear modules
    for _, child in pairs(self.Modules:GetChildren()) do
        if child:IsA("GuiObject") then
            child:Destroy()
        end
    end
    
    -- Show elements for selected section
    for i, element in pairs(targetSection.Elements) do
        element.LayoutOrder = i
        element.Parent = self.Modules
    end
    
    self:UpdateCanvasSize()
end

function SerenityUI:UpdateCanvasSize()
    wait() -- Wait for layout to update
    local totalHeight = 0
    for _, child in pairs(self.Modules:GetChildren()) do
        if child:IsA("GuiObject") then
            totalHeight = totalHeight + child.AbsoluteSize.Y + 5
        end
    end
    self.Modules.CanvasSize = UDim2.new(0, 0, 0, totalHeight + 20)
end

function SerenityUI:Button(title, callback)
    if not self.CurrentSection then
        warn("No section selected. Create a section first.")
        return
    end
    
    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Size = UDim2.new(0.9, 0, 0, 40) -- Fixed height
    button.Position = UDim2.new(0, 0, 0, 0)
    button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    button.BorderColor3 = Color3.fromRGB(0, 0, 0)
    button.BorderSizePixel = 0
    button.Text = ""
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 22
    button.Font = Enum.Font.SourceSans
    button.TextWrapped = true
    button.AnchorPoint = Vector2.new(0, 0)
    button.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.Parent = button
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0.8, 0, 1, 0)
    titleLabel.Position = UDim2.new(0.1, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.BorderSizePixel = 0
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 18
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.AnchorPoint = Vector2.new(0, 0)
    titleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.Parent = button
    
    -- FIXED: Proper button connection
    button.MouseButton1Click:Connect(function()
        if callback then
            pcall(callback) -- Use pcall for safety
        end
    end)
    
    table.insert(self.CurrentSection.Elements, button)
    
    if self.CurrentSection.Selected.Visible then
        button.LayoutOrder = #self.CurrentSection.Elements
        button.Parent = self.Modules
        spawn(function() self:UpdateCanvasSize() end)
    end
    
    return button
end

function SerenityUI:Toggle(title, callback)
    if not self.CurrentSection then
        warn("No section selected. Create a section first.")
        return
    end
    
    local toggleState = false
    
    local toggle = Instance.new("TextButton")
    toggle.Name = "Toggle"
    toggle.Size = UDim2.new(0.9, 0, 0, 40) -- Fixed height
    toggle.Position = UDim2.new(0, 0, 0, 0)
    toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
    toggle.BorderSizePixel = 0
    toggle.Text = ""
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.TextSize = 22
    toggle.Font = Enum.Font.SourceSans
    toggle.TextWrapped = true
    toggle.AnchorPoint = Vector2.new(0, 0)
    toggle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.Parent = toggle
    
    local togglePart = Instance.new("Frame")
    togglePart.Name = "TogglePart"
    togglePart.Size = UDim2.new(0.1, 0, 0.55, 0)
    togglePart.Position = UDim2.new(0.85, 0, 0.225, 0)
    togglePart.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    togglePart.BorderColor3 = Color3.fromRGB(0, 0, 0)
    togglePart.BorderSizePixel = 0
    togglePart.AnchorPoint = Vector2.new(0, 0)
    togglePart.Parent = toggle
    
    local togglePartCorner = Instance.new("UICorner")
    togglePartCorner.Parent = togglePart
    
    local on = Instance.new("Frame")
    on.Name = "On"
    on.Size = UDim2.new(0.5, 0, 1, 0)
    on.Position = UDim2.new(0.5, 0, 0, 0)
    on.BackgroundColor3 = Color3.fromRGB(30, 30, 150)
    on.BorderColor3 = Color3.fromRGB(0, 0, 0)
    on.BorderSizePixel = 0
    on.AnchorPoint = Vector2.new(0, 0)
    on.Visible = false
    on.Parent = togglePart
    
    local onCorner = Instance.new("UICorner")
    onCorner.Parent = on
    
    local off = Instance.new("Frame")
    off.Name = "Off"
    off.Size = UDim2.new(0.5, 0, 1, 0)
    off.Position = UDim2.new(0, 0, 0, 0)
    off.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    off.BorderColor3 = Color3.fromRGB(0, 0, 0)
    off.BorderSizePixel = 0
    off.Visible = true
    off.AnchorPoint = Vector2.new(0, 0)
    off.Parent = togglePart
    
    local offCorner = Instance.new("UICorner")
    offCorner.Parent = off
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    titleLabel.Position = UDim2.new(0.1, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.BorderSizePixel = 0
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 18
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.AnchorPoint = Vector2.new(0, 0)
    titleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.Parent = toggle
    
    local function updateToggle()
        on.Visible = toggleState
        off.Visible = not toggleState
    end
    
    -- FIXED: Click anywhere on toggle frame
    toggle.MouseButton1Click:Connect(function()
        toggleState = not toggleState
        updateToggle()
        if callback then
            pcall(callback, toggleState)
        end
    end)
    
    table.insert(self.CurrentSection.Elements, toggle)
    
    if self.CurrentSection.Selected.Visible then
        toggle.LayoutOrder = #self.CurrentSection.Elements
        toggle.Parent = self.Modules
        spawn(function() self:UpdateCanvasSize() end)
    end
    
    return {
        Element = toggle,
        SetValue = function(value)
            toggleState = value
            updateToggle()
        end,
        GetValue = function()
            return toggleState
        end
    }
end

function SerenityUI:Keybind(title, defaultKey, callback)
    if not self.CurrentSection then
        warn("No section selected. Create a section first.")
        return
    end
    
    local currentKey = defaultKey or "F"
    local listening = false
    
    local keybind = Instance.new("TextButton")
    keybind.Name = "keybind"
    keybind.Size = UDim2.new(0.9, 0, 0, 40) -- Fixed height
    keybind.Position = UDim2.new(0, 0, 0, 0)
    keybind.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
    keybind.BorderSizePixel = 0
    keybind.Text = ""
    keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
    keybind.TextSize = 22
    keybind.Font = Enum.Font.SourceSans
    keybind.TextWrapped = true
    keybind.AnchorPoint = Vector2.new(0, 0)
    keybind.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    
    local keybindCorner = Instance.new("UICorner")
    keybindCorner.Parent = keybind
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    titleLabel.Position = UDim2.new(0.1, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.BorderSizePixel = 0
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 18
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.AnchorPoint = Vector2.new(0, 0)
    titleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.Parent = keybind
    
    local bind = Instance.new("TextButton")
    bind.Name = "Bind"
    bind.Size = UDim2.new(0.15, 0, 0.75, 0)
    bind.Position = UDim2.new(0.8, 0, 0.125, 0)
    bind.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    bind.BorderColor3 = Color3.fromRGB(0, 0, 0)
    bind.BorderSizePixel = 0
    bind.Text = currentKey
    bind.TextColor3 = Color3.fromRGB(255, 255, 255)
    bind.TextSize = 14
    bind.Font = Enum.Font.RobotoMono
    bind.TextScaled = true
    bind.TextWrapped = true
    bind.AnchorPoint = Vector2.new(0, 0)
    bind.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    bind.Parent = keybind
    
    local bindCorner = Instance.new("UICorner")
    bindCorner.Parent = bind
    
    -- FIXED: Click anywhere on keybind frame
    keybind.MouseButton1Click:Connect(function()
        if not listening then
            listening = true
            bind.Text = "..."
            
            local connection
            connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    local keyName = input.KeyCode.Name
                    if keyName:len() == 1 then -- Only single letters
                        currentKey = keyName
                        bind.Text = currentKey
                        listening = false
                        connection:Disconnect()
                    end
                end
            end)
        end
    end)
    
    -- FIXED: Listen for the actual keybind press
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed or listening then return end
        
        if input.KeyCode.Name == currentKey then
            if callback then
                pcall(callback)
            end
        end
    end)
    
    table.insert(self.CurrentSection.Elements, keybind)
    
    if self.CurrentSection.Selected.Visible then
        keybind.LayoutOrder = #self.CurrentSection.Elements
        keybind.Parent = self.Modules
        spawn(function() self:UpdateCanvasSize() end)
    end
    
    return {
        Element = keybind,
        SetKey = function(key)
            if key:len() == 1 then
                currentKey = key
                bind.Text = currentKey
            end
        end,
        GetKey = function()
            return currentKey
        end
    }
end

function SerenityUI:Dropdown(title, options, callback)
    if not self.CurrentSection then
        warn("No section selected. Create a section first.")
        return
    end
    
    local selectedOption = options[1] or "None"
    local isOpen = false
    
    local dropdown = Instance.new("TextButton")
    dropdown.Name = "Dropdown"
    dropdown.Size = UDim2.new(0.9, 0, 0, 40) -- Fixed height
    dropdown.Position = UDim2.new(0, 0, 0, 0)
    dropdown.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
    dropdown.BorderSizePixel = 0
    dropdown.Text = ""
    dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdown.TextSize = 22
    dropdown.Font = Enum.Font.SourceSans
    dropdown.TextWrapped = true
    dropdown.AnchorPoint = Vector2.new(0, 0)
    dropdown.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    dropdown.ClipsDescendants = false
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.Parent = dropdown
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    titleLabel.Position = UDim2.new(0.1, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.BorderSizePixel = 0
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 18
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.AnchorPoint = Vector2.new(0, 0)
    titleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.Parent = dropdown
    
    local droppedDown = Instance.new("ScrollingFrame")
    droppedDown.Name = "DroppedDown"
    droppedDown.Size = UDim2.new(1, 0, 0, #options * 35) -- Dynamic height based on options
    droppedDown.Position = UDim2.new(0, 0, 1, 5)
    droppedDown.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    droppedDown.BorderColor3 = Color3.fromRGB(0, 0, 0)
    droppedDown.BorderSizePixel = 0
    droppedDown.Visible = false
    droppedDown.ZIndex = 1000
    droppedDown.AnchorPoint = Vector2.new(0, 0)
    droppedDown.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
    droppedDown.ScrollBarThickness = 0
    droppedDown.Active = true
    droppedDown.CanvasSize = UDim2.new(0, 0, 0, #options * 35)
    droppedDown.Parent = dropdown
    
    local droppedDownCorner = Instance.new("UICorner")
    droppedDownCorner.Parent = droppedDown
    
    local droppedDownLayout = Instance.new("UIListLayout")
    droppedDownLayout.SortOrder = Enum.SortOrder.LayoutOrder
    droppedDownLayout.Parent = droppedDown
    
    -- Create option buttons
    for i, option in pairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Name = "Button"
        optionButton.Size = UDim2.new(0.9, 0, 0, 30)
        optionButton.Position = UDim2.new(0.05, 0, 0, 0)
        optionButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        optionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        optionButton.BorderSizePixel = 0
        optionButton.Text = option
        optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        optionButton.TextSize = 16
        optionButton.Font = Enum.Font.SourceSans
        optionButton.TextWrapped = true
        optionButton.AnchorPoint = Vector2.new(0, 0)
        optionButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        optionButton.LayoutOrder = i
        optionButton.Parent = droppedDown
        
        local optionCorner = Instance.new("UICorner")
        optionCorner.Parent = optionButton
        
        optionButton.MouseButton1Click:Connect(function()
            selectedOption = option
            isOpen = false
            droppedDown.Visible = false
            
            -- Update dropdown size back to normal
            dropdown.Size = UDim2.new(0.9, 0, 0, 40)
            
            if callback then
                pcall(callback, selectedOption)
            end
            spawn(function() self:UpdateCanvasSize() end)
        end)
    end
    
    dropdown.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        droppedDown.Visible = isOpen
        
        -- FIXED: Properly expand dropdown to push other elements
        if isOpen then
            dropdown.Size = UDim2.new(0.9, 0, 0, 40 + (#options * 35) + 5)
        else
            dropdown.Size = UDim2.new(0.9, 0, 0, 40)
        end
        
        spawn(function() self:UpdateCanvasSize() end)
    end)
    
    table.insert(self.CurrentSection.Elements, dropdown)
    
    if self.CurrentSection.Selected.Visible then
        dropdown.LayoutOrder = #self.CurrentSection.Elements
        dropdown.Parent = self.Modules
        spawn(function() self:UpdateCanvasSize() end)
    end
    
    return {
        Element = dropdown,
        SetValue = function(value)
            selectedOption = value
        end,
        GetValue = function()
            return selectedOption
        end
    }
end

function SerenityUI:Slider(title, minValue, maxValue, callback)
    if not self.CurrentSection then
        warn("No section selected. Create a section first.")
        return
    end
    
    local currentValue = minValue
    local dragging = false
    
    local slider = Instance.new("Frame")
    slider.Name = "Slider"
    slider.Size = UDim2.new(0.9, 0, 0, 40) -- Fixed height
    slider.Position = UDim2.new(0, 0, 0, 0)
    slider.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
    slider.BorderSizePixel = 0
    slider.AnchorPoint = Vector2.new(0, 0)
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(0.4, 0, 1, 0)
    titleLabel.Position = UDim2.new(0.1, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.BorderSizePixel = 0
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 18
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.AnchorPoint = Vector2.new(0, 0)
    titleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.Parent = slider
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.Parent = slider
    
    local bar = Instance.new("Frame")
    bar.Name = "Bar"
    bar.Size = UDim2.new(0.4, 0, 0.25, 0)
    bar.Position = UDim2.new(0.55, 0, 0.375, 0)
    bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    bar.BorderSizePixel = 0
    bar.AnchorPoint = Vector2.new(0, 0)
    bar.Parent = slider
    
    local barCorner = Instance.new("UICorner")
    barCorner.Parent = bar
    
    local slid = Instance.new("Frame")
    slid.Name = "Slid"
    slid.Size = UDim2.new(0.5, 0, 1, 0)
    slid.Position = UDim2.new(0, 0, 0, 0)
    slid.BackgroundColor3 = Color3.fromRGB(30, 30, 150)
    slid.BorderColor3 = Color3.fromRGB(0, 0, 0)
    slid.BorderSizePixel = 0
    slid.AnchorPoint = Vector2.new(0, 0)
    slid.Parent = bar
    
    local sliderBall = Instance.new("TextButton")
    sliderBall.Name = "SliderBall"
    sliderBall.Size = UDim2.new(0.1, 0, 2, 0)
    sliderBall.Position = UDim2.new(0.45, 0, -0.5, 0)
    sliderBall.BackgroundColor3 = Color3.fromRGB(51, 51, 255)
    sliderBall.BorderColor3 = Color3.fromRGB(0, 0, 0)
    sliderBall.BorderSizePixel = 0
    sliderBall.Text = ""
    sliderBall.TextColor3 = Color3.fromRGB(0, 0, 0)
    sliderBall.TextSize = 14
    sliderBall.Font = Enum.Font.SourceSans
    sliderBall.AnchorPoint = Vector2.new(0, 0)
    sliderBall.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    sliderBall.Parent = bar
    
    local sliderBallCorner = Instance.new("UICorner")
    sliderBallCorner.Parent = sliderBall
    
    local function updateSlider(percentage)
        percentage = math.clamp(percentage, 0, 1)
        currentValue = minValue + (maxValue - minValue) * percentage
        
        slid.Size = UDim2.new(percentage, 0, 1, 0)
        sliderBall.Position = UDim2.new(percentage - 0.05, 0, -0.5, 0)
        
        if callback then
            pcall(callback, math.floor(currentValue + 0.5)) -- Round to nearest integer
        end
    end
    
    local function getMousePercentage(input)
        local barPosition = bar.AbsolutePosition.X
        local barSize = bar.AbsoluteSize.X
        local mouseX = input.Position.X
        
        local percentage = (mouseX - barPosition) / barSize
        return math.clamp(percentage, 0, 1)
    end
    
    -- FIXED: Slider dragging - can drag outside bar
    sliderBall.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local percentage = getMousePercentage(input)
            updateSlider(percentage)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Click on bar to set value
    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and not dragging then
            local percentage = getMousePercentage(input)
            updateSlider(percentage)
        end
    end)
    
    table.insert(self.CurrentSection.Elements, slider)
    
    if self.CurrentSection.Selected.Visible then
        slider.LayoutOrder = #self.CurrentSection.Elements
        slider.Parent = self.Modules
        spawn(function() self:UpdateCanvasSize() end)
    end
    
    return {
        Element = slider,
        SetValue = function(value)
            local percentage = (value - minValue) / (maxValue - minValue)
            updateSlider(percentage)
        end,
        GetValue = function()
            return math.floor(currentValue + 0.5)
        end
    }
end

return SerenityUI
