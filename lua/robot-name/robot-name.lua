local charset = {}
for i = 65,  90 do table.insert(charset, string.char(i)) end

math.randomseed(math.floor(os.clock()*100000000000))

local function randomString(length)
  if not length or length <= 0 then return '' end
  return randomString(length - 1) .. charset[math.random(1, #charset)]
end

local function randomNumber(length)
  if not length or length <= 0 then return '' end
  return randomNumber(length - 1) .. tostring(math.random(0,9))
end

local Robot = {}
Robot.__index = Robot

function Robot.new()
  local self = setmetatable({}, Robot)
  self.name = randomString(2) .. randomNumber(3)

  return self
end

function Robot:reset()
  self.name = randomString(2) .. randomNumber(3)
end

return Robot
