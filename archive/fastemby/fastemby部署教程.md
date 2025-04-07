## 一、写在前面

### 1.1 为什么我们要安装FastEmby？

FastEmby可以帮助你，在Emby服务下，快速部署网盘的302模式；302模式可以让<font style="background-color:#FBDE28;">你在家以外的网络环境</font>，<font style="background-color:#FBDE28;">满速访问网盘内的资源</font>，不再受限于家庭带宽的上行速度；

### 1.2 官方参考文档

老版本文档（部分操作无UI界面）：[https://great-willow-cc0.notion.site/FastEmby-14c017c1f53f80fca6a0f66a967718e3](https://great-willow-cc0.notion.site/FastEmby-14c017c1f53f80fca6a0f66a967718e3)

新版本文档（主要操作有UI界面）：[https://www.huanhq.com/archives/FastEmby2.0](https://www.huanhq.com/archives/FastEmby2.0)

### 1.3 准备工作

- Symedia已安装：[https://www.huanhq.com/archives/Symedia-FastEmby](https://www.huanhq.com/archives/Symedia-FastEmby)
- Emby服务已安装：这个百度或者问AI
- 获取密钥的主要步骤

  一、Symedia用户直接把Symedia的激活码填写在容器创建命令中的LICENSE_KEY变量中即可

  二、单独购买FastEmby的用户

  1. 步骤1：获取emby的api密钥（具体方式，如下图）
  2. 步骤2：私信开发者，获取<font style="background-color:#FBDE28;">fastemby的密钥</font>

![](https://cdn.nlark.com/yuque/0/2025/png/8384795/1741787763914-b98eebf1-4640-492b-91f5-00e3e6bdfc3c.png)

## 二、安装过程：

![](https://cdn.nlark.com/yuque/0/2025/png/8384795/1741790956818-6e9859ef-5ff6-4826-8cb0-38ae0e0935d9.png)

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

注意：路径1和路径2需要自己在本地创建，可以自定义

路径1：/volume1/docker/FastEmby/config、路径2：/volume1/docker/FastEmby/log

### 2.2 配置容器config.yaml文件

- 文件路径：路径1/config.yaml
- 修改内容：<font style="color:rgb(32, 35, 43);background-color:rgb(243, 243, 244);">Emby</font><font style="background-color:rgb(253, 224, 71);">内网地址</font><font style="color:rgb(32, 35, 43);background-color:rgb(243, 243, 244);">，和</font><font style="color:rgb(32, 35, 43);background-color:#FBDE28;">FastEmby</font><font style="background-color:#FBDE28;">密钥</font>
- 保存后重启：<font style="background-color:#FBDE28;">重点！重启容器</font>

![](https://cdn.nlark.com/yuque/0/2025/png/8384795/1741789085222-8740375a-a3c7-4c2c-86a3-bc38e6f0cd51.png)

### 2.3 配置FastEmby

- 通过浏览器访问：ip+15895
  - 用户名：admin
  - 密码：password
- Emby服务器配置（图1）：
- 路径配置（图2）：通过Emby+3030后台<font style="background-color:#FBDE28;">复制同一部影片的地址</font>
- 其他配置（图3）：
- 以上均搞定，保存配置，记得<font style="background-color:#FBDE28;">重启FastEmby+Emby</font>

![图1](https://cdn.nlark.com/yuque/0/2025/png/8384795/1741789755600-342022c5-32b8-4f9d-a143-915acf1e99c2.png)

![图2](https://cdn.nlark.com/yuque/0/2025/png/8384795/1741790368578-cfff41c0-d762-4b89-98df-3dbe8fef8faa.png)

![](https://cdn.nlark.com/yuque/0/2025/png/8384795/1741790476963-b169c9b0-a515-4588-8064-c2539f026ce1.png)

### 2.3 通过Emby客户端测试

- 端口号：ip+8098(注意，<font style="background-color:#FBDE28;">这是一个新的端口号</font>，以后需要302模式，都要用这个端口)；Emby账号密码不变；
- 通过5g信号测试播放速度，速度大于家庭宽带上行即配置成功
  - 注意事项1：iso文件播放会卡顿，并且造成cookie失效
  - 注意事项2：<font style="background-color:#FBDE28;">长时间视频无法加载，请检查日志</font>，有可能是cookie失效，请跟换cookie
