local PATH = game.CoreGui.TopBarApp.TopBarFrame
local TweenService = game:GetService("TweenService")

PATH.Size = UDim2.new(1, 0, 0, 56)
local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
if playerGui:FindFirstChild("Chat") then
    local chatFrame = playerGui.Chat.Frame
    if chatFrame then
        chatFrame.Position = UDim2.new(0, 15, 0, 20)
    end
end

PATH.LeftFrame.Layout.Padding = UDim.new(0, 8)

local function Create(Name, Properties, Children)
	local Object = Instance.new(Name)
	for i, v in next, Properties or {} do
		Object[i] = v
	end
	for i, v in next, Children or {} do
		v.Parent = Object
	end
	return Object
end

local threeDCube = Create("ImageButton", {
    BackgroundColor3 = Color3.fromRGB(0,0,0),
    BackgroundTransparency = 0.5,
    Image = PATH.LeftFrame.MenuIcon.Background.Image,
    Parent = PATH.LeftFrame,
    ScaleType = "Crop", 
    AutoButtonColor = false,
    Size = UDim2.new(0, 42, 0, 42),
    BorderSizePixel = 0,
    LayoutOrder = 1,
    Name = "ThreeDCube",
},{
    Create("Frame", {
        ClipsDescendants = true,
        Size = UDim2.new(1, 0, 1, 10000),
        Name = "ViewCrop",
        BackgroundTransparency = 1
    }, {
        Create("Frame", {
            Size = UDim2.new(0, 42, 0, 42),
            BackgroundTransparency = 1
        }, {
            Create("TextButton", {
                BackgroundTransparency = 1,
                BackgroundColor3 = Color3.fromRGB(255,255,255),
                AutoButtonColor = true,
                Size = UDim2.new(1, -6, 1, -6),
                AnchorPoint = Vector2.new(0.5,0.5),
                Position = UDim2.fromScale(0.5,0.5),
                Name = "StateOverlay",
                Text = ""
            }, {
                Create("ImageLabel", {
                    Image = "rbxassetid://16815954372",
                    Size = UDim2.new(0, 23, 0, 23),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundTransparency = 1,
                    Name = "Icon"
                }),
                Create("UICorner", {
                    CornerRadius = UDim.new(1,0)
                }),
                Create("Frame", {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 1, 0),
                    Position = UDim2.new(0, 40, 0, 0),
                    Name = "ContentFrame"
                }, {
                    Create("Folder",{
                        Name = "ContentFolder"
                    }, {
                        Create("UIListLayout", {
                            Name = "Layout",
                            VerticalAlignment = "Center",
                            SortOrder = "LayoutOrder",
                            HorizontalAlignment = "Left",
                            FillDirection = "Horizontal",
                            Padding = UDim.new(0,6)
                        })
                    })
                })
            })
        })
    }),
    Create("UICorner", {
        CornerRadius = UDim.new(1,0)
    })
})

local UIListLayoutPath = PATH.LeftFrame.ThreeDCube.ViewCrop.Frame.StateOverlay.ContentFrame.ContentFolder
local ContentFramePath = PATH.LeftFrame.ThreeDCube.ViewCrop.Frame.StateOverlay.ContentFrame

if PATH.LeftFrame:FindFirstChild("ChatIcon") then
    PATH.LeftFrame.ChatIcon.Parent = UIListLayoutPath
end
if PATH.RightFrame:FindFirstChild("MoreMenu") then
    PATH.RightFrame.MoreMenu.Parent = UIListLayoutPath
    UIListLayoutPath.MoreMenu.Visible = false
end

function Setting(Name)
    PATH.LeftFrame[Name].Background.StateOverlay.Visible = false
    PATH.LeftFrame[Name].Background.BackgroundTransparency = 0.5
    PATH.LeftFrame[Name].Size = UDim2.new(0, 42, 0, 42)
    PATH.LeftFrame[Name].Background.AutoButtonColor = false
    PATH.LeftFrame[Name].Background.Size = UDim2.new(0, 42, 0, 42)
    Instance.new("UICorner", PATH.LeftFrame[Name].Background).CornerRadius = UDim.new(1,0)
end

function Setting2(Name)
    UIListLayoutPath[Name].Background.BackgroundColor3 = Color3.fromRGB(255,255,255)
    UIListLayoutPath[Name].Background.StateOverlay.Visible = false
    UIListLayoutPath[Name].Background.BackgroundTransparency = 1
    UIListLayoutPath[Name].Size = UDim2.new(0, 42, 0, 42)
    UIListLayoutPath[Name].Background.AutoButtonColor = false
    UIListLayoutPath[Name].Background.Size = UDim2.new(0, 42, 0, 42)
    Instance.new("UICorner", UIListLayoutPath[Name].Background).CornerRadius = UDim.new(1,0)
end

Setting("MenuIcon")
PATH.LeftFrame['MenuIcon'].Background.MouseEnter:Connect(function()
    TweenService:Create(PATH.LeftFrame['MenuIcon'].Background, TweenInfo.new(0.15), {BackgroundTransparency=0.4}):Play()
end)

PATH.LeftFrame['MenuIcon'].Background.MouseLeave:Connect(function()
    TweenService:Create(PATH.LeftFrame['MenuIcon'].Background, TweenInfo.new(0.15), {BackgroundTransparency=0.5}):Play()
end)
    
Setting2("ChatIcon")
    
UIListLayoutPath.ChatIcon.Size = UDim2.new(0, 36, 0, 36)
UIListLayoutPath.ChatIcon.Background.Size = UDim2.new(0, 36, 0, 36)
UIListLayoutPath.ChatIcon.Background.ImageTransparency = 1

PATH.LeftFrame.MenuIcon.Background.Icon.Image = "rbxassetid://16814856911"

function Settings3(Name)
    UIListLayoutPath[Name].OpenButton.StateOverlay.Visible = false
    UIListLayoutPath[Name].OpenButton.BackgroundTransparency = 1
    UIListLayoutPath[Name].OpenButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
    UIListLayoutPath[Name].OpenButton.ImageTransparency = 1
    UIListLayoutPath[Name].Size = UDim2.new(0, 36, 0, 36)
    UIListLayoutPath[Name].OpenButton.AutoButtonColor = false
    UIListLayoutPath[Name].OpenButton.Size = UDim2.new(0, 36, 0, 36)
    UIListLayoutPath[Name].MoreMenuContainer.Position = UDim2.new(6.85, 12, 0, 30)
    Instance.new("UICorner", UIListLayoutPath[Name].OpenButton).CornerRadius = UDim.new(1,0)
end

Settings3("MoreMenu")

PATH.LeftFrame.Layout.VerticalAlignment = "Bottom"

local threeDCubeSize = ""
threeDCubeSize = UDim2.new(0, 42 + UIListLayoutPath.Layout.AbsoluteContentSize.X + 4, 0, 42)
threeDCube.Size = threeDCubeSize

UIListLayoutPath.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    threeDCubeSize = UDim2.new(0, 42 + UIListLayoutPath.Layout.AbsoluteContentSize.X + 4, 0, 42)
    TweenService:Create(threeDCube, TweenInfo.new(0.07, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = threeDCubeSize}):Play()
end)

UIListLayoutPath.ChatIcon.Background.Icon:GetPropertyChangedSignal("Image"):Connect(function()
    if UIListLayoutPath.ChatIcon.Background.Icon.Image == "rbxasset://textures/ui/TopBar/chatOn.png" then
        TweenService:Create(PATH.LeftFrame.ThreeDCube.ViewCrop.Frame.StateOverlay.ContentFrame.ContentFolder['ChatIcon'].Background, TweenInfo.new(0.15), {BackgroundTransparency=0.88}):Play()
    elseif UIListLayoutPath.ChatIcon.Background.Icon.Image == "rbxasset://textures/ui/TopBar/chatOff.png" then
        TweenService:Create(PATH.LeftFrame.ThreeDCube.ViewCrop.Frame.StateOverlay.ContentFrame.ContentFolder['ChatIcon'].Background, TweenInfo.new(0.15), {BackgroundTransparency=1}):Play()
    end
end)

UIListLayoutPath.MoreMenu.OpenButton.Icon:GetPropertyChangedSignal("Image"):Connect(function()
    if UIListLayoutPath.MoreMenu.OpenButton.Icon.Image == "rbxasset://textures/ui/TopBar/moreOn.png" then
        TweenService:Create(PATH.LeftFrame.ThreeDCube.ViewCrop.Frame.StateOverlay.ContentFrame.ContentFolder['MoreMenu'].OpenButton, TweenInfo.new(0.15), {BackgroundTransparency=0.88}):Play()
    elseif UIListLayoutPath.MoreMenu.OpenButton.Icon.Image == "rbxasset://textures/ui/TopBar/moreOff.png" then
        TweenService:Create(PATH.LeftFrame.ThreeDCube.ViewCrop.Frame.StateOverlay.ContentFrame.ContentFolder['MoreMenu'].OpenButton, TweenInfo.new(0.15), {BackgroundTransparency=1}):Play()
    end
end)

local toggled = false

PATH.LeftFrame.ThreeDCube.ViewCrop.Frame.StateOverlay.MouseButton1Click:Connect(function()
    if toggled == false then
        threeDCube.ViewCrop.Frame.StateOverlay.BackgroundTransparency = 0.9
        toggled = true
        threeDCube.ViewCrop.Frame.StateOverlay.Icon.Image = "rbxassetid://10747384394"
        threeDCube.ViewCrop.Frame.StateOverlay.Icon.Size = UDim2.new(0, 19, 0, 19)
        wait(0.07)
        threeDCube.ViewCrop.Size = UDim2.new(8, 0, 1, 10000)
        UIListLayoutPath.MoreMenu.Visible = true
        UIListLayoutPath.Line.Visible = true
        UIListLayoutPath.Line2.Visible = true
        UIListLayoutPath.UserIcon.Visible = true
        UIListLayoutPath.InfoIcon.Visible = true
    else
        threeDCube.ViewCrop.Size = UDim2.new(1, 0, 1, 10000)
        threeDCube.ViewCrop.Frame.StateOverlay.BackgroundTransparency = 1
        threeDCube.ViewCrop.Frame.StateOverlay.Icon.Size = UDim2.new(0, 23, 0, 23)
        toggled = false
        threeDCube.ViewCrop.Frame.StateOverlay.Icon.Image = "rbxassetid://16815954372"
        UIListLayoutPath.MoreMenu.Visible = false
        UIListLayoutPath.Line.Visible = false
        UIListLayoutPath.Line2.Visible = false
        UIListLayoutPath.UserIcon.Visible = false
        UIListLayoutPath.InfoIcon.Visible = false
        TweenService:Create(threeDCube, TweenInfo.new(0.07, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 42 + 36 + 4, 0, 42)}):Play()
    end
end)
  
local Line = Create("Frame", {
    BorderSizePixel = 0,
    BackgroundTransparency = 0.8,
    BackgroundColor3 = Color3.fromRGB(255,255,255),
    Parent = UIListLayoutPath,
    Size = UDim2.new(0, 1, 1, -10),
    LayoutOrder = 7,
    Name = "Line",
    Visible = false
})
local UserIcon = Create("ImageLabel", {
    Image = game:GetService("Players"):GetUserThumbnailAsync(game:GetService("Players").LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420),
    BackgroundTransparency = 0.15,
    Size = UDim2.new(0, 36, 0, 36),
    BackgroundColor3= Color3.fromRGB(234,234,234),
    Parent = UIListLayoutPath,
    LayoutOrder = 8,
    Name = "UserIcon",
    Visible = false
}, {
    Create("UICorner", {
        CornerRadius = UDim.new(1,0)
    })
})
local Line2 = Create("Frame", {
    BorderSizePixel = 0,
    BackgroundTransparency = 0.8,
    BackgroundColor3 = Color3.fromRGB(255,255,255),
    Parent = UIListLayoutPath,
    Size = UDim2.new(0, 1, 1, -10),
    LayoutOrder = 9,
    Name = "Line2",
    Visible = false
})
local InfoIcon = Create("TextButton", {
    Name = "InfoIcon",
    Text = "",
    BackgroundTransparency = 1,
    BackgroundColor3 = Color3.fromRGB(255,255,255),
    Size = UDim2.new(0, 36, 0, 36), 
    Parent = UIListLayoutPath,
    LayoutOrder = 10,
    Visible = false,
    AutoButtonColor = false
}, {
    Create("UICorner", {
        CornerRadius = UDim.new(1,0)
    }),
    Create("ImageLabel", {
        Image = "rbxassetid://16858092523",
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 23, 0, 23),
        Name = "Icon",
        AnchorPoint = Vector2.new(0.5,0.5),
        Position = UDim2.fromScale(0.5,0.5)
    })
})
local InfoUIScreenGui = Create("ScreenGui", {
    Name = "InfoUI",
    Parent = game:GetService("Players").LocalPlayer.PlayerGui
}, {
    Create("Frame", {
        BackgroundTransparency = 0.3,
        BackgroundColor3 = Color3.fromRGB(0,0,0),
        Size = UDim2.new(0, 450, 0, 200),
        Position = UDim2.new(0.5, 0, 3, 0),
        AnchorPoint = Vector2.new(0.5,0.5)
    }, {
        Create("UIPadding", {
            PaddingTop = UDim.new(0, 17),
            PaddingLeft = UDim.new(0, 25),
            PaddingRight = UDim.new(0, 25),
            PaddingBottom = UDim.new(0, 17)
        }),
        Create("UICorner", {
            CornerRadius = UDim.new(0, 21)
        }),
        Create("TextLabel", {
            Text = "ExperienceControl", 
            TextColor3 = Color3.fromRGB(255,255,255),
            TextSize = 25,
            Font = "GothamMedium",
            TextXAlignment = "Left",
            TextYAlignment = "Top",
            BackgroundTransparency = 1
        }),
        Create("TextLabel", {
            Text = "This is an unofficial script and I do not encourage anyone to use it, this script is made for exploits. this script was written to have fanmade experience control",
            TextColor3 = Color3.fromRGB(255,255,255),
            TextSize = 15,
            Font = "Gotham",
            TextXAlignment = "Left",
            TextYAlignment = "Top",
            Position = UDim2.new(0, 0, 0, 35),
            Size = UDim2.new(1, 0, 0, 50),
            TextWrapped = true,
            BackgroundTransparency = 1
        }),
        Create("TextButton", {
            Text = "https://github.com/AlikSusFootages/ExperienceControlFanmade",
            TextColor3 = Color3.fromRGB(0,128,255),
            Font = "Gotham",
            TextSize = 13,
            TextXAlignment = "Left",
            TextYAlignment = "Top",
            Position = UDim2.new(0, 0, 0, 85),
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 383, 0,12),
            Name = "CopyText"
        }),
        Create("TextLabel", {
            Text = "(Click to copy)",
            TextColor3 = Color3.fromRGB(200,200,200),
            TextXAlignment = "Left",
            TextYAlignment = "Top",
            Position = UDim2.new(0, 0, 0, 100),
            BackgroundTransparency = 1,
            Font = "Gotham",
            TextSize = 13
        }),
        Create("TextButton", {
            Text = "OK",
            Font = "Gotham",
            BackgroundTransparency = 0.2,
            BackgroundColor3 = Color3.fromRGB(0,0,0),
            Size = UDim2.new(1,0,0,42),
            Position = UDim2.new(0,0,1,0),
            AnchorPoint = Vector2.new(0,1),
            AutoButtonColor = false,
            TextSize = 20,
            TextColor3 = Color3.fromRGB(255,255,255),
            Name = "CloseButton"
        }, {
            Create("UICorner", {
                CornerRadius = UDim.new(1,0)
            })
        })
    })
})

InfoUIScreenGui.Frame.CopyText.MouseButton1Click:Connect(function()
    toclipboard("https://github.com/AlikSusFootages/ExperienceControlFanmade")
end)
local toggled3 = false
InfoUIScreenGui.Frame.CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(InfoUIScreenGui.Frame, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5, 0, 3, 0)}):Play()
    toggled3 = false
    InfoIcon.Icon.Image = "rbxassetid://16858092523"
    InfoIcon.BackgroundTransparency = 1
end)

InfoIcon.MouseButton1Click:Connect(function()
    if toggled3 == false then
        TweenService:Create(InfoUIScreenGui.Frame, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
        toggled3 = true
        InfoIcon.Icon.Image = "rbxassetid://16858097944"
        InfoIcon.BackgroundTransparency = 0.9
    else
        TweenService:Create(InfoUIScreenGui.Frame, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5, 0, 3, 0)}):Play()
        toggled3 = false
        InfoIcon.Icon.Image = "rbxassetid://16858092523"
        InfoIcon.BackgroundTransparency = 1
    end
end)
