---@module 'banana.utils.debug_flame'
local flame = require("banana.lazyRequire")("banana.utils.debug_flame")
---@module 'banana.nml.tag'
local t = require("banana.lazyRequire")("banana.nml.tag")

---@type Banana.Renderer
local function renderer(_, ast, hl, parentWidth, parentHeight, _, _, inherit,
                        extra)
    -- flame.new("tag:head")
    local b = require("banana.box")
    if extra.isRealRender then
        -- flame.pop()
        return b.Box:new()
    end
    ---@type Banana.Box
    local ret = b.Box:new()
    -- not actually rendering anything bc its all metadata tags
    for v in ast:childIter() do
        v.actualTag:renderRoot(v, hl, parentWidth, parentHeight, inherit, extra)
    end
    -- flame.expect("tag:head")
    -- flame.pop()
    return ret
end
---@type Banana.TagInfo
local M = t.newTag(
    "head",
    t.FormatType.Block,
    false,
    renderer,
    require("banana.nml.tag").defaultInitials()
)

return M
