#!/bin/bash

INSTALL_DIR=/usr/local/bin
SCRIPT_NAME=$INSTALL_DIR/locationchanger
LAUNCH_AGENTS_DIR=$HOME/Library/LaunchAgents
PLIST_NAME=$LAUNCH_AGENTS_DIR/LocationChanger.plist

echo "这将从您的Mac卸载LocationChanger及其配置文件和脚本。\n"
echo "您确定要卸载LocationCahnger吗 (y/n)?"
read reply
if [ "$reply" != "y" ]; then
    echo "正在中止卸载命令。"
    exit
fi

sudo rm "$SCRIPT_NAME"
launchctl unload "$PLIST_NAME"
rm "$PLIST_NAME"
rm -rf "$HOME/Library/Application Support/LocationChanger"
rm -rf "${HOME}/Library/Logs/LocationChanger.log"
rm -rf "${HOME}/.locations"

echo "卸载完成。"