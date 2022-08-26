-- package.path = library_dir .. "/?.lua"
package.path = "/Users/mrxzx/Development/DioxusLabs/plugin-dev/plugin-library/library/?.lua"

local plugin = require("plugin")
local manager = require("manager")

-- deconstruct api functions
local log = plugin.log

-- plugin information
manager.name = "Hello Dixous Plugin"
manager.repository = "https://github.com/mrxiaozhuox/hello-dioxus-plugin"
manager.author = "YuKun Liu <mrxzx.info@gmail.com>"
manager.version = "0.0.1"

-- init manager info to plugin api
plugin.init(manager)

manager.on_init = function ()
    log.info("Start to init plugin: " .. manager.name)
end

---@param info BuildInfo
manager.build.on_start = function (info)
    log.info("Build starting: " .. info.name)
end

---@param info BuildInfo
manager.build.on_finish = function (info)
    log.info("build finished: " .. info.name)
end

return manager