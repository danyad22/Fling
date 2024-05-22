local function send(text)
	local StarterGui = game:GetService("StarterGui")
	StarterGui:SetCore("SendNotification",{
		Title = "Fling by danya23131", -- You can remove this, idc
		Text = text,
		Duration = 5
	})
end
local fakepart = Instance.new("Part", workspace)
local att1 = Instance.new("Attachment", fakepart)
local att2 = Instance.new("Attachment", game.Players.LocalPlayer.Character.HumanoidRootPart)
local body = Instance.new("AlignPosition", fakepart)
body.Attachment0 = att2
body.Attachment1 = att1
body.RigidityEnabled = true
body.Responsiveness = math.huge
body.MaxForce = math.huge
body.MaxVelocity = math.huge
body.MaxAxesForce = Vector3.new(math.huge,math.huge,math.huge)
body.Visible = true
body.Mode = Enum.PositionAlignmentMode.TwoAttachment
game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.StrafingNoPhysics)
send("Please wait")
local oldcf = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0,40000000,0)) * CFrame.fromEulerAnglesXYZ(math.rad(180),0,0)
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,1000000,0)
task.wait(3)
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcf
task.wait(.2)	
local power = 100
local attack = 5
fakepart.Anchored = true
fakepart.Size = Vector3.new(5,5,5)
fakepart.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
fakepart.CanCollide = false
fakepart.Transparency = 0.5
fakepart.Material = Enum.Material.ForceField
for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
	if v:IsA("BasePart") then
		if v.Name ~= "HumanoidRootPart" then
			v.Transparency = .75
			v.Material = Enum.Material.Neon
		end
	elseif v:IsA("Decal") then
		v:Remove()
	end
end
local partic = Instance.new("ParticleEmitter", fakepart)
partic.Texture = "rbxassetid://15273937357"
partic.SpreadAngle = Vector2.new(-180,180)
partic.Rate = 45
partic.Size = NumberSequence.new(1,0)
partic.Transparency = NumberSequence.new(0.9)
partic.Lifetime = NumberRange.new(0.7,1)
partic.RotSpeed = NumberRange.new(-45,45)
workspace.CurrentCamera.CameraSubject = fakepart
spawn(function()
	while true do
		task.wait()
		for i = 0,1,0.01 do
			task.wait()
			fakepart.Color = Color3.fromHSV(i,1,1)
			partic.Color = ColorSequence.new(Color3.fromHSV(i,1,1))
		end
	end
end)
spawn(function()
	while true do
		game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(math.random(-500,50),math.random(-500,500) * power,math.random(-5,5))
		task.wait(math.random(0,attack)/50)	
	end
end)
spawn(function()
	while true do
		if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude ~= 0 then
			fakepart.Position = fakepart.Position + workspace.CurrentCamera.CFrame.LookVector * 2
		end
		task.wait()
	end
end)
spawn(function()
	while true do
		if math.random(0,2)==1 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.fromEulerAnglesXYZ(0,math.rad(90),0)
		elseif math.random(0,2)==2 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.fromEulerAnglesXYZ(math.rad(math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5)))
		else
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.fromEulerAnglesXYZ(0,math.rad(180),0)
		end
		fakepart.Rotation = game.Players.LocalPlayer.Character.HumanoidRootPart.Rotation
		task.wait()
	end
end)
local isdown = false
local mouse = game.Players.LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
	isdown = true
end)
mouse.Button1Up:Connect(function()
	isdown = false
end)
spawn(function()
	while true do
		task.wait()
		if isdown then
			for i = 0,360,5 do
				task.wait()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(math.random(-5,5)/5,math.random(0,18)/2,math.random(-5,5)/5)) * CFrame.fromEulerAnglesXYZ(math.rad(90),0,math.rad(i))
				game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(math.random(-5000,5000),math.random(-50,50) * power,math.random(-5000,5000))	
				if not isdown then
					break
				end	
			end
		end
	end
end)
spawn(function()
	while true do
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
		task.wait(.5)
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
		task.wait(.5)
	end
end)
while true do
	--game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
	fakepart.Rotation = game.Players.LocalPlayer.Character.HumanoidRootPart.Rotation
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
	if math.random(0,1)==1 then
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	else
		game.Players.LocalPlayer.Character.Humanoid.Jump = false
	end
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fakepart.CFrame
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(math.random(-250,250),math.random(-500,500),math.random(-250,250))
	game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(math.random(-250,250),math.random(-500,500),math.random(-250,250))
	--game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0,180,0)
	task.wait()
end
