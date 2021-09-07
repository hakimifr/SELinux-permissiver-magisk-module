# fuck you shell checker i dont need shebang, stop being red

ui_print "************************************"
ui_print ""
ui_print "SELinux Permissiver"
ui_print "Reboot after flashing"
ui_print ""
ui_print "************************************"
ui_print ""
ui_print "Vol up = Set permissive once"
ui_print "Vol down = Set permissive every boot"
ui_print ""
ui_print "************************************"
ui_print ""

if chooseport 5; then
    ui_print "- Setting permissive just for now..."
    ui_print "  (aka running setenforce 0 lol)"
    setenforce 0
else
    ui_print "- Installing boot script"
    install_script -l $MODPATH/common/script1.sh
fi
