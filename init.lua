-- package.path = LIBDIR .. "/?.lua"
package.path = "/Users/mrxzx/Development/DioxusLabs/plugin-dev/plugin-library/library/?.lua"

local log = require("log")
local dir = require("dirs")
local downloader = require("downloader")

local manager = {
    name = "Hello Dioxus Plugin",
    repository = "https://github.com/mrxiaozhuox/hello-dioxus-plugin",
    author = "YuKun Liu <mrxzx.info@gmail.com>",
    version = "0.0.1",
}

manager.on_init = function ()
    log.info("💻 Start to init `" .. manager.name .. "` ...");
end

manager.on_load = function ()
    log.info("{" .. manager.name .. "} ~ plugin loaded.")
    local r = downloader.clone_repo("https://github.com/mrxiaozhuox/dorea", dir.download_dir() .. "/dorea/");
    if r then
        print("OK")
    else
        print("GG")
    end
end

manager.on_build_start = function ()
    log.warn("system start to build")
end

return manager
