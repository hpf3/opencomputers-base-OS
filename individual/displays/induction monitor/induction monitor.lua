local term = require("term")
local component = require("component")
local design = require("design")
local gpu = component.gpu
local matrix = component.induction_matrix
local screen = component.screen
local p = "█"
local color1 = 0x0F0F0F
local color2 = 0x5A5A5A
local red = 0xFF0000
local green = 0x00FF00
local orange = 0xFFA500
local blue = 0x0000FF
local function color(fore,back)
gpu.setBackground(back)
gpu.setForeground(fore)
end

local function drawDesign(layout)
local y = #layout
local x = string.len(layout[1])

gpu.setBackground(color1)
gpu.setForeground(color2)

gpu.setResolution(x,y)
term.clear()
print(matrix.getMaxEnergy())
print(matrix.getEnergy())
gpu.set(3,3,p)
gpu.set(2,3,p)
gpu.set(1,3,p)
os.sleep(5)                     
term.clear()
for i=1,y,1 do
for e=1,x,1 do
if string.sub(layout[i],e,e) == "X" then gpu.set(e,i,p) end
end
end
end

function storageUpdate()
local zone = design.zones.main
local maximum = matrix.getMaxEnergy()
local current = matrix.getEnergy()
local barPercent = current/maximum
local width = math.ceil((zone.storage[3] - zone.storage[1]) * barPercent)
local height = zone.storage[4] - zone.storage[2]
color(orange,color1)
gpu.fill(zone.storage[1],zone.storage[2],width,height,p)
color(blue,color1)
gpu.fill(zone.storage[1]+width,zone.storage[2],((zone.storage[3]) - zone.storage[1]) - width,height,p)
end

local function ioUpdate()

local input = matrix.getInput()
local output = matrix.getOutput()
end
drawDesign(design.main)
while true do
storageUpdate()
os.sleep(0.05)
end

