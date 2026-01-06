AudioBookShelf 302 配置方式与 Emby 基本相同，主要区别在于需要部署支持 Strm 格式的魔改版 AudioBookShelf 镜像。

## 一、Symedia 链接同步配置

首先，在 Symedia 中创建有声书的链接同步配置，生成 strm 和 302 的方式与 Emby 完全一致。

::: tip 重要提示
请参考 Emby 302 教程中的链接同步配置步骤，确保本地软链接目录的后续路径与媒体目录完全一致。
:::

## 二、部署 AudioBookShelf 容器

### Docker Compose 配置

使用以下配置部署支持 Strm 格式的 AudioBookShelf 容器：

```yaml
services:
  audiobookshelf:
    image: dajingzhongshan/audiobookshelf:latest
    container_name: audiobookshelf
    ports:
      - 9526:80
    volumes:
      - /vol1/1000/Symlink/有声书:/audiobooks
      - /vol1/1000/appdata/audiobookshelf/podcasts:/podcasts
      - /vol1/1000/appdata/audiobookshelf/config:/config
      - /vol1/1000/appdata/audiobookshelf/metadata:/metadata
      - /vol1/1000/CloudNAS:/CloudNAS:rshared
    environment:
      - TZ=Asia/Shanghai
```

::: tip 说明

- 请根据实际情况修改路径映射
- 确保 CloudNAS 目录已正确映射，以便容器能够访问云盘文件
  :::

## 三、配置 Redia

### 路径替换设置

与 Emby 一样，在 Redia 中直接进行智能生成映射即可。
