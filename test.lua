local rebirth = game:GetService("ReplicatedStorage").Rebirth
local Load = "Load"

game:GetService("RunService").RenderStepped:Connect(function()
if Auto_Remote == true then
        game:GetService("ReplicatedStorage").RemoteDrop:FireServer()
    end
end)

local function layouts(player)
local Load = "Load"
local check = "Check"

if Use_Second_Layout == false then
    game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()
    game:GetService("ReplicatedStorage").Layouts:InvokeServer(Load, Starting_Layout)
elseif Use_Second_Layout == true then
    game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()
    game:GetService("ReplicatedStorage").Layouts:InvokeServer(Load, Starting_Layout)
    wait(Second_Timer)
    game:GetService("ReplicatedStorage").Layouts:InvokeServer(Load, Second_Layout, Items)
    end
end


layouts()

while _G.autorebirth do
local rebirthing = rebirth:InvokeServer()
if rebirthing == true then
    layouts()
    end

end
