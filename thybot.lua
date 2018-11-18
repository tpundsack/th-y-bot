local discordia = require "discordia"

mods = require "data/modulo"
for i, k in pairs(mods)
  if k.init then k.init() end
end
--to be finished
