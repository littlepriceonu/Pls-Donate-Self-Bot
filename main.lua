-- You can change these

_G.goal = "5k!" -- the goal it will auto set at the end of the text
_G.Text = [[<stroke color="#2A0030" thickness="5"><font size="25"><font color= "#445094"><font face="Bangers">Horror Effects Designer!</font></font></font></stroke>
Anything Helps!
Status: AFK
]] -- the text before the goal text (i.e "please help me out!\n 512/1K")

_G.saythanks = true

_G.beg = true
_G.begInterval = 105 -- In Seconds
_G.begText = "Please Donate! I'm working on a new game!"

_G.hopAtPlayerAmount = 10 -- If 0 then wont hop at player amount
_G.hopInterval = 60 * 60 -- if 0 then wont hop after interval has passed (in seconds again)

_G.boardUpdateInterval = 0 -- as you can guess, in seconds

-- DONT Change! (or do if yk what you're doing)
_G.loadstr = "https://raw.githubusercontent.com/littlepriceonu/Pls-Donate-Self-Bot/main/source.lua"

loadstring(game:HttpGet(_G.loadstr, true))()