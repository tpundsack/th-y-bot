local discordia = require "discordia"
local client = discordia.client
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
    end)

client:run(token)
