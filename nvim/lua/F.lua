F = {}

F.tprint = function(table, title)
  if title then print(tostring(title)) end
  for k,v in pairs(table) do
    print(string.format("[%s] => %s", tostring(k), tostring(v)))
  end
end

F.copy = function(dict)
  local new = {}
  for i,k in pairs(dict) do
    new[i] = k
  end
  return new
end

F.merge = function(dict, patch)
  patch = patch or {}
  local _dict = F.copy(dict)
  for i,k in pairs(patch) do
    _dict[i] = k
  end
  return _dict
end

return F
