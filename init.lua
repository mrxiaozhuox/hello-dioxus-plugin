package.path = library_dir .. "/?.lua"

local plugin = require("plugin")
local manager = require("manager")

-- deconstruct api functions
local log = plugin.log

-- plugin information
manager.name = "Hello Dixous Plugin"
manager.repository = "https://github.com/mrxiaozhuox/hello-dioxus-plugin"
manager.author = "YuKun Liu <mrxzx.info@gmail.com>"
manager.version = "0.0.1"

-- init manager plugin api
plugin.init(manager)

manager.on_init = function ()
    -- when the first time plugin been load, this function will be execute.
    -- system will create a `dcp.json` file to verify init state.
    log.info("Start to init plugin: " .. manager.name)
    return true
end

---@param info BuildInfo
manager.build.on_start = function (info)
    -- before the build work start, system will execute this function.
    log.info("Build starting: " .. info.name)
end

---@param info BuildInfo
manager.build.on_finish = function (info)
    -- when the build work is done, system will execute this function.
    log.info("Build finished: " .. info.name)
end

---@param info ServeStartInfo
manager.serve.on_start = function (info)
    -- this function will after clean & print to run, so you can print some thing.
    log.info("Serve start: " .. info.name)
end

---@param info ServeRebuildInfo
manager.serve.on_rebuild = function (info)
    -- this function will after clean & print to run, so you can print some thing.
    local files = plugin.tool.dump(info.changed_files)
    log.info("Serve rebuild: '" .. files .. "'")
end

manager.serve.on_shutdown = function ()
    --- this function will after serve shutdown.
    log.info("Serve shutdown")
end

return manager