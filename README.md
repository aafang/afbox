# Af_Box
一个集合常用脚本的工具箱，我仅是收集和合整理了各位大佬的脚本。  
作为一个shell的初学者，我的脚本还很简陋，还望各位大佬批评指正。好让我这位菜鸟得以有所长进。  
**注意：学习脚本，请勿用于生产环境。**
工具箱集成了以下功能：
1. BBR加速管理
2. 服务器各项测试
3. Docker的简单管理
4. 哪吒探针管理
5. Warp的管理
6. 一键安装html5 speedtest
7. 一键安装Alist
8. 一键安装QuickBox Lite
9. 网卡限速
10. 日志文件清理
## 使用
```
bash <(curl -sL https://raw.githubusercontent.com/aafang/afbox/main/afbox.sh)
```
在使用网卡限速功能时，先使用```ip a```或```ifconfig```查看网卡名称
## 更新日志
- 2023年9月26日：修改主菜单布局，增加日志文件清理功能，增加docker镜像管理
- 2023年9月24日：增加网卡限速功能，基于 wondershaper
- 2023年9月24日：增加alist，QuickBox Lite
- 2023年9月23日：首个版本发布
## 基本界面展示
- 主菜单  
![image](https://github.com/aafang/afbox/assets/145802153/1003c57c-2e58-4a3e-8cad-e1f8ef3cdacf)  
- BB加速管理  
![image](https://github.com/aafang/afbox/assets/145802153/1cdf8044-f52b-4d6a-93ad-999ed95e1b4d)
- 服务器各项测试  
![image](https://github.com/aafang/afbox/assets/145802153/cf33f8ec-210d-49de-b171-08bbf3183008)
- Docker管理  
![image](https://github.com/aafang/afbox/assets/145802153/913e7f31-adf1-44eb-91c5-5b5111d1b4f1)
- QuickBox Lite 安装  
![image](https://github.com/aafang/afbox/assets/145802153/ae784ba2-4f24-414a-8fd9-8a57e0f7f32f)
- 网卡限速管理  
![image](https://github.com/aafang/afbox/assets/145802153/9cb583e6-3882-4dd2-88d5-38c69e36eccb)  
限速前  
![4cd7d2f8bde0ffcea502cbdcbdeb167](https://github.com/aafang/afbox/assets/145802153/d26e09c9-a0ce-4ccc-bfd5-d1a5dae0b35a)  
限速后  
![128bb6f3b5a460f74ea20d908ffc7ba](https://github.com/aafang/afbox/assets/145802153/bf1bb521-a3e0-43e7-932f-2b1ae28fe841)  
解除后  
![image](https://github.com/aafang/afbox/assets/145802153/bc874578-b1e0-4c3d-a5d7-25a5da08fb10)
- 日志文件清理  
![image](https://github.com/aafang/afbox/assets/145802153/375aef17-2141-4e31-82ed-0ff2f2547a49)
- 其他
哪吒探针，warp，html5 speedtest，Alist均是调用了其他脚本，故不作展示
## 鸣谢
感谢以下大佬贡献的脚本，排名不分先后。  
1. HJM大佬的BBR脚本 - [项目地址](https://blog.ylx.me/archives/783.html)
2. bench.sh - [项目地址](https://bench.sh/)
3. lmc999大佬流媒体测试脚本 - [项目地址](https://github.com/lmc999/RegionRestrictionCheck)
4. i-abc大佬的多功能测速脚本 - [项目地址](https://github.com/i-abc/Speedtest)
5. zhanghanyun大佬的GO版回程测试教程 - [项目地址](https://github.com/zhanghanyun/backtrace)
6. Chennhaoo大佬的脚本库 - [项目地址](https://github.com/Chennhaoo/Shell_Bash)
7. 酒神大佬的NodeBench - [项目地址](https://www.nodeseek.com/post-11619-1)
8. naiba大佬的哪吒探针 - [项目地址](https://github.com/naiba/nezha)
9. fscarmen大佬的warp管理脚本 - [项目地址](https://gitlab.com/fscarmen/warp)
10. ilemonrain大佬的html5 speed test - [项目地址](https://hub.docker.com/r/ilemonrain/html5-speedtest/#!)
11. Alist - [项目地址](https://github.com/alist-org/alist)
12. QuickBox Lite - [项目地址](https://wiki.ptbox.dev/zh-Hans/)
13. wondershaper - [项目地址](https://github.com/magnific0/wondershaper)
## 交流
[阿方的频道](https://t.me/afangcp)
