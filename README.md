# Rob-Scripts

Rob (一路向西) money farm script, protected build.

## Usage

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fhuev12/Rob-Scripts/main/Rob_MoneyFarm_v1.lua"))()
```

Requirements: an executor that provides `game:HttpGet`, `loadstring` and `bit32`.

## Build

- source: `一路向西刷钱脚本(1).lua` (3,400 bytes, 95 lines, SHA-256 `75d599be24cbf0fb6bb32238afaf6932d02fc33f70a6792f29a14f4fd6d75120`)
- pipeline: LZSS compress -> 4-byte length header -> XOR (28-char key) -> Base64 -> 2 shards
- compressed: 1,359 bytes (40.0%), base64 payload 1,820 chars, loader 3,248 bytes
- verified: shards pulled from raw.githubusercontent.com decode back to 3,400 bytes with an identical SHA-256

## Layout

```
Rob_MoneyFarm_v1.lua   loader
parts/Rob_MoneyFarm_v1.p1.txt ... p2.txt
```

The loader fetches all shards, strips whitespace, base64-decodes, XOR-decrypts, LZSS-decompresses, verifies the declared length, then runs the payload. Any missing or tampered shard, or a wrong key, aborts before execution.

## What the script does

Pure remote abuse, no HTTP calls at all:

- `ChangeCharacter:FireServer('Damage', 0/0)` — passes NaN so the character takes no damage from the self-damage path.
- Walks `Workspace.ChestFolder` and registers each chest via `RobRemote:FireServer('Register', {...})` with `Active = true`.
- Triggers `OpenSafe` (`FireServer('Completed')`) and repeatedly fires `RobRemote:FireServer('Safe', Item)` to loot every chest without playing the robbery loop.
- Teleport anchor is `Camp = CFrame.new(1636.62537, 104.349976, -1736.184)`.

No `HttpGet`, no `loadstring`, no webhook, no token reader: the source itself is clean. All risk comes from the remote spam rate.

## Warning

This script acts client-side against a live Roblox game. It violates the Roblox Terms of Service and can get the account banned. Use only for your own private testing.
