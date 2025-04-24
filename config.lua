Config = {}

Config.Frakce = {
     ['ambulance'] = {
        questions = {
            {type = 'input', label = 'Age (IC)', description = 'Your Age', required = true, min = 1, max = 3},
            {type = 'input', label = 'Name and Surname (IC)', description = 'Your name and surname', required = true, min = 3, max = 50},
            {type = 'input', label = 'Date of birth (IC)', description = 'Date of your birth', required = true, min = 10, max = 10},
            {type = 'checkbox', label = 'Whitelist', description = 'Do you have whitelist?', required = true},
            {type = 'checkbox', label = 'Have you ever been employed in this job?', description = 'Have you ever been employed in this job?', required = true},
            {type = 'input', label = 'Discord (OOC)', description = 'Your Discord', required = true, min = 3, max = 50},
        },
        discordWebhook = 'https://discord.com/api/webhooks/1318003900573417523/EDTsw_KEEOR5H7PowcBTPEYQE7GZ29fdpru9hbOex8T862a01aYJPjtdB540ynrug_a6',
        target = {
            label = 'Apply for a job',
            icon = 'fas fa-briefcase',
            position = vector3(441.2209, -978.8523, 30.6896),
            radius = 3.0,
            distance = 3.0
        }
    }
}

Config.Notify = {
   title = "Job application",
   desc = "applied for a job"
}

Config.Cooldown = 86400 -- 24h


-- by cosmonak 