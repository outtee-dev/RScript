debugX = true

-- Variables will be placed here.
local toggle = false
-- End variables

getgenv().RAYFIELD_ASSET_ID = 72374703558148

-- Functions will be placed here.

-- End Function section
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "First Script",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Work In Progress",
   LoadingSubtitle = "by outtee",
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Native", -- Create a custom folder for your hub/game
      FileName = "config"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
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

local ChamsButton = MainTab:CreateButton({
   Name = "Chams",
   Callback = function()
      toggle = not toggle
      if toggle then
         print("Chams Enabled")
      elseif not toggle then
         print("Chams Disabled")
      end
   end,
})

local OtherTab = Window:CreateTab("Other")

local DestroyButton = OtherTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      Rayfield:Destroy()
   end,
})

Rayfield:LoadConfiguration()