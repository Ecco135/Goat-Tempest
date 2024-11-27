local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

Knit.AddServices(ServerStorage.Source.Services)

for _, v in pairs(ServerStorage.Source.Components:GetChildren()) do
	if v:IsA("ModuleScript") then
		require(v)
	end
end

Knit.Start()
	:andThen(function()
		print("Knit started")
		if not ReplicatedStorage:FindFirstChild("KnitService") then
			local KnitServiceReady = Instance.new("BoolValue", ReplicatedStorage)
			KnitServiceReady.Name = "KnitService"
			KnitServiceReady.Value = true
		end
	end)
	:catch(warn)

--ready with arcanist
