#/=========\#
#| By Lewy |#
#\=========/#

needed packages:
    -bc (basic calculator used in the updateVar script)

I recommend changing your HyprLock Keybind and the HyprIdle HyprLock start to also run the updateVar.sh with it, so it always has the right formating for all monitors

NO NEED TO READ THE REST:

This is just a little doc for readability of the code (basically parts of the HyprLock Doc written down for my future self (and for anyone interested))


General:
    # If empty = all
       monitor = <Strings>
    # sets the source path to a file
       path = <String>
    # sets the color of the element (red, green, blue = 0-255; opacity = 0-1.0)
       color = rgba(<redByte>, <greenByte>, <blueByte>, <opacity>)
    # runs command in cmd every x ms
        xxx = cms[update:x] <command>

Elements:
    # how many px to move from the startingpoint
        position = <xInt>, <yInt>
    # horizontal startingpoint: center; left; right
        halign = center
    # vertical startingpoint: center; top; bottom
        valign = center
    # rotates in degree; + = counter-clockwise ; - = clockwise
        rotate = <Int>
    # sets z axis layer of Element
        zindex = <Int>
    # activates reload every x seconds
        reload_time = <Int>
    # runs this command every reaload activation
        reload_cmd = <Sting>

Background:
    # has the option path = screenshot: shows a screenshot of your last active screen
        path = <String>
    # blurs your background
        blur_passes = <Int>
    # Hides the cursor instead of making it visible.
        hide_cursor= <bool>
    # Skips validation when no password is provided.
        ignore_empty_input= <bool>
    # Makes hyprlock immediately start to draw widgets.
    # Backgrounds will render background:color until their background:path resource is available.
        immediate_render = <bool>
    # Sets if the text should be trimmed, useful to avoid trailing newline in commands output.
        text_trim = <bool>
    # 0 = disabled; 1 = enabled; 2 = auto
        fractional_scaling = <0/1/2>
    # 0 = gpu accelerated; 1 = cpu (slow)
        screencopy_mode = <0/1>

Label:
    # shows this text
        text = <String>
    # which font: eg. Noto Sans
        font_family = <String>
    # how big is the text
        font_size = <Int>

Images:
    # sets size of the image
        size = <Int>
    # sets rounding of the borders
        rounding = <Int>
    # sets how many px the border is
        border_size = <Int>

Input:
    # thickness of outline in px (basically border)
        outline_thickness = <Int>
    # color of the space inside the border (works like color =)
        inner_color = rgba(<redByte>, <greenByte>, <blueByte>, <opacity>)
    # color of the border (works like color=), has 2 rgba 1. = top-left color 2. = bottom-right color
        outer_color = rgba(<redByte>, <greenByte>, <blueByte>, <opacity>) rgba(<redByte>, <greenByte>, <blueByte>, <opacity>)
    # text shown while checking password
        check_text = <String>
    # shows this color while checking password
        check_color = rgba(<redByte>, <greenByte>, <blueByte>, <opacity>)
    # shows this color when you entered the wrong password
        fail_color = rgba(<redByte>, <greenByte>, <blueByte>, <opacity>)
    # color of the font inside the intup element
        font_color = rgba(<redByte>, <greenByte>, <blueByte>, <opacity>)
    # fades the input field when empty
        fade_on_empty = <bool>
    # rounding of the element
        rounding = <Int>
