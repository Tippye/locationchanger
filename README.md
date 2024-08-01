# Location Changer

它会自动更改OS X的[网络位置](https://support.apple.com/en-us/HT202480)
基于Wi-Fi网络的名称，并在发生时运行任意划线。

## 安装和更新

```shell
curl -L https://github.com/tippye/locationchanger/raw/master/locationchanger.sh | bash
```

它会要求您输入root密码，以便将“locationchanger”安装到 */usr/local/bin* 目录。

## 基本用法

您必须在Wi-Fi网络之后命名网络位置。比如说，你需要
“Corp Wi-Fi”无线网络的特定网络首选项，然后您必须创建
位置“公司Wi-Fi”。现在，网络位置将自动更改为“Corp Wi-Fi”，
如果你连接到了那个无线网络。如果你连接了Wi-Fi网络，你
没有的位置，则位置将更改为默认位置（“自动”）。

如果你想在每次连接到特定的Wi-Fi网络时运行一个脚本，那么
这些脚本位于*~/.locations*中，并以Wi-Fi网络命名（确保您已设置
相应的网络位置）。例如，您有一个更改安全性的脚本
连接到“公司Wi-Fi”网络时的首选项：

```bash
#!/usr/bin/env bash
exec 2>&1

# Require password immediately after sleep or screen saver begins
osascript -e 'tell application "System Events" to set require password to wake of security preferences to true'
```

然后将此脚本命名为 *~/.locations/Corp Wi-Fi*。你可能想创建
*~/.locations/Automatic*将重置这些更改：

```bash
#!/usr/bin/env bash
exec 2>&1

# Don’t require password immediately after sleep or screen saver begins
osascript -e 'tell application "System Events" to set require password to wake of security preferences to false'
```

## 别名

如果你想在不同的无线网络之间共享一个网络位置（例如，你有一个同时在2.4和5GHz频段上广播的无线路由器），那么你可以创建一个配置文件*~/.locations/locations.conf*（带有简单键值对的纯文本文件，中间没有空格）：
```bash
Wi-Fi_5GHz=Wi-Fi
```

其中键是无线网络名称，值是所需的位置名称。

## 故障排除

每次无线网络发生变化时，它都会将相当广泛的信息写入日志文件：

```bash
tail -f ~/Library/Logs/LocationChanger.log
```

样本输出：

```
Connected to 'Wi-Fi_5GHz'
Will switch the location to 'Wi-Fi' (configuration file)
Changing the location to 'Wi-Fi'
Running '~/.locations/Wi-Fi'
```

## 卸载

```shell
curl -L https://github.com/tippye/locationchanger/raw/master/uninstall.sh | bash
```

> ⚠️会删除~/.locations目录
## 致谢

感谢[eprev](https://github.com/eprev/locationchanger)开源的自动化脚本

感谢[sashagavrilov](https://github.com/sashagavrilov/locationchanger)开源的卸载脚本