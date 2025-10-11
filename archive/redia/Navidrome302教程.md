::: warning 重要警告
请严格按照教程进行配置，如果配置与教程不符合，遇到问题将不进行任何帮助。
:::

## 一、Symedia 链接同步配置

首先，在 Symedia 中创建音乐的链接同步配置：

![](https://images.symedia.top/2025/10/11/20251011203228_3e0eac6e.png)

::: tip 重要提示
注意：本地软链接目录的后续路径必须与媒体目录完全一致，如上图红框所示部分。
:::

### 配置音乐文件后缀

在高级设置中，将以下常见音乐格式添加到软链接后缀：

```
.mp3;.aac;.m4a;.ogg;.opus;.wma;.flac;.alac;.ape;.wav;.aiff;.aif;.wv;.dsf;.dff;.mid;.midi;
```

![](https://images.symedia.top/2025/10/11/20251011203631_d7b03e07.png)

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

选择以下任一方式部署 Navidrome：

**方式一：Docker Compose**

```yaml
services:
  navidrome:
    container_name: navidrome
    environment:
      - ND_IMAGECACHESIZE=1024MB
      - TZ=Asia/Shanghai
      - ND_SCANSCHEDULE=1m
      - ND_LOGLEVEL=info
      - UID=0
      - GID=0
      - ND_LASTFM_ENABLED=true
      - ND_SESSIONTIMEOUT=24h
      - ND_LASTFM_LANGUAGE=zh
      - PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
      - ND_MUSICFOLDER=/music
      - ND_DATAFOLDER=/data
      - ND_CONFIGFILE=/data/navidrome.toml
      - ND_PORT=4533
      - GODEBUG=asyncpreemptoff=1
    image: deluan/navidrome
    network_mode: bridge-mq
    ports:
      - 4533:4533
    privileged: true
    volumes:
      - /vol1/1000/CloudNAS:/CloudNAS:rshared # 飞牛系统使用 rshared，其他系统使用 rslave
      - /vol1/1000/Media/Music:/music # 此目录对应 Symedia 中创建的链接同步目录
      - /vol1/1000/appdata/navidrome:/data
```

**方式二：Docker CLI**

```shell
docker run -d \
  --name navidrome \
  --restart always \
  --network bridge-mq \
  --privileged \
  -p 4533:4533 \
  -e ND_IMAGECACHESIZE=1024MB \
  -e TZ=Asia/Shanghai \
  -e ND_SCANSCHEDULE=1m \
  -e ND_LOGLEVEL=info \
  -e UID=0 \
  -e GID=0 \
  -e ND_LASTFM_ENABLED=true \
  -e ND_SESSIONTIMEOUT=24h \
  -e ND_LASTFM_LANGUAGE=zh \
  -e PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
  -e ND_MUSICFOLDER=/music \
  -e ND_DATAFOLDER=/data \
  -e ND_CONFIGFILE=/data/navidrome.toml \
  -e ND_PORT=4533 \
  -e GODEBUG=asyncpreemptoff=1 \
  -v /vol1/1000/CloudNAS:/CloudNAS:rslave \
  -v /vol1/1000/Media/Music:/music \
  -v /vol1/1000/appdata/navidrome:/data \
  deluan/navidrome
```

### 验证配置

容器创建成功后，Navidrome 扫描到的音乐路径格式应如下所示：

```shell
/music/CloudNAS/CloudDrive/115open/Music/周杰伦/兰亭集序.flac
```

## 三、配置 Redia

### 路径替换设置

在 Redia 中添加 Navidrome 服务器后，按以下方式配置路径替换规则：

![](https://images.symedia.top/2025/10/11/20251011204541_5d106775.png)

::: tip 说明
注意上面的路径替换开头是没有"/"的，不要自作聪明又加上去

如需配置 123 云盘，可参照上述方式进行路径替换。
:::
