local a=game:GetService("ReplicatedStorage").Rebirth;local b="Load"local c="Check"game:GetService("RunService").RenderStepped:Connect(function()if _G.Auto_Remote==true then game:GetService("ReplicatedStorage").RemoteDrop:FireServer()end end)local function d(e)game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()game:GetService("ReplicatedStorage").Layouts:InvokeServer(b,_G.Starting_Layout)end;local function f(e)game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()game:GetService("ReplicatedStorage").Layouts:InvokeServer(b,_G.Starting_Layout)wait(_G.Second_Timer)game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()game:GetService("ReplicatedStorage").Layouts:InvokeServer(b,_G.Second_Layout,_G.Items)end;if _G.Use_Second_Layout==false then d()elseif _G.Use_Second_Layout==true then f()end;while _G.autorebirth do local g=a:InvokeServer()if g==true then if _G.Use_Second_Layout==false then d()elseif _G.Use_Second_Layout==true then f()end end end
