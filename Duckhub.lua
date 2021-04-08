 if game.PlaceId == 394506555 then 
     
local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vep1032/VepStuff/main/Rgb%20Ui"))()

MAINTTL = "Duck Hub"

local win = VLib:Window("Glue Piece", Color3.fromRGB(196, 40, 28))

    local rbg = win:Tab("RBG")
    local ss = win:Tab("MAIN")
    local sss = win:Tab("CREDITS")
    
rbg:Button("Button",function()
print("Pressed!")
end)


rbg:Toggle("Toggle",function(t)
print(t)
    end)


rbg:Slider("Slider",0,100,70,function(t)
print(t)
end)


rbg:Dropdown("Dropdown",{"Option 1", "Option 2", "Option 3", "Option 4", "Option 5"},function(t)
print(t)
end)
   
   
rbg:Colorpicker("Colorpicker",Color3.fromRGB(255, 1, 1),function(t)
print(t)
    end)

rbg:Textbox("Textbox", true,function(t)
print(t)
end)

    Character_Table = {}
    for i, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("NPC_Combat") then
            if not table.find(Character_Table, v.Name) then
                table.insert(Character_Table, v.Name)
            end
        end
    end

    local tool_table = {}
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(tool_table, v.Name)
        end
    end
    SelectedWeapon = nil

    ss:Dropdown(
        "Select Tool",
        tool_table,
        function(SelectedOption)
            SelectedWeapon = SelectedOption
        end
    )

    ss:Toggle(
        "AutoEquip",
        function(t)
            Equip = t
            while wait() do
                if Equip then
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.Name == SelectedWeapon then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                end
            end
        end
    )

    ss:Toggle(
        "Autofarm DevilFruits",
        function(t)
            getgenv().fruits = t
            while wait() do
                if getgenv().fruits == true then
                    for i, v in pairs(workspace:GetChildren()) do
                        if v:IsA("Tool") and v.Handle then
                            v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            firetouchinterest(
                                game.Players.LocalPlayer.Character.HumanoidRootPart,
                                v.Handle.TouchInterest.Parent,
                                0
                            )
                        end
                    end
                end
            end
        end
    )
    ss:Dropdown(
        "Mobs To Farm",
        Character_Table,
        function(t)
            mobs = t
        end
    )

    ss:Toggle(
        "Autofarm Start Mobs",
        function(state)
            farm = state
            game:GetService("RunService").Heartbeat:Connect(
                function()
                    if farm then
                        pcall(
                            function()
                                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                            end
                        )
                    end
                end
            )

            while farm do
                wait()

                for i, v in pairs(workspace:GetChildren()) do
                    if v.Name == mobs and v:FindFirstChild("HumanoidRootPart") then
                        repeat
                            wait()
                            pcall(
                                function()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                        CFrame.new(
                                        v.HumanoidRootPart.Position + Vector3.new(0, Distance, 0),
                                        v.HumanoidRootPart.Position
                                    )
                                end
                            )
                            wait()
                        until v.Humanoid.Health <= 0 or farm == false
                    end
                end
            end
        end
    )

    Distance = 5

    ss:Slider(
        "Distance",
        -9,
        10,
        3,
        function(t)
            Distance = t
        end
    )

    ss:Toggle(
        "AutoHit",
        function(t)
            hit = t
            while hit do
                wait()
                pcall(
                    function()
                        game:GetService("ReplicatedStorage").RemoteEvent.Combat.Punch:FireServer()
                    end
                )
            end
        end
    )

    sss:Button(
        "Hide Character",
        function()
            while wait() do
                pcall(
                    function()
                        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if v.ClassName == "Accessory" or v.Name == "Shirt" or v.Name == "Pants" then
                                v:Destroy()
                            end
                        end
                    end
                )
            end
        end
    )


sss:Label("Duck Hub")

sss:Label("Donate pls")

end 
