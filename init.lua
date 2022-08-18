-- package.path = library_dir .. "/?.lua"
package.path = "/Users/mrxzx/Development/DioxusLabs/plugin-dev/plugin-library/library/?.lua"

local plugin = require("plugin")
local manager = require("manager")

manager.name = "Hello Dixous Plugin"
manager.repository = "https://github.com/mrxiaozhuox/hello-dioxus-plugin"
manager.author = "YuKun Liu <mrxzx.info@gmail.com>"
manager.version = "0.0.1"


-- init manager info to plugin api
plugin.init(manager)

manager.on_init = function ()
    plugin.log.info("Start to init")
end

---@param info BuildStartInfo
manager.build.on_start = function (info)
    plugin.log.info("Build start: " .. info.name)
end

return manager