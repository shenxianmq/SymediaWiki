# Telexfer 简明使用教程

Telexfer 是一款强大的 Telegram 消息管理和网盘转存工具，支持创建多个转存 Bot，实现消息转发、网盘链接转存等功能。

## 目录

- [部署配置](#部署配置)
- [初始化设置](#初始化设置)
- [Bot 类型说明](#bot-类型说明)
- [实体列表使用](#实体列表使用)
- [消息转发与转存](#消息转发与转存)

---

## 部署配置

### Docker Compose 配置

创建 `docker-compose.yml` 文件，配置如下：

```yaml
version: "3.8"
services:
  telexfer:
    container_name: telexfer
    environment:
      - TELEGRAM_API_ID=你的tg api id
      - TELEGRAM_API_HASH=你的tg api hash
      - PROXY_TYPE=http
      - PROXY_HOST=192.168.9.5
      - PROXY_PORT=7890
      - LICENSE_KEY=telexfer密钥
    image: shenxianmq/telexfer:latest
    network_mode: host
    volumes:
      - /vol1/1000/appdata/telexfer/config:/app/config
      - /vol1/1000/downloads:/downloads
      - /vol1/1000/appdata/telexfer/ms-playwright:/telexfer/.cache/ms-playwright
      - /var/run/docker.sock:/var/run/docker.sock:ro
```

### 配置说明

- **TELEGRAM_API_ID** 和 **TELEGRAM_API_HASH**：从 [Telegram API 平台](https://my.telegram.org/apps) 获取
- **PROXY_TYPE**、**PROXY_HOST**、**PROXY_PORT**：代理配置（如不需要代理可删除这些环境变量）
- **LICENSE_KEY**：Telexfer 授权密钥
- **volumes**：根据实际情况修改路径映射

### 访问端口

容器启动后，Web 界面访问端口为：**9027**

---

## 初始化设置

容器创建后，通过 SSH 连接到服务器，运行以下命令进行初始化：

注意，输入的是你 tg 账号的手机号，如+1305xxxxxxx，不要填写 bot token

```bash
docker exec -it telexfer python /app/login_init.py
```

**说明**：初始化过程会引导你登录 Telegram 账号，请按照提示完成操作。

---

## Bot 类型说明

Telexfer 支持创建多个 Bot，功能分类如下：

### 转存 Bot（侧边栏）

- **用途**：用于各种网盘转存操作
- **数量**：可以创建多个转存 Bot
- **功能**：类似于 Symedia 的转存助手，但支持创建多个实例

### 主 Bot（设置中配置）

- **用途**：
  - 发送系统通知
  - 接收并下载 YouTube、抖音等视频链接
- **数量**：通常只需配置一个
- **位置**：在设置页面中配置

### 重要提示

⚠️ **转存 Bot 和主 Bot 不要共用同一个 Bot**，它们的功能分类不同，需要分别创建和配置。

![](https://images.symedia.top/2025/12/15/20251215175255_1e3762ac.png)

---

## 实体列表使用

### 搜索频道

1. 进入 **实体列表** 页面
2. 在搜索框中输入频道关键词
3. 点击搜索，找到目标频道或群组
4. 选择需要操作的实体

### 使用场景

- 搜索并添加需要监控的 Telegram 频道或群组
- 为消息转发和转存功能配置源实体

---

## 消息转发与转存

### 消息转发

**功能说明**：将指定实体的消息转发到另一个实体（频道、群组或私聊）。

**使用场景**：

- 将频道消息转发到群组
- 将群组消息转发到个人
- 消息聚合和分发

**配置方式**：

1. 在转发设置中选择源实体（消息来源）
2. 选择目标实体（转发目标）
3. 保存配置即可自动转发

### 消息转存

**功能说明**：自动识别指定实体中的网盘链接，并直接转存到配置的网盘中。

**使用场景**：

- 自动转存频道中的 115、123、阿里云盘等链接
- 批量转存网盘资源
- 自动化资源收集

**配置方式**：

1. 在转存设置中选择源实体（包含网盘链接的频道或群组）
2. 配置目标网盘账号
3. 保存配置后，系统会自动识别并转存链接

### 功能对比

| 功能         | 消息转发             | 消息转存       |
| ------------ | -------------------- | -------------- |
| **作用对象** | 所有消息             | 仅网盘链接     |
| **目标**     | 另一个 Telegram 实体 | 网盘账号       |
| **处理方式** | 转发消息             | 提取链接并转存 |
| **适用场景** | 消息分发             | 资源收集       |

---

## 注意事项

1. **Bot 配置**：确保转存 Bot 和主 Bot 使用不同的 Bot，避免功能冲突
2. **API 限制**：注意 Telegram API 的调用频率限制，避免频繁操作
3. **网盘配置**：转存功能需要先配置好对应的网盘账号信息
4. **代理设置**：如果无法访问 Telegram，请正确配置代理参数
5. **权限要求**：确保 Bot 有权限访问需要操作的频道和群组

---

## 常见问题

### Q1: 初始化失败怎么办？

**A**: 检查以下几点：

- Telegram API ID 和 Hash 是否正确
- 网络连接是否正常（如需要代理，检查代理配置）
- 容器日志是否有错误信息

### Q2: 转存 Bot 无法转存链接？

**A**: 可能的原因：

- 网盘账号未正确配置
- Bot 没有权限访问源实体
- 链接格式不支持

### Q3: 如何查看转存进度？

**A**: 在 Web 界面中可以查看转存任务列表和状态，主 Bot 也会发送转存完成的通知。

---

## 总结

Telexfer 提供了灵活的 Telegram 消息管理和网盘转存功能，通过合理配置转存 Bot 和主 Bot，可以实现自动化的消息转发和资源转存。建议：

1. 仔细区分转存 Bot 和主 Bot 的用途
2. 合理配置实体列表，避免重复操作
3. 根据实际需求选择消息转发或转存功能
4. 定期检查转存任务状态，确保正常运行
