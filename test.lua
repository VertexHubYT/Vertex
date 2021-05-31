local rebirth = game:GetService("ReplicatedStorage").Rebirth
local Load = "Load"

game:GetService("RunService").RenderStepped:Connect(function()
if _G.Auto_Remote == true then
        game:GetService("ReplicatedStorage").RemoteDrop:FireServer()
    end
end)

local function layouts(player)
local Load = "Load"
local check = "Check"

game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()
        
if _G.Use_Second_Layout == false then
    game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()
    game:GetService("ReplicatedStorage").Layouts:InvokeServer(Load, _G.Starting_Layout)
elseif _G.Use_Second_Layout == true then
    game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()
    game:GetService("ReplicatedStorage").Layouts:InvokeServer(Load, _G.Starting_Layout)
    wait(_G.Second_Timer)
    game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()
    game:GetService("ReplicatedStorage").Layouts:InvokeServer(Load, _G.Second_Layout, _G.Items.costs)
    end
end


layouts()

while _G.autorebirth do
local rebirthing = rebirth:InvokeServer()
if rebirthing == true then
    layouts()
    end

end
