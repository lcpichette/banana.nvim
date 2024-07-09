local numToRoman = require('banana.nml.ast').numToRoman

local num = 1

local prevMax = 0
local str = ""
while num < 8000 do
    local len = #numToRoman(num)
    if len > prevMax then
        str = num .. " " .. len .. "\n" .. str
        prevMax = len
    end
    num = num + 1
end
vim.fn.setreg("n", str)



describe("Num to roman tests", function()
    -- copilot wrote these
    local tests = {
        { 1,    "I" },
        { 2,    "II" },
        { 3,    "III" },
        { 4,    "IV" },
        { 5,    "V" },
        { 6,    "VI" },
        { 7,    "VII" },
        { 8,    "VIII" },
        { 9,    "IX" },
        { 10,   "X" },
        { 11,   "XI" },
        { 12,   "XII" },
        { 13,   "XIII" },
        { 14,   "XIV" },
        { 15,   "XV" },
        { 16,   "XVI" },
        { 17,   "XVII" },
        { 18,   "XVIII" },
        { 19,   "XIX" },
        { 20,   "XX" },
        { 21,   "XXI" },
        { 22,   "XXII" },
        { 23,   "XXIII" },
        { 24,   "XXIV" },
        { 25,   "XXV" },
        { 26,   "XXVI" },
        { 27,   "XXVII" },
        { 28,   "XXVIII" },
        { 29,   "XXIX" },
        { 30,   "XXX" },
        { 31,   "XXXI" },
        { 32,   "XXXII" },
        { 33,   "XXXIII" },
        { 34,   "XXXIV" },
        { 35,   "XXXV" },
        { 36,   "XXXVI" },
        { 37,   "XXXVII" },
        { 38,   "XXXVIII" },
        { 39,   "XXXIX" },
        { 40,   "XL" },
        { 41,   "XLI" },
        { 42,   "XLII" },
        { 43,   "XLIII" },
        { 44,   "XLIV" },
        { 45,   "XLV" },
        { 46,   "XLVI" },
        { 47,   "XLVII" },
        { 48,   "XLVIII" },
        { 49,   "XLIX" },
        { 50,   "L" },
        { 51,   "LI" },
        { 52,   "LII" },
        { 95,   "XCV" },
        { 96,   "XCVI" },
        { 97,   "XCVII" },
        { 98,   "XCVIII" },
        { 99,   "XCIX" },
        { 100,  "C" },
        { 101,  "CI" },
        { 102,  "CII" },
        { 103,  "CIII" },
        { 104,  "CIV" },
        { 105,  "CV" },
        { 106,  "CVI" },
        { 107,  "CVII" },
        { 108,  "CVIII" },
        { 109,  "CIX" },
        { 110,  "CX" },
        { 111,  "CXI" },
        { 112,  "CXII" },
        { 113,  "CXIII" },
        { 114,  "CXIV" },
        { 115,  "CXV" },
        { 116,  "CXVI" },
        { 117,  "CXVII" },
        { 118,  "CXVIII" },
        { 119,  "CXIX" },
        { 120,  "CXX" },
        { 121,  "CXXI" },
        { 122,  "CXXII" },
        { 123,  "CXXIII" },
        { 124,  "CXXIV" },
        { 125,  "CXXV" },
        { 126,  "CXXVI" },
        { 127,  "CXXVII" },
        { 128,  "CXXVIII" },
        { 129,  "CXXIX" },
        { 130,  "CXXX" },
        { 131,  "CXXXI" },
        { 132,  "CXXXII" },
        { 133,  "CXXXIII" },
        { 134,  "CXXXIV" },
        { 135,  "CXXXV" },
        { 136,  "CXXXVI" },
        { 137,  "CXXXVII" },
        { 138,  "CXXXVIII" },
        { 139,  "CXXXIX" },
        { 140,  "CXL" },
        { 141,  "CXLI" },
        { 142,  "CXLII" },
        { 143,  "CXLIII" },
        { 144,  "CXLIV" },
        { 145,  "CXLV" },
        { 146,  "CXLVI" },
        { 147,  "CXLVII" },
        { 990,  "CMXC" },
        { 991,  "CMXCI" },
        { 992,  "CMXCII" },
        { 993,  "CMXCIII" },
        { 994,  "CMXCIV" },
        { 995,  "CMXCV" },
        { 996,  "CMXCVI" },
        { 997,  "CMXCVII" },
        { 998,  "CMXCVIII" },
        { 999,  "CMXCIX" },
        { 1000, "M" },
        { 1001, "MI" },
        { 1002, "MII" },
        { 1003, "MIII" },
        { 1004, "MIV" },
        { 1005, "MV" },
        { 1006, "MVI" },
        { 1007, "MVII" },
        { 1008, "MVIII" },
        { 1009, "MIX" },
        { 1010, "MX" },
        { 1011, "MXI" },
        { 1012, "MXII" },
        { 1013, "MXIII" },
        { 1014, "MXIV" },
        { 1015, "MXV" },
        { 1016, "MXVI" },
        { 1017, "MXVII" },
        { 1018, "MXVIII" },
        { 1019, "MXIX" },
        { 1020, "MXX" },
        { 1021, "MXXI" },
        { 1022, "MXXII" },
        { 1023, "MXXIII" },
        { 1024, "MXXIV" },
        { 1025, "MXXV" },
        { 1026, "MXXVI" },
        { 1027, "MXXVII" },
        { 1028, "MXXVIII" },
        { 1029, "MXXIX" },
        { 1030, "MXXX" },
        { 1031, "MXXXI" },
        { 1032, "MXXXII" },
        { 1033, "MXXXIII" },
    }
    it("works", function()
        for _, test in ipairs(tests) do
            assert.equal(test[2], numToRoman(test[1]), "Failed to convert " .. test[1] .. " to " .. test[2])
        end
    end)
end)
