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
local mouse = game.Players.LocalPlayer:GetMouse()
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
--[[

spawn(function()
	while true do
		if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude ~= 0 then
			fakepart.Position = fakepart.Position + workspace.CurrentCamera.CFrame.LookVector * 2
		end
		task.wait()
	end
end)

]]
local w = false
local a = false
local s = false
local d = false
mouse.KeyDown:Connect(function(key)
	if key == "w" then
		w = true
		--fakepart.Position = fakepart.Position + workspace.CurrentCamera.CFrame.LookVector * 2
	end
	if key == "a" then
		a = true
		--fakepart.Position = fakepart.Position - workspace.CurrentCamera.CFrame.RightVector * 2
	end
	if key == "s" then
		s = true
		--fakepart.Position = fakepart.Position - workspace.CurrentCamera.CFrame.LookVector * 2
	end
	if key == "d" then
		d = true
		--fakepart.Position = fakepart.Position + workspace.CurrentCamera.CFrame.RightVector * 2
	end
end)
mouse.KeyUp:Connect(function(key)
	if key == "w" then
		w = false
		--fakepart.Position = fakepart.Position + workspace.CurrentCamera.CFrame.LookVector * 2
	end
	if key == "a" then
		a = false
		--fakepart.Position = fakepart.Position - workspace.CurrentCamera.CFrame.RightVector * 2
	end
	if key == "s" then
		s = false
		--fakepart.Position = fakepart.Position - workspace.CurrentCamera.CFrame.LookVector * 2
	end
	if key == "d" then
		d = false
		--fakepart.Position = fakepart.Position + workspace.CurrentCamera.CFrame.RightVector * 2
	end
end)
game:GetService("RunService").Heartbeat:Connect(function()
	if w then
		fakepart.Position = fakepart.Position + workspace.CurrentCamera.CFrame.LookVector * 2
	end
	if a then
		fakepart.Position = fakepart.Position - workspace.CurrentCamera.CFrame.RightVector * 2
	end
	if s then
		fakepart.Position = fakepart.Position - workspace.CurrentCamera.CFrame.LookVector * 2
	end
	if d then
		fakepart.Position = fakepart.Position + workspace.CurrentCamera.CFrame.RightVector * 2
	end
end)
spawn(function()
	while true do
		local players = game.Players:GetPlayers()
		local closest = nil
		local shortestDistance = math.huge
		local localPlayer = game.Players.LocalPlayer
		local localRootPart = localPlayer.Character.HumanoidRootPart

		for _, player in pairs(players) do
			if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local targetRootPart = player.Character.HumanoidRootPart
				local distance = (localRootPart.Position - targetRootPart.Position).magnitude
				if distance < shortestDistance then
					shortestDistance = distance
					closest = player
				end
			end
		end

		if closest then
			local targetRootPart = closest.Character.HumanoidRootPart
			local direction = (targetRootPart.Position - localRootPart.Position).unit
			local lookAtCFrame = CFrame.lookAt(localRootPart.Position, Vector3.new(targetRootPart.Position.X,localRootPart.Position.Y,targetRootPart.Position.Z))
			localRootPart.CFrame = lookAtCFrame
		end

		fakepart.Rotation = localRootPart.Rotation
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
game:GetService("RunService").Heartbeat:Connect(function()
	if isdown then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(math.random(-5,5)/5,math.random(0,8)/2,math.random(-5,5)/5)) * CFrame.fromEulerAnglesXYZ(0,math.rad(45),0)
		game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(10000,9999,-9999)
		game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(-17.7,500,17.7)
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
	if not isdown then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fakepart.CFrame
	end
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(math.random(-250,250),math.random(-500,500),math.random(-250,250))
	--game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(math.random(-250,250),math.random(-500,500),math.random(-250,250))
	--game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0,180,0)
	task.wait()
end
