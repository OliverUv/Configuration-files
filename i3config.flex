# vim: ft=i3

# Change brightness with media keys
bindsym XF86MonBrightnessDown exec light -U 15
bindsym XF86MonBrightnessUp exec light -A 15

exec --no-startup-id screenrotator
exec --no-startup-id setx
exec --no-startup-id dunst
exec --no-startup-id "xinput set-prop \\"SYNA8004:00 06CB:CD8B Touchpad\\" \\"libinput Tapping Enabled\\" 1"

