# Install and setup flameshot via terminal ... if there is no custom0 shortcut / binding configured

Install flameshot:
```
sudo apt install flameshot
```
Release the PrtScr binding by this command:
```
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot ''
```
Set new custom binding:
```
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
```
Set name:
```
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'flameshot'
```
Set command:
```
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/flameshot gui'
```
Set binding: 
```
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding 'Print'
```

Nguồn tham khảo: [link](https://askubuntu.com/questions/1036473/ubuntu-18-how-to-change-screenshot-application-to-flameshot)