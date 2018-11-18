local discordia = require "discordia"
local client = discordia.Client()
--enables discordia extensions
discordia.extensions()
--definitions
local enums = discordia.enums
local class = discordia.class
local fmt = string.format
--extras
local http = require('coro-http')
local json = require('json')
local mutex = discordia.Mutex()
local token = require "th-y_t"


mods = require "data/mods"
    for i, k in pairs(mods) do
        if k.init then k.init(client) end
      end

client:on("messageCreate", function(message)
    for i, k in pairs(mods) do
        if k.messageCreate then k.messageCreate(message) end
      end
        if message.content == "reload" then
            msg = ""
			os.execute('git pull "https://github.com/tpundsack/th-y-bot" --allow-unrelated-histories')
		for i, k in pairs(package.loaded) do
			if string.match(i, "Data/mods/") then
			local a = string.match(i, "Data/mods/(.*)")
			package.loaded[i] = nil
			configs[a] = require(i)
			msg = msg .."reloaded `".. i.."`\n"
		end
		if i == "wiki" then
		package.loaded[i] = nil
		configs["wiki"] = require(i)
		msg = msg .."reloaded `".. i.."`\n"
	end
		end
		message.author:send(msg) message.author:getPrivateChannel():close()
		message:delete()
            end
    end)

client:run(token)
