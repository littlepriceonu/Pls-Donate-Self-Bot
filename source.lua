local VirtualUser=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)

if _G.hopAtPlayerAmount > 0 then
    spawn(function()
        while wait() do
            if #game.Players:GetChildren() <= _G.hopAtPlayerAmount then
                syn.queue_on_teleport([[
                _G.goal = ]] .._G.goal.. [[
                _G.Text = ]] .._G.Text.. [[

                _G.saythanks = ]] ..tostring(_G.saythanks).. [[

                _G.beg = ]] ..tostring(_G.beg).. [[
                _G.begInterval = ]] ..tostring(_G.begInterval).. [[
                _G.begText = ]] .. _G.begText .. [[

                _G.hopAtPlayerAmount = ]]..tostring(_G.hopAtPlayerAmount).. [[
                _G.hopInterval = ]].. tostring(_G.hopInterval) .. [[
                
                _G.boardUpdateInterval = ]] .. tostring(_G.boardUpdateInterval) .. [[ -- as you can guess, in seconds
                
                -- DONT Change! (or do if yk what you're doing)
                _G.loadstr = ]].. _G.loadstr .. [[

                loadstring(game:HttpGet(_G.loadstr, true))()]])
    
                local GUIDs = {}
                local maxPlayers = 0
                local pagesToSearch = 100
                local Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="))
                function Search()
                   for i = 1,pagesToSearch do
                    for i,v in pairs(Http.data) do
                        if v.playing ~= v.maxPlayers and v.id ~= game.JobId then
                            maxPlayers = v.maxPlayers
                            table.insert(GUIDs, {id = v.id, users = v.playing})
                        end
                    end
                    print("Searched!")
                    if Http.nextPageCursor ~= null then Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..Http.nextPageCursor)) else break end
                end
                end

                local highest = {id = "", users=0}
                function findHighest()
                for i,v in ipairs(GUIDs) do
                    if v.users > highest.users and not (v.users > (maxPlayers - 4)) then
                        highest = v
                    end
                end
                end

                function tp()
                   local suc = pcall(function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, highest.id, game.Players.LocalPlayer) end)
                   if not suc then 
                        Search()
                        findHighest()
                        tp()
                    end
                end

                tp()
            end
        end
    end)
end

if _G.hopInterval > 0 then
    spawn(function()
        wait(_G.hopInterval)
        syn.queue_on_teleport([[
            _G.goal = ]] .._G.goal.. [[
            _G.Text = ]] .._G.Text.. [[

            _G.saythanks = ]] ..tostring(_G.saythanks).. [[

            _G.beg = ]] ..tostring(_G.beg).. [[
            _G.begInterval = ]] ..tostring(_G.begInterval).. [[
            _G.begText = ]] .. _G.begText .. [[

            _G.hopAtPlayerAmount = ]]..tostring(_G.hopAtPlayerAmount).. [[
            _G.hopInterval = ]].. tostring(_G.hopInterval) .. [[
            
            _G.boardUpdateInterval = ]] .. tostring(_G.boardUpdateInterval) .. [[ -- as you can guess, in seconds
            
            -- DONT Change! (or do if yk what you're doing)
            _G.loadstr = ]].. _G.loadstr .. [[

            loadstring(game:HttpGet(_G.loadstr, true))()]])
    
        local GUIDs = {}
        local maxPlayers = 0
        local pagesToSearch = 100
        local Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="))
        function Search()
           for i = 1,pagesToSearch do
            for i,v in pairs(Http.data) do
                if v.playing ~= v.maxPlayers and v.id ~= game.JobId then
                    maxPlayers = v.maxPlayers
                    table.insert(GUIDs, {id = v.id, users = v.playing})
                end
            end
            print("Searched!")
            if Http.nextPageCursor ~= null then Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..Http.nextPageCursor)) else break end
        end 
        end

        local highest = {id = "", users=0}
        function findHighest()
        for i,v in ipairs(GUIDs) do
            if v.users > highest.users and not (v.users > (maxPlayers - 4)) then
                highest = v
            end
        end
        end

        function tp()
           local suc = pcall(function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, highest.id, game.Players.LocalPlayer) end)
           if not suc then 
                Search()
                findHighest()
                tp()
            end
        end

        tp()
    end)
end

local lib = require(game.ReplicatedStorage.Remotes)

old = hookfunction(lib.Event, function(name, ...)
    for i,v in ipairs(game.ReplicatedStorage.Remotes:GetChildren()) do
        if v.Name == name then return v end 
    end
    
    local event = old(name, ...)
    if event.Name then
       event.Name = name
       return event
    end
end)

local old2;

old2 = hookfunction(lib.Function, function(name, ...)
    for i,v in ipairs(game.ReplicatedStorage.Remotes:GetChildren()) do
        if v.Name == name then return v end 
    end
    
    local event = old(name, ...)
    if event.Name then
       event.Name = name
       return event
    end
end)

local data = {"InsufficientGiftbux","NewPurchasedBooths","PurchaseBoothStarted","NewGiftbuxBalance","AlreadyOwned","AdminCommandResponse","GetOurTopDonated","GlobalDonationsDown","FireSmite","FireNuke","ChangeMusic","GiftSentAlert","NotifyDonationParticipants","ChatDonationAlert","UserInfo","UnclaimedDonationCount","UnclaimedDonations","CheckFiltered","SetSettings","GetSettings","GiftbuxBalance","ExclusiveBooths","PurchasedBooths","CurrentBooth","GetDonated","SetDonatedVisibility","GiftReceived","DonatedChanged","EditBoothModel","SetBoothText","RefreshItems","PreloadItems","ClaimBooth","UnclaimBooth","CancelPromptPurchase",}
for i,v in ipairs(data) do
    lib.Event(v)
    lib.Function(v)
end

-- Claim Board

for i,v in ipairs(game.Workspace.BoothInteractions:GetChildren()) do
    if game.Players.LocalPlayer.PlayerGui.MapUIContainer.MapUI.BoothUI["BoothUI"..tostring(v:GetAttribute("BoothSlot"))].Details.Owner.Text == "unclaimed" then
        fireproximityprompt(v.Claim, 0)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.CFrame.x+3, v.CFrame.y+3, v.CFrame.z+3)
        return
    end
end

-- Setup Board

local event = lib.Event("SetBoothText")

local boothui = game.Players.LocalPlayer.PlayerGui.MapUIContainer.MapUI.BoothUI

local ourbooth

function getOurBooth()
for i,v in ipairs(boothui:GetChildren()) do
   if v.Details.Owner.Text:split("'")[1] == game.Players.LocalPlayer.DisplayName  then
       ourbooth = v
       print("Our Booth: " .. v.Name)
       break
    end
end
end

repeat getOurBooth(); wait() until ourbooth

event:FireServer(_G.Text .. ourbooth.Details.Raised.Text:split(" ")[1] .. " / " .. _G.goal, "booth")

if _G.beg then
    spawn(function()
        while wait(_G.begInterval) do
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(_G.begText)
        end
    end) 
end

local last = 0

while wait(_G.boardUpdateInterval) do
    if tonumber(ourbooth.Details.Raised.Text:split(" ")[1]) > last and _G.saythanks then
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Thanks for donating "..tostring(tonumber(ourbooth.Details.Raised.Text:split(" ")[1]) - last).."$!","All")
    end
    
    last = tonumber(ourbooth.Details.Raised.Text:split(" ")[1])
    event:FireServer(_G.Text .. ourbooth.Details.Raised.Text:split(" ")[1] .. " / " .. _G.goal, "booth")
end