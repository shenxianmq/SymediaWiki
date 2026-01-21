# frp + Lucky 透传 IP 教程

## 适用场景

本教程适用于以下部署架构：

- **服务端**：在 VPS 上部署 frps
- **客户端**：在本地部署 frpc + Lucky

## 配置步骤

### 步骤一：配置 frpc 开启 IP 透传

在本地 frpc 配置文件中添加以下配置，启用 Proxy Protocol v2 协议以实现 IP 透传：

```toml
[[proxies]]
name = "Lucky"
type = "tcp"
localIP = "192.168.9.89"
localPort = 16666
remotePort = 443
transport.proxyProtocolVersion = "v2"  # 关键配置：开启 IP 透传协议
```

> **说明**：`transport.proxyProtocolVersion = "v2"` 这一行是开启 IP 透传的关键配置。

### 步骤二：配置 Lucky 信任的 CIDR 列表

在 Lucky 中进入 **设置 → 全局代理协议 → 信任的 CIDR 列表**，填入以下内网地址段：

```
192.168.0.0/16
10.0.0.0/8
127.0.0.0/8
```

配置界面参考：

![](https://images.symedia.top/2026/01/15/20260115132157_3e70835d.png)

## 完成

完成以上配置后，重启 frpc 和 Lucky 服务，IP 透传功能即可生效。现在 Lucky 可以正确获取到客户端的真实 IP 地址了。
