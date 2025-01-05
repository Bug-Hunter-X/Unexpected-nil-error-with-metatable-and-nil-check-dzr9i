local function foo(a)
  if a == nil then return end
  -- Check if 'x' exists before accessing it
  if a.x ~= nil then
    print(a.x)
  else
    print('Field "x" not found') -- Handle the case where 'x' is missing
  end
end

foo({})
foo(nil)
foo(setmetatable({}, {__index = function(t,k)
  if k == "x" then return 'bar' else return nil end
end}))
foo(setmetatable({}, {__index = function(t,k) 
    return 'bar'
end})) 