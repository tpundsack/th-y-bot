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

mods = require "data/mods"

--to be finished

