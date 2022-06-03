local plr = game:GetService("Players").LocalPlayer
local ls = plr:FindFirstChild("Leaderstats")
local m = ls:FindFirstChild("Money")

local stock1symbol = ls:FindFirstChild("Stock1Symbol")
local stock1quantity = ls:FindFirstChild("Stock1Quantity")
local stock2symbol = ls:FindFirstChild("Stock2Symbol")
local stock2quantity = ls:FindFirstChild("Stock2Quantity")
local stock3symbol = ls:FindFirstChild("Stock3Symbol")
local stock3quantity = ls:FindFirstChild("Stock3Quantity")
local stock4symbol = ls:FindFirstChild("Stock4Symbol")
local stock4quantity = ls:FindFirstChild("Stock4Quantity")
local stock5symbol = ls:FindFirstChild("Stock5Symbol")
local stock5quantity = ls:FindFirstChild("Stock5Quantity")

local F = script.Parent
local TB_Toggle = script.Parent.Parent:WaitForChild("Toggle")
local TB_Help = script.Parent:WaitForChild("Help")
local F_Help = script.Parent.Parent:WaitForChild("Help")

local F_Notify = script.Parent.Parent:WaitForChild('Notify')
local TL_Notify_Message = F_Notify:WaitForChild("Message")

F.Visible = false

local symbol

local RS = game:GetService("ReplicatedStorage")
local REs = RS:WaitForChild("REs")
local RFs = RS:WaitForChild("RFs")
local rE_RequestPrice = REs:WaitForChild("RequestPrice")
local rE_InformPrice = REs:WaitForChild("InformPrice")
local rF_BuySellStock = RFs:WaitForChild("BuySellStock")
local rF_CalculatePrice = RFs:WaitForChild("CalculatePrice")

local F_PleaseWait = script.Parent.Parent:WaitForChild("PleaseWait")
local F_Holdings = script.Parent.Parent:WaitForChild("Holdings")
local tc_F_Row = F_Holdings:WaitForChild("Row")

local F_Row_Size_Y = .124

local TL_CurrentPrice = script.Parent:WaitForChild("CurrentPrice")
local TL_PercentChange = script.Parent:WaitForChild("PercentChange")
local TL_Price5MinutesAgo = script.Parent:WaitForChild("Price5MinutesAgo")
local TL_StockName = script.Parent:WaitForChild("StockName")
local TL_SharesOwned = script.Parent:WaitForChild("SharesOwned")
local TL_AverageCost = script.Parent:WaitForChild("AverageCost")

local TL_Money = script.Parent:WaitForChild("Money")

local IL_DirectionArrow = script.Parent:WaitForChild("DirectionArrow")

local TB_Go = script.Parent:WaitForChild("Go")
local TB_Buy = script.Parent:WaitForChild("Buy")
local TB_Sell = script.Parent:WaitForChild("Sell")
local TB_PrintHoldings = script.Parent:WaitForChild("PrintHoldings")
local TB_Holdings = script.Parent:WaitForChild("Holdings")
local TB_Close_Holdings = F_Holdings:WaitForChild("Close")

local textBox = script.Parent:WaitForChild("TextBox")

TB_Help.MouseButton1Click:Connect(function()
	F_Help.Visible = true
end)


--[[
when i sold apple it ended up setting all other slots price to apples. 
	it seems to do this when it sells the last share of apple. It also happened when I had 0 shares of apple and I bought 1
damn
]]

local function DisplayHoldings()
	--for i,v in pairs(F_Holdings:GetChildren()) do
	--	if v:IsA("Frame") then
	--		if v.Name ~= "Header" and v.Name ~= "Row" then
	--			v:Destroy()
	--		end
	--	end
	--end
	print"DisplayHOldings function is being called"
	
	if stock1symbol.Value == "" and stock2symbol.Value == "" and stock3symbol.Value == "" and stock4symbol.Value == "" and stock5symbol.Value == "" then
		warn(plr.Name.." has no current stock holdings.")
		return
	end
	F_PleaseWait.Visible = true
	if stock1symbol.Value ~= "" then
		pcall(function()
			local stringToSend = tostring(stock1symbol.Value)
			local price1 = rF_CalculatePrice:InvokeServer(stringToSend)
			F_Holdings.Row1.CurrentPrice.Text = "$"..tostring(price1)
			F_Holdings.Row1.CurrentValue.Text = "$"..tostring(price1 * stock1quantity.Value)
			F_Holdings.Row1.Quantity.Text = stock1quantity.Value
			F_Holdings.Row1.Symbol.Text = stock1symbol.Value
		end)
	else
		F_Holdings.Row1.CurrentPrice.Text = "-"
		F_Holdings.Row1.CurrentValue.Text = "-"
		F_Holdings.Row1.Quantity.Text = "-"
		F_Holdings.Row1.Symbol.Text = "-"		
	end
	
	if stock2symbol.Value ~= "" then
		pcall(function()
			local stringToSend = tostring(stock2symbol.Value)
			local price2 = rF_CalculatePrice:InvokeServer(stringToSend)
			F_Holdings.Row2.CurrentPrice.Text = "$"..tostring(price2)
			F_Holdings.Row2.CurrentValue.Text = "$"..tostring(price2 * stock2quantity.Value)
			F_Holdings.Row2.Quantity.Text = stock2quantity.Value
			F_Holdings.Row2.Symbol.Text = stock2symbol.Value
		end)
	else
		F_Holdings.Row2.CurrentPrice.Text = "-"
		F_Holdings.Row2.CurrentValue.Text = "-"
		F_Holdings.Row2.Quantity.Text = "-"
		F_Holdings.Row2.Symbol.Text = "-"	
	end
	
	if stock3symbol.Value ~= "" then
		pcall(function()
			local stringToSend = tostring(stock3symbol.Value)
			local price3 = rF_CalculatePrice:InvokeServer(stringToSend)
			F_Holdings.Row3.CurrentPrice.Text = "$"..tostring(price3)
			F_Holdings.Row3.CurrentValue.Text = "$"..tostring(price3 * stock3quantity.Value)
			F_Holdings.Row3.Quantity.Text = stock3quantity.Value
			F_Holdings.Row3.Symbol.Text = stock3symbol.Value
		end)
	else
		F_Holdings.Row3.CurrentPrice.Text = "-"
		F_Holdings.Row3.CurrentValue.Text = "-"
		F_Holdings.Row3.Quantity.Text = "-"
		F_Holdings.Row3.Symbol.Text = "-"	
	end
	
	if stock4symbol.Value ~= "" then
		pcall(function()
			local stringToSend = tostring(stock4symbol.Value)
			local price4 = rF_CalculatePrice:InvokeServer(stringToSend)
			F_Holdings.Row4.CurrentPrice.Text = "$"..tostring(price4)
			F_Holdings.Row4.CurrentValue.Text = "$"..tostring(price4 * stock4quantity.Value)
			F_Holdings.Row4.Quantity.Text = stock4quantity.Value
			F_Holdings.Row4.Symbol.Text = stock4symbol.Value
		end)
	else
		F_Holdings.Row4.CurrentPrice.Text = "-"
		F_Holdings.Row4.CurrentValue.Text = "-"
		F_Holdings.Row4.Quantity.Text = "-"
		F_Holdings.Row4.Symbol.Text = "-"	
	end
	
	if stock5symbol.Value ~= "" then
		pcall(function()
			local stringToSend = tostring(stock5symbol.Value)
			local price5 = rF_CalculatePrice:InvokeServer(stringToSend)
			F_Holdings.Row5.CurrentPrice.Text = "$"..tostring(price5)
			F_Holdings.Row5.CurrentValue.Text = "$"..tostring(price5 * stock5quantity.Value)
			F_Holdings.Row5.Quantity.Text = stock5quantity.Value
			F_Holdings.Row5.Symbol.Text = stock5symbol.Value
		end)
	else
		F_Holdings.Row5.CurrentPrice.Text = "-"
		F_Holdings.Row5.CurrentValue.Text = "-"
		F_Holdings.Row5.Quantity.Text = "-"
		F_Holdings.Row5.Symbol.Text = "-"	
	end
	
	F_PleaseWait.Visible = false
	
	--for i = 1, 5 do
	--	if v.Value > 0 then
	--		local price = rF_CalculatePrice:InvokeServer(symbol)
	--		local row = tc_F_Row:Clone()
	--		row.Position = tc_F_Row.Position + UDim2.new(0,0,(.2 + i*F_Row_Size_Y - F_Row_Size_Y),0)
	--		row.Symbol.Text = v.Name
	--		row.Quantity.Text = v.Value
	--		row.Name = v.Name
	--		--local success, notSuccess = pcall(function()
	--		--	row.AverageCost.Text = "$"..v["Average Cost"].Value
	--		--end)
	--		--if not success then
	--		--	warn("Couldn't find the average cost")
	--		--	row.AverageCost.Text = "Error 2"
	--		--end
	--		row.CurrentValue.Text = "$"..tostring(v.Value * price)

	--		--this works once I put the thing on the server in a pcall as well
	--		local success, notSuccess = pcall(function()
	--			row.CurrentPrice.Text = "$"..price
	--		end)

	--		if notSuccess then
	--			row.CurrentPrice.Text = "Error 1"
	--		end

	--		row.ViewStock.MouseButton1Click:Connect(function()
	--			F_Holdings.Visible = false
	--			Go(v.Name)
	--		end)

	--		row.Parent = F_Holdings
	--	end
		
	--end
end

TB_Toggle.MouseButton1Click:Connect(function()
	F.Visible = not F.Visible
end)

--TB_PrintHoldings.MouseButton1Click:Connect(function()
--	for i,v in pairs(stocks:GetChildren()) do
--		local success, notSucess = pcall(function()
--			print("Owns "..v.Value.." shares of "..v.Name.." with an average cost of: "..v["Average Cost"].Value)
--		end)
--		if notSucess then
--			warn("Not success")
--		end
--	end
--end)

TB_Holdings.MouseButton1Click:Connect(function()
	DisplayHoldings()
	F_Holdings.Visible = true
end)

TB_Close_Holdings.MouseButton1Click:Connect(function()
	F_Holdings.Visible = false
end)

TL_Money.Text = "$"..tostring(m.Value)

m.Changed:Connect(function()
	TL_Money.Text = "$"..tostring(m.Value)	
end)

--local function UpdateSharesOwned(symbol)
--	local sharesOwned = stocks:FindFirstChild(symbol)
--	if not sharesOwned or sharesOwned.Value == 0 then
--		TL_SharesOwned.Text = "0"	
--		TL_AverageCost.Text = "$0"
--		return
--	else
--		TL_SharesOwned.Text = tostring(sharesOwned.Value)	
--		TL_AverageCost.Text = "$"..tostring(sharesOwned["Average Cost"].Value)	
--	end
--end

rE_InformPrice.OnClientEvent:Connect(function(price, direction, dif, openPrice)
	TL_CurrentPrice.Text = "$"..price
	if direction == "Up" then
		IL_DirectionArrow.Image = "http://www.roblox.com/asset/?id=136011727"
		IL_DirectionArrow.Visible = true
		TL_PercentChange.Text = "+"..string.sub(tostring(dif), 1, 5).."%"
	elseif direction == "Down" then
		IL_DirectionArrow.Image = "http://www.roblox.com/asset/?id=22462613"
		IL_DirectionArrow.Visible = true
		TL_PercentChange.Text = string.sub(tostring(dif), 1, 5).."%"
	else
		IL_DirectionArrow.Visible = false
	end
	TL_Price5MinutesAgo.Text = "$"..openPrice
	TL_StockName.Text = symbol
	--UpdateSharesOwned(symbol)
end)

function Go(possibleSymbol)
	TB_Go.Visible = false
	if possibleSymbol then
		symbol = possibleSymbol
	else
		symbol = string.upper(textBox.Text)
	end
	rE_RequestPrice:FireServer(symbol)
	--UpdateSharesOwned(symbol)
	textBox.Text = symbol
	TB_Go.Visible = true
end

TB_Go.MouseButton1Click:Connect(function()
	Go()
end)

TB_Buy.MouseButton1Click:Connect(function()
	TB_Buy.Visible = false
	symbol = string.upper(textBox.Text)
	F_PleaseWait.Visible = true
	local x = rF_BuySellStock:InvokeServer("Buy", symbol, 1)
	print("Will print x: "..tostring(x))
	if x == true then
		TL_Notify_Message.Text = "Success!"
	else
		TL_Notify_Message.Text = "Error"
	end
	F_Notify.Visible = true
	--UpdateSharesOwned(symbol)
	F_PleaseWait.Visible = false
	TB_Buy.Visible = true
end)

TB_Sell.MouseButton1Click:Connect(function()
	TB_Sell.Visible = false
	symbol = string.upper(textBox.Text)
	F_PleaseWait.Visible = true
	print("the symbol is: "..symbol)
	if symbol ~= nil and symbol ~= "" then
		local success, notSuccess = pcall(function()
			local x = rF_BuySellStock:InvokeServer("Sell", symbol, 1)
			if x == true then
				TL_Notify_Message.Text = "Success!"
			else
				TL_Notify_Message.Text = "Error"
			end
		end)
	else
		warn("Couldn't find symbol from text field")		
	end
	--UpdateSharesOwned(symbol)
	F_Notify.Visible = true
	F_PleaseWait.Visible = false
	TB_Sell.Visible = true
end)

function onKeyPress(actionName, userInputState, inputObject)
	if userInputState == Enum.UserInputState.Begin then
		Go()
	end
end

--will need to unbind later
game.ContextActionService:BindAction("keyPressReturn", onKeyPress, false, Enum.KeyCode.Return)
