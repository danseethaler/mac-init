const fs = require('fs')

const USER_SETTINGS_PATH =
  '/Users/danseethaler/Library/Application Support/Code/User/settings.json'

const userSettings = JSON.parse(
  fs.readFileSync(USER_SETTINGS_PATH, {encoding: 'utf8'})
)

const orderedSettings = {}
Object.keys(userSettings)
  .sort()
  .forEach(key => {
    orderedSettings[key] = userSettings[key]
  })

fs.writeFileSync(USER_SETTINGS_PATH, JSON.stringify(orderedSettings, null, 2))
