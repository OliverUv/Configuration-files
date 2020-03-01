# vim: ft=i3

# Change brightness with media keys
bindsym XF86MonBrightnessDown exec light -U 15
bindsym XF86MonBrightnessUp exec light -A 15

exec --no-startup-id screenrotator
exec --no-startup-id setx
exec --no-startup-id dunst
