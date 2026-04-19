# Installation

To install the whole repository:
```
git clone https://github.com/LewyTheNPC/LewysConfigs
```

## HyprLock

### Clone the LewysHyprLock folder

This will **only** clone the folder with the HyprLock configuration
```
git clone --filter=blob:none --sparse https://github.com/LewyTheNPC/LewysConfigs.git && cd LewysConfigs && git sparse-checkout set LewysHyprLock && git checkout main
```

### Make the install.sh executable

There is now a **install.sh** in the cloned folder, that will move everything in the right place

Go where **install.sh** is located
```
cd 
```

Now make the install script **executable**
```
chmod +x 
```
