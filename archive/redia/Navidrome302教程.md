::: warning 重要警告
请严格按照教程进行配置，如果配置与教程不符合，遇到问题将不进行任何帮助。
:::

## 一、Symedia 链接同步配置

首先，在 Symedia 中创建音乐的链接同步配置：

![](https://images.symedia.top/2026/01/06/20260106174502_ab483f37.png)

### 配置音乐文件后缀

在高级设置中，将以下常见音乐格式添加到 Strm 后缀：

```
.mp3;.aac;.m4a;.ogg;.opus;.wma;.flac;.alac;.ape;.wav;.aiff;.aif;.wv;.dsf;.dff;.mid;.midi;
```

![](https://images.symedia.top/2026/01/06/20260106173727_aa7a09ca.png)

### 设置同步选项

按照下图配置同步选项：

![](https://images.symedia.top/2025/10/11/20251011203725_572bee67.png)

配置完成后，点击保存并手动执行一次同步任务。

::: tip 说明
部分 NAS 系统的文件管理器无法显示软链接文件，这是正常现象，无需担心。
:::

## 二、配置 Navidrome 容器

### 映射 CloudNAS 目录

打开 Symedia 的部署命令，找到 CloudNAS 的映射配置行：

![](https://images.symedia.top/2025/10/11/20251011204000_aa1c166e.png)

将该映射配置添加到 Navidrome 的部署命令中：

![](https://images.symedia.top/2025/10/11/20251011215710_148e9a15.png)

### 创建 Navidrome 容器

```yaml
services:
  navidrome:
    image: dajingzhongshan/navidrome:latest
    container_name: navidrome-strm
    restart: always
    privileged: true
    network_mode: bridge
    environment:
      - UID=0 # 看自己机子是 UID 还是 PUID
      - GID=0 # 看自己机子是 GID 还是 PGID
      - TZ=Asia/Shanghai
      - ND_DEFAULTLANGUAGE=zh-Hans # 默认语言
      - ND_DEFAULTTHEME=Spotify-ish # 默认主题
      - ND_ENABLEGRAVATAR=true # GRAVATAR 头像
      - ND_IMAGECACHESIZE=1024M # 图像缓存的大小。设置"0"为禁用缓存
      - ND_ENABLEMEDIAFILECOVERART=true # 媒体文件封面艺术
      - ND_SCANSCHEDULE=1h # 扫描音乐文件周期
      - ND_LOGLEVEL=trace
      - EnableSidecar=true
      - SidecarFormat="nfo"
      - SidecarReadOnl=true
      - SidecarGenerateOnStartup=true
      - PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
      - ND_MUSICFOLDER=/music
      - ND_DATAFOLDER=/data
      - ND_CONFIGFILE=/data/navidrome.toml
      - ND_PORT=4533
      - GODEBUG=asyncpreemptoff=1
      - ND_SCANNER_PURGEMISSING=always
      - ND_SCANNER_SIDECARDELETEONPURGE=true
      - ND_SCANNER_SIDECAR_TRUST=true
      - ND_SCANNER_ENABLESIDECAR=true
      - ND_SCANNER_SIDECARFORMAT=nfo
      - ND_SCANNER_SIDECARREADONLY=true
      - ND_SCANNER_SIDECARGENERATEONSTARTUP=true
      - ND_SCANNER_SIDECARTRUSTMODE=true
      - ND_LASTFM_ENABLED=true # last.fm 集成
      - ND_LASTFM_LANGUAGE=zh # 设定 last.fm 语言为中文
      - ND_LASTFM_APIKEY=************* # last.fm 的 apikey
      - ND_LASTFM_SECRET=************** # last.fm 的 SECRET
      - ND_SPOTIFY_ID=*************** # spotify Client ID
      - ND_SPOTIFY_SECRET=************* # spotify Client secret
      - HTTP_PROXY=http://192.168.50.18:7890 #代理
      - HTTPS_PROXY=http://192.168.50.18:7890 #代理
    ports:
      - "4533:4533"
    volumes:
      - /vol1/1000/Compose/navidrome-strm:/data
      - /vol1/1000/CloudNAS:/CloudNAS:rslave
      - /vol1/1000/SA/data/Music-Strm:/music
```

## 三、配置 Redia

### 路径替换设置

与 Emby 一样，直接进行智能生成映射即可
