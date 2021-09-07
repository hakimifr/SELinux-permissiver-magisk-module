# fuck you shell checker i dont need shebang, stop being red


ui_print ""
ui_print "************************************"
ui_print ""
ui_print "Vol up = Set permissive once,"
ui_print "SELinux will revert to enforcing"
ui_print "after reboot or when setenforce 1"
ui_print "command is issued"
ui_print ""
ui_print "Vol down = Set permissive every boot"
ui_print "SELinux will stay enforcing even after"
ui_print "rebooting"
ui_print ""
ui_print "************************************"
ui_print ""

if chooseport 5; then
    ui_print "- Running setenforce 0, no boot"
    ui_print "  script will be installed"
    setenforce 0
    ui_print "  reboot is not required..."
else
    ui_print "- Installing boot script"
    install_script -l $MODPATH/common/script1.sh
    ui_print "- Running setenforce 0"
    setenforce 0
    ui_print "  reboot is not required..."
fi
