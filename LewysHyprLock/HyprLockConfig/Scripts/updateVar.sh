#/=========\#
#| By Lewy |#
#\=========/#

# path to your conf (default: $HOME/.config/hypr/CustomConfigs/HyprLock/var.conf)
    SETTINGS="$HOME/.config/hypr/HyprLockConfig/var.conf"

# path to hyprlock,conf (default: $HOME/.config/hypr/hyprlock.conf)
    HYPRLOCK="$HOME/.config/hypr/hyprlock.conf"


#----------------------------------------------------------------------------------------------------------------------------------

#################
### SECTION 1 ###
#################

# 1.1
# reads monitors from SETTINGS (default: var.conf)
    monitor1=$(grep -E "^\s*\\\$monitor1\s*=" "$SETTINGS" | cut -d'=' -f2 | xargs)
    monitor2=$(grep -E "^\s*\\\$monitor2\s*=" "$SETTINGS" | cut -d'=' -f2 | xargs)
    monitor3=$(grep -E "^\s*\\\$monitor3\s*=" "$SETTINGS" | cut -d'=' -f2 | xargs)

# 1.2
# sets monitor variables for section 2
    varsM=(
        "monitor1"
        "monitor2"
        "monitor3"
    )

# 1.3
# places in hyprlock.conf
    for varM in "${varsM[@]}"; do
        val=${!varM}
        sed -i "s|^\(\s*\$$varM\s*=\s*\)[^#]*|\1$val |" "$HYPRLOCK"
    done

#----------------------------------------------------------------------------------------------------------------------------------

#################
### SECTION 2 ###
#################

# 2.1
# calculates size values of all elements for diffent resolutions (based on height) (mult is based on 2560x1600)
    scale_values() {

    # 2.1.1
    # variables for this method
        local monitor_name=$1
        local suffix=$2
        local default_height=$3

    # DO NOT USE:
        # local monitor_name2=$(echo "$monitor_name" | cut -d',' -f1 | xargs)
    # wanted to use this but HyprLock does not support multiple variables in monitor=
    #leaving it in maybe it will be possible someday

    # 2.1.2
    # gets height of monitor
        local height=$(hyprctl monitors -j | jq -r ".[] | select(.name==\"$monitor_name\") | .height")

    # 2.1.3
    # checks if there is a height, if not uses default
        if [ -z "$height" ] || [ "$height" == "null" ]; then
            height=$default_height
            echo "Warning: Monitor '$monitor_name' not found. Using default $height."
        fi

    # 2.1.4
    # calculates multiplier based on monitor height
        local mult=$(echo "$height / 1600" | bc -l)

    # 2.1.5
    # calculates the sizes
        declare -g "hourSIZE${suffix}"=$(printf "%.0f" "$(echo "200 * $mult" | bc -l)")
        declare -g "minuteSIZE${suffix}"=$(printf "%.0f" "$(echo "200 * $mult" | bc -l)")
        declare -g "ampmSIZE${suffix}"=$(printf "%.0f" "$(echo "50 * $mult" | bc -l)")
        declare -g "daySIZE${suffix}"=$(printf "%.0f" "$(echo "30 * $mult" | bc -l)")
        declare -g "dateSIZE${suffix}"=$(printf "%.0f" "$(echo "30 * $mult" | bc -l)")
        declare -g "batteryTextSIZE${suffix}"=$(printf "%.0f" "$(echo "50 * $mult" | bc -l)")
        declare -g "plusSIZE${suffix}"=$(printf "%.0f" "$(echo "100 * $mult" | bc -l)")
        declare -g "btwSIZE${suffix}"=$(printf "%.0f" "$(echo "50 * $mult" | bc -l)")
        declare -g "tetoSIZE${suffix}"=$(printf "%.0f" "$(echo "1000 * $mult" | bc -l)")
        declare -g "mikuSIZE${suffix}"=$(printf "%.0f" "$(echo "1000 * $mult" | bc -l)")
        declare -g "boxSIZE${suffix}"=$(printf "%.0f" "$(echo "400 * $mult" | bc -l)")
        declare -g "catSIZE${suffix}"=$(printf "%.0f" "$(echo "1000 * $mult" | bc -l)")
        declare -g "woolSIZE${suffix}"=$(printf "%.0f" "$(echo "300 * $mult" | bc -l)")
        declare -g "lockSIZE${suffix}"=$(printf "%.0f" "$(echo "250 * $mult" | bc -l)")
        declare -g "batterySIZE${suffix}"=$(printf "%.0f" "$(echo "100 * $mult" | bc -l)")
        declare -g "bookmarkSIZE${suffix}"=$(printf "%.0f" "$(echo "500 * $mult" | bc -l)")
        declare -g "hyprLogoSIZE${suffix}"=$(printf "%.0f" "$(echo "125 * $mult" | bc -l)")
        declare -g "archLogoSIZE${suffix}"=$(printf "%.0f" "$(echo "160 * $mult" | bc -l)")
        declare -g "clockShapeSIZEY${suffix}"=$(printf "%.0f" "$(echo "225 * $mult" | bc -l)")
        declare -g "clockShapeBORDERSIZE${suffix}"=$(printf "%.0f" "$(echo "4 * $mult" | bc -l)")

    # 2.1.6
    # field of variables from previous part of the script
        local vars=(
            "hourSIZE"
            "minuteSIZE"
            "ampmSIZE"
            "daySIZE"
            "dateSIZE"
            "batteryTextSIZE"
            "plusSIZE"
            "btwSIZE"

            "tetoSIZE"
            "mikuSIZE"
            "boxSIZE"
            "catSIZE"
            "woolSIZE"
            "lockSIZE"
            "batterySIZE"
            "bookmarkSIZE"
            "hyprLogoSIZE"
            "archLogoSIZE"

            "clockShapeSIZEY"
            "clockShapeBORDERSIZE"
        )

    # 2.1.7
    # puts the values from the variables into hyprlock.conf
        for v in "${vars[@]}"; do
            local var_name="${v}${suffix}"
            local val=${!var_name}
            sed -i "s|^\(\s*\$$var_name\s*=\s*\)[^#]*|\1$val |" "$HYPRLOCK"
        done
    }

# 2.2
# runs the scale_values method (scale_values "<monitor_name>" "<suffix>" <default_height>)
    scale_values "$monitor1" "m1" 1600
    scale_values "$monitor2" "m2" 1600
    scale_values "$monitor3" "m3" 1600


#----------------------------------------------------------------------------------------------------------------------------------

#################
### SECTION 3 ###
#################

# makes the elements of the bookmark be connected to eachother (calculates coords)

# 3.1
# reads bookmark coords from SETTINGS (default: var.conf)
    bmX=$(grep "\$bookmarkX =" "$SETTINGS" | sed 's/.*= //' | grep -oE '\-?[0-9.]+')
    bmY=$(grep "\$bookmarkY =" "$SETTINGS" | sed 's/.*= //' | grep -oE '\-?[0-9.]+')

# 3.2
# calculates coords of other elements that are connected to the bookmark
    bookmarkX="${bmX}%"
    bookmarkXPlusText=$(echo "$bmX + 8.7891" | bc -l)%
    bookmarkXBTWText=$(echo "$bmX + 1.9531" | bc -l)%
    bookmarkXHyprLogo=$(echo "$bmX + 5.8594" | bc -l)%
    bookmarkXArchLogo=$(echo "$bmX + 13.6719" | bc -l)%
    bookmarkY="${bmY}%"
    bookmarkYBTWText=$(echo "$bmY - 11.875" | bc -l)%
    bookmarkYLogo=$(echo "$bmY - 11.25" | bc -l)%
    bookmarkYPlusText=$(echo "$bmY - 10.625" | bc -l)%

# 3.3
# field of variables from previous part of the script
    vars2=(
        "bookmarkX"
        "bookmarkY"

        "bookmarkXPlusText"
        "bookmarkXBTWText"
        "bookmarkXHyprLogo"
        "bookmarkXArchLogo"

        "bookmarkYPlusText"
        "bookmarkYBTWText"
        "bookmarkYLogo"
    )

# 3.4
# puts the values from the variables into hyprlock.conf
    for var2 in "${vars2[@]}"; do
        val=${!var2}
        sed -i "s|^\(\s*\$$var2\s*=\s*\)[^#]*|\1$val |" "$HYPRLOCK"
    done

# 3.5
# self explanatory
    echo "Done"
