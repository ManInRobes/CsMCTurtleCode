-- Set the parameters for the excavation area
local tArgs = { ... }
if #tArgs ~= 3 then
    print("The excavation area will be <depth>, <width>, <length> ")
    return
end


-- Mine to dimension...
local length = tonumber tArgs[3] -- Length of the excavation area
local width = tonumber tArgs[2] -- Width of the excavation area
local depth = tonumber tArgs[1] -- Depth of the excavation area
if length < 1 then
    print("Excavate length must be positive")
    return
if width < 1 then
    print("Excavate width must be positive")
    return
if height < 1 then
    print("Excavate height must be positive")
    return    
end

-- Function to excavate a single layer of blocks
local function digLayer()
  for i = 1, length do
    for j = 1, width do
      turtle.digDown()
      turtle.forward()
    end

    -- Return to the starting position and move down one level
    for k = 1, width-1 do
      turtle.back()
    end

    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.turnLeft()
  end
end

-- Function to excavate the entire area
function digArea()
  for i = 1, depth do
    digLayer()

    -- Move down one level
    turtle.digDown()
    turtle.down()
  end
end

-- Call the function to excavate the area
digArea()
