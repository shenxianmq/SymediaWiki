# Symedia 部署教程

<span style="border-left: 3px solid orange; padding-left: 10px;">注：Symedia 以下简称 "SA" 或 "sa"
</span>

## 前期准备

**激活码**：

- 如果已经购买激活码，可以直接部署。
- 如果未购买，点击右上角捐赠按钮，捐赠后会获得激活码一枚

## 前置工作

### CloudDrive2 的标准挂载方式

Sa 的归档轮询监控主要依托于 CloudDrive2,即 cd2,而 cd2 的挂载的标准方法如下:

![](https://images.symedia.top/2025/04/06/20250406231003982.png)

![](https://images.symedia.top/2025/04/06/20250406231058061.png)

最终你的 115 路径应该是/CloudNAS/CloudDrive/115,很多人第一次用 cd2 的时候进行了错误挂载，即/CloudNAS/115,这样会导致一个问题，就是当你的 cd2 重启或者掉盘的时候，你的其他容器无法访问到 cd2 挂载文件夹，必须重启才可以，所以在部署 Sa 前必须先检查一下挂载是否正确

## Docker 部署

### docker run

```shell
docker run -d \
--name symedia \
-e TZ=Asia/Shanghai \
-e LICENSE_KEY=输入作者发的激活码 \
-v /vol1/1000/DATA/CloudNAS:/CloudNAS:rslave `#cd2映射路径` \
-v /vol1/1000/DATA/Media:/Media `#本地媒体目录，检查路径外的映射和链接同步的目录路径以及大小写是否一致` \
-v /vol1/1000/DATA/AppData/symedia/config:/app/config `#sa配置文件夹` \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
-p 8095:8095 \
--restart unless-stopped \
shenxianmq/symedia:latest
```

### docker compose

```shell
version: '3.8'

services:
  symedia:
  image: shenxianmq/symedia:latest ## 拉取最新镜像
  container_name: symedia ## 容器名称
  restart: always ## 重启策略
  ports:
    - "8095:8095" ## 映射端口：主机 8095 -> 容器 8095
  volumes:
    - /volume1/CloudNAS/:/CloudNAS:rslave ## cd2映射路径
    - /volume1/media:/media ## 本地媒体目录，检查路径外的映射和链接同步的目录路径以及大小写是否一致
    - /vol1/1000/DATA/AppData/symedia/config:/app/config ## sa配置文件夹
    - /var/run/docker.sock:/var/run/docker.sock:ro ## Docker 宿主机通信
  environment:
    TZ: Asia/Shanghai ## 容器时区
    LICENSE_KEY: eyj89j9fjrfkr9fpi ## 激活码，注意冒号后面有空格
```

## 初始设置

### 登录

部署后输入 ip:8095 就可以进入登录界面了,初始账号密码为 admin password
![](https://images.symedia.top/2025/04/06/20250406231457183.png)

### 一些必要的设置

#### http 代理

如下图，登录成功后，先去设置-全局设置中，设置好 http 代理，否则会无法使用 bot 功能，和归档识别功能
![](https://images.symedia.top/2025/04/06/20250406231648215.png)

#### 监控检测

监控检测是为了检查监控方式为【轮询监控】的任务监控状态，在你日常使用的网盘中新建一个文件夹，可以叫【监控测试】，然后填入这个【监控测试】文件夹的路径即可，如下图，监控的路径为：

```shell
/mnt/CloudNAS/CloudDrive2/115/我的接收/监控测试
```

![](https://images.symedia.top/2025/04/06/20250406231718774.png)

## 常见问题

### 无法登录

有些用户点击登录后，会显示 502 错误，这时候，只需要重启容器，看一下容器日志，会有验证密钥出错的日志，这时候只需要把验证服务器的 IP 地址加入你代理软件的直连名单即可
