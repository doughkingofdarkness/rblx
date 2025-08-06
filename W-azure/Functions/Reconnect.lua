 local ListErrorCode = {    
        Enum.ConnectionError.DisconnectErrors.Value,
        Enum.ConnectionError.PlacelaunchOtherError.Value,
        17,
        279,
        266,
        267,
        722,
        --772, Server Full
        272,
        529,
        277,
        769
    } 
  
  while task.wait(1) do 

      local Code = game:GetService'GuiService':GetErrorCode().Value
      
      for i, v in pairs(ListErrorCode) do
          if Code == v then 
              game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId, game.Players.LocalPlayer)
          end 
      end
      
      if LastPing == game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() and LastPing ~= 0 then
          LastCheck = tick()
      else
          LastCheck1 = tick()
      end
      if LastCheck and LastCheck1 then
          if LastCheck - LastCheck1 > 50 then 
              game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId, game.Players.LocalPlayer)

              task.wait(10)
          end
      end
      LastPing = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
  end
