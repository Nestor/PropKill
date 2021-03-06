/*---------------------------------------------------------
   Name: sh_init.lua
   Desc: Includes everything, does everything. The gamemode DEPENDS on this.
   Author: G-Force Connections (STEAM_0:1:19084184)
---------------------------------------------------------*/

PK.Version = "2.9b"

DeriveGamemode( "sandbox" )

GM.Name = "PropKill"
GM.Author = "G-Force"

/* Setting numbers to define what shit is :) */
SETTING_NUMBER = 1
SETTING_BOOLEAN = 2
SETTING_STRING = 3

/*---------------------------------------------------------
   Name: Teams
   Desc: This uses the old DarkRP script way of handling what team has which shit, I need to use this and have optimized it to do what I want it to do.
   Usage: TEAM_NAME = AddTeam( "TeamName", Color( R, G, B, A ), "playermodel", [[Some shit about it that players can read.]], "commandtojoin" )
   Author: G-Force Connections (STEAM_0:1:19084184)
---------------------------------------------------------*/
TEAM_SPECTATOR = AddTeam( "Spectator", Color( 84, 84, 84, 255 ), "models/player/group01/male_01.mdl", [[You spectate the fight, you can't kill others without being
Battler or in a team.]], "spectator" )

TEAM_BATTLER = AddTeam( "Battler", Color( 0, 255, 0, 255 ), "models/player/barney.mdl", [[Basic battler, no set teams.]], "battler" )

TEAM_RED = AddTeam( "Red Team", Color( 255, 0, 0, 255 ), {
    "models/player/arctic.mdl",
    "models/player/phoenix.mdl",
    "models/player/guerilla.mdl",
    "models/player/leet.mdl" },
[[Red Team vs Blue Team.]], "redteam" )

TEAM_BLUE = AddTeam( "Blue Team", Color( 30, 144, 255, 255 ), {
    "models/player/urban.mdl",
    "models/player/swat.mdl",
    "models/player/gasmask.mdl",
    "models/player/riot.mdl" },
[[Blue Team vs Red Team.]], "blueteam" )

function GM:Msg( message )
    Msg( Format( "PKv%s: %s\n", PK.Version, message ) )
end

-- Bunny hop preventing functions
function GM:Move() end
function GM:SetupMove() end
function GM:FinishMove() end

-- kill the footsteps when you join spectator, so fucking annoying...
function GM:PlayerFootstep( ply, pos, foot, sound, volume, filter )
    if ply:Team() == TEAM_SPECTATOR or not ply:Alive() then return true end -- no footsteps

    self.BaseClass:PlayerFootstep( ply, pos, foot, sound, volume, filter )
end