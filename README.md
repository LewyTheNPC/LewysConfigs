# Installation
[HyprLock](#hyprlock)

To install the whole repository:
```
git clone https://github.com/LewyTheNPC/LewysConfigs
```

## HyprLock <a name="hyprlock"></a>

### <ins>Clone the LewysHyprLock folder</ins>

This will **only** clone the folder with the HyprLock configuration
```
git clone --filter=blob:none --sparse https://github.com/LewyTheNPC/LewysConfigs.git && cd LewysConfigs && git sparse-checkout set LewysHyprLock && git checkout main
```

### <ins>Make the install.sh executable and run it</ins>

There is now a **install.sh** in the cloned folder, that will move everything in the right place, but you have to make it executable, then run it

- Go where **install.sh** is located
```
cd ~/LewysConfigs/LewysHyprLock
```

- Now make the install script **executable**
```
chmod +x ~/install.sh
```

- (Optional) check if **install.sh** is executable
```
ls -l ~/install.sh
```

- Now you have to run **install.sh** to move everything in place
```
~/install.sh
```

### <ins>(optional) Finishing steps</ins>

These steps are optional to make this configuration work, but are recomended

1. Remove the installed repository to not waste space
```
rm -rf ~/LewysConfigs/LewysHyprLock
```

2. (highly recomended) add automatic update script
...
