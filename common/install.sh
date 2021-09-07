# fuck you shell checker i dont need shebang, stop being red
ui_print ""
ui_print "- Checking for the presence of .git directory"
if [ -e "$MODPATH/.git" ]; then
    ui_print "  .git directory detected! removing"
    rm -rf $MODPATH/.git
fi

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
    install_script -l $MODPATH/uninstall.sh
    ui_print "- Unintalling module"
    rm -rf /data/adb/modules/$MODID
    if ! $BOOTMODE ; then
        recovery_cleanup
    fi
    exit 0
else
    ui_print "- Installing boot script"
    install_script -l $MODPATH/common/script1.sh
    ui_print "- Running setenforce 0"
    setenforce 0
    ui_print "  reboot is not required..."
fi
