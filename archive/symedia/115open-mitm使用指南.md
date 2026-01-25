# 115open-mitm 使用指南

## 概述

115open-mitm 是一个用于 115 网盘的中间人代理工具，配合 CloudDrive2 使用可以实现更快的访问速度。本指南将介绍如何部署和配置 115open-mitm。

## 一、部署容器

首先，使用以下 Docker Compose 配置部署 115open-mitm 容器：

**方式一：Docker Compose**

```yaml
services:
  open115-mitm:
    container_name: open115-mitm
    environment:
      - TZ=Asia/Shanghai
      - CONFIG_PATH=/app/config/config.json
    image: shenxianmq/open115-mitm:latest
    network_mode: host
    restart: always
    volumes:
      - /vol1/1000/appdata/open115-mitm/config:/app/config
      - /vol1/1000/appdata/open115-mitm/cert:/app/cert  # 证书文件存放目录
```

**方式二：Docker Run**

```bash
docker run -d \
  --name open115-mitm \
  --restart always \
  --network host \
  -e TZ=Asia/Shanghai \
  -e CONFIG_PATH=/app/config/config.json \
  -v /vol1/1000/appdata/open115-mitm/config:/app/config \
  -v /vol1/1000/appdata/open115-mitm/cert:/app/cert \
  shenxianmq/open115-mitm:latest
```

::: tip 说明
- 请根据实际情况修改路径映射
- `cert` 目录用于存放 mitmproxy 证书文件，后续配置 CloudDrive2 时需要用到
- 推荐使用 Docker Compose 方式，便于管理和维护
:::

## 二、获取证书路径

容器启动后，需要获取证书文件的路径：

1. 进入证书目录：`/vol1/1000/appdata/open115-mitm/cert`
2. 找到证书文件（通常为 `ca-cert.pem`）
3. 复制证书文件的完整路径，例如：`/vol1/1000/appdata/open115-mitm/cert/ca-cert.pem`

::: tip 重要提示
请妥善保存证书路径，后续配置 CloudDrive2 时需要用到。
:::

## 三、准备 CloudDrive2 配置

在运行部署脚本之前，请准备好 CloudDrive2 的配置文件夹路径：

- 找到 CloudDrive2 的配置文件目录（宿主机路径）
- 记录该路径，例如：`/Users/shenxian/Downloads/CloudDrive2`

## 四、运行部署脚本

执行以下命令运行 CloudDrive2 部署脚本：

```bash
export GITHUB_BASE_URL="https://cdn.jsdelivr.net/gh/shenxianmq/SymediaWiki@main" && curl -fsSL "$GITHUB_BASE_URL/scripts/deploy-cd2.sh" -o /tmp/deploy-cd2.sh && bash /tmp/deploy-cd2.sh
```

脚本运行后，会依次提示输入以下信息：

1. **Config 文件夹路径（宿主机路径）**
   ```
   请输入 Config 文件夹路径（宿主机路径）: /Users/shenxian/Downloads/CloudDrive2
   [INFO] Config 映射: /Users/shenxian/Downloads/CloudDrive2 -> /Config
   ```

2. **mitmproxy 证书文件路径**
   ```
   请输入 mitmproxy 证书文件路径: /Users/shenxian/PycharmProjects/115open-mitm/cert/ca-cert.pem
   ```

::: tip 说明
请根据实际情况输入正确的路径，脚本会自动配置相应的映射关系。
:::

## 五、完成配置

脚本执行完成后，还需要：

1. 手动添加对应的环境变量
2. 确认卷映射配置正确
3. 重新部署 CloudDrive2 容器

::: warning 重要提示
确保所有配置项都已正确设置后再重新部署 CloudDrive2，否则可能导致功能异常。
:::

## 六、配置 CloudDrive2 代理

完成 CloudDrive2 部署后，需要在 CloudDrive2 中为 115 网盘配置代理：

1. 打开 CloudDrive2 Web 界面
2. 找到已添加的 115 网盘
3. 进入网盘设置页面
4. 配置代理设置，参考以下截图：

![](https://images.symedia.top/2026/01/25/20260125182546_c5473759.png)

![](https://images.symedia.top/2026/01/25/20260125182601_aa7c7dee.png)

### 验证配置

配置完成后，可以通过以下方式验证代理是否正常工作：

1. 在 CloudDrive2 中访问 115 网盘的文件夹
2. 查看 115open-mitm 容器的日志
3. 如果配置成功，日志中会出现拦截请求的记录，如下图所示：

![](https://images.symedia.top/2026/01/25/20260125182753_e7882c63.png)

::: tip 说明
- 代理地址通常为：`http://localhost:8812` 或 `http://127.0.0.1:8812`
- 如果 CloudDrive2 和 115open-mitm 不在同一台机器上，请使用实际的服务器 IP 地址
- 配置完成后，115 网盘的流量将通过 115open-mitm 代理进行转发
:::

## 常见问题

### Q: 证书文件找不到？
A: 确认容器已正常启动，检查证书目录挂载是否正确，证书文件通常在容器启动后自动生成。

### Q: 部署脚本执行失败？
A: 检查网络连接，确保可以访问 GitHub CDN，或检查输入路径是否正确。

