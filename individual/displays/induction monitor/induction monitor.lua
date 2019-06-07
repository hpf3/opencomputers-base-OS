local term = require("term")
local component = require("component")
local design = require("design")
local gpu = component.gpu
local matrix = component.induction_matrix
local screen = component.screen
local p = "█"
local color1 = 0x0F0F0F
local color2 = 0x5A5A5A


local function drawDesign(layout)
local y = #layout
local x = string.len(layout[1])

gpu.setBackground(color1)
gpu.setForeground(color2)

gpu.setResolution(x,y)
term.clear()
print(x,y)
print(string.sub(layout[y],1,1))
print(string.sub(layout[y],1,2))
gpu.set(3,1,p)
gpu.set(3,2,p)
gpu.set(3,3,p)
os.sleep(5)
term.clear()
for i=1,y,1 do
for e=1,x,1 do
if string.sub(layout[i],e,e) == "X" then gpu.set(i,e,p) end
end
end
end



drawDesign(design.main)
os.sleep(30)