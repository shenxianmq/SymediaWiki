# 🚀 Redia 部署教程

> Redia 是一个强大的媒体服务器反向代理工具，与 Symedia 结合使用，支持多种云盘（115，123 云盘，天翼云盘）直链播放。本教程将详细介绍如何部署和配置 Redia。(本工具定价 99，直接在捐赠页面捐赠即可)

::: warning 本软件仅用于合法用途，仅限用户本人使用，用户不得利用本软件从事违法违规行为，因用户违法使用所产生的一切后果均由用户自行承担。
:::

````

## 📦 一、Docker 部署

### 1.1 容器安装

#### 🐳 Docker CLI

::: danger 重要提醒
如果您已经部署了 **FastEmby**，请先删除 FastEmby 容器后再进行 Redia 安装，以避免端口冲突和功能重复。
:::

**💻 X86 架构版本**

```bash
docker run -d \
  --name Redia \
  --network host \
  --restart unless-stopped \
  -e LICENSE_KEY=你的Redia密钥 \
  -v /vol1/1000/appdata/redia/config:/app/config \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  shenxianmq/redia:latest
````

**🔧 ARM64 架构版本**

```bash
docker run -d \
  --name Redia \
  --network host \
  --restart unless-stopped \
  -e LICENSE_KEY=你的Redia密钥 \
  -v /vol1/1000/appdata/redia/config:/app/config \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  shenxianmq/redia_arm64:latest
```

#### 🐙 Docker Compose 部署

**💻 X86 架构版本**

```yaml
version: "3.8"

services:
  redia:
    container_name: Redia
    image: shenxianmq/redia:latest
    network_mode: host
    restart: unless-stopped
    environment:
      - LICENSE_KEY=你的Redia密钥
    volumes:
      - /vol1/1000/appdata/redia/config:/app/config
      - /var/run/docker.sock:/var/run/docker.sock:ro
```

**🔧 ARM64 架构版本**

```yaml
version: "3.8"

services:
  redia:
    container_name: Redia
    image: shenxianmq/redia_arm64:latest
    network_mode: host
    restart: unless-stopped
    environment:
      - LICENSE_KEY=你的Redia密钥
    volumes:
      - /vol1/1000/appdata/redia/config:/app/config
      - /var/run/docker.sock:/var/run/docker.sock:ro
```

::: warning 注意事项

- 路径需要提前在本地创建，可以自定义
- 配置路径：`/vol1/1000/appdata/redia/config`
  :::

### 1.2 访问服务

容器创建成功后，可通过以下地址访问：

```
http://你的服务器IP:9025
```

::: info 默认登录信息

- **用户名**：`admin`
- **密码**：`password`
  :::

## ⚙️ 二、配置方法

### 2.1 配置云盘助手

#### 步骤一：打开云盘助手配置

导航到 **反向代理** → **云盘助手**，以 115 助手为例：

![配置云盘助手](https://images.symedia.top/2025/09/21/20250921224635_0f7f5c39.png)

#### 步骤二：添加 115 配置

按照下图配置 115 助手，新手可直接参考此配置：

![115配置示例](https://images.symedia.top/2025/09/21/20250921224728_831d3529.png)

::: tip 重要提醒
请记住红框中的**配置名称**为 `115`，这个名称在后续配置 Emby 服务器时会用到！
:::

### 2.2 配置 Emby 服务器

#### 步骤一：打开 Emby 服务器配置

导航到 **反向代理** → **媒体服务器** → **Emby 服务器**：

![Emby服务器配置](https://images.symedia.top/2025/09/21/20250921224506_0dceb6a4.png)

#### 步骤二：理解路径替换机制

配置的核心在于**路径替换**，需要将 strm 文件中的网盘根目录路径，映射到步骤 2.1 中添加的网盘助手配置名称。

##### 📋 如何查看文件路径

在 Emby 中随意点开一个文件，查看文件路径：

![文件路径示例](https://images.symedia.top/2025/09/21/20250921225106_53733573.png)

也可以直接打开 Symedia 生成的 strm 文件

![文件路径示例](https://images.symedia.top/2025/10/07/20251007195440_c7331352.png)

##### 🔍 自动生成路径映射

如果你是使用 Symedia 生成的 Strm 文件，并且路径中有含有 115，123，天翼云盘这样的字符，则可以直接使用【自动生成路径映射】

![](https://images.symedia.top/2025/10/07/20251007195721_5ebe3f7c.png)

填入刚刚获取到的 strm 文件内的路径，点击生成映射

![](https://images.symedia.top/2025/10/07/20251007195747_fd27f290.png)

获取路径映射后，点击【应用到配置】即可

![](https://images.symedia.top/2025/10/07/20251007195824_134ef47b.png)

::: tip 重要提醒
不要忘记启用服务器以及保存配置哦！
:::

##### 🔍 路径分析示例

以上图文件为例，完整路径为：

```
/mnt/CloudNAS/CloudDrive2/115/看剧/links/电视剧/韩剧/又是吴海英 (2016) {tmdb-66082}/Season 1/又是吴海英.2016.S01E01.第 1 集.1080p.Disney.WEB-DL.H.264.mkv
```

**网盘根目录**：`/mnt/CloudNAS/CloudDrive2/115`

**配置名称**（来自步骤 2.1）：`115`

**路径替换规则**：`/mnt/CloudNAS/CloudDrive2/115 => 115`

#### 步骤三：配置路径替换

![Emby配置示例](https://images.symedia.top/2025/09/21/20250921224928_0d4edfa7.png)

##### 📝 更多示例

| 网盘类型 | 路径替换规则                               |
| -------- | ------------------------------------------ |
| 115 网盘 | `/mnt/CloudNAS/CloudDrive2/115 => 115`     |
| 123 云盘 | `/mnt/CloudNAS/CloudDrive2/123云盘 => 123` |

::: warning 多个同类网盘的处理
如果您有多个相同类型的网盘，请在路径末尾添加 `/` 以避免替换错误：

```
/mnt/CloudNAS/CloudDrive2/115/ => 115/
/mnt/CloudNAS/CloudDrive2/115-2/ => 115-2/
```

:::

##### 🌐 HTTP 格式的 strm 文件配置

如果您的 strm 文件内容是 **HTTP 格式**（例如使用 CloudDrive2），配置方法略有不同：

**示例文件路径**：

```
http://192.168.9.89:19798/static/http/192.168.9.89:19798/False/%2F115open%2FFlipped.2160p.mkv
```

**路径分析**：

- 网盘名称：`115open`
- 路径替换规则：`http://192.168.9.89:19798/static/http/192.168.9.89:19798/False//115open => 115`

**其他网盘示例**:

- 网盘名称：`123云盘`
- 路径替换规则：`http://192.168.9.89:19798/static/http/192.168.9.89:19798/False//123云盘 => 123`

- 网盘名称：`天翼云盘`
- 路径替换规则：`http://192.168.9.89:19798/static/http/192.168.9.89:19798/False//天翼云盘 => 天翼云盘`

::: warning 关键细节
请注意 `False` 后面有**两个斜杠** `//`，这是必须的，不能遗漏！
:::

#### 步骤四：保存并访问

配置完成后，点击保存，即可通过反向代理端口访问 Emby 服务。

::: tip 完成
恭喜！您已成功配置 Redia，现在可以享受流畅的云盘直链播放体验了！🎉
:::
