# Symedia 插件使用

::: tip 文章信息

- **文章来源**: [@HuanHq](https://www.huanhq.com/)
- **原文链接**: [Symedia 插件使用](https://www.huanhq.com/work/Symedia%E2%80%94%E6%8F%92%E4%BB%B6%E4%BD%BF%E7%94%A8.html)
  :::
  前言
  本篇文章主要讲 Symedia 插件的使用方法

## 微信通知

插件功能：可利用微信做转发通知
前期准备
先注册一个企业微信账号

## 微信通知代理服务器部署

### Docker Compose 配置文件

```yaml
version: "3.3"
services:
  wxchat:
    container_name: wxchat
    restart: always
    ports:
      - 7777:80
    image: ddsderek/wxchat:latest
networks: {}
```

## 配置企业微信应用

### 获取方式

企业 ID
![](https://images.symedia.top/2025/04/08/20250408103832_9a0d38d3.png)
应用 ID
先创建我们的机器人，上传好头像，设置好名称
![](https://images.symedia.top/2025/04/08/20250408103813_215f8942.png)
![](https://images.symedia.top/2025/04/08/20250408103817_40edf471.png)
应用秘钥
![](https://images.symedia.top/2025/04/08/20250408103827_48baefb3.png)
Access Token
![](https://images.symedia.top/2025/04/08/20250408103820_20819132.png)
![](https://images.symedia.top/2025/04/08/20250408103816_24f3412b.png)
消息加密秘钥
![](https://images.symedia.top/2025/04/08/20250408103826_cb141b9f.png)
URL（回调地址）
企业微信回调地址填写：https://sa 的公网地址/api/v1/message/?token=symedia
![](https://images.symedia.top/2025/04/08/20250408103829_90bb2084.png)
![](https://images.symedia.top/2025/04/08/20250408103818_c512b3b5.png)
代理 URL
填写你部署的微信通知代理服务器 IP 即可

Sa 插件记得填写格式 http://ip:端口
![](https://images.symedia.top/2025/04/08/20250408103824_10f98e58.png)
填写完成
注意查看是否存在空格
![](https://images.symedia.top/2025/04/08/20250408103826_b533fb94.png)
如何使用
微信扫码添加即可
![](https://images.symedia.top/2025/04/08/20250408103831_c556d175.png)
然后就可以使用了
![](https://images.symedia.top/2025/04/08/20250408103830_3211b1a0.png)

## EmbyServer

插件功能：用于生成 Strm ｜软链接时通知 Emby 扫库
![](https://images.symedia.top/2025/04/08/20250408103815_6c11b1e7.png)
Emby 媒体服务器通知：需要设置媒体服务器 Webhook，回调相对路径为 /api/v1/webhook/mediamsg/emby/{Emby IP:端口}/{Emby API Key}?token=symedia（8095 端口），其中 symedia 为设置的 API_TOKEN。 示例：http://172.17.0.1:8095/api/v1/webhook/mediamsg/emby/172.17.0.1:8096/770131037e8e49459618af98c14de06c?token=symedia
![](https://images.symedia.top/2025/04/08/20250408103822_611abe8c.png)
![](https://images.symedia.top/2025/04/08/20250408103825_bfdeece2.png)
路径替换：Emby 和 Symedia 对于同一个目录映射方式相同时可以不填

Emby 通知的原理是把生成的 Strm ｜软链接的路径通知给 Emby，让 Emby 去扫描该路径，如果 Strm ｜软链接的目录在 Symedia 和 Emby 中的映射不一样，则需要在这里进行替换。因此建议 Symedia 和 Emby 在映射目录时尽量保持一致

支持的配置格式（注意空格）：多个配置用;隔开

被替换路径 1 => 替换路径 1;被替换路径 2 => 替换路径 2;...

示例：比如对于/mnt/Symlink 在 Symedia 中的映射为/mnt/Symlink:/Symedia/Symlink,在 Emby 中的映射为/mnt/Symlink:/Emby/Symlink,我们就需要把/Symedia/Symlink 替换为/Emby/Symlink

那么路径替换就是：/Symedia/Symlink => /Emby/Symlink

注意！！！
如遇到测试失败，则需要再 Emby 添加这三条环境变量

```yaml
HTTP_PROXY=http://192.168.9.5:7890
ALL_PROXY=http://192.168.9.5:7890
NO_PROXY=172.17.0.1,127.0.0.1,localhost
```

![](https://images.symedia.top/2025/04/08/20250408103821_5e2b8da8.png)
![](https://images.symedia.top/2025/04/08/20250408103823_8010f4b9.png)
