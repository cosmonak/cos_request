local ox_target = exports['ox_target']

function startDialog(job)
    TriggerServerEvent('exrp_naborListky:checkCooldown', job)
end

RegisterNetEvent('exrp_naborListky:startJobDialog')
AddEventHandler('exrp_naborListky:startJobDialog', function(job)

    local questions = Config.Frakce[job].questions
    local webhook = Config.Frakce[job].discordWebhook

    local input = lib.inputDialog('Žádost o zaměstnání', questions)

    if input then
        local data = {}

        for i, question in ipairs(questions) do
            if question.type == 'input' then
                data[question.label] = input[i]
            elseif question.type == 'checkbox' then
                data[question.label] = input[i] and 'Ano' or 'Ne'
            end
        end

        TriggerServerEvent('exrp_naborListky:sendToDiscord', webhook, data)
        lib.notify({
            title = Config.Notify.title,
            description = Config.Notify.desc,
            type = 'success'
        })
    else
    end
end)

for job, config in pairs(Config.Frakce) do
    local target = config.target

    if target.position then
        ox_target:addSphereZone({
            coords = target.position,
            radius = target.radius,
            options = {
                {
                    name = 'startJobDialog',
                    label = target.label,
                    icon = target.icon,
                    onSelect = function()
                        startDialog(job)
                    end
                }
            },
            distance = target.distance
        })
    end
end
