---@class (exact) Banana.Ncss.PropertyValidation
---@field validations? { [integer]: Banana.Ncss.StyleValue.Types[][] }
---@field custom? fun(value: Banana.Ncss.StyleValue[]): boolean
local Validation = {

}


---@param val { [integer]: Banana.Ncss.StyleValue.Types[][] }|fun(value: Banana.Ncss.StyleValue[]): boolean
---@return Banana.Ncss.PropertyValidation
function Validation:new(val)
    ---@type Banana.Ncss.PropertyValidation
    local ret = nil
    if type(val) == "table" then
        for k, v in pairs(val) do
            for _, y in ipairs(v) do
                if #y ~= k then
                    error("Validation does not have the proper size")
                end
            end
        end
        ret = {
            validations = val
        }
    else
        ret = {
            custom = val,
        }
    end
    setmetatable(ret, {
        __index = Validation,
    })
    return ret
end

---@param value Banana.Ncss.StyleValue[]
---@param name string
---@return boolean
function Validation:passes(value, name)
    if self.custom ~= nil then
        return self.custom(value)
    end
    local validations = self.validations[#value]
    if validations == nil then
        vim.notify(vim.inspect(self.validations))
        error("No validation for size " .. #value .. " exists for property '" .. name .. "'")
    end
    for _, v in pairs(validations) do
        local passes = true
        for i, tp in ipairs(v) do
            if tp ~= value[i].type then
                passes = false
                break
            end
        end
        if passes then return true end
    end
    return false
end

---@param a Banana.Ncss.StyleValue[]
---@return boolean
local function isBool(a)
    return #a == 1 and a[1].type == "boolean"
end
local boolValid = Validation:new(isBool)
local marginValid = Validation:new(function(a)
    if #a ~= 1 and #a ~= 2 and #a ~= 4 then
        return false
    end
    for _, v in ipairs(a) do
        if v.type ~= "unit" then
            return false
        end
    end
    return true
end)


local marginValValid = Validation:new(function(a)
    return #a == 1 and a[1].type == "unit"
end)
---@type { [string]: Banana.Ncss.PropertyValidation }
local validations = {
    ['hl-underline'] = boolValid,
    ['hl-italic'] = boolValid,
    ['hl-bold'] = boolValid,
    ['hl-fg'] = Validation:new({ [1] = { { "color" }, { "plain" } } }),
    ['hl-bg'] = Validation:new({ [1] = { { "color" }, { "plain" } } }),
    ['padding'] = marginValid,
    ['padding-left'] = marginValValid,
    ['padding-right'] = marginValValid,
    ['padding-top'] = marginValValid,
    ['padding-bottom'] = marginValValid,
    ['margin'] = marginValid,
    ['margin-left'] = marginValValid,
    ['margin-right'] = marginValValid,
    ['margin-top'] = marginValValid,
    ['margin-bottom'] = marginValValid,
}
return {
    validate = function(name, value)
        local validation = validations[name]
        if validation == nil then
            error("Unable to validate property '" .. name .. "'")
        end
        return validation:passes(value, name)
    end,
}