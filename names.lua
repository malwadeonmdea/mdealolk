local plr = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local connections = {} -- Store connections to disconnect later

-- Function to clean up and stop the ESP script
local function stopESP()
    for _, conn in ipairs(connections) do
        conn:Disconnect()
    end

    -- Remove all drawn lines
    for _, obj in ipairs(game.Workspace:GetChildren()) do
        if obj:IsA("Line") then
            obj:Remove()
        end
    end

    -- Clear the connections table
    connections = {}
end

-- Function to handle F8 key press
local function OnKeyPress(input)
    if input.KeyCode == Enum.KeyCode.F8 then
        stopESP()
        -- Add any additional cleanup or stop logic for other scripts here
    end
end

-- Connect the input listener
game:GetService("UserInputService").InputBegan:Connect(OnKeyPress)

for i, v in pairs(game.Players:GetChildren()) do
    local Top = Drawing.new("Line")
    local Bottom = Drawing.new("Line")
    local Left = Drawing.new("Line")
    local Right = Drawing.new("Line")

    function ESP()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Name ~= plr.Name and v.Character.Humanoid.Health > 0 then 
                local ScreenPos, OnScreen = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if OnScreen then
                    local Scale = v.Character.Head.Size.Y/2
                    local Size = Vector3.new(2, 3, 0) * (Scale * 2)
                    local humpos = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                    local TL = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, 0)).p)
                    local TR = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, 0)).p)
                    local BL = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, 0)).p)
                    local BR = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).p)

                    Top.From = Vector2.new(TL.X, TL.Y)
                    Top.To = Vector2.new(TR.X, TR.Y)

                    Left.From = Vector2.new(TL.X, TL.Y)
                    Left.To = Vector2.new(BL.X, BL.Y)

                    Right.From = Vector2.new(TR.X, TR.Y)
                    Right.To = Vector2.new(BR.X, BR.Y)

                    Bottom.From = Vector2.new(BL.X, BL.Y)
                    Bottom.To = Vector2.new(BR.X, BR.Y)

                    if v.TeamColor == plr.TeamColor then
                        Top.Color = Color3.fromRGB(0, 255, 0)
                        Left.Color = Color3.fromRGB(0, 255, 0)
                        Bottom.Color = Color3.fromRGB(0, 255, 0)
                        Right.Color = Color3.fromRGB(0, 255, 0)
                    else 
                        Top.Color = Color3.fromRGB(255, 0, 0)
                        Left.Color = Color3.fromRGB(255, 0, 0)
                        Bottom.Color = Color3.fromRGB(255, 0, 0)
                        Right.Color = Color3.fromRGB(255, 0, 0)
                    end

                    Top.Visible = true
                    Left.Visible = true
                    Bottom.Visible = true
                    Right.Visible = true
                else 
                    Top.Visible = false
                    Left.Visible = false
                    Bottom.Visible = false
                    Right.Visible = false
                end
            else 
                Top.Visible = false
                Left.Visible = false
                Bottom.Visible = false
                Right.Visible = false
                if game.Players:FindFirstChild(v.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
        table.insert(connections, connection) -- Store the connection to disconnect later
    end
    coroutine.wrap(ESP)()
end

game.Players.PlayerAdded:Connect(function(newplr)
    local Top = Drawing.new("Line")
    local Bottom = Drawing.new("Line")
    local Left = Drawing.new("Line")
    local Right = Drawing.new("Line")

    function ESP()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if newplr.Character ~= nil and newplr.Character:FindFirstChild("HumanoidRootPart") ~= nil and newplr.Name ~= plr.Name  and newplr.Character.Humanoid.Health > 0 then
                local ScreenPos, OnScreen = camera:WorldToViewportPoint(newplr.Character.HumanoidRootPart.Position)
                if OnScreen then
                    local Scale = newplr.Character.Head.Size.Y/2
                    local Size = Vector3.new(2, 3, 0) * (Scale * 2)
                    local humpos = camera:WorldToViewportPoint(newplr.Character.HumanoidRootPart.Position)
                    local TL = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, 0)).p)
                    local TR = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, 0)).p)
                    local BL = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, 0)).p)
                    local BR = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).p)

                    Top.From = Vector2.new(TL.X, TL.Y)
                    Top.To = Vector2.new(TR.X, TR.Y)

                    Left.From = Vector2.new(TL.X, TL.Y)
                    Left.To = Vector2.new(BL.X, BL.Y)

                    Right.From = Vector2.new(TR.X, TR.Y)
                    Right.To = Vector2.new(BR.X, BR.Y)

                    Bottom.From = Vector2.new(BL.X, BL.Y)
                    Bottom.To = Vector2.new(BR.X, BR.Y)

                    if newplr.TeamColor == plr.TeamColor then
                        Top.Color = Color3.fromRGB(0, 255, 0)
                        Left.Color = Color3.fromRGB(0, 255, 0)
                        Bottom.Color = Color3.fromRGB(0, 255, 0)
                        Right.Color = Color3.fromRGB(0, 255, 0)
                    else 
                        Top.Color = Color3.fromRGB(255, 0
                        0)
                        Left.Color = Color3.fromRGB(255, 0, 0)
                        Bottom.Color = Color3.fromRGB(255, 0, 0)
                        Right.Color = Color3.fromRGB(255, 0, 0)
                    end

                    Top.Visible = true
                    Left.Visible = true
                    Bottom.Visible = true
                    Right.Visible = true
                else 
                    Top.Visible = false
                    Left.Visible = false
                    Bottom.Visible = false
                    Right.Visible = false
                end
            else 
                Top.Visible = false
                Left.Visible = false
                Bottom.Visible = false
                Right.Visible = false
                if game.Players:FindFirstChild(newplr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
        table.insert(connections, connection) -- Store the connection to disconnect later
    end
    coroutine.wrap(ESP)()
end)

-- Function to stop all scripts
local function stopAllScripts()
    stopESP()
    -- Add other scripts to stop here
end

-- Function to handle F8 key press
local function OnKeyPress(input)
    if input.KeyCode == Enum.KeyCode.F8 then
        stopAllScripts()
    end
end

-- Connect the input listener
game:GetService("UserInputService").InputBegan:Connect(OnKeyPress)
