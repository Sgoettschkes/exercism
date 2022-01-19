local charset = {}
for i = 65,  90 do table.insert(charset, string.char(i)) end

math.randomseed(math.floor(os.clock()*100000000000))

local function randomString(length)
  length = length or 0
  if length <= 0 then return '' end
  return randomString(length - 1) .. charset[math.random(1, #charset)]
end

local function randomNumber(length)
  length = length or 0
  if length <= 0 then return '' end
  return randomNumber(length - 1) .. tostring(math.random(0,9))
end

local robotNames ={}

local function robotName()
  local robotname = randomString(2) .. randomNumber(3)
  if robotNames[robotname] then
    return robotName()
  end

  robotNames[robotname] = true
  return robotname
end

local Robot = {}
Robot.__index = Robot

function Robot.new()
  local self = setmetatable({}, Robot)
  self.name = robotName()

  return self
end

function Robot:reset()
  self.name = robotName()
end

return Robot
