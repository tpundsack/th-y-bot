local mod = {}

function mod.init()
end
function mod.messageCreate(message)
  if message.content == "th-test" then message.channel:send("demo module executed.\n\n~~execute order 66~~") end
end

return mod
