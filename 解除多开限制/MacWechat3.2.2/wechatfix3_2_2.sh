#!/bin/bash
echo '拷贝微信到桌面...'
sudo cp -r /Applications/WeChat.app  ~/Desktop/WeChat4.app;
echo '拷贝微信到桌面...完成'
cd ~/Desktop/WeChat4.app/Contents/MacOS/;


echo '开始修改二进制...'
mv WeChat WeChat_Old;
hexdump -ve '1/1 "%.2x"' WeChat_Old | sed "s/1f0b00f123100054e8e701b0006d44f9/1f2b00f123100054e8e701b0006d44f9/g" |xxd -r -p > WeChat;
rm WeChat_Old;

echo '修改二进制...完成'
chmod +x WeChat;

echo '修复签名信息...'
codesign -fds - ~/Desktop/WeChat4.app;

echo '移动微信到应用文件夹...'
sudo mv  ~/Desktop/WeChat4.app /Applications/;
echo '完成。请在应用文件夹打开微信4'