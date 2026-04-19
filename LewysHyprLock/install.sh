#!/bin/bash

# colors
    G='\033[0;32m'
    Y='\033[1;33m'
    R='\033[0;31m'
    NC='\033[0m'

    echo -e "${G}Installing Lewy's HyprLock Config...${NC}"

# vars
    TARGET_DIR="$HOME/.config/hypr"
    CONF_DIR="$TARGET_DIR/HyprLockConfig"

# check dependencies
    deps=(jq bc hyprlock)
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            echo -e "${Y}Installing missing dependency: $dep${NC}"
            sudo pacman -S --needed --noconfirm "$dep" || echo -e "${R}Failed to install $dep. Do it manually!${NC}"
        fi
    done

# create folders
    echo -e "${G}Preparing directories...${NC}"
    mkdir -p "$CONF_DIR/Monitors"
    mkdir -p "$CONF_DIR/Pictures"
    mkdir -p "$CONF_DIR/Scripts"

# sorting Files
    echo -e "${G}Deploying files...${NC}"

# move to main folder
    cp "hyprlock.conf" "$TARGET_DIR/hyprlock.conf"

# Move to sub-folders (Monitors, Pictures, README)
    cp -r HyprLockConfig/Monitors/* "$CONF_DIR/Monitors/"
    cp -r HyprLockConfig/Pictures/* "$CONF_DIR/Pictures/"
    cp "HyprLockConfig/var.conf" "$CONF_DIR/var.conf"
    cp "HyprLockConfig/README.md" "$CONF_DIR/"

# get scripts executable
    echo -e "${G}Setting up scripts...${NC}"
    cp -r HyprLockConfig/Scripts/* "$CONF_DIR/Scripts/"
    chmod +x "$CONF_DIR/Scripts/"*.sh

    echo -e "\n${G}Done!${NC}"
    echo -e "Main config: ${Y}$TARGET_DIR/hyprlock.conf${NC}"
    echo -e "Variables:   ${Y}$CONF_DIR/var.conf${NC}"
    echo -e "Scripts:     ${Y}$CONF_DIR/Scripts/${NC}"
