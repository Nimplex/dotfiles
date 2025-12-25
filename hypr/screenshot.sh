#!/bin/bash
grim -g "$(slurp -dD -R \#ff0000)" -t png - | wl-copy -t image/png
