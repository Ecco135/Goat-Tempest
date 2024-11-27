local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

Knit.AddControllers(ReplicatedStorage.Shared.Controller)

for _, v in pairs(ReplicatedStorage.Shared.Components:GetDescendants()) do
	if v:IsA("ModuleScript") then
		require(v)
	end
end

Knit.Start()
	:andThen(function()
		print("Knit client started")
		if not ReplicatedStorage:FindFirstChild("KnitController") then
			local KnitControllerReady = Instance.new("BoolValue", ReplicatedStorage)
			KnitControllerReady.Name = "KnitController"
			KnitControllerReady.Value = true
		end
	end)
	:catch(warn)
