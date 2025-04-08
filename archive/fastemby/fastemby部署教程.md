## 一、写在前面

### 1.1 为什么我们要安装 FastEmby？

FastEmby 可以帮助你，在 Emby 服务下，快速部署网盘的 302 模式；302 模式可以让<font style="background-color:#FBDE28;color:black;">你在家以外的网络环境</font>，<font style="background-color:#FBDE28;color:black;">满速访问网盘内的资源</font>，不再受限于家庭带宽的上行速度；

### 1.2 官方参考文档

老版本文档（部分操作无 UI 界面）：[https://great-willow-cc0.notion.site/FastEmby-14c017c1f53f80fca6a0f66a967718e3](https://great-willow-cc0.notion.site/FastEmby-14c017c1f53f80fca6a0f66a967718e3)

新版本文档（主要操作有 UI 界面）：[https://www.huanhq.com/archives/FastEmby2.0](https://www.huanhq.com/archives/FastEmby2.0)

### 1.3 准备工作

- Symedia 已安装：[https://www.huanhq.com/archives/Symedia-FastEmby](https://www.huanhq.com/archives/Symedia-FastEmby)
- Emby 服务已安装：这个百度或者问 AI
- 获取密钥的主要步骤

  一、Symedia 用户直接把 Symedia 的激活码填写在容器创建命令中的 LICENSE_KEY 变量中即可

  二、单独购买 FastEmby 的用户

  1. 步骤 1：获取 emby 的 api 密钥（具体方式，如下图）
  2. 步骤 2：私信开发者，获取<font style="background-color:#FBDE28;color:black;">fastemby 的密钥</font>

![](https://images.symedia.top/2025/04/08/20250408094403_71fe00a6.png)

## 二、安装过程：

![](https://images.symedia.top/2025/04/08/20250408094446_3e10ea1c.png)

### 2.1 容器安装

```plain
docker run -d \
--name FastEmby \
-e TZ=Asia/Shanghai \
-v /volume1/docker/FastEmby/config:/app/config \
-v /volume1/docker/FastEmby/log:/app/log \
--network host \
shenxianmq/fastemby:latest
```

注意：路径 1 和路径 2 需要自己在本地创建，可以自定义

路径 1：/volume1/docker/FastEmby/config、路径 2：/volume1/docker/FastEmby/log

### 2.2 配置容器 config.yaml 文件

- 文件路径：路径 1/config.yaml
- 修改内容：<font style="color:rgb(32, 35, 43);background-color:rgb(243, 243, 244);">Emby</font><font style="background-color:rgb(253, 224, 71);">内网地址</font><font style="color:rgb(32, 35, 43);background-color:rgb(243, 243, 244);">，和</font><font style="color:rgb(32, 35, 43);background-color:#FBDE28;color:black;">FastEmby</font><font style="background-color:#FBDE28;color:black;">密钥</font>
- 保存后重启：<font style="background-color:#FBDE28;color:black;">重点！重启容器</font>

![](https://images.symedia.top/2025/04/08/20250408094449_a59071c4.png)

### 2.3 配置 FastEmby

- 通过浏览器访问：ip+15895
  - 用户名：admin
  - 密码：password
- Emby 服务器配置（图 1）：
- 路径配置（图 2）：通过 Emby+3030 后台<font style="background-color:#FBDE28;color:black;">复制同一部影片的地址</font>
- 其他配置（图 3）：
- 以上均搞定，保存配置，记得<font style="background-color:#FBDE28;color:black;">重启 FastEmby+Emby</font>

![](https://images.symedia.top/2025/04/08/20250408094452_ab9787a0.png)

![](https://images.symedia.top/2025/04/08/20250408094442_c5238082.png)

![](https://images.symedia.top/2025/04/08/20250408094439_7a7612c0.png)

### 2.3 通过 Emby 客户端测试

- 端口号：ip+8098(注意，<font style="background-color:#FBDE28;color:black;">这是一个新的端口号</font>，以后需要 302 模式，都要用这个端口)；Emby 账号密码不变；
- 通过 5g 信号测试播放速度，速度大于家庭宽带上行即配置成功
  - 注意事项 1：iso 文件播放会卡顿，并且造成 cookie 失效
  - 注意事项 2：<font style="background-color:#FBDE28;color:black;">长时间视频无法加载，请检查日志</font>，有可能是 cookie 失效，请跟换 cookie
