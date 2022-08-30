# Pls Donate! Self Bot
A self bot for the roblox experience Pls Donate!

[The Game!](roblox.com/games/8737602449)

Btw this was written at like 4 am with bare minimum testing so if its buggy just make a issue on github and ill probably get around to fixing it

Its pretty useful if you wanna afk and make some robux or something. Just look at the settings at the top of the

It has a autoboard type thing in so the board will auto update its "goal" (i.e. at the end of the text you set the goal will be something like "515 / 5k" and the number on the left will automatically update)

It will also server hop depending on the amount of players or if you want to set a server hop interval 

## Script:

```lua
-- You can change these

_G.goal = "5k!" -- the goal it will auto set at the end of the text
_G.Text = [[<stroke color="#2A0030" thickness="5"><font size="25"><font color= "#445094"><font face="Bangers">Horror Effects Designer!</font></font></font></stroke>
Anything Helps!
Status: AFK
]] -- the text before the goal text (i.e "please help me out!\n 512/1K")

_G.saythanks = true

_G.beg = false
_G.begInterval = 4 -- In Seconds
_G.begText = "Please Donate! I'm working on a new game!"

_G.hopAtPlayerAmount = 14 -- If 0 then wont hop at player amount
_G.hopInterval = 60 * 20 -- if 0 then wont hop after interval has passed (in seconds again)

_G.boardUpdateInterval = 0 -- as you can guess, in seconds

-- DONT Change! (or do if yk what you're doing)
_G.loadstr = "https://raw.githubusercontent.com/littlepriceonu/Pls-Donate-Self-Bot/main/source.lua"

loadstring(game:HttpGet(_G.loadstr, true))()
```
