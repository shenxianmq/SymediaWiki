# 🚀 FastEmby 2.0 部署教程

## 📦 一、Docker 部署

### 1.1 容器安装

#### 🐳 Docker CLI

**💻 X86 架构版本**

```bash
docker run -d \
  --name FastEmby \
  --network host \
  --restart unless-stopped \
  -e LICENSE_KEY=你的Symedia密钥 \
  -v /vol1/1000/appdata/fastEmby/config:/app/config \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  shenxianmq/fastemby:latest
```

**🔧 ARM64 架构版本**

```bash
docker run -d \
  --name FastEmby \
  --network host \
  --restart unless-stopped \
  -e LICENSE_KEY=你的Symedia密钥 \
  -v /vol1/1000/appdata/fastemby/config:/app/config \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  shenxianmq/fastemby_arm64:latest
```

#### 🐙 Docker Compose 部署

**💻 X86 架构版本**

```yaml
version: "3.8"

services:
  fastemby:
    container_name: FastEmby
    image: shenxianmq/fastemby:latest
    network_mode: host
    restart: unless-stopped
    environment:
      - LICENSE_KEY=你的Symedia密钥
    volumes:
      - /vol1/1000/appdata/fastemby/config:/app/config
      - /var/run/docker.sock:/var/run/docker.sock:ro
```

**🔧 ARM64 架构版本**

```yaml
version: "3.8"

services:
  fastemby:
    container_name: FastEmby
    image: shenxianmq/fastemby_arm64:latest
    network_mode: host
    restart: unless-stopped
    environment:
      - LICENSE_KEY=你的Symedia密钥
    volumes:
      - /vol1/1000/appdata/fastemby/config:/app/config
      - /var/run/docker.sock:/var/run/docker.sock:ro
```

::: warning 注意事项

- **路径创建**：配置路径需要提前在本地创建，可以自定义
- **配置路径**：`/vol1/1000/appdata/fastemby/config`
- **权限要求**：确保 Docker 容器有权限访问配置目录
  :::

### 1.2 访问服务

容器创建成功后，可通过以下地址访问：

```
http://你的服务器IP:9026
```

::: info 默认登录信息

- **用户名**：`admin`
- **密码**：`password`
  :::

## ⚙️ 二、配置方法

### 2.1 配置云盘助手

#### 步骤一：配置云盘助手

1. 导航到 **115 助手** 页面
2. 按照界面提示完成云盘配置

![](https://images.symedia.top/2025/10/26/20251026084952_63beb49a.png)

::: tip 重要提醒
请记住红框中的**配置名称**为 `115open`，这个名称在后续配置 Emby 服务器时会用到！
:::

### 2.2 配置 Emby 服务器

#### 步骤一：进入 Emby 配置页面

1. 导航到 **Emby** 配置页面
2. 准备进行路径替换配置

![](https://images.symedia.top/2025/10/26/20251026003456_3b6a56c7.png)

#### 步骤二：理解路径替换机制

配置的核心在于**路径替换**，需要将 strm 文件中的网盘根目录路径，映射到步骤 2.1 中添加的网盘助手配置名称。

::: info 工作原理
FastEmby 通过路径替换机制，将 Emby 中的文件路径转换为云盘直链，实现流畅播放。
:::

##### 📋 如何查看文件路径

**方法一：在 Emby 中查看**
在 Emby 中随意点开一个文件，查看文件路径：

![文件路径示例](https://images.symedia.top/2025/09/21/20250921225106_53733573.png)

**方法二：直接查看 strm 文件**
也可以直接打开 Symedia 生成的 strm 文件查看路径：

![文件路径示例](https://images.symedia.top/2025/10/07/20251007195440_c7331352.png)

##### 🔍 115 网盘自动生成路径映射

**适用场景**：使用 Symedia 生成的 Strm 文件，且路径中包含 115 字符

1. 点击【自动生成路径映射】按钮

![](https://images.symedia.top/2025/10/26/20251026003534_2d8b3447.png)

2. 填入刚刚获取到的 strm 文件内的路径，点击生成映射

![](https://images.symedia.top/2025/10/07/20251007195747_fd27f290.png)

3. 获取路径映射后，点击【应用到配置】完成设置

![](https://images.symedia.top/2025/10/07/20251007195824_134ef47b.png)

##### 🔍 123 云盘、天翼网盘等通过 openlist 自动生成路径映射

**适用场景**：使用 openlist 获取 302 直链的网盘

1. 点击【生成 OPENLIST 路径映射】按钮
2. 输入 strm 文件内的路径和 openlist 中该文件的下载链接：

![](https://images.symedia.top/2025/10/26/20251026003942_10491d5b.png)

3. 获取 Openlist 下载链接可以参考：[FastEmby + Openlist 302 教程](https://www.symedia.top/archive/fastemby/FastEmby+Openlist%20302%E6%95%99%E7%A8%8B.html)

4. 点击生成映射，成功获取后应用到配置即可

![](https://images.symedia.top/2025/10/26/20251026004058_b824b734.png)

::: tip 重要提醒
不要忘记启用服务器以及保存配置哦！
:::

##### 🔍 路径分析示例

以示例文件为例，完整路径为：

```
/mnt/CloudNAS/CloudDrive2/115/看剧/links/电视剧/韩剧/又是吴海英 (2016) {tmdb-66082}/Season 1/又是吴海英.2016.S01E01.第 1 集.1080p.Disney.WEB-DL.H.264.mkv
```

**路径分析**：

- **网盘根目录**：`/mnt/CloudNAS/CloudDrive2/115`
- **配置名称**（来自步骤 2.1）：`115open`
- **路径替换规则**：`/mnt/CloudNAS/CloudDrive2/115 => 115open`

#### 步骤三：配置路径替换

![](https://images.symedia.top/2025/10/26/20251026004408_471f6d58.png)

##### 📝 常见网盘路径替换示例

| 网盘类型 | 原始路径                       | 配置名称  | 替换规则                                   |
| -------- | ------------------------------ | --------- | ------------------------------------------ |
| 115 网盘 | `/mnt/CloudNAS/CloudDrive/115` | `115open` | `/mnt/CloudNAS/CloudDrive2/115 => 115open` |

:::

##### 🌐 HTTP 格式的 strm 文件配置

**适用场景**：使用 CloudDrive2 等工具生成的 HTTP 格式 strm 文件

**示例文件路径**：

```
http://192.168.9.89:19798/static/http/192.168.9.89:19798/False/%2F115open%2FFlipped.2160p.mkv
```

**路径分析**：

- **网盘名称**：`115open`
- **路径替换规则**：`http://192.168.9.89:19798/static/http/192.168.9.89:19798/False//115open => 115open`

::: warning 关键细节
请注意 `False` 后面有**两个斜杠** `//`，这是必须的，不能遗漏！
:::

#### 步骤四：保存并测试

1. **保存配置**：完成所有路径替换设置后，点击保存按钮
2. **启用服务**：确保服务器状态为启用状态
3. **测试访问**：通过反向代理端口访问 Emby 服务

::: tip 完成
恭喜！您已成功配置 FastEmby 2.0，现在可以享受流畅的云盘直链播放体验了！🎉

**下一步**：可以开始配置其他云盘或优化播放设置。
:::
