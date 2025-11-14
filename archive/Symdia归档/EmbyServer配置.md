# EmbyServer 配置

**EmbyServer**

## 功能简介

本插件能实现两个功能：

- Sa 生成 Strm 文件时，通知 Emby 扫描该文件，这是 Sa => Emby
- Emby 出现播放、入库等事件时，可以发通知到 Tg/企业微信，这是 Emby => Sa

## Sa => Emby

### 添加配置

打开**侧边栏 - 插件 - EmbyServer**,点击**添加配置**,然后填入你的 Emby 地址和 apikey,填写后点击测试,现面**连接成功**字样即说明配置正确

![](https://images.symedia.top/2025/04/16/20250416212745_3b2ec108.png)

添加配置成功后，首页会显示该 Emby 的媒体数量

![](https://images.symedia.top/2025/04/16/20250416213855_d2cbab33.png)

### 常见问题

部分用户因为本地网络问题，直接填写本机 ip+端口会测试失败，这时候可以做如下尝试

- 填写**docker 网关地址+端口**

```shell
http://172.17.0.1:8096
```

- 填写**Emby 的公网地址**

```shell
http://你的Emby的公网地址
```

## Emby => Sa

### 媒体服务器通知

需要设置媒体服务器 Webhook，回调相对路径为 `/api/v1/webhook/mediamsg/emby/{Emby IP:端口}/{Emby API Key}?token=symedia`（8095 端口），其中 symedia 为设置的 API\\\_TOKEN。

```
http://172.17.0.1:8095/api/v1/webhook/mediamsg/emby/172.17.0.1:8096/770131037e8e49459618af98c14de06c?token=symedia
```

![](https://images.symedia.top/2025/04/16/20250416213123_b83c2938.png)

> - 路径替换：Emby 和 Symedia 对于同一个目录映射方式相同时可以不填
> - Emby 通知的原理是把生成的 Strm ｜软链接的路径通知给 Emby，让 Emby 去扫描该路径，如果 Strm ｜软链接的目录在 Symedia 和 Emby 中的映射不一样，则需要在这里进行替换。因此建议 Symedia 和 Emby 在映射目录时尽量保持一致
> - 支持的配置格式（注意空格）：多个配置用 隔开
> - 被替换路径 1 => 替换路径 1;被替换路径 2 => 替换路径 2;...
> - 示例：比如对于 `/mnt/Symlink`
>
>   - 在 Symedia 中的映射为 `/mnt/Symlink:/Symedia/Symlink`
>   - 在 Emby 中的映射为 `/mnt/Symlink:/Emby/Symlink`
>   - 我们就需要把 `/Symedia/Symlink` 替换为 `/Emby/Symlink`
>   - 那么路径替换就是`/Symedia/Symlink => /Emby/Symlink`

> 另外提及一点，按照上面的示例，如果是这么配置的情况下，这里的路径替换可以不用填写
>
> - 对于 `/mnt/Symlink`
>
>   - 在 Symedia 中的映射为 `/mnt/Symlink:/Symlink`
>   - 在 Emby 中的映射为 `/mnt/Symlink:/Symlink`
>
> 就是说，把实际的物理机实际路径 `/mnt/Symlink` ，给到两个容器（Symedia、Emby）的映射路径用同一个路径 `/Symlink` 进行映射，这样就不需要替换路径啦

**注意！！！**

如果遇到 Emby 的通知测试失败，需要给 Emby 添加这三条环境变量

```
HTTP_PROXY=http://192.168.9.5:7890

ALL_PROXY=http://192.168.9.5:7890

NO_PROXY=172.17.0.1,127.0.0.1,localhost
```
