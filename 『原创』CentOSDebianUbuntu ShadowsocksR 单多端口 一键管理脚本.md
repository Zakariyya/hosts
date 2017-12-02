# 『原创』CentOS/Debian/Ubuntu ShadowsocksR 单/多端口 一键管理脚本

[TOC]

> 本文最后更新于 [**2017年11月3日 11:13**]() 可能会因为没有更新而失效。如已失效或需要修正，请留言！

**更多的Shadowsocks安装教程/一键脚本请看这里：**[Shadowsocks指导篇](https://doub.io/ss-jc26/#2.2.2、搭建Shadowsocks服务)

## 系统要求

**CentOS 6+ / Debian 6+ / Ubuntu 14.04 +**

推荐 **Debian 7 x64**，这个是我一直使用的系统，我的脚本在这个系统上面出错率最低。并且最容易安装锐速（锐速不支持OpenVZ）

CentOS根据大家的要求，加入了CentOS 6和7的支持，CentOS 7 自带防火墙问题(firewalld)自行解决，其他版本没有做测试。

## 脚本版本

> **Ver:** 2.0.35

## 脚本特点

目前网上的各个ShadowsocksR脚本基本都是只有 安装/卸载 等基础功能，对于小白来说还是不够简单方便，要修改账号配置还要手动修改文件，所以那些ShadowsocksR脚本只能称得上**一键安装脚本**。既然没有我满意的ShadowsocksR一键管理脚本，那么我就自己造喽，于是特意学了Shell，然后写出来了这个Shadowsocks**R一键管理脚本**！

1. 支持 限制 端口限速
2. 支持 限制 端口设备数
3. 支持 显示 当前连接IP
4. 支持 显示 SS/SSR连接+二维码
5. 支持 切换管理 单/多端口
6. 支持 一键安装 BBR
7. 支持 一键安装 锐速
8. 支持 一键安装 LotServer
9. 支持 一键封禁 垃圾邮件(SMAP)/BT/PT

## 安装步骤

**简单的来说，如果你什么都不懂，那么你直接一路回车就可以了！**

本脚本需要Linux root账户权限才能正常安装运行，所以**如果不是 root账号，请先切换为root，如果是 root账号，那么请跳过！**

> sudo su

输入上面代码回车后会提示你输入当前用户的密码，输入并回车后，没有报错就继续下面的步骤安装ShadowsocksR。

**v2.0.0 版本以后的脚本，请先卸载旧脚本ShadowsocksR服务端，再重新安装！**

>wget -N --no-check-certificate https://softs.fun/Bash/ssr.sh && chmod +x ssr.sh && bash ssr.sh

**备用下载地址（上面的链接无法下载，就用这个）：**

>wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh && chmod +x ssr.sh && bash ssr.sh

下载运行后会提示你输入数字来选择要做什么。

输入**1** ，就会开始安装ShadowsocksR服务端，并且会提示你输入Shadowsocks的 **端口/密码/加密方式/ 协议/混淆（混淆和协议是通过输入数字选择的）** 等参数。

**如果安装过程中报错，请看 [常见问题解决方法](https://doub.io/ss-jc42/#其他说明)。**

如果协议是origin，那么混淆也必须是plain !

```
1. 请输入要设置的ShadowsocksR账号 端口
2. (默认: 2333):
3.  
4. ——————————————————————————————
5.  端口 : 2333
6. ——————————————————————————————
7.  
8. 请输入要设置的ShadowsocksR账号 密码
9. (默认: doub.io):
10.  
11. ——————————————————————————————
12.  密码 : doub.io
13. ——————————————————————————————
14.  
15. 请选择要设置的ShadowsocksR账号 加密方式
16.   \1. none
17.  [注意] 如果使用 auth_chain_a 协议，请加密方式选择 none，混淆随意(建议 plain)
18.  
19.   \2. rc4
20.   \3. rc4-md5
21.   \4. rc4-md5-6
22.  
23.   \5. aes-128-ctr
24.   \6. aes-192-ctr
25.   \7. aes-256-ctr
26.  
27.   \8. aes-128-cfb
28.   \9. aes-192-cfb
29.  \10. aes-256-cfb
30.  
31.  \11. aes-128-cfb8
32.  \12. aes-192-cfb8
33.  \13. aes-256-cfb8
34.  
35.  \14. salsa20
36.  \15. chacha20
37.  \16. chacha20-ietf
38. 注意：salsa20/chacha20-*系列加密方式，需要额外安装依赖 libsodium ，否则会无法启动ShadowsocksR !
39.  
40. (默认: 5. aes-128-ctr):
41.  
42. ——————————————————————————————
43.  加密 : aes-128-ctr
44. ——————————————————————————————
45.  
46. 请选择要设置的ShadowsocksR账号 协议插件
47.  \1. origin
48.  \2. auth_sha1_v4
49.  \3. auth_aes128_md5
50.  \4. auth_aes128_sha1
51.  \5. auth_chain_a
52.  [注意] 如果使用 auth_chain_a 协议，请加密方式选择 none，混淆随意(建议 plain)
53.  
54. (默认: 2. auth_sha1_v4):
55.  
56. ——————————————————————————————
57.  协议 : auth_sha1_v4
58. ——————————————————————————————
59.  
60. 是否设置 协议插件兼容原版(_compatible)？[Y/n]
61.  
62. 请选择要设置的ShadowsocksR账号 混淆插件
63.  \1. plain
64.  \2. http_simple
65.  \3. http_post
66.  \4. random_head
67.  \5. tls1.2_ticket_auth
68.  [注意] 如果使用 ShadowsocksR 加速游戏，请选择 混淆兼容原版或 plain 混淆，然后客户端选择 plain，否则会增加延迟 !
69. (默认: 5. tls1.2_ticket_auth):
70.  
71. ——————————————————————————————
72.  混淆 : tls1.2_ticket_auth
73. ——————————————————————————————
74.  
75. 是否设置 混淆插件兼容原版(_compatible)？[Y/n]
76. 请输入要设置的ShadowsocksR账号 欲限制的设备数 ( auth_* 系列协议 不兼容原版才有效 )
77. [注意] 设备数限制：每个端口同一时间能链接的客户端数量(多端口模式，每个端口都是独立计算)，建议最少 2个。
78. (默认: 无限):5
79. ——————————————————————————————
80.  链接设备数 : 5 
81. ——————————————————————————————
82.  
83. 请输入要设置的每个端口 单线程 限速上限(单位：KB/S)
84. [注意] 单线程限速：每个端口 单线程的限速上限，多线程即无效。
85. (默认: 无限):666
86.  
87. ——————————————————————————————
88.  单端口单线程 : 666 KB/S 
89. ——————————————————————————————
90.  
91. 请输入要设置的每个端口 总速度 限速上限(单位：KB/S)
92. [注意] 端口总限速：每个端口 总速度 限速上限，单个端口整体限速。
93. (默认: 无限):2333
94.  
95. ——————————————————————————————
96.  单端口总限速 : 2333 KB/S 

```

同时最后也会提示是否设置 混淆 兼容原版（也就是使用原版SS也能链接），不懂 **直接回车** 或 **输入 y** 。（协议不在兼容原版）

> 注意：关于限制设备数数，这个协议必须是非原版并且不兼容原版才有效，也就是必须SSR客户端使用协议的情况下，才有效！

不输入一路回车就是 **默认参数：**

```
端口 : 2333
密码 : doub.io
加密 : aes-128-ctr
协议 : auth_sha1_v4_compatible
混淆 : tls1.2_ticket_auth_compatible
设备数限制: 0(无限)
单线程限速: 0 KB/S (不限速)
端口总限速: 0 KB/S (不限速)
```

最后会提示让你确认是否输入正确，如果没问题那就**按任意键继续安装**，如果输入错误，那么就使用 **Ctrl + C** 退出脚本。

```
——————————————————————————————
 请检查Shadowsocks账号配置是否有误 !
 
 端口     : 2333
 密码     : doub.io
 加密     : aes-128-ctr
 协议     : auth_sha1_v4_compatible
 混淆     : tls1.2_ticket_auth_compatible
 设备数限制: 5
 单线程限速: 666 KB/S 
 端口总限速: 2333 KB/S
——————————————————————————————
 
请按任意键继续，如有配置错误请使用 Ctrl+C 退出。
```

如果安装过程没有出错，那么最后就会提示：

```
############################################################
 ShadowsocksR账号 配置信息：
 
 I P     : xxx.xxx.xxx.xxx
 端口     : 2333 
 密码     : doub.io
 加密     : aes-128-ctr
 协议     : auth_sha1_v4_compatible
 混淆     : tls1.2_ticket_auth_compatible 
 设备数限制: 5
 单线程限速: 666 KB/S 
 端口总限速: 2333 KB/S 
 
 SS链接: ss://xxxxxxxxxxxxx
 SS二维码: http://pan.baidu.com/share/qrcode?w=300&h=300&url=ss://xxxxxxxxxxxxx
 SSR链接: ssr://xxxxxxxxxxxxx
 SSR二维码: http://pan.baidu.com/share/qrcode?w=300&h=300&url=ssr://xxxxxxxxxxxxx
 
 提示: 
 在浏览器中，打开二维码链接，就可以看到二维码图片。
 协议和混淆后面的[ _compatible ]，指的是 兼容原版协议/混淆。
 
############################################################
```

**SS/SSR链接**（格式： ss://XXXXXXX ，很长），可以从剪辑版导入Shadowsocks客户端，不懂的话看下面二维码。

**SS/SSR二维码**，复制后面的链接在浏览器打开，就会显示一个二维码的图片，可以用Shadowsocks客户端扫描二维码来添加。

## 使用说明

运行脚本

> bash ssr.sh

输入对应的数字来执行相应的命令。

```
  请输入一个数字来选择菜单选项
 
 1. 安装 ShadowsocksR
 2. 更新 ShadowsocksR
 3. 卸载 ShadowsocksR
 4. 安装 libsodium(chacha20)
————————————
 5. 查看 账号信息
 6. 显示 连接信息
 7. 设置 用户配置
 8. 手动 修改配置
 9. 切换 端口模式
————————————
 10. 启动 ShadowsocksR
 11. 停止 ShadowsocksR
 12. 重启 ShadowsocksR
 13. 查看 ShadowsocksR 日志
————————————
 14. 其他功能
 15. 升级脚本
 
 当前状态: 已安装 并 已启动
 当前模式: 单端口
 
请输入数字(1-15)：
```

- 当你为 **单端口模式**时，使用 **7. 设置 用户配置** 是 修改 单端口账号配置。
- 当你为 **多端口模式**时，使用 **7. 设置 用户配置** 是 添加/删除/修改 多端口账号配置。

## 文件位置

**安装目录：**/usr/local/shadowsocksr

**配置文件：**/etc/shadowsocksr/user-config.json

## 其他说明

ShadowsocksR 安装后，自动设置为 系统服务，所以支持使用服务来启动/停止等操作，同时支持开机启动。

1. **启动 ShadowsocksR：**/etc/init.d/ssr start
2. **停止 ShadowsocksR：**/etc/init.d/ssr stop
3. **重启 ShadowsocksR：**/etc/init.d/ssr restart
4. **查看 ShadowsocksR状态：**/etc/init.d/ssr status

ShadowsocksR 默认支持UDP转发，服务端无需任何设置。

本脚本已经集成了 安装/卸载 锐速(ServerSpeeder)开心版，但是是否支持请查看 [Linux支持内核列表](https://www.91yun.co/wp-content/plugins/91yun-serverspeeder/systemlist.html) 。（锐速不支持OpenVZ）

**v2.0.0 以前的旧版本下载地址：**

> wget -N --no-check-certificate https://softs.fun/Bash/ssr_old.sh && chmod +x ssr_old.sh && bash ssr_old.sh

**备用下载地址（上面的链接无法下载，就用这个）：**

> wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr_old.sh && chmod +x ssr_old.sh && bash ssr_old.sh

## ShadowsocksR目前支持的协议和混淆：

**协议（Protocol）：**origin，auth_sha1_v4，**auth_aes128_md5，auth_aes128_sha1，auth_chain_a，auth_chain_b**

**混淆（Obfs）：**plain，http_simple，http_post，random_head，**tls1.2_ticket_auth，tls1.2_ticket_fastauth(需06/04日以后的服务端版本)**

origin 和 plain 是原版，加粗的是推荐使用的。

> 如果你想要使用 **tls1.2_ticket_fastauth** 混淆插件，那么服务端选择 **tls1.2_ticket_auth**，客户端选择 **tls1.2_ticket_fastauth** 即可。
>
> 如果服务端 设置混淆参数为：**tls1.2_ticket_auth_compatible (兼容原版)**
>
> 那么客户端 可使用的混淆为：**plain / tls1.2_ticket_auth / tls1.2_ticket_fastauth**
>
> **tls1.2_ticket_auth** 与 **tls1.2_ticket_fastauth** 的区别为，后者不会等待服务器回应，所以不会增加延迟。适合于，因为混淆插件增加延迟的原因不得不选择原版混淆 **plain**，但是又因为QOS等因素而处于延迟与干扰/限速等之间抉择的时候，可以选择 **tls1.2_ticket_fastauth** 客户端混淆插件！

## 使用阿里云/腾讯云等存着安全组或规则组一类外部防火墙的请注意

因为阿里云/腾讯云的服务器还有一个外部的防火墙也就是叫 安全组或规则组。

一般来说默认是只开放** 22(SSH)端口**，所以一些人在搭建ShadowsocksR服务端后，会出现无法访问的情况，ShadowsocksR客户端的统计窗口显示超时。

同时ShadowsocksR服务端**开启详细日志模式(其他功能中)**后，ShadowsocksR客户端访问ShadowsocksR账号**无日志输出**。

## ShadowsocksR 端口限速中 单线程限速 和 端口总限速 的区别

> 注意：如果要使用脚本中的这个功能，需要重新下载脚本，并重装安装 2月15日 以后的ShadowsocksR服务端才行。

请查看这个文章：[ShadowsocksR服务端 限制设备连接数 和 限制端口速度 的方法](https://doub.io/ss-jc47/)

## 解决 可使用原版协议，但无法使用ShadowsocksR协议 的问题

如果发现Shadowsocks原版协议/混淆可以使用，而ShadowsocksR的协议/混淆无法使用，那么多半是 VPS时区问题

这个命令，我的ShadowsocksR脚本在安装的时候已经执行了，如果你发现没有执行，那你可以手动执行。

我们可以通过下面这个命令，把VPS的时区调整为北京时区，这样就避免了ShadowsocksR 协议/混淆 因为时差太大造成的无法验证。

> cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

注意，部分VPS会提示你是否覆盖文件，输入` y `然后回车。

如果你遇到，crontab设定的定时任务不按更换时区后的VPS时间执行，那么请看下面：

crontab设定的定时任务不按VPS的时间执行，那是因为你更换VPS时区后还需要重启crontab。

### **CentOS 系统：**

> /etc/init.d/crond restart

### **Debian/Ubuntu 系统：**

> /etc/init.d/cron restart

## 提示 Media change: please insert the disc labeled‘Debian GNU/Linux 7.0.0 Wheezy — Official amd64 CD 等信息是 apt源 的问题，更换 apt源

我发现有一些人的VPS的 apt源有问题，导致安装失败，所以我这里写上如何更换 apt源。

**本步骤仅适合 Debian 系统，Ubuntu系统自行搜索 apt源。**

下面的手动改的方法一些人可能嫌麻烦，所以你们可以这样字更换apt源。

依次输入就可以更换apt源了，下面的代码是以 us美国 为例，你可以自己去[这里选一个近一些合适](https://softs.fun/?dir=Bash/sources/)的，然后替换下面代码中** us.sources.list 的 us** 。

```
wget -N --no-check-certificate -P /etc/apt https://softs.fun/Bash/sources/us.sources.list
rm -rf /etc/apt/sources.list
cp /etc/apt/us.sources.list /etc/apt/sources.list
```

## 手动更换（上面的命令执行完毕就不要重复执行这个了）

打开你的apt源文件

> vi /etc/apt/sources.list

然后按` I 键 `进入编辑模式，如果你没有安装vim，也无法通过 **apt-get install vim -y** 安装，那么你就只能通过SFTP下载这个文件本地编辑了。

把下面的内容复制过去，注意下面示例是美国的apt源，想要其他地区的apt源，请看：[Debian全球镜像站](http://www.debian.org/mirror/list)（替换下面的 **ftp.us.debian.org** 中的 **us** ）

```
deb http://ftp.us.debian.org/debian/ jessie main
deb-src http://ftp.us.debian.org/debian/ jessie main
 
deb http://security.debian.org/ jessie/updates main contrib
deb-src http://security.debian.org/ jessie/updates main contrib
 
# jessie-updates, previously known as 'volatile'
deb http://ftp.us.debian.org/debian/ jessie-updates main contrib
deb-src http://ftp.us.debian.org/debian/ jessie-updates main contrib
```

修改完毕之后，按` ESC 键 `退出编辑模式，然后输入` :wq `保存并退出，然后再试一试` apt-get update `是否正常。

##ShadowsocksR启动失败，日志提示：Exception: libsodium not found 的错误

这是你使用了 chacha20 系列加密方式，但是却没有安装 libsodium支持库，导致ShadowsocksR无法启动，运行脚本选择选项 4 安装 libsodium支持库即可，如果安装失败，请选择其他的加密方式，对速度影响不大。

## 提示wget: unknown host “softs.fun” 之类的错误

这是无法解析我的域名，多半是DNS的问题，请更换DNS为谷歌DNS。

```
echo "nameserver 8.8.8.8
nameserver 8.8.4.4" > /etc/resolv.conf
# 两行一起复制一直执行
```

## 提示 wget: command not found 的错误

这是你的系统精简的太干净了，wget都没有安装，所以需要安装wget。

### **CentOS系统:**

> yum install -y wget

### **Debian/Ubuntu系统:**

>apt-get install -y wget

## 升级脚本

升级脚本只需要重新下载脚本文件就可以了，会自动覆盖原文件。

## 定时重启

一些人可能需要定时重启ShadowsocksR服务端来保证稳定性等，所以这里用 crontab 定时。

```
crontab -e
# 首先打开定时设置，然后会出现文本编辑，按 I键 进入编辑模式，根据需求添加下下面的代码到 这个文本编辑框内！！
------------
# 如果提示命令不存在，那么安装crontab：
# CentOS系统：
yum update
yum install -y crond
# Debian/Ubuntu系统：
apt-get update
apt-get install -y cron
```

安装并打开 crontab 后，我们根据需求添加下面的代码，添加后我们按` ESC键 `退出编辑模式，然后输入` :wq `保存并退出。

```
# 添加定时重启任务
# 是添加到 crontab -e 文本编辑框内，而不是让你执行！
# 下面代码前面的 * * * * * 分别对应：分钟 小时 日 月 星期
 
10 2 * * * /etc/init.d/ssr restart
# 这个代表 每天2点10分重启一次 ShadowsocksR
 
10 2 */2 * * /etc/init.d/ssr restart
# 这个代表 每隔2天的2点10分重启一次 ShadowsocksR
 
10 */4 * * * /etc/init.d/ssr restart
# 这个代表 每隔4小时的第10分重启一次 ShadowsocksR
```

本脚本只是本人的第一个Shell脚本学习练手作品，在逻辑结构上问题不少，大家遇到什么BUG请积极反馈！



**更多的Shadowsocks安装教程/一键脚本请看这里：[Shadowsocks指导篇](https://doub.io/ss-jc26/#2.2.2、搭建Shadowsocks服务)**

***

本文转载自[『原创』CentOS/Debian/Ubuntu ShadowsocksR 单/多端口 一键管理脚本](https://doub.io/ss-jc42/)

防止丢失，作已记录