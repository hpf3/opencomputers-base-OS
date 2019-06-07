local term = require("term")
local component = require("component")
local design = require("design")
local gpu = component.gpu
local matrix = component.induction_matrix
local screen = component.screen
local p = "▀"
gpu.



local function drawDesign(layout)
local y = #layout
local x = string.len(layout[1])

gpu.setBackground(1,true)
gpu.setForeground(2,true)

gpu.setResolution(x,y)
term.clear()
for i=1,1,y do
for e=1,1,x do
if string.sub(layout[y],x,x) == "X" then gpu.set(i,e,p) end
end
end
end



drawDesign(design.main)