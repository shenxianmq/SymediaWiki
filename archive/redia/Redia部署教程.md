# Redia 部署教程

## 一、docker 部署

### 1.1 容器安装

#### Docker CLI

```plain
docker run -d \
  --name Redia \
  --network host \
  -e LICENSE_KEY=你的Redia密钥 \
  -v /vol1/1000/appdata/redia/config:/app/config \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  shenxianmq/redia:latest

```

#### Docker Compose

```yaml
services:
  Redia:
    container_name: Redia
    environment:
      - LICENSE_KEY=你的Redia密钥
    image: shenxianmq/redia:latest
    network_mode: host
    volumes:
      - /vol1/1000/appdata/redia/config:/app/config
      - /var/run/docker.sock:/var/run/docker.sock:ro
```

注意：路径 1 需要自己在本地创建，可以自定义

路径 1：/vol1/1000/appdata/redia/config

容器创建后，就可以通过 http://ip:9025 进行访问

默认账号密码为:admin password

## 二、配置方法

### 2.1 配置云盘助手

打开反向代理-云盘助手，以 115 助手为例
![](https://images.symedia.top/2025/09/21/20250921224635_0f7f5c39.png)
添加 115 配置，新手直接按下图配置即可，配置好后点击保存，注意红框中的配置名称为“115”，下面配置 Emby 服务器会用到
![](https://images.symedia.top/2025/09/21/20250921224728_831d3529.png)

### 2.2 配置 Emby 服务器

打开反向代理-媒体服务器-Emby 服务器
![](https://images.symedia.top/2025/09/21/20250921224506_0dceb6a4.png)

添加配置,根据实际情况填写，这里最关键的在于路径替换，你需要把你 strm 文件中路径的网盘根目录，指向 2.1 中你添加的网盘助手的配置名称

可以直接去 Emby 中，随意点开一个文件，看一下文件的路径，如下图
![](https://images.symedia.top/2025/09/21/20250921225106_53733573.png)
该文件的路径为

**/mnt/CloudNAS/CloudDrive2/115/看剧/links/电视剧/韩剧/又是吴海英 (2016) {tmdb-66082}/Season 1/又是吴海英.2016.S01E01.第 1 集.1080p.Disney.WEB-DL.H.264.mkv**

这是 115 网盘中的文件，该文件的网盘根目录为

**/mnt/CloudNAS/CloudDrive2/115**

2.1 中 115 助手添加的配置名称为“115”

所以路径替换就是

**/mnt/CloudNAS/CloudDrive2/115 => 115**

同理，如果你有 123 云盘，路径替换就可以写作

**/mnt/CloudNAS/CloudDrive2/123 云盘 => 123**

![](https://images.symedia.top/2025/09/21/20250921224928_0d4edfa7.png)

Tips: 如果你同时有多个 115 要进行替换，那么请在路径替换的末尾添加上/，防止替换出错，如

**/mnt/CloudNAS/CloudDrive2/115/ => 115/**

**/mnt/CloudNAS/CloudDrive2/115-2/ => 115-2/**

保存后，直接通过反代端口访问即可
