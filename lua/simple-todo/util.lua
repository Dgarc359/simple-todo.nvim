local M = {}
function M.pretty_print(value, indent, already_printed)
  indent = indent or ""
  already_printed = already_printed or {}
  local t = type(value)
  if t == "table" then
    if already_printed[value] then
      io.write("...a repeat of a previous table...")
    else
      already_printed[value] = true
      io.write("{\n")
      local subindent = indent .. "  "
      for k,v in pairs(value) do
        io.write(subindent)
        if type(k) == "string" and k:match("^[_a-zA-Z][_a-zA-Z0-9]*$") then
          io.write(k)
        else
          io.write("[")
          M.pretty_print(k)
          io.write("]")
        end
        io.write(" = ")
         M.pretty_print(v)
        io.write(",\n")
      end
      io.write(indent.."}")
    end
  elseif t == "string" then
    -- print strings with quotes and escapes
    io.write(("%q"):format(value))
  else
    -- anything else, let tostring save us
    io.write(tostring(value))
  end
  if indent == "" then
    -- this is a top-level thing, we want to put a newline after us
    io.write("\n")
  end
end

return M
