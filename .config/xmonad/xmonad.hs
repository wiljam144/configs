import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce (spawnOnce)

import XMonad.Hooks.EwmhDesktops

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import XMonad.Actions.Navigation2D

import XMonad.Layout.Spacing
import XMonad.Layout.Reflect (reflectHoriz)

import qualified XMonad.StackSet as W

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myLayout = avoidStruts (spacingRaw False (Border gapSize 0 gapSize 0) 
                       True (Border 0 gapSize 0 gapSize) True $ tiled ||| Mirror tiled ||| Full)
    where
        tiled = reflectHoriz $ Tall nmaster delta ratio
	nmaster = 1
	ratio = 1/2
	delta = 3/100
	gapSize = 10

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "polybar -r"
    spawnOnce "~/.screenlayout/layout2.sh"
    spawnOnce "setxkbmap -option caps:escape"
    spawnOnce "setxkbmap -option pl"
    spawnOnce "feh --bg-fill ~/customization/mountain.jpg"

myKeys = 
    [ ("M-q", kill)
    , ("M-S-r", spawn "xmonad --recompile && xmonad --restart")

    , ("M-d", spawn "rofi -show drun")
    , ("M-<Return>", spawn "kitty")
    , ("M-b", spawn "firefox")

    , ("M-h", windowGo L False)
    , ("M-j", windowGo D False)
    , ("M-k", windowGo U False)
    , ("M-l", windowGo R False)

    , ("M-S-h", windowSwap L False)
    , ("M-S-j", windowSwap D False)
    , ("M-S-k", windowSwap U False)
    , ("M-S-l", windowSwap R False)
    ] ++
    [ (otherModMasks ++ "M-" ++ [key], action tag)
      | (tag, key) <- zip myWorkspaces "123456789"
      , (otherModMasks, action) <- [ ("", windows . W.view)
                                      , ("S-", windows . W.shift)]
    ]

myConfig = def 
    { modMask = mod4Mask
    , layoutHook = myLayout
    , startupHook = myStartupHook
    , normalBorderColor = "#999999"
    , focusedBorderColor = "#ffffff"
    }
    `additionalKeysP` myKeys
    

main :: IO ()
main = xmonad 
     . ewmhFullscreen 
     . ewmh 
     . docks
     $ myConfig

