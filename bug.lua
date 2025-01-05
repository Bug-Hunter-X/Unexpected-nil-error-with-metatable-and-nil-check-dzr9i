local function foo(a)
  if a == nil then return end
  print(a.x)
end

foo({}) -- this will work fine
foo(nil) -- this will also work fine, because of the nil check
foo(setmetatable({}, {__index = function(t,k)
  return 'bar'
end})) -- this will error with attempt to index a nil value (local 'x')