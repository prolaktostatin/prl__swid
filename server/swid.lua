RegisterCommand("swid", function(source, args)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.getGroup() == "superadmin" then
		local identifier = args[1]
		local identifier2 = args[2]
		MySQL.Async.execute("DELETE FROM `addon_account_data` WHERE `owner`=@identifier", {['@identifier'] = identifier2}) -- do not change
		MySQL.Async.execute("DELETE FROM `drunk_stats` WHERE `identifier`=@identifier", {['@identifier'] = identifier2}) -- do not change
		MySQL.Async.execute("DELETE FROM `datastore_data` WHERE `owner`=@identifier", {['@identifier'] = identifier2}) -- do not change
		MySQL.Async.execute("DELETE FROM `users` WHERE `identifier`=@identifier", {['@identifier'] = identifier2}) -- do not change
		MySQL.Async.execute("UPDATE `users` SET `identifier`=@identifier2 WHERE `identifier`=@identifier", {['@identifier'] = identifier, ['@identifier2'] = identifier2}) -- change from here
		MySQL.Async.execute("UPDATE `addon_account_data` SET `owner`=@identifier2 WHERE `owner`=@identifier", {['@identifier'] = identifier, ['@identifier2'] = identifier2})
		-- add lines here

		TriggerClientEvent('NOTIFYTRIGGER', src, "success", "SWITCH IDENTIFIER", "The identifiers were successfully transferred.", 5000)
    end
end)
