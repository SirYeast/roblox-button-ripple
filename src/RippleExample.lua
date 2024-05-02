--local script in StarterGui
local TweenService = game:GetService("TweenService")

local mainGUI = Instance.new("ScreenGui", script.Parent)

local button = Instance.new("TextButton")
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.Position = UDim2.fromScale(0.5, 0.5)
button.Size = UDim2.fromScale(0.2, 0.1)
button.SizeConstraint = Enum.SizeConstraint.RelativeXY
button.BorderSizePixel = 0
button.BackgroundColor3 = Color3.new(0.0117647, 0.454902, 1)
button.Text = "Click Me"
button.TextColor3 = Color3.new(1, 1, 1)
button.ClipsDescendants = true
button.Parent = mainGUI

local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
local tweenProperties = {Size = UDim2.fromScale(1, 1), ImageTransparency = 1}

button.Activated:Connect(function(inputObject)
	local ripple = Instance.new("ImageLabel")
	ripple.AnchorPoint = Vector2.new(0.5, 0.5)
	ripple.Position = UDim2.fromOffset(
		inputObject.Position.X - button.AbsolutePosition.X,
		inputObject.Position.Y - button.AbsolutePosition.Y)
	ripple.Size = UDim2.new(0, 0, 0, 0)
	ripple.SizeConstraint = Enum.SizeConstraint.RelativeXX
	ripple.BackgroundTransparency = 1
	ripple.Image = "rbxassetid://5629962387"
	ripple.Parent = button

	local tween = TweenService:Create(ripple, tweenInfo, tweenProperties)
	tween.Completed:Once(function()
		ripple:Destroy()
	end)

	tween:Play()
end)