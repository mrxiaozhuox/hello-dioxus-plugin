-- package.path = LIBDIR .. "/?.lua"
package.path = "/Users/mrxzx/Development/DioxusLabs/plugin-dev/plugin-library/library/?.lua"

local log = require("log")
local dir = require("dirs")
local downloader = require("downloader")

local manager = {
    name = "Dioxus-CLI Plugin Demo",
    repository = "http://github.com/DioxusLabs/cli",
    author = "YuKun Liu <mrxzx.info@gmail.com>",
}

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
