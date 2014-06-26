import XMonad hiding ((|||))

--Fyrir gnomepanel
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Replace
import System.IO

import XMonad.Hooks.DynamicLog

--laga matlab
import XMonad.Hooks.SetWMName

--Fyrir keys
import qualified Data.Map as M
import Data.Bits
import Control.Arrow (first)
import qualified XMonad.StackSet as W
import XMonad.Prompt

--touchpad
import XMonad.Hooks.EwmhDesktops
import XMonad.Actions.MouseGestures

--volume buttons
import Graphics.X11.ExtraTypes.XF86
--import XMonad.Actions.Volume
--import XMonad.Util.Dzen

import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.CopyWindow
import Data.Ratio
import XMonad.Layout.Named
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Tabbed
import XMonad.Layout.Spiral
import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Groups.Examples
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation

import XMonad.Actions.Submap


--Decoration
import XMonad.Layout.ImageButtonDecoration
import XMonad.Layout.Minimize
import XMonad.Layout.Maximize
import XMonad.Hooks.Minimize
import XMonad.Actions.MouseResize

--Cycle
import XMonad.Actions.CycleWS
import XMonad.Actions.CycleSelectedLayouts
import XMonad.Layout.LayoutCombinators ((|||))

--Nofn
import XMonad.Layout.ShowWName

--Android-studio
import XMonad.Hooks.ICCCMFocus


--Skipum nofnum
wspaces = ["1","2","3","4","5","6","7","8","9"]
--wspaces = ["main", "web","code","laer","5","6","7","facebook","9"]
--wspaces = ["main", "web","code","laer","facebook"]
gridLayout = Grid
spiralLayout = spiral (1 % 1)
spaceLayouts = ["Tall", "Mirror Tall","Full"]
bLayouts = ["Tabs", "Grid", "Spiral",
             "Float", "Three Col", "Three Col Mid",
              "i3","Tall Tabs","Groups Tall Tabs" ]
nLayouts =["IMGBFloat", "Tall"]

-- Layouts based on workspace names
--myLayout =   onWorkspace "grid" gridLayout $ onWorkspace "spiral" spiralLayout $ onWorkspace "tabs" simpleTabbedBottom $ onWorkspace "float" simplestFloat $  named "Tabs" simpleTabbedBottom ||| layoutHook defaultConfig
myLayoutHook =
     --imageButtonDeco shrinkText defaultThemeWithImageButtons
     --maximize  $
     --minimize  $
     avoidStruts $
     named "Tall" (subTabbed (Tall 1 (3%100) (1%2)))  |||
     named "Mirror Tall" (subTabbed (Mirror (Tall 1 (3%100) (1%2)))) |||
     named "Full" (subTabbed (Full)) |||
     named "Grid" (subTabbed (gridLayout)) |||
     named "Spiral" (subTabbed (spiralLayout)) |||
     named "Tabs" (subTabbed (simpleTabbedBottom)) |||
     named "Float" (subTabbed (simplestFloat)) |||
     named "IMGBFloat" ( mouseResize $ minimize $ maximize $ imageButtonDeco shrinkText defaultThemeWithImageButtons simplestFloat) |||
     named "Three Col" (subTabbed (ThreeCol 1 (3%100) (1%2))) |||
     named "Three Col Mid" (subTabbed (ThreeColMid 1 (3%100) (1%2)))



--hljod kemur upp a skja
--alert = dzenConfig return . show

-- Nicer
changeKbLayout = "(setxkbmap -query | grep \"layout:\\s\\+us\")  && setxkbmap -layout is || setxkbmap -layout us && xmodmap /home/tritlo/.xmodmap"

gestures = M.fromList
    [ ([], focus)
    , ([L],\_ -> removeEmptyWorkspaceAfterExcept wspaces (moveTo Prev HiddenWS))
    , ([R], \_ ->  removeEmptyWorkspaceAfterExcept wspaces (moveTo Next HiddenWS))
    ]

--altbrowserCmd = "firefox-ux -new-window"
--browserCmd = "emacsclient -a \"\" -c -n -e \"(w3m)\""
browserCmd = "chromium-browser"
--browserCmd = "firefox-ux -new-window"
--altbrowserCmd = "env GTK2_RC_FILES=/usr/share/themes/Adwaita/gtk-2.0/gtkrc iceweasel -new-window"
altbrowserCmd = "firefox"
audioController = "gnome-control-center sound"
musicPlayer = "spotify-start"
lockCmd = "gnome-screensaver-command -l"
games = "steam"
-- logoutCmd = "shutdown now"
shutdownCmd = "shutdown now"
emailclient = "urxvtclient -e mutt"


addPrefix p ms conf =
    M.singleton p . submap $ M.mapKeys (first chopMod) (ms conf)
    where
    mod = modMask conf
    chopMod = (.&. complement mod)


--myTerm = "urxvtclient"
myTerm = "gnome-terminal"
editor = "emacsclient -a \"\" -c -n"
simpleEditor ="gedit"
fixMouse = "(sleep 1 && killall lxappearance)& lxappearance"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
	(
    [
    -- Dmenu fix
      ((modm                , xK_p), (spawn "dmenu_run"))
    -- Default programs
    , ((modm                , xK_f), (spawn browserCmd))
    , ((modm .|. shiftMask  , xK_f), (spawn altbrowserCmd ))
    , ((modm                , xK_s), (spawn audioController))
    , ((modm .|. shiftMask  , xK_s), (spawn musicPlayer))
    , ((modm                , xK_v), (spawn emailclient))
    , ((modm                , xK_c ), (spawn editor))
    , ((modm .|. shiftMask  , xK_g), (spawn simpleEditor))
    {-
    , ((modm .|. controlMask, xK_h), sendMessage $ pullGroup L)
    , ((modm .|. controlMask, xK_l), sendMessage $ pullGroup R)
    , ((modm .|. controlMask, xK_k), sendMessage $ pullGroup U)
    , ((modm .|. controlMask, xK_j), sendMessage $ pullGroup D)
    -}
    , ((modm .|. controlMask, xK_s), submap $ defaultSublMap conf)
    , ((modm .|. controlMask, xK_h), sendMessage $ pushWindow L)
    , ((modm .|. controlMask, xK_l), sendMessage $ pushWindow R)
    , ((modm .|. controlMask, xK_k), sendMessage $ pushWindow U)
    , ((modm .|. controlMask, xK_j), sendMessage $ pushWindow D)

    , ((modm .|. controlMask, xK_m), withFocused (sendMessage . MergeAll))
    , ((modm .|. controlMask, xK_u), withFocused (sendMessage . UnMerge))

    , ((modm .|. controlMask, xK_period), onGroup W.focusUp')
    , ((modm .|. controlMask, xK_comma), onGroup W.focusDown')
    , ((modm                , xK_j), focusDown)
    , ((modm                , xK_k), focusUp)
    --, ((modm .|. controlMask, xK_s), submap $ defaultSublMap conf)
    -- Gestures
    --, ((modm   , 2), mouseGesture gestures)
	--, ((modm .|. shiftMask, xK_q), (spawn logoutCmd))
	{-, ((modm                , xK_u), (spawn fixMouse))-}
	, ((modm .|. shiftMask  , xK_u), restart "/home/tritlo/.scripts/obtoxmd" True)
    -- Workspaces
	, ((modm                , xK_space), (cycleThroughLayouts spaceLayouts))
    , ((modm                , xK_x), increaseNMasterGroups)
    , ((modm .|. shiftMask  , xK_x), decreaseNMasterGroups)
	, ((modm                , xK_space), (spawn changeKbLayout))
	, ((modm                , xK_b), (cycleThroughLayouts spaceLayouts))
	{-, ((modm                , xK_n), (cycleThroughLayouts nLayouts))-}
    , ((modm .|. shiftMask  , xK_b     ), sendMessage ToggleStruts)
    , ((modm                , xK_i ), removeEmptyWorkspaceAfterExcept wspaces (moveTo Prev HiddenWS))
    , ((modm                , xK_o), removeEmptyWorkspaceAfterExcept wspaces (moveTo Next HiddenWS))
    , ((modm .|. shiftMask  , xK_i), removeEmptyWorkspaceAfterExcept wspaces (shiftTo Prev HiddenWS))
    , ((modm .|. shiftMask  , xK_o), removeEmptyWorkspaceAfterExcept wspaces (shiftTo Next HiddenWS))
    , ((modm                , xK_a), removeEmptyWorkspaceAfterExcept wspaces toggleWS)
    , ((modm .|. shiftMask  , xK_BackSpace), removeWorkspace)
    , ((modm .|. shiftMask  , xK_v), selectWorkspace defaultXPConfig)
    , ((modm                , xK_m), withWorkspace defaultXPConfig (windows . W.shift))
    , ((modm .|. shiftMask  , xK_m), withWorkspace defaultXPConfig (windows . copy))
    , ((modm .|. shiftMask  , xK_r), renameWorkspace defaultXPConfig)
    -- lock, kill windows(do not kill program if same window on other workspace) and change kbLayout to icelandic
    , ((modm .|. shiftMask  , xK_c), kill1)
    , ((modm .|. shiftMask  , xK_l), (spawn lockCmd))
    , ((modm .|. shiftMask  , xK_t), (spawn myTerm))
    --, ((XMonad.mod4Mask     , xK_Shift_L), (spawn changeKbLayout))
    , ((modm .|. shiftMask     , xK_a), (spawn changeKbLayout))
    --, ((XMonad.mod1Mask .|. shiftMask    , xK_s), (spawn changeKbLayout))
    --Rather have Actions.Volume do this, can use to enable print out if it weren't for xmobarr
    --, ((0, xF86XK_AudioLowerVolume), (spawn "amixer set Master 5%-"))
    --, ((0, xF86XK_AudioRaiseVolume), (spawn "amixer set Master 5%+"))
    --, ((0, xF86XK_AudioMute), (spawn "amixer set Master toggle"))
    -- Backlight
    {-, ((0                   , xF86XK_MonBrightnessUp), (spawn "/home/tritlo/.scripts/backl inc"))-}
    {-, ((0                   , xF86XK_MonBrightnessDown), (spawn "/home/tritlo/.scripts/backl dec"))-}

    -- Media keys
    --, ((0                   , xF86XK_AudioLowerVolume), setMute False >> lowerVolume 5 >> return ())
    --, ((0                   , xF86XK_AudioRaiseVolume), setMute False >> raiseVolume 5 >> return ())
    --, ((0                   , xF86XK_AudioMute), toggleMute >> return ())
    --, ((0                   , xF86XK_AudioPlay), (spawn "/home/tritlo/.scripts/musickeystospotify play"))
    --, ((0                   , xF86XK_AudioNext), (spawn "/home/tritlo/.scripts/musickeystospotify next"))
    --, ((0                   , xF86XK_AudioPrev), (spawn "/home/tritlo/.scripts/musickeystospotify prev"))
	]
    ++
    zip (zip (repeat (modm)) [xK_1..xK_9]) (map (withNthWorkspace W.greedyView) [0..])
    ++
    zip (zip (repeat (modm .|. shiftMask)) [xK_1..xK_9]) (map (withNthWorkspace W.shift) [0..])
    )

myManageHook =  composeAll
    [ manageHook defaultConfig
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "gimp" --> doFloat
    ]

myRed = "#CC6666"
myGreen = "#B5BD68"
--myRed = "#FF0000"
--myGreen = "#FFFF00"
{-myPP = xmobarPP { ppCurrent = xmobarColor "#00ff00" "" . wrap "[" "]",
                  ppTitle = xmobarColor "#00ff00" "" . shorten 90
                }
-}
myPP = xmobarPP { ppCurrent = xmobarColor myGreen "" . wrap "[" "]",
                     ppTitle = xmobarColor myGreen "" . shorten 90
                }
{-
myPP = xmobarPP { ppCurrent = xmobarColor "#b9ca4a" "" . wrap "[" "]",
                  ppTitle = xmobarColor "#b9ca4a" "" . shorten 120
                }
-}

myStartupHook :: X()
myStartupHook = do
    setWMName "LG3D"

--Android-studio
myLogHook = do
    takeTopFocus
    dynamicLogString myPP >>= xmonadPropLog

myEventHook = fullscreenEventHook

main =  do
replace
--conky <- spawnPipe "conky -c /home/tritlo/.conkyrc"
dunst <- spawnPipe "dunst" -- Notification daemon
btsync <- spawnPipe "btsync --config .btsync.conf"
xmproc <- spawnPipe "killall -q xmobar ; xmobar /home/tritlo/.xmobarrc" --Status bar
xflux <- spawnPipe "killall -q xflux; xflux -l 64 -g -22" --Make display better
stalonetray <- spawnPipe "sleep 10; killall -q stalonetray; stalonetray" -- Tray
--sound <- spawnPipe "sleep 15; killall -q gnome-sound-applet; gnome-sound-applet" -- Audio keys
volti <- spawnPipe "sleep 15; killall -q prime-indicator; prime-indicator" -- nvidia switching
circscroll <- spawnPipe "/home/tritlo/.scripts/circscroll.sh"
dropbox <- spawnPipe "sleep 15; dropbox start"
--not needed with nm-cli
--networkm <- spawnPipe "sleep 15; killall -q nm-applet; nm-applet;"
gnomesettings <- spawnPipe "sleep 15; killall -q gnome-settings-daemon; gnome-settings-daemon;" --Brightness and audio keys.
--wicd <- spawnPipe "sleep 15; killall -q wicd-client;  wicd-client -t;"
--redshift <- spawnPipe "sleep 15; killall -q redshift-gtk; redshift-gtk -l 64:-22"
--redshift <- spawnPipe "sleep 15; killall -q gtk-redshift ; gtk-redshift -l 64:-22"
xmonad $ ewmh defaultConfig {
manageHook = manageDocks <+> myManageHook,
--keys = myKeys <+> keys defaultConfig,
keys = addPrefix (controlMask, xK_less)  (myKeys <+> keys defaultConfig) <+> (myKeys <+> keys defaultConfig ),
--layoutHook = showWName myLayout, --er i xmobar
--layoutHook = smartSpacing 5 $ avoidStruts $ myLayout,
layoutHook =  myLayoutHook,
terminal = myTerm,
focusedBorderColor = myRed,
XMonad.workspaces = wspaces,
startupHook = myStartupHook,
--modMask = mod1Mask,
modMask = mod4Mask,
logHook = myLogHook,
handleEventHook = handleEventHook defaultConfig <+> myEventHook
}


{-
#.xinitrc:
#Tharf eftirfarandi forrit:
#volti --hljod
#stalonetray --dock
xmodmap /home/tritlo/.xmodmap & #Caps-lock yfir i enter
dropbox start > /dev/null &
wicd-client -t > /dev/null & #Internet
nitrogen --restore & #Desktop wallpaper
dunst & #Notifications
-}

--Comment til ad fa til ad virka
--nota lxappearance til ad stilla gtk themeid
--vera med amixer og alsa til ad geta stryt hljodi
--nota svo .xinitrc current er
--xmodmap /home/tritlo/.xmodmap &
--xrdb /home/tritlo/.Xresources
--thunar --daemon &
--dropbox start > /dev/null &
--nitrogen --restore &
-- #xsetroot -solid "#1D1F21" &
--nm-applet > /dev/null &
--stalonetray > /dev/null &
--dunst &
--exec xmonad
