local json = require "json"
local cooldownFile = "cooldowns.json"
local cooldowns = {}

Citizen.CreateThread(function()
    local file = io.open(cooldownFile, "r")
    if file then
        local data = file:read("*all")
        if data then
            cooldowns = json.decode(data) or {}
        end
        file:close()
    end
end)

local function saveCooldowns()
    local file = io.open(cooldownFile, "w")
    if file then
        file:write(json.encode(cooldowns))
        file:close()
    end
end

RegisterServerEvent('exrp_naborListky:checkCooldown')
AddEventHandler('exrp_naborListky:checkCooldown', function(job)
    local player = source
    local cooldownKey = "jobCooldown_" .. player

    if cooldowns[cooldownKey] then
        local remainingTime = cooldowns[cooldownKey] - os.time()
        if remainingTime > 0 then
            TriggerClientEvent('ox_lib:notify', player, {
                type = 'error',
                text = 'Můžete poslat žádost až za ' .. remainingTime .. ' sekund.'
            })
            return
        end
    end

    TriggerClientEvent('exrp_naborListky:startJobDialog', player, job)
end)

RegisterServerEvent('exrp_naborListky:sendToDiscord')
AddEventHandler('exrp_naborListky:sendToDiscord', function(webhook, data)
    local message = {
        content = "**Apply for a job**",
        embeds = {
            {
                title = 'New request for job',
                fields = {}
            }
        }
    }

    for k, v in pairs(data) do
        table.insert(message.embeds[1].fields, { name = k, value = v, inline = true })
    end

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode(message), { ['Content-Type'] = 'application/json' })

    local player = source
    local cooldownKey = "jobCooldown_" .. player
    cooldowns[cooldownKey] = os.time() + Config.Cooldown 

    saveCooldowns()
end)
