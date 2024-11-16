-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlyGUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.4, 0, 0.2, 0) -- 40% width, 20% height
frame.Position = UDim2.new(0.3, 0, 0.7, 0) -- Positioned at the bottom
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Dark gray
frame.Parent = screenGui

-- Create the Fly Button
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0.6, 0, 0.6, 0) -- 60% width and height of the Frame
flyButton.Position = UDim2.new(0.2, 0, 0.2, 0) -- Centered in the Frame
flyButton.Text = "Fly"
flyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255) -- Light blue
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
flyButton.Parent = frame

-- Variables to manage flying
local isFlying = false
local speed = 50
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Fly mechanics
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.MaxForce = Vector3.new(0, 0, 0)

-- Button functionality
flyButton.MouseButton1Click:Connect(function()
    isFlying = not isFlying
    if isFlying then
        flyButton.Text = "Stop Flying"
        -- Enable flying
        bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000) -- Allow movement
        bodyVelocity.Velocity = Vector3.new(0, speed, 0) -- Fly upwards
        bodyVelocity.Parent = humanoidRootPart
    else
        flyButton.Text = "Fly"
        -- Stop flying
        bodyVelocity.MaxForce = Vector3.new(0, 0, 0) -- Disable movement
        bodyVelocity.Velocity = Vector3.zero
        bodyVelocity.Parent = nil
    end
end)
