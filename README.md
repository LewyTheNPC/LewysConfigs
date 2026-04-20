# Installation
Anchors to different installations:
- [HyprLock](#hyprlock) ([HyprLockImage](#HyprLockImage))

To install the whole repository:
```bash
git clone https://github.com/LewyTheNPC/LewysConfigs
```

## HyprLock <a name="hyprlock"></a>

### 1. <ins>Clone the LewysHyprLock folder</ins>

This will **only** clone the folder with the HyprLock configuration
```bash
git clone --filter=blob:none --sparse https://github.com/LewyTheNPC/LewysConfigs.git && cd LewysConfigs && git sparse-checkout set LewysHyprLock && git checkout main
```

### 2. <ins>Make the install.sh executable and run it</ins>

There is now a **install.sh** in the cloned folder, that will move everything in the right place, but you have to make it executable, then run it

- Go where **install.sh** is located
```bash
cd ~/LewysConfigs/LewysHyprLock
```

- Now make the install script **executable**
```bash
chmod +x ~/install.sh
```

- (Optional) check if **install.sh** is executable
```bash
ls -l ~/install.sh
```

- Now you have to run **install.sh** to move everything in place
```bash
~/install.sh
```

### 3. <ins>Update the configuration</ins>

So that the configuration will work on your monitors, you should change the **$monitor = x** variable, so it fits your setup. You can find the configuration in **~/.config/hypr/HyprLockConfig/var.conf**.
After setting your monitor variables, run the **updateVar.sh** script:
```bash
~/.config/hypr/HyprLockConfig/Scripts/updateVar.sh
```

### 4. <ins>(optional) Finishing steps</ins>

These steps are optional to make this configuration work, but are recomended

1. **Remove the installed repository to not waste space**
```bash
rm -rf ~/LewysConfigs/LewysHyprLock
```

2. **(highly recomended) Add automatic update script**

So that you don't need to run the **updateVar.sh** script manualy, just add it to the keybind and HyprIdle (I also recomend using a grace period for HyprLock)
- HyprLand Keybind example (2 seconds of grace)
```bash
$lockscreen = ~/.config/hypr/HyprLockConfig/Scripts/updateVar.sh && hyprlock --grace 2
```
```bash
bind = $mainMod, L, exec, $lockscreen
```
- HyprIdle (15 seconds of grace)
```bash
listener {
    timeout = 300                                 # 5min
    on-timeout = ~/.config/hypr/HyprLockConfig/Scripts/updateVar.sh && hyprlock --grace 15
    #on-timeout = loginctl lock-session            # lock screen when timeout has passed
}
```

## Showcases <a name="HyprLockImage"></a>

### HyprLock
![HyprLockShowcase](https://github.com/LewyTheNPC/LewysConfigs/blob/51b8abf24620e8c7828e5bf8ca3d4ab08eed150e/Showcases/HyprLockShowcase.png)
