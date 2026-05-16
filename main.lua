debugX = true

-- Variables Here

local Players = game:GetService("Players")

local CHAM_COLOR = Color3.fromRGB(255, 50, 50)
local CHAM_OUTLINE = Color3.fromRGB(255, 255, 255)
local CHAM_FILL_TRANSPARENCY = 0.5
local CHAM_OUTLINE_TRANSPARENCY = 0

local chamsEnabled = false
local localPlayer = Players.LocalPlayer
local highlights = {}

-- big functions here

local function addCham(player)
	if player == localPlayer or not player.Character then return end
	local old = player.Character:FindFirstChild("PlayerCham")
	if old then old:Destroy() end
	local h = Instance.new("Highlight")
	h.Name = "PlayerCham"
	h.Adornee = player.Character
	h.FillColor = CHAM_COLOR
	h.OutlineColor = CHAM_OUTLINE
	h.FillTransparency = CHAM_FILL_TRANSPARENCY
	h.OutlineTransparency = CHAM_OUTLINE_TRANSPARENCY
	h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	h.Parent = player.Character
	highlights[player.UserId] = h
end

local function removeCham(player)
	highlights[player.UserId] = nil
	if player.Character then
		local h = player.Character:FindFirstChild("PlayerCham")
		if h then h:Destroy() end
	end
end

function ToggleChams(state)
	chamsEnabled = state
	for _, player in ipairs(Players:GetPlayers()) do
		if chamsEnabled then addCham(player) else removeCham(player) end
	end
end

local function setupPlayer(player)
	if chamsEnabled then addCham(player) end
	player.CharacterAdded:Connect(function()
		task.wait(0.1)
		highlights[player.UserId] = nil
		if chamsEnabled then addCham(player) end
	end)
end

for _, player in ipairs(Players:GetPlayers()) do setupPlayer(player) end
Players.PlayerAdded:Connect(setupPlayer)
Players.PlayerRemoving:Connect(function(player) highlights[player.UserId] = nil end)

getgenv().RAYFIELD_ASSET_ID = 72374703558148

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "First Script",
   Icon = 0,
   LoadingTitle = "Work In Progress",
   LoadingSubtitle = "by outtee",
   Theme = "Amethyst",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Native",
      FileName = "config"
   },

   Discord = {
      Enabled = false
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Main", "anvil")

local ESPSection = MainTab:CreateSection("ESP")

local ChamsToggle = MainTab:CreateToggle({
   Name = "Chams",
   CurrentValue = false,
   Callback = function(Value)
      ToggleChams(Value)
   end,
})

local OtherTab = Window:CreateTab("Other")

local DestroyButton = OtherTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      ToggleChams(false)
      Rayfield:Destroy()
   end,
})

Rayfield:LoadConfiguration()