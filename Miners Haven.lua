if not getgenv().theme then getgenv().theme={main=Color3.fromRGB(37,37,37),secondary=Color3.fromRGB(40,40,40),accent=Color3.fromRGB(255,255,255),accent2=Color3.fromRGB(161,161,161),off=Color3.fromRGB(255,45,45),on=Color3.fromRGB(0,255,102)}end;local a={}local b={}b.flags={}b.destroyed=false;b.funcstorage={}b.objstorage={}b.binding=false;b.tabinfo={button=nil,tab=nil}b.binds={}local c=setmetatable({},{__index=function(d,e)return game:GetService(e)end,__newindex=function(d,f)d[f]=nil;return end})local g=c.Players;local h=g.LocalPlayer;local i=h:GetMouse()function a:Tween(j,k,l)local m=TweenInfo.new(k[1],Enum.EasingStyle[k[2]],Enum.EasingDirection[k[3]])c.TweenService:Create(j,m,l):Play()end;function a:Ripple(j)spawn(function()if j.ClipsDescendants~=true then j.ClipsDescendants=true end;local n=Instance.new("ImageLabel")n.Name="Ripple"n.Parent=j;n.BackgroundColor3=Color3.fromRGB(255,255,255)n.BackgroundTransparency=1.000;n.ZIndex=8;n.Image="rbxassetid://2708891598"n.ImageTransparency=0.800;n.ScaleType=Enum.ScaleType.Fit;n.ImageColor3=getgenv().theme.accent;n.Position=UDim2.new((i.X-n.AbsolutePosition.X)/j.AbsoluteSize.X,0,(i.Y-n.AbsolutePosition.Y)/j.AbsoluteSize.Y,0)self:Tween(n,{1,"Linear","InOut"},{Position=UDim2.new(-5.5,0,-5.5,0),Size=UDim2.new(12,0,12,0)})wait(0.5)self:Tween(n,{.5,"Linear","InOut"},{ImageTransparency=1})wait(.5)n:Destroy()end)end;function a:Drag(o,p)if not p then p=o end;local q;local r;local s;local t;local function u(w)local x=w.Position-s;o.Position=UDim2.new(t.X.Scale,t.X.Offset+x.X,t.Y.Scale,t.Y.Offset+x.Y)end;p.InputBegan:Connect(function(w)if w.UserInputType==Enum.UserInputType.MouseButton1 then q=true;s=w.Position;t=o.Position;w.Changed:Connect(function()if w.UserInputState==Enum.UserInputState.End then q=false end end)end end)o.InputChanged:Connect(function(w)if w.UserInputType==Enum.UserInputType.MouseMovement then r=w end end)c.UserInputService.InputChanged:Connect(function(w)if w==r and q then u(w)end end)end;function b:UpdateToggle(y,z)if b.flags[y]==nil then return end;local j=b.objstorage[y]local A=b.flags[y]z=z or not A;local B=b.funcstorage[y]if A==z then return end;b.flags[y]=z;a:Tween(j.ToggleDisplay,{.15,"Linear","InOut"},{BackgroundColor3=z and getgenv().theme.on or getgenv().theme.off})B(z)end;function b:UpdateSlider(y,f,C,D)local E=self.objstorage[y]local F=E.SliderBar;local G=E.SliderText.SliderValHolder.SliderVal;local H=(i.X-F.AbsolutePosition.X)/F.AbsoluteSize.X;if f then H=(f-C)/(D-C)end;H=math.clamp(H,0,1)f=f or math.floor(C+(D-C)*H)b.flags[y]=f;G.Text=tostring(f)a:Tween(F.SliderFill,{0.05,"Linear","InOut"},{Size=UDim2.new(H,0,1,0)})self.funcstorage[y](tonumber(f))return tonumber(f)end;local I=false;function a:ChangeTab(J)if I then return end;local K,L=J[1],J[2]if not K or not L then return end;if b.tabinfo.button==K then return end;I=true;local M,N=b.tabinfo.button,b.tabinfo.tab;b.tabinfo={button=K,tab=L}local O=L.Parent;if O.ClipsDescendants==false then O.ClipsDescendants=true end;local P=O.Size;a:Tween(O,{0.3,"Sine","InOut"},{Size=UDim2.new(P.X.Scale,P.X.Offset,0,0)})a:Tween(M,{0.3,"Sine","InOut"},{TextColor3=getgenv().theme.accent2})wait(0.3)N.Visible=false;L.Visible=true;a:Tween(O,{0.3,"Sine","InOut"},{Size=P})a:Tween(K,{0.3,"Sine","InOut"},{TextColor3=getgenv().theme.accent})wait(0.3)I=false end;local function Q(R,S)local T=R;if typeof(T)=="Instance"then if T.UserInputType==Enum.UserInputType.Keyboard and S.KeyCode==T.KeyCode then return true elseif tostring(T.UserInputType):find("MouseButton")and S.UserInputType==T.UserInputType then return true end end;if tostring(T):find"MouseButton1"then return T==S.UserInputType else return T==S.KeyCode end end;c.UserInputService.InputBegan:Connect(function(w,U)if not b.binding and not b.destroyed and not U then for V,W in next,b.binds do local R=W.location[V]if R and Q(R,w)then W.callback()end end end end)function b:Init(X)X=X or"Library"local Y=Instance.new("ScreenGui")local Z=Instance.new("Frame")local _=Instance.new("UICorner")local a0=Instance.new("Frame")local a1=Instance.new("UICorner")local a2=Instance.new("UIListLayout")local a3=Instance.new("TextLabel")local a4=Instance.new("UIPadding")local a5=Instance.new("Frame")local a6=Instance.new("UICorner")local a7=Instance.new("ScrollingFrame")local a8=Instance.new("UIListLayout")local a9=Instance.new("UIPadding")local aa=Instance.new("Frame")local ab=Instance.new("UICorner")if syn and syn.protect_gui then syn.protect_gui(Y)end;Y.Name="Vertex"Y.Parent=(function()if gethui then return gethui()end;if get_hidden_gui then return get_hidden_gui()end;if c.RunService:IsStudio()then return c.Players.LocalPlayer:WaitForChild("PlayerGui")end;return c.CoreGui end)()function b:DestroyUI()b.destroyed=true;Y:Destroy()end;local ac=true;local ad=false;Z.Name=c.HttpService:GenerateGUID(true)Z.Parent=Y;Z.BackgroundColor3=getgenv().theme.secondary;Z.BorderSizePixel=0;Z.Position=UDim2.new(0.5,0,0.5,0)Z.Size=UDim2.new(0,658,0,434)Z.ClipsDescendants=true;Z.AnchorPoint=Vector2.new(0.5,0.5)local ae=nil;function b:ToggleUI()if ad then return end;ac=not ac;ad=true;if ac then a:Tween(Z,{0.5,"Sine","InOut"},{Position=ae})wait(0.5)ad=false else ae=Z.Position;a:Tween(Z,{0.5,"Sine","InOut"},{Position=UDim2.new(1.3,0,ae.Y.Scale,ae.Y.Offset)})wait(0.5)ad=false end end;_.CornerRadius=UDim.new(0,4)_.Name="MainC"_.Parent=Z;a0.Name="Top"a0.Parent=Z;a0.BackgroundColor3=getgenv().theme.main;a0.BorderSizePixel=0;a0.Position=UDim2.new(0,6,0,6)a0.Size=UDim2.new(0,646,0,36)a:Drag(Z,a0)a1.CornerRadius=UDim.new(0,4)a1.Name="TopC"a1.Parent=a0;a2.Name="TopL"a2.Parent=a0;a2.FillDirection=Enum.FillDirection.Horizontal;a2.SortOrder=Enum.SortOrder.LayoutOrder;a2.VerticalAlignment=Enum.VerticalAlignment.Center;a3.Name="Title"a3.Parent=a0;a3.BackgroundColor3=getgenv().theme.accent;a3.BackgroundTransparency=1.000;a3.Position=UDim2.new(0.0185758509,0,0.111111112,0)a3.Size=UDim2.new(0,49,0,28)a3.Font=Enum.Font.GothamBold;a3.Text=X;a3.TextColor3=getgenv().theme.accent;a3.TextSize=16.000;a3.TextXAlignment=Enum.TextXAlignment.Left;a4.Name="TopP"a4.Parent=a0;a4.PaddingLeft=UDim.new(0,12)a5.Name="Side"a5.Parent=Z;a5.BackgroundColor3=getgenv().theme.main;a5.BorderSizePixel=0;a5.Position=UDim2.new(0,6,0,48)a5.Size=UDim2.new(0,190,0,380)a6.CornerRadius=UDim.new(0,4)a6.Name="SideC"a6.Parent=a5;a7.Name="SideBtns"a7.Parent=a5;a7.Active=true;a7.BackgroundColor3=getgenv().theme.accent;a7.BackgroundTransparency=1.000;a7.BorderSizePixel=0;a7.Size=UDim2.new(0,190,0,380)a7.ScrollBarThickness=0;a8.Name="SideBtnsL"a8.Parent=a7;a8.HorizontalAlignment=Enum.HorizontalAlignment.Center;a8.SortOrder=Enum.SortOrder.LayoutOrder;a8.Padding=UDim.new(0,5)a9.Name="SideBtnsP"a9.Parent=a7;a9.PaddingTop=UDim.new(0,7)aa.Name="TabHolder"aa.Parent=Z;aa.BackgroundColor3=getgenv().theme.main;aa.BorderSizePixel=0;aa.Position=UDim2.new(0,202,0,48)aa.Size=UDim2.new(0,450,0,380)ab.CornerRadius=UDim.new(0,4)ab.Name="TabHolderC"ab.Parent=aa;a8:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()a7.CanvasSize=UDim2.new(0,0,0,a8.AbsoluteContentSize.Y+9)end)local af={}function af:Tab(X)X=X or"Tab"local ag=Instance.new("TextButton")local ah=Instance.new("UICorner")local ai=Instance.new("ScrollingFrame")local aj=Instance.new("UIListLayout")local ak=Instance.new("UIPadding")ag.Name="TabBtn"ag.Parent=a7;ag.BackgroundColor3=Color3.fromRGB(20,20,20)ag.BackgroundTransparency=1.000;ag.BorderColor3=Color3.fromRGB(27,42,53)ag.BorderSizePixel=0;ag.Position=UDim2.new(0.0315789469,0,0.0236842111,0)ag.Size=UDim2.new(0,178,0,29)ag.AutoButtonColor=false;ag.Font=Enum.Font.GothamSemibold;ag.Text=X;ag.TextColor3=b.tabinfo.button==nil and getgenv().theme.accent or getgenv().theme.accent2;ag.TextSize=14.000;ah.CornerRadius=UDim.new(0,4)ah.Name="TabBtnC"ah.Parent=ag;ai.Name="Tab"ai.Parent=aa;ai.Active=true;ai.BackgroundColor3=getgenv().theme.accent;ai.BackgroundTransparency=1.000;ai.BorderSizePixel=0;ai.Size=UDim2.new(0,450,0,380)ai.ScrollBarThickness=0;ai.Visible=b.tabinfo.tab==nil;aj.Name="TabL"aj.Parent=ai;aj.HorizontalAlignment=Enum.HorizontalAlignment.Center;aj.SortOrder=Enum.SortOrder.LayoutOrder;aj.Padding=UDim.new(0,5)ak.Name="TabP"ak.Parent=ai;ak.PaddingTop=UDim.new(0,7)ag.MouseButton1Click:Connect(function()a:Ripple(ag)a:ChangeTab({ag,ai})end)aj:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()ai.CanvasSize=UDim2.new(0,0,0,aj.AbsoluteContentSize.Y+12)end)if b.tabinfo.button==nil then b.tabinfo.button=ag end;if b.tabinfo.tab==nil then b.tabinfo.tab=ai end;local al={}function al:Button(am,an)am=am or"Button"an=an or function()end;local ao=Instance.new("TextButton")local ap=Instance.new("UICorner")ao.Name="Btn"ao.Parent=ai;ao.BackgroundColor3=getgenv().theme.secondary;ao.BorderColor3=Color3.fromRGB(27,42,53)ao.BorderSizePixel=0;ao.Position=UDim2.new(0,0,0.0249999985,0)ao.Size=UDim2.new(0,440,0,34)ao.AutoButtonColor=false;ao.Font=Enum.Font.GothamSemibold;ao.Text="   "..am;ao.TextColor3=getgenv().theme.accent;ao.TextSize=14.000;ao.TextXAlignment=Enum.TextXAlignment.Left;ap.CornerRadius=UDim.new(0,4)ap.Name="BtnC"ap.Parent=ao;ao.MouseButton1Click:Connect(function()a:Ripple(ao)an()end)end;function al:Toggle(am,y,aq,an)am=am or"Toggle"assert(y,"flag is a required argument")aq=aq or false;an=an or function()end;local ar=Instance.new("TextButton")local as=Instance.new("UICorner")local at=Instance.new("Frame")local au=Instance.new("UICorner")b.objstorage[y]=ar;b.funcstorage[y]=an;b.flags[y]=false;ar.Name="Toggle"ar.Parent=ai;ar.BackgroundColor3=getgenv().theme.secondary;ar.BorderColor3=Color3.fromRGB(27,42,53)ar.BorderSizePixel=0;ar.Position=UDim2.new(0,0,0.0249999985,0)ar.Size=UDim2.new(0,440,0,34)ar.AutoButtonColor=false;ar.Font=Enum.Font.GothamSemibold;ar.Text="   "..am;ar.TextColor3=getgenv().theme.accent;ar.TextSize=14.000;ar.TextXAlignment=Enum.TextXAlignment.Left;as.CornerRadius=UDim.new(0,4)as.Name="ToggleC"as.Parent=ar;at.Name="ToggleDisplay"at.Parent=ar;at.BackgroundColor3=Color3.fromRGB(255,44,44)at.BorderSizePixel=0;at.Position=UDim2.new(0.918181837,0,0.117647059,0)at.Size=UDim2.new(0,26,0,26)au.CornerRadius=UDim.new(0,4)au.Name="ToggleDisplayC"au.Parent=at;if aq then b:UpdateToggle(y,aq)end;at.InputBegan:Connect(function(S)if S.UserInputType==Enum.UserInputType.MouseButton1 then a:Ripple(at)b:UpdateToggle(y)end end)end;function al:Box(am,y,av,an)am=am or"Textbox"assert(y,"flag is a required argument")assert(av,"default is a required argument")an=an or function()end;b.flags[y]=av;local aw=Instance.new("TextButton")local ax=Instance.new("UICorner")local ay=Instance.new("Frame")local az=Instance.new("UIListLayout")local aA=Instance.new("TextBox")local aB=Instance.new("UICorner")aA:GetPropertyChangedSignal("TextBounds"):Connect(function()aA.Size=UDim2.new(0,aA.TextBounds.X+18,0,26)end)aw.Name="Textbox"aw.Parent=ai;aw.BackgroundColor3=getgenv().theme.secondary;aw.BorderColor3=Color3.fromRGB(27,42,53)aw.BorderSizePixel=0;aw.Position=UDim2.new(-0.0377777778,0,0.0184210502,0)aw.Size=UDim2.new(0,440,0,34)aw.AutoButtonColor=false;aw.Font=Enum.Font.GothamSemibold;aw.Text="   "..am;aw.TextColor3=getgenv().theme.accent;aw.TextSize=14.000;aw.TextXAlignment=Enum.TextXAlignment.Left;ax.CornerRadius=UDim.new(0,4)ax.Name="TextboxC"ax.Parent=aw;ay.Name="TextboxHolder"ay.Parent=aw;ay.BackgroundColor3=getgenv().theme.accent;ay.BackgroundTransparency=1.000;ay.BorderSizePixel=0;ay.Position=UDim2.new(0.752252221,0,0,0)ay.Size=UDim2.new(0,103,0,34)az.Name="TextboxHolderL"az.Parent=ay;az.FillDirection=Enum.FillDirection.Horizontal;az.HorizontalAlignment=Enum.HorizontalAlignment.Right;az.SortOrder=Enum.SortOrder.LayoutOrder;az.VerticalAlignment=Enum.VerticalAlignment.Center;aA.Name="TextInp"aA.Parent=ay;aA.BackgroundColor3=getgenv().theme.main;aA.BorderSizePixel=0;aA.Position=UDim2.new(-0.0199999996,0,0.117647059,0)aA.Size=UDim2.new(0,102,0,26)aA.Font=Enum.Font.Gotham;aA.Text=av;aA.TextColor3=getgenv().theme.accent;aA.TextSize=14.000;aB.CornerRadius=UDim.new(0,4)aB.Name="TextInpC"aB.Parent=aA;aA.FocusLost:Connect(function()if aA.Text==""then aA.Text=b.flags[y]end;b.flags[y]=aA.Text;an(aA.Text)end)end;function al:Label(am)am=am or"Label"local aC=Instance.new("TextButton")local aD=Instance.new("UICorner")aC.Name="Label"aC.Parent=ai;aC.BackgroundColor3=getgenv().theme.secondary;aC.BorderColor3=Color3.fromRGB(27,42,53)aC.BorderSizePixel=0;aC.Position=UDim2.new(0,0,0.0249999985,0)aC.Size=UDim2.new(0,440,0,34)aC.AutoButtonColor=false;aC.Font=Enum.Font.GothamSemibold;aC.Text="   "..am;aC.TextColor3=getgenv().theme.accent;aC.TextSize=14.000;aC.TextXAlignment=Enum.TextXAlignment.Left;aD.CornerRadius=UDim.new(0,4)aD.Name="LabelC"aD.Parent=aC;return aC end;function al:Slider(am,y,av,C,D,an)assert(y,"flag is a required argument")assert(av,"default is a required argument")assert(C,"min is a required argument")assert(D,"max is a required argument")an=an or function()end;am=am or"Slider"local f=av or C;local aE=Instance.new("TextButton")local aF=Instance.new("UICorner")local aG=Instance.new("TextButton")local aH=Instance.new("Frame")local aI=Instance.new("UIListLayout")local aJ=Instance.new("TextBox")local aK=Instance.new("UICorner")local aL=Instance.new("Frame")local aM=Instance.new("UICorner")local aN=Instance.new("Frame")local aO=Instance.new("UICorner")b.objstorage[y]=aE;b.funcstorage[y]=an;b.flags[y]=f;aE.Name="Slider"aE.Parent=ai;aE.BackgroundColor3=getgenv().theme.secondary;aE.BorderColor3=Color3.fromRGB(27,42,53)aE.BorderSizePixel=0;aE.Position=UDim2.new(0.0111111114,0,0.428947359,0)aE.Size=UDim2.new(0,440,0,51)aE.AutoButtonColor=false;aE.Font=Enum.Font.GothamSemibold;aE.Text=""aE.TextColor3=getgenv().theme.accent;aE.TextSize=14.000;aF.CornerRadius=UDim.new(0,4)aF.Name="SliderC"aF.Parent=aE;aG.Name="SliderText"aG.Parent=aE;aG.BackgroundColor3=getgenv().theme.secondary;aG.BackgroundTransparency=1.000;aG.BorderColor3=Color3.fromRGB(27,42,53)aG.BorderSizePixel=0;aG.Size=UDim2.new(0,444,0,34)aG.AutoButtonColor=false;aG.Font=Enum.Font.GothamSemibold;aG.Text="   "..am;aG.TextColor3=getgenv().theme.accent;aG.TextSize=14.000;aG.TextXAlignment=Enum.TextXAlignment.Left;aH.Name="SliderValHolder"aH.Parent=aG;aH.BackgroundColor3=getgenv().theme.accent;aH.BackgroundTransparency=1.000;aH.BorderSizePixel=0;aH.Position=UDim2.new(0.752252281,0,0,0)aH.Size=UDim2.new(0,100,0,34)aI.Name="SliderValHolderL"aI.Parent=aH;aI.FillDirection=Enum.FillDirection.Horizontal;aI.HorizontalAlignment=Enum.HorizontalAlignment.Right;aI.SortOrder=Enum.SortOrder.LayoutOrder;aI.VerticalAlignment=Enum.VerticalAlignment.Center;aJ.Name="SliderVal"aJ.Parent=aH;aJ.BackgroundColor3=getgenv().theme.main;aJ.BorderSizePixel=0;aJ.Position=UDim2.new(0.449999988,0,0.117647059,0)aJ.Size=UDim2.new(0,55,0,26)aJ.Font=Enum.Font.Gotham;aJ.Text=f;aJ.TextColor3=getgenv().theme.accent;aJ.TextSize=14.000;aK.CornerRadius=UDim.new(0,4)aK.Name="SliderValC"aK.Parent=aJ;aL.Name="SliderBar"aL.Parent=aE;aL.BackgroundColor3=getgenv().theme.main;aL.BorderSizePixel=0;aL.Position=UDim2.new(0,6,0,34)aL.Size=UDim2.new(0,428,0,10)aM.CornerRadius=UDim.new(0,4)aM.Name="SliderBarC"aM.Parent=aL;aN.Name="SliderFill"aN.Parent=aL;aN.BackgroundColor3=getgenv().theme.accent;aN.BorderSizePixel=0;aN.Size=UDim2.new(0,66,0,10)aO.CornerRadius=UDim.new(0,4)aO.Name="SliderFillC"aO.Parent=aN;aJ.Size=UDim2.new(0,aJ.TextBounds.X+18,0,26)aJ:GetPropertyChangedSignal("TextBounds"):Connect(function()a:Tween(aJ,{0.05,"Linear","InOut"},{Size=UDim2.new(0,aJ.TextBounds.X+18,0,26)})end)b:UpdateSlider(y,f,C,D)local q=false;aL.InputBegan:Connect(function(w)if w.UserInputType==Enum.UserInputType.MouseButton1 then b:UpdateSlider(y,nil,C,D)q=true end end)aL.InputEnded:Connect(function(w)if w.UserInputType==Enum.UserInputType.MouseButton1 then q=false end end)c.UserInputService.InputChanged:Connect(function(w)if q and w.UserInputType==Enum.UserInputType.MouseMovement then b:UpdateSlider(y,nil,C,D)end end)local aP=false;local aQ={[""]=true,["-"]=true}aJ.Focused:Connect(function()aP=true end)aJ.FocusLost:Connect(function()aP=false;if not tonumber(aJ.Text)then b:UpdateSlider(y,av or C,C,D)end end)aJ:GetPropertyChangedSignal("Text"):Connect(function()if not aP then return end;aJ.Text=aJ.Text:gsub("%D+","")local am=aJ.Text;if not tonumber(am)then aJ.Text=aJ.Text:gsub("%D+","")elseif not aQ[am]then if tonumber(am)>D then am=D;aJ.Text=tostring(D)end;b:UpdateSlider(y,tonumber(am)or f,C,D)end end)end;function al:Keybind(am,y,av,aR,an)assert(am,"text is a required arg")assert(y,"flag is a required arg")assert(av,"default is a required arg")aR=aR or false;an=an or function()end;b.flags[y]=av;local aS={Return=true,Space=true,Tab=true,Unknown=true}local aT={RightControl="RightCtrl",LeftControl="LeftCtrl",LeftShift="LShift",RightShift="RShift",MouseButton1="Mouse1",MouseButton2="Mouse2"}local aQ={MouseButton1=true,MouseButton2=true}local aU=av and(aT[av.Name]or av.Name)or"None"local aV=Instance.new("TextButton")local aW=Instance.new("UICorner")local aX=Instance.new("Frame")local aY=Instance.new("UIListLayout")local aZ=Instance.new("TextButton")local a_=Instance.new("UICorner")aV.Name="Keybind"aV.Parent=ai;aV.BackgroundColor3=getgenv().theme.secondary;aV.BorderColor3=Color3.fromRGB(27,42,53)aV.BorderSizePixel=0;aV.Position=UDim2.new(0,0,0.0249999985,0)aV.Size=UDim2.new(0,440,0,34)aV.AutoButtonColor=false;aV.Font=Enum.Font.GothamSemibold;aV.Text="   "..am;aV.TextColor3=getgenv().theme.accent;aV.TextSize=14.000;aV.TextXAlignment=Enum.TextXAlignment.Left;aW.CornerRadius=UDim.new(0,4)aW.Name="KeybindC"aW.Parent=aV;aX.Name="KeybindHolder"aX.Parent=aV;aX.BackgroundColor3=getgenv().theme.accent;aX.BackgroundTransparency=1.000;aX.BorderSizePixel=0;aX.Position=UDim2.new(0.752252221,0,0,0)aX.Size=UDim2.new(0,103,0,34)aY.Name="KeybindHolderL"aY.Parent=aX;aY.FillDirection=Enum.FillDirection.Horizontal;aY.HorizontalAlignment=Enum.HorizontalAlignment.Right;aY.SortOrder=Enum.SortOrder.LayoutOrder;aY.VerticalAlignment=Enum.VerticalAlignment.Center;aZ.Name="KeybindVal"aZ.Parent=aX;aZ.BackgroundColor3=getgenv().theme.main;aZ.BorderSizePixel=0;aZ.Position=UDim2.new(0.339805812,0,0.117647059,0)aZ.Size=UDim2.new(0,68,0,26)aZ.AutoButtonColor=false;aZ.Font=Enum.Font.Gotham;aZ.Text=aU;aZ.TextColor3=getgenv().theme.accent;aZ.TextSize=14.000;aZ.Size=UDim2.new(0,aZ.TextBounds.X+18,0,26)aZ:GetPropertyChangedSignal("TextBounds"):Connect(function()a:Tween(aZ,{0.05,"Linear","InOut"},{Size=UDim2.new(0,aZ.TextBounds.X+18,0,26)})end)a_.CornerRadius=UDim.new(0,4)a_.Name="KeybindValC"a_.Parent=aZ;aZ.MouseButton1Click:Connect(function()b.binding=true;aZ.Text="..."local b0,b1=c.UserInputService.InputBegan:wait()local b2=tostring(b0.KeyCode.Name)local b3=tostring(b0.UserInputType.Name)if b0.UserInputType~=Enum.UserInputType.Keyboard and aQ[b0.UserInputType.Name]and not aR or b0.KeyCode and not aS[b0.KeyCode.Name]then local b2=b0.UserInputType~=Enum.UserInputType.Keyboard and b0.UserInputType.Name or b0.KeyCode.Name;b.flags[y]=b0;aZ.Text=aT[b2]or b2 else if b.flags[y]then if not pcall(function()return b.flags[y].UserInputType end)then local b2=tostring(b.flags[y])KeybindValText=aT[b2]or b2 else local b2=b.flags[y].UserInputType~=Enum.UserInputType.Keyboard and b.flags[y].UserInputType.Name or b.flags[y].KeyCode.Name;KeybindValText=aT[b2]or b2 end end end;wait(0.1)b.binding=false end)if b.flags[y]then KeybindValText=aT[tostring(b.flags[y].Name)]or tostring(b.flags[y].Name)end;b.binds[y]={location=b.flags,callback=an}end;function al:Dropdown(am,y,b4,an)assert(y,"flag is a required argument")assert(b4,"options is a required argument")an=an or function()end;am=am or"Dropdown"local b5=nil;local b6={}if type(b4)~="table"or not b4[1]then b4={"No options provided"}end;b.flags[y]=b4[1]local b7=Instance.new("TextButton")local b8=Instance.new("UICorner")local b9=Instance.new("ImageButton")local ba=Instance.new("TextButton")local bb=Instance.new("UICorner")local bc=Instance.new("ScrollingFrame")local bd=Instance.new("UIListLayout")local be=Instance.new("UIPadding")b7.Name="DropdownTop"b7.Parent=ai;b7.BackgroundColor3=getgenv().theme.secondary;b7.BorderColor3=Color3.fromRGB(27,42,53)b7.BorderSizePixel=0;b7.Position=UDim2.new(0,0,0.0249999985,0)b7.Size=UDim2.new(0,440,0,34)b7.AutoButtonColor=false;b7.Font=Enum.Font.GothamSemibold;b7.Text="   "..am.." ("..b4[1]..")"b7.TextColor3=getgenv().theme.accent;b7.TextSize=14.000;b7.TextXAlignment=Enum.TextXAlignment.Left;b8.CornerRadius=UDim.new(0,4)b8.Name="DropdownTopC"b8.Parent=b7;b9.Name="Back"b9.Parent=b7;b9.BackgroundColor3=getgenv().theme.accent;b9.BackgroundTransparency=1.000;b9.BorderSizePixel=0;b9.Position=UDim2.new(0.913636327,0,0.0882352963,0)b9.Rotation=-90.000;b9.Size=UDim2.new(0,28,0,28)b9.Image="rbxassetid://4370337241"b9.ScaleType=Enum.ScaleType.Fit;ba.Name="DropdownBottom"ba.Parent=ai;ba.BackgroundColor3=getgenv().theme.secondary;ba.BorderColor3=Color3.fromRGB(27,42,53)ba.BorderSizePixel=0;ba.ClipsDescendants=true;ba.Position=UDim2.new(0.0111111114,0,0.176315784,0)ba.Size=UDim2.new(0,440,0,0)ba.Visible=false;ba.AutoButtonColor=false;ba.Font=Enum.Font.GothamSemibold;ba.Text=""ba.TextColor3=getgenv().theme.accent;ba.TextSize=14.000;ba.TextXAlignment=Enum.TextXAlignment.Left;bb.CornerRadius=UDim.new(0,4)bb.Name="DropdownBottomC"bb.Parent=ba;bc.Name="DropdownObjects"bc.Parent=ba;bc.Active=true;bc.BackgroundColor3=getgenv().theme.accent;bc.BackgroundTransparency=1.000;bc.Size=UDim2.new(1,0,1,0)bc.CanvasSize=UDim2.new(0,0,0,0)bc.ScrollBarThickness=0;bd.Name="DropdownObjectsList"bd.Parent=bc;bd.HorizontalAlignment=Enum.HorizontalAlignment.Center;bd.SortOrder=Enum.SortOrder.LayoutOrder;bd.Padding=UDim.new(0,4)be.Name="DropdownObjectsPadding"be.Parent=bc;be.PaddingTop=UDim.new(0,3)bd:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()bc.CanvasSize=UDim2.new(0,0,0,bd.AbsoluteContentSize.Y+8)end)local bf=false;local function bg()bf=not bf;if not bf then spawn(function()wait(.3)ba.Visible=false end)else ba.Visible=true end;local bh=172;if bd.AbsoluteContentSize.Y+8<bh then bh=bd.AbsoluteContentSize.Y+8 end;b7.Text="   %s (%s)";format(am,bf and"..."or b.flags[y])a:Tween(b9,{0.3,"Sine","InOut"},{Rotation=bf and 90 or-90})a:Tween(ba,{0.3,"Sine","InOut"},{Size=UDim2.new(0,447,0,bf and bh or 0)})end;bd:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()if not bf then return end;local bh=172;if bd.AbsoluteContentSize.X+8<bh then bh=bd.AbsoluteContentSize.Y+8 end;a:Tween(ba,{0.3,"Sine","InOut"},{Size=UDim2.new(0,447,0,bf and bh or 0)})end)b9.MouseButton1Click:Connect(function()bg()end)for bi,v in pairs(b4)do local bj=Instance.new("TextButton")local bk=Instance.new("UICorner")bj.Name="Option"bj.Parent=bc;bj.BackgroundColor3=Color3.fromRGB(20,20,20)bj.BackgroundTransparency=1.000;bj.BorderColor3=Color3.fromRGB(27,42,53)bj.BorderSizePixel=0;bj.Position=UDim2.new(0.0136363637,0,0.0176470596,0)bj.Size=UDim2.new(0,428,0,24)bj.AutoButtonColor=false;bj.Font=Enum.Font.GothamSemibold;bj.Text=v;bj.TextColor3=b5==nil and getgenv().theme.accent or getgenv().theme.accent2;bj.TextSize=14.000;bk.CornerRadius=UDim.new(0,4)bk.Name="OptionC"bk.Parent=bj;b5=bj;table.insert(b6,bj)bj.MouseButton1Click:Connect(function()if bj~=b5 then b5.TextColor3=getgenv().theme.accent2;bj.TextColor3=getgenv().theme.accent;b5=bj end;b.flags[y]=v;spawn(bg)spawn(function()an(bj.Text)end)end)end;local bl={}function bl:refresh(bm)for bi,v in pairs(b6)do v:Destroy()end;b6={}b5=nil;if type(bm)~="table"or not bm[1]then bm={"No options provided"}end;for bi,v in pairs(bm)do local bj=Instance.new("TextButton")local bk=Instance.new("UICorner")bj.Name="Option"bj.Parent=bc;bj.BackgroundColor3=Color3.fromRGB(20,20,20)bj.BackgroundTransparency=1.000;bj.BorderColor3=Color3.fromRGB(27,42,53)bj.BorderSizePixel=0;bj.Position=UDim2.new(0.0136363637,0,0.0176470596,0)bj.Size=UDim2.new(0,428,0,24)bj.AutoButtonColor=false;bj.Font=Enum.Font.GothamSemibold;bj.Text=v;bj.TextColor3=b5==nil and getgenv().theme.accent or getgenv().theme.accent2;bj.TextSize=14.000;bk.CornerRadius=UDim.new(0,4)bk.Name="OptionC"bk.Parent=bj;b5=bj;table.insert(b6,bj)bj.MouseButton1Click:Connect(function()if bj~=b5 then b5.TextColor3=getgenv().theme.accent2;bj.TextColor3=getgenv().theme.accent;b5=bj end;b.flags[y]=v;spawn(bg)spawn(function()an(bj.Text)end)end)end end;return bl end;return al end;return af end;local bn={toggles={rebirth=false,remote=false,crate=false,cratetp=false}}local bo=b:Init('Vertex Hub')local L=bo:Tab('Main')L:Toggle("Auto Rebirth","flag1",false,function(z)bn.toggles.rebirth=z end)game:GetService("RunService").RenderStepped:Connect(function()if bn.toggles.rebirth==true then game:GetService("ReplicatedStorage").Rebirth:InvokeServer()end end)L:Toggle("Auto Remote","flag2",false,function(z)bn.toggles.remote=z end)game:GetService("RunService").RenderStepped:Connect(function()if bn.toggles.remote==true then game:GetService("ReplicatedStorage").RemoteDrop:FireServer()end end)L:Toggle("Tp all crates","flag3",false,function(z)bn.toggles.cratetp=z end)game:GetService("RunService").RenderStepped:Connect(function()if bn.toggles.cratetp==true then for bi,bp in ipairs(game.Workspace:GetDescendants())do if bp:IsA("BasePart")and bp.Anchored==false and(bp.Name=="Research"or bp.Name=="Shadow"or bp.Name=="Egg"or bp.Name=="Lucky"or bp.Name=="Crystal"or bp.Name=="Golden"or bp.Name=="Diamond")then if autocrate then local bq=game:GetService("Players").LocalPlayer.Character:FindFirstChild("UpperTorso").Position;local br=Vector3.new(bq.X+3,bq.Y,bq.Z+3)bp.Position=br;wait()end end end end end)L:Toggle("Open All Crates","flag4",false,function(z)bn.toggles.crate=z end)local bs="Regular"local bt="Unreal"local bu="Inferno"local bv="Twitch"local bw="Luxury"local bx="Red-Banded"local by="Spectral"local bz="Magnificent"local bA="Heavenly"local bB="Easter"local bC="Birthday"local bD="Festive"local bE="Pumpkin"local bF=true;game:GetService("RunService").RenderStepped:Connect(function()if bn.toggles.cratetp==true then game:GetService("Players").LocalPlayer.PlayerGui.GUI.Unboxing.Unbox:Invoke(bs,bF)wait(5)game:GetService("Players").LocalPlayer.PlayerGui.GUI.Unboxing.Unbox:Invoke(bt,bF)wait(5)game:GetService("Players").LocalPlayer.PlayerGui.GUI.Unboxing.Unbox:Invoke(bu,bF)wait(5)game:GetService("Players").LocalPlayer.PlayerGui.GUI.Unboxing.Unbox:Invoke(bx,bF)wait(5)game:GetService("Players").LocalPlayer.PlayerGui.GUI.Unboxing.Unbox:Invoke(by,bF)wait(5)game:GetService("Players").LocalPlayer.PlayerGui.GUI.Unboxing.Unbox:Invoke(bA,bF)wait(5)game:GetService("Players").LocalPlayer.PlayerGui.GUI.Unboxing.Unbox:Invoke(bB,bF)wait(5)game:GetService("Players").LocalPlayer.PlayerGui.GUI.Unboxing.Unbox:Invoke(bC,bF)wait(5)game:GetService("Players").LocalPlayer.PlayerGui.GUI.Unboxing.Unbox:Invoke(bD,bF)wait(5)game:GetService("Players").LocalPlayer.PlayerGui.GUI.Unboxing.Unbox:Invoke(bE,bF)wait(5)end end)L:Button("Withdraw all",function()game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()end)L:Button("Anti idle",function()local bG=game:GetService("Players")local bH=game:GetService("RunService")local bI=bG.LocalPlayer;local bJ=bI.Character;while true do bJ=bI.Character;if bJ then local bK=bJ:FindFirstChild("Humanoid")local bL=bJ:FindFirstChild("HumanoidRootPart")if bK and bL then bK.WalkToPoint=bL.Position+Vector3.new(0,0,1)end end;wait(30)end end)local bR=bo:Tab('Visual')local bn={Visuals={BoxEsp=false,EnemyColor=Color3.fromRGB(196,40,28),TeamColor=Color3.fromRGB(31,128,29),TeamCheck=false}}local bS=setmetatable({LocalPlayer=game:GetService("Players").LocalPlayer,Camera=workspace.CurrentCamera},{__index=function(self,V)return rawget(self,V)or game:GetService(V)end})local bT={}function bT:IsAlive(h)if h and h.Character and h.Character:FindFirstChild("Head")and workspace:FindFirstChild(h.Character.Name)and h~=bS.LocalPlayer then return true end end;function bT:DrawSquare()local bU=Drawing.new("Square")bU.Color=Color3.fromRGB(190,190,0)bU.Thickness=0.5;bU.Filled=false;bU.Transparency=1;return bU end;bR:Toggle('Esp','ToggleFlag3',false,function(z)bn.Visuals.BoxEsp=z end)bR:Toggle('Esp Team Check',"NiggasButtholes",false,function(z)bn.Visuals.TeamCheck=z end)function bT:AddEsp(h)local bU=bT:DrawSquare()bS.RunService.Stepped:Connect(function()if bn.Visuals.TeamCheck and h.Team==bS.LocalPlayer.Team then bU.Color=bn.Visuals.TeamColor else bU.Color=bn.Visuals.EnemyColor end;if bT:IsAlive(h)and h.Character:FindFirstChild("HumanoidRootPart")then local bV,bW=bS.Camera:WorldToViewportPoint(h.Character.HumanoidRootPart.Position)local bX=bS.Camera:WorldToViewportPoint(h.Character.Head.Position+Vector3.new(0,0,0))local bY=bS.Camera:WorldToViewportPoint(h.Character.HumanoidRootPart.Position-Vector3.new(0,5,0))local bZ=bV.Y-(bX.Y-bY.Y)/2;local b_=bV.X-(bX.Y-bY.Y)/2;local c0=bX.Y-bY.Y;if bn.Visuals.BoxEsp then bU.Visible=bW;bU.Size=Vector2.new(bX.Y-bY.Y,bX.Y-bY.Y)bU.Position=Vector2.new(bV.X-(bX.Y-bY.Y)/2,bV.Y-(bX.Y-bY.Y)/2)else bU.Visible=false end else bU.Visible=false end end)end;for c1,v in pairs(bS.Players:GetPlayers())do if v~=bS.LocalPlayer then bT:AddEsp(v)end end;bS.Players.PlayerAdded:Connect(function(h)if v~=bS.LocalPlayer then bT:AddEsp(h)end end)local c2=bo:Tab('Settings')c2:Keybind('Toggle Cheat','KeybindFlag',Enum.KeyCode.Insert,false,function()b:ToggleUI()end)c2:Box('FOV','BoxFlag0',70,function(w)game:GetService("Workspace").Camera.FieldOfView=w end)local c3=bo:Tab('Credits')local c4=c3:Label('___Credits___')local c5=c3:Label('Owner: PurpleGuy')local c6=c3:Label('Ex Co-Owner: Felix')local c7=c3:Label('UI: 0x37')local c8=c3:Label('Scripting: Felix, PurpleGuy, neeX, 0x37, KiWidaSmil3r')return b
