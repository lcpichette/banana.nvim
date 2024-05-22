local M = {}
-- Returns the length in bytes of the utf8 character
-- Copilot wrote this and it actually works :O

---returns the bytelength of a single code point
---@param utf8Char string
---@return integer
function M.codepointLen(utf8Char)
    if utf8Char:byte() < 128 then
        return 1
    elseif utf8Char:byte() < 224 then
        return 2
    elseif utf8Char:byte() < 240 then
        return 3
    else
        return 4
    end
end

---Returns the number of characters (not bytes) in a string
---@param str string
---@return number
function M.charCount(str)
    local len = 0
    local i = 1
    while i <= #str do
        local c = str:sub(i, i)
        local inc = M.codepointLen(c)
        len = len + 1
        i = i + inc
    end
    return len
end

return M