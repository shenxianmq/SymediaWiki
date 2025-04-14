# Symedia 一条龙教程

::: tip 文章信息

- **文章来源**: [@HuanHq](https://www.huanhq.com/)
- **原文链接**: [Emby 直链 115 神器](https://www.huanhq.com/work/Emby%E7%9B%B4%E9%93%BE115%E7%A5%9E%E5%99%A8%EF%BC%8C%E5%89%8A%E5%88%AE%E3%80%81%E6%95%B4%E7%90%86%E3%80%81%E9%87%8D%E5%91%BD%E5%90%8D%EF%BC%88Symedia+FastEmby%EF%BC%89.html)
  :::

## 前期准备

**激活码**：

- 如果已经购买激活码，可以直接部署。
- 如果未购买，点击右上角捐赠按钮，捐赠后会获得激活码一枚

## CloudDrive2 挂载路径

**注意事项**：

- 挂载路径需要严格遵循以下格式，否则可能导致掉盘或无法使用 SA 刷新。

CloudDrive2 挂载路径
（注意需要跟我这样才行，否则后面掉盘没法用 sa 去刷新）
![](https://images.symedia.top/2025/04/08/20250408103525_787a06e7.png)
![](https://images.symedia.top/2025/04/08/20250408103605_8a4979de.png)
![](https://images.symedia.top/2025/04/08/20250408103519_84b8944a.png)

## Symedia 配置指南

### **Cookie 配置**

- 需要留空两个 Cookie：
  - **CloudDrive2**：用于挂载路径。
  - **Symedia**：用于激活服务。

### Docker Compose 配置文件

```yaml
version: "3.8"
services:
  symedia:
    image: shenxianmq/symedia:latest # 拉取最新镜像
    container_name: symedia # 容器名称
    restart: always # 重启策略
    ports:
      - "8095:8095" # 映射端口：主机 8095 -> 容器 8095
    volumes:
      - /volume1/docker/CloudNAS:/CloudNAS:rslave # cd2映射的本地路径
      - /volume1/strm:/strm # 本地生成strm路径，自行选择
      - /volume1/docker/symedia/config:/app/config # sa配置文件夹
      - /var/run/docker.sock:/var/run/docker.sock:ro # Docker 宿主机通信
    environment:
      - TZ=Asia/Shanghai # 容器时区
      - LICENSE_KEY=eyj89j9fjrfkr9fpi #秘钥
```

- 创建 symedia 配置文件夹
  ![](https://images.symedia.top/2025/04/08/20250408103507_57550d23.png)
- 本地生成 strm 的存放文件夹
  ![](https://images.symedia.top/2025/04/08/20250408103539_2e1d11f0.png)
- 没问题直接创建启动
  ![](https://images.symedia.top/2025/04/08/20250408103558_dde4d2cc.png)
- 启动服务
- 浏览器访问 ip:8095 端口
  ![](https://images.symedia.top/2025/04/08/20250408103506_ee7c671f.png)
- 默认用户名：admin，默认密码：password

**首次进入设置，全局设置内修改用户名密码，重启生效**
![](https://images.symedia.top/2025/04/08/20250408103501_f9e65864.png)
![](https://images.symedia.top/2025/04/08/20250408103625_3ff531b2.png)

### **115 设置**

- **填入名称与 115 cookie，建议抓取微信小程序 cookie，可风控检测（如果使用 FastEmby 后端，可以自动扫码切换 cookie）**
  ![](https://images.symedia.top/2025/04/08/20250408103604_4e957d91.png)
  ![](https://images.symedia.top/2025/04/08/20250408103610_15211210.png)
  ![](https://images.symedia.top/2025/04/08/20250408103611_ca80b2f5.png)
  ![](https://images.symedia.top/2025/04/08/20250408103517_4d0d044c.png)

### 链接同步

- **1、新建同步，以"国产剧"为例：填写任务名称之后，选择同步方式：目录树同步（推荐）、星标同步（会使你同步的文件全部打星标，谨慎使用）、常规同步（不建议，速度慢容易风控）**

- **2、选择云盘文件夹名字，例如 115**

- **3、选择添加的 115 cookie 配置**

- **4、填写云盘根目录、源目录、链接目录等**

- **5、选择挂载类型，可选 cd2、alist、custom（自行配置，fastemby 用户可选）**

- **6、以 cd2 为例，填写云端地址，strm 模式（软链接或 strm），及其他。右侧实时更新 strm 预览结果，可对照使用**

- **7、填写本地需要生成的 strm、软链接及元数据后缀，区别于 autosumlink，sa 可以同时生成 strm 或软链接**

- **8、侧边栏手动同步，可以复制本地已有的配置，省去反复重新填写的麻烦**

- **9、strm 模式：cloud 模式文件内是 http 开头的链接,local 模式文件内是文件的路径**

这里需要注意的是，指定删除前缀才能成功播放

例如我这里实际的解码路径为

http://192.168.6181:19798/static/http/192.168.6.181:19798/False//CloudNAS/115人影院/国产剧/test.mkv

则需要在 cd2 中查看我路径实际为http://192.168.6181:19798/static/http/192.168.6.181:19798/False//CloudNAS/115

/CloudNAS 为多余，删掉即可

**点击保存**
![](https://images.symedia.top/2025/04/08/20250408103651_844cc9a6.png)
![](https://images.symedia.top/2025/04/08/20250408103508_4c4ab008.png)
**运行试试**
![](https://images.symedia.top/2025/04/08/20250408103549_2caba1ce.png)
**可以看到生成速度很快**
![](https://images.symedia.top/2025/04/08/20250408103533_762555b3.png)
**作者很贴心，单独给同步的链接做了日志，新增删除都有记录，很细**
![](https://images.symedia.top/2025/04/08/20250408103650_88276e6e.png)
![](https://images.symedia.top/2025/04/08/20250408103614_7a08b3db.png)

## **Telegram 机器人通知**

tg 寻找机器人 father @BotFather 创建属于自己的机器人，获取 bot tokon，填入自己的 tg ID 以接收 sa 通知或互动
![](https://images.symedia.top/2025/04/08/20250408103554_607d9e96.png)
webhook 监控
注：webhook 不起作用：检查是否是 cd2 会员，cd2 要是 host 模式

上传 webhook.toml 文件到 cd2 的 config 的 webhooks 目录，修改 base_url 为自己的 sa 实际 IP 地址

[webhook.toml](https://images.viplee.cc/2025/02/20/webhook.toml.zip)

不能直接下载 webhook.toml，则下载 zip 文件解压

> 最新版 CloudDrive2 可以直接在网页中添加 webhook 配置，新建 webhook 后，将下列代码粘贴进去，修改 base_url 为自己的 sa 实际 IP 地址

![](https://images.symedia.top/2025/04/14/20250414164133_eb3878b4.png)

![](https://images.symedia.top/2025/04/14/20250414164149_cd0c10de.png)

```toml
# global variables: global variables are used to replace the placeholders in URL and body of the webhook
# {device_name} - The name of the device
# {user_name} - Current user name
# {version} - The version of the application
# {event_category} - The category of the event
# {event_name} - The name of the event
# {event_time} - The time of the event occurred, unix epoch time in seconds
# {send_time} - The time of the data sent, unix epoch time in seconds

# global parameters
[global_params]
# The base URL of the server to send the data to, the server must be able to receive POST requests
base_url = "http://localhost:8095"
# Whether the webhook is enabled
enabled = true

# The default http headers
[global_params.default_headers]
content-type = "application/json"
user-agent = "clouddrive2/{version}"
authorization = "basic usernamepassword"

# File system watcher webhook configuration
[file_system_watcher]
# The URL of the server to send the data to, the server must be able to receive POST requests
url = "{base_url}/api/v1/webhook/clouddrive2/file_notify?device_name={device_name}&user_name={user_name}&type={event_name}"
# http method, can be "GET" or "POST", if not specified, the default value is POST
method = "POST"
# Whether the file system watcher is enabled
enabled = true
# The body to be sent to the server can be a JSON string
# The following is a sample template for the data to be sent
# the json string should contains at least an array of file changes, each file change item shoud contain the following fields
# {event_category} - The category of the event is "file"
# {event_name} - The name of the event is "notify"
# {action} - The action of file change (create, delete, rename)
# {is_dir} - Whether the file is a directory (false: file, true: directory)
# {source_file} - The source file's path of the action
# {destination_file} - The destination file's path of the action, only valid for action rename(move)
body = '''
{
  "device_name": "{device_name}",
  "user_name": "{user_name}",
  "version": "{version}",
  "event_category": "{event_category}",
  "event_name": "{event_name}",
  "event_time": "{event_time}",
  "send_time": "{send_time}",
  "data": [
      {
        "action": "{action}",
        "is_dir": "{is_dir}",
        "source_file": "{source_file}",
        "destination_file": "{destination_file}"
      }
  ]
}
'''
# specify additional http headers for the file system watcher request if required, headers with same name will override in the default headers
[file_system_watcher.headers]
additional_header = "value"

# mount point watcher configuration
[mount_point_watcher]
# The URL of the server to send the data to, the server must be able to receive POST requests
url = "{base_url}/api/v1/webhook/clouddrive2/mount_notify?device_name={device_name}&user_name={user_name}&type={event_name}"
# http method
method = "POST"
# Whether the mount point watcher is enabled
enabled = true
# The body to be sent to the server can be a JSON string
# The following is a sample template for the data to be sent
# the mount_point_watcher should contains at least an array of mount point changes, each mount point change item shoud contain the following fields
# {event_category} - The category of the event is "mount_point"
# {event_name} - The name of the event is "mount" or "unmount"
# {action} - The action of mount point change (mount, unmount)
# {mount_point} - The mount point's path of the action
# {status} - The status of the action (true for success, false for failed)
# {reason} - The failed reason, empty string means success
body = '''
{
  "device_name": "{device_name}",
  "user_name": "{user_name}",
  "version": "{version}",
  "event_category": "{event_category}",
  "event_name": "{event_name}",
  "event_time": "{event_time}",
  "send_time": "{send_time}",
  "data": [
      {
        "action": "{action}",
        "mount_point": "{mount_point}",
        "status": "{status}",
        "reason": "{reason}"
      }
  ]
}
'''
# specify additional http headers for the file system watcher request if required, headers with same name will override in the default headers
[mount_point_watcher.headers]
user-agent = "clouddrive2/{version}/mount"
```

重启 cd2 生效

开启 webhook 监控，大媒体库（500T 以上）可以不开 cd2 永久缓存，可实时监控。
![](https://images.symedia.top/2025/04/08/20250408103609_8f2249ac.png)

## 归档教程

**新建一个刮削，这里以我为例，新建一个剧集刮削的规则**

![](https://images.symedia.top/2025/04/08/20250408103509_bc85af27.png)
**注意这里我们因为是配置剧集，所以电影待会配置，先配置剧集**
![](https://images.symedia.top/2025/04/08/20250408103545_f06f577b.png)

#### 剧集刮削配置

##### 剧集文件夹命名设置

**文件件的命名格式多元化，可以按自己需求来**

> > **举例**

- **片名+年份+tmdbid/季名**

- **三体 (2023) {tmdb-12345}/Season 1**

- **片名+年份/季名**

- **三体 (2023)/Season 1**

- **注意勾选启用剧集整理！！！！！**
  ![](https://images.symedia.top/2025/04/08/20250408103624_b7754dcf.png)
  **自定义**

命名格式大家可以选择第一栏标签，对应文件夹命名格式，预览可以看到配置结果
![](https://images.symedia.top/2025/04/08/20250408103555_d114a45c.png)

##### 剧集文件命名设置

> > 举例

- 完整信息

- 三体.2023.S01E01.第 1 集.1080p.x265-CMCT.mkv

- 简洁信息

- 三体 S01E01 - 1080p.mkv
  ![](https://images.symedia.top/2025/04/08/20250408103553_01560702.png)

##### 自定义

**同上方文件件命名一样，可自由搭配**
![](https://images.symedia.top/2025/04/08/20250408103643_c258789f.png)

### 电影刮削配置

![](https://images.symedia.top/2025/04/08/20250408103551_f04882a1.png)

#### 电影文件夹命名设置

> > 举例

- 片名+年份+tmdbid

- 流浪地球 (2019) {tmdb-535167}

- 片名+年份

- 流浪地球 (2019)

- 电影文件夹和文件也都支持自定义，以上剧集已经讲过了，这里就不再过多阐述
  ![](https://images.symedia.top/2025/04/08/20250408103640_655323ef.png)

#### 文件命名设置

> > 举例

- 完整信息

- 流浪地球 (2019) - 2160p.WEB-DL.BluRay Remux.HDR 10-bit.x265.TrueHD.7.1-CMCT.mkv

- 简洁信息

- 流浪地球 (2019) - 2160p.mkv
  ![](https://images.symedia.top/2025/04/08/20250408103646_65102dd5.png)
  总览（参考）
  我自己是刮削分类和不分类单独配置好了，仅做参考
  ![](https://images.symedia.top/2025/04/08/20250408103649_1a870da3.png)

### 二级分类

**根据自己是需求去选择分类类型**

**我自己用的是类型分类**
![](https://images.symedia.top/2025/04/08/20250408103631_ab8fdc6c.png)

#### 二级分类规则

我这套二级分类是只有这几个文件夹（大家可以按作者默认那套来自己细分）

> > 电影

- 华语电影

- 外语电影

- 动画电影

> > 剧集

- 国产剧

- 日韩剧

- 欧美剧

- 动漫

- 综艺

- 纪录片

```yaml
####### 配置说明 #######
# 1. 该配置文件用于配置电影和电视剧的分类策略，配置后程序会按照配置的分类策略名称进行分类，配置文件采用yaml格式，需要严格附合语法规则
# 2. 配置文件中的一级分类名称：`movie`、`tv` 为固定名称不可修改，二级名称同时也是目录名称，会按先后顺序匹配，匹配后程序会按这个名称建立二级目录
# 3. 支持的分类条件：
#   `original_language` 语种，具体含义参考下方字典
#   `production_countries` 国家或地区（电影）、`origin_country` 国家或地区（电视剧），具体含义参考下方字典
#   `genre_ids` 内容类型，具体含义参考下方字典
#   themoviedb 详情API返回的其它一级字段
# 4. 配置多项条件时需要同时满足，一个条件需要匹配多个值是使用`,`分隔

# 配置电影的分类策略
movie:
  # 分类名同时也是目录名
  动画电影:
    # 匹配 genre_ids 内容类型，16是动漫
    genre_ids: "16"
  华语电影:
    # 匹配语种
    original_language: "zh,cn,bo,za"
  # 未匹配以上条件时，分类为外语电影
  外语电影:
# 配置电视剧的分类策略
tv:
  # 分类名同时也是目录名
  动漫:
    # 匹配 genre_ids 内容类型，16是动漫
    genre_ids: "16"
  纪录片:
    # 匹配 genre_ids 内容类型，99是纪录片
    genre_ids: "99"
  综艺:
    # 匹配 genre_ids 内容类型，10764 10767都是综艺
    genre_ids: "10764,10767"
  国产剧:
    # 匹配 origin_country 国家，CN是中国大陆，TW是中国台湾，HK是中国香港
    origin_country: "CN,TW,HK"
  欧美剧:
    # 匹配 origin_country 国家，主要欧美国家列表
    origin_country: "US,FR,GB,DE,ES,IT,NL,PT,RU,UK"
  日韩剧:
    # 匹配 origin_country 国家，主要亚洲国家列表
    origin_country: "JP,KP,KR,TH,IN,SG"
  # 未匹配以上分类，则命名为未分类
  未分类:
## genre_ids 内容类型 字典，注意部分中英文是不一样的
#	28	Action
#	12	Adventure
#	16	Animation
#	35	Comedy
#	80	Crime
#	99	Documentary
#	18	Drama
#	10751	Family
#	14	Fantasy
#	36	History
#	27	Horror
#	10402	Music
#	9648	Mystery
#	10749	Romance
#	878  Science Fiction
#	10770	TV Movie
#	53	Thriller
#	10752	War
#	37	Western
#	28	动作
#	12	冒险
#	16	动画
#	35	喜剧
#	80	犯罪
#	99	纪录
#	18	剧情
#	10751	家庭
#	14	奇幻
#	36	历史
#	27	恐怖
#	10402	音乐
#	9648	悬疑
#	10749	爱情
#	878	科幻
#	10770	电视电影
#	53	惊悚
#	10752	战争
#	37	西部

## original_language 语种 字典
#	af	南非语
#	ar	阿拉伯语
#	az	阿塞拜疆语
#	be	比利时语
#	bg	保加利亚语
#	ca	加泰隆语
#	cs	捷克语
#	cy	威尔士语
#	da	丹麦语
#	de	德语
#	dv	第维埃语
#	el	希腊语
#	en	英语
#	eo	世界语
#	es	西班牙语
#	et	爱沙尼亚语
#	eu	巴士克语
#	fa	法斯语
#	fi	芬兰语
#	fo	法罗语
#	fr	法语
#	gl	加里西亚语
#	gu	古吉拉特语
#	he	希伯来语
#	hi	印地语
#	hr	克罗地亚语
#	hu	匈牙利语
#	hy	亚美尼亚语
#	id	印度尼西亚语
#	is	冰岛语
#	it	意大利语
#	ja	日语
#	ka	格鲁吉亚语
#	kk	哈萨克语
#	kn	卡纳拉语
#	ko	朝鲜语
#	kok	孔卡尼语
#	ky	吉尔吉斯语
#	lt	立陶宛语
#	lv	拉脱维亚语
#	mi	毛利语
#	mk	马其顿语
#	mn	蒙古语
#	mr	马拉地语
#	ms	马来语
#	mt	马耳他语
#	nb	挪威语(伯克梅尔)
#	nl	荷兰语
#	ns	北梭托语
#	pa	旁遮普语
#	pl	波兰语
#	pt	葡萄牙语
#	qu	克丘亚语
#	ro	罗马尼亚语
#	ru	俄语
#	sa	梵文
#	se	北萨摩斯语
#	sk	斯洛伐克语
#	sl	斯洛文尼亚语
#	sq	阿尔巴尼亚语
#	sv	瑞典语
#	sw	斯瓦希里语
#	syr	叙利亚语
#	ta	泰米尔语
#	te	泰卢固语
#	th	泰语
#	tl	塔加路语
#	tn	茨瓦纳语
#	tr	土耳其语
#	ts	宗加语
#	tt	鞑靼语
#	uk	乌克兰语
#	ur	乌都语
#	uz	乌兹别克语
#	vi	越南语
#	xh	班图语
#	zh	中文
#	cn	中文
#	zu	祖鲁语

## origin_country/production_countries 国家地区 字典
#	AR	阿根廷
#	AU	澳大利亚
#	BE	比利时
#	BR	巴西
#	CA	加拿大
#	CH	瑞士
#	CL	智利
#	CO	哥伦比亚
#	CZ	捷克
#	DE	德国
#	DK	丹麦
#	EG	埃及
#	ES	西班牙
#	FR	法国
#	GR	希腊
#	HK	香港
#	IL	以色列
#	IN	印度
#	IQ	伊拉克
#	IR	伊朗
#	IT	意大利
#	JP	日本
#	MM	缅甸
#	MO	澳门
#	MX	墨西哥
#	MY	马来西亚
#	NL	荷兰
#	NO	挪威
#	PH	菲律宾
#	PK	巴基斯坦
#	PL	波兰
#	RU	俄罗斯
#	SE	瑞典
#	SG	新加坡
#	TH	泰国
#	TR	土耳其
#	US	美国
#	VN	越南
#	CN	中国 内地
#	GB	英国
#	TW	中国台湾
#	NZ	新西兰
#	SA	沙特阿拉伯
#	LA	老挝
#	KP	朝鲜 北朝鲜
#	KR	韩国 南朝鲜
#	PT	葡萄牙
#	MN	蒙古国 蒙古
```

个人使用逻辑
我的逻辑是，把 115 转存到需要刮削的目录，让 Symedia 去刮削到二级目录，emby 再去读取，一劳永逸

选择自己配置的 115 账号，填写文件夹 id

格式：文件夹名:cid,多个文件夹用;隔开
![](https://images.symedia.top/2025/04/08/20250408103629_e2999254.png)
![](https://images.symedia.top/2025/04/08/20250408103513_6ba6cfb0.png)
归档前提告知！！
如果你不需要分类，只是刮削，那你在规则中关闭分类即可
![](https://images.symedia.top/2025/04/08/20250408103606_20f25b9d.png)
（开始配置归档任务）新建任务
归档目录选择我们需要用到刚刚创建的剧集
![](https://images.symedia.top/2025/04/08/20250408103548_a55321b3.png)
![](https://images.symedia.top/2025/04/08/20250408103618_c27a4a1c.png)
![](https://images.symedia.top/2025/04/08/20250408103529_87943639.png)
记得，CloudDrive2 需要转存文件夹缓存时间设为 20 秒
![](https://images.symedia.top/2025/04/08/20250408103615_36b701be.png)
我是剧集和电影单独分类
![](https://images.symedia.top/2025/04/08/20250408103511_18307dcb.png)
这里先执行一个分类刮削

可以看到，我放了一个电视剧
![](https://images.symedia.top/2025/04/08/20250408103608_efcac37a.png)
我配置了 webhook，直接检测到了
![](https://images.symedia.top/2025/04/08/20250408103503_f2f562f6.png)
不用一分钟，已经刮好了
![](https://images.symedia.top/2025/04/08/20250408103515_6e7d5763.png)
![](https://images.symedia.top/2025/04/08/20250408103536_71d169c3.png)
生成 strm 也很快，我的 emby 已经扫好了
![](https://images.symedia.top/2025/04/08/20250408103654_15d98859.png)
![](https://images.symedia.top/2025/04/08/20250408103510_1367a30c.png)
注意
如果大家不需要分类，只需要配置一个不分类的刮削规则即可，可以监控，也可以手动
![](https://images.symedia.top/2025/04/08/20250408103531_21e0614d.png)
![](https://images.symedia.top/2025/04/08/20250408103639_56004ef4.png)

## **TGBot 保姆级教程**

**1、打开 telegram，在顶部栏搜索 @BotFather**

**2、点击左下角菜单栏，点击最顶部 /newbot**
![](https://images.symedia.top/2025/04/08/20250408103518_534d03e6.png)
**3、输入 Symedia 通知 的名称或自己取名**
![](https://images.symedia.top/2025/04/08/20250408103547_e3500c31.png)
**4、给自己的机器人起一个独一无二的 ID,注意，以 bot 或\_bot 结尾**
![](https://images.symedia.top/2025/04/08/20250408103527_bd3ca248.png)
**5、保存图中的 API，一会儿要用到**

**6、获取自己的 ID，telegram 搜索 @getidsbot**

同理点击左下角菜单，或输入 /about ，等待机器人返回第一行 ID：XXXXXXX ，复制保存
![](https://images.symedia.top/2025/04/08/20250408103526_5c703ec3.png)
**7、配置 SA bot，开启 SA，左侧菜单栏打开设置 → 通知**
![](https://images.symedia.top/2025/04/08/20250408103621_868a7d9a.png)
**左侧第一行，填入刚刚从 @botfather 获取的 API，其他三个文本框，均输入@getidsbot 获取的 ID，将下面八个开关按需打开，再点击保存和测试，看看机器人是否给你发送通知，如下图**
![](https://images.symedia.top/2025/04/08/20250408103602_1d776050.png)

## FastEmby 配置指南

### 前期准备

- **注意需要留空一个 cookie 给 FastEmby 使用**

- **这里以我新建一个 emby 为例，路径需要注意把 strm 和网盘路径挂载上去**

- **需要注意的是**

- **Symedia 中的媒体目录与你 emby 挂载的目录需要一致，否则不能播放**

**这里的路径我指的是/volume1/docker/CloudNAS**
![](https://images.symedia.top/2025/04/08/20250408103541_20f8067f.png)
![](https://images.symedia.top/2025/04/08/20250408103613_206e005f.png)
![](https://images.symedia.top/2025/04/08/20250408103652_f576150e.png)
![](https://images.symedia.top/2025/04/08/20250408103556_c5c8c508.png)

### Docker Compose 部署

Docker Compose 配置文件

```yaml
version: "3.8"
services:
  FastEmby:
    image: shenxianmq/fastemby:latest # 使用最新镜像
    container_name: FastEmby # 容器名称
    environment:
      - TZ=Asia/Shanghai # 环境变量：容器时区
      - LICENSE_KEY=xxxxxx # 填入Symedia的授权码即可
    volumes:
      - /volume1/docker/FastEmby/config:/app/config # 配置文件夹映射
      - /volume1/docker/FastEmby/log:/app/log # 日志文件夹映射
    network_mode: host # 使用主机网络模式
    restart: always # 自动重启策略（可选）
```

![](https://images.symedia.top/2025/04/08/20250408103619_528eadd3.png)
![](https://images.symedia.top/2025/04/08/20250408103523_41dba581.png)
**手动配置**

- 启动完容器，在配置文件中 config.yaml，需要手动配置一下
  ![](https://images.symedia.top/2025/04/08/20250408103632_3f13eb8c.png)

**4 和 6 这两条要注意哈，比如我的是http://192.168.6.181:8096（端口后面没有/）**

**如果填的是你服务器 ip+emby 端口访问不，则需要修改成 docker 网关 ip**

**新版本大家 Emby 地址可填写内网 ip 和端口也能做到 302**
![](https://images.symedia.top/2025/04/08/20250408103600_6f3dc02e.png)

### FastEmby2.0-路径替换

#### 前期准备

**配置文件**
**配置文件在 config 路径中**

**首次需要在配置文件把 emby 内网地址，和密钥填进去才能正常访问**
![](https://images.symedia.top/2025/04/08/20250408103641_1a1a4034.png)
**访问 Web-UI**

**浏览器地址输入 ip+15895 端口访问**

- **默认用户名：admin**
- **默认密码：password**

![](https://images.symedia.top/2025/04/08/20250408103521_db5de455.png)

#### 日志

**日志在我们的最上方**
![](https://images.symedia.top/2025/04/08/20250408103617_9bca39f3.png)

#### Emby 服务器配置

**最开始已经在配置文件中添加了我们第一台 emby 的地址了**

**如需配置第二台，则需要在 2 地址中添加即可**
![](https://images.symedia.top/2025/04/08/20250408103623_49a2bd6a.png)

#### 路径配置

##### 傻瓜式路径配置

##### 115 版

**由于我是 cloud 格式，所以会比较长一点，远离都是一样的由于我是 cloud 格式，所以会比较长一点，远离都是一样的**
![](https://images.symedia.top/2025/04/08/20250408103627_5cb5b367.png)
![](https://images.symedia.top/2025/04/08/20250408103504_20dd2323.png)
![](https://images.symedia.top/2025/04/08/20250408103543_4abe0df8.png)

```yaml
Emby路径http://192.168.6.181:19798/static/http/192.168.6.181:19798/False/%2F115%2F%E7%A7%81%E4%BA%BA%E5%BD%B1%E9%99%A2%2F%E5%8D%8E%E8%AF%AD%E7%94%B5%E5%BD%B1%2F%E6%80%92%E7%81%AB%E5%8D%81%E4%BA%8C%E5%B0%8F%E6%97%B6%20%282024%29%2F%E6%80%92%E7%81%AB%E5%8D%81%E4%BA%8C%E5%B0%8F%E6%97%B6%20%282024%29%20-%202160p%20-%20WEB-DL.mkv
后台3030路径
http://192.168.6.181:3030/%E7%A7%81%E4%BA%BA%E5%BD%B1%E9%99%A2/%E5%8D%8E%E8%AF%AD%E7%94%B5%E5%BD%B1/%E6%80%92%E7%81%AB%E5%8D%81%E4%BA%8C%E5%B0%8F%E6%97%B6%20(2024)/%E6%80%92%E7%81%AB%E5%8D%81%E4%BA%8C%E5%B0%8F%E6%97%B6%20(2024)%20-%202160p%20-%20WEB-DL.mkv?pickcode=bafv4th41a6s28wyx
```

##### 123 版（其他 302 网盘同理）

![](https://images.symedia.top/2025/04/08/20250408103530_c22844b6.png)
![](https://images.symedia.top/2025/04/08/20250408103634_a220d4d6.png)
![](https://images.symedia.top/2025/04/08/20250408103514_223f913f.png)

```yaml
Emby路径http://192.168.6.181:19798/static/http/192.168.6.181:19798/False/%2F123%2F%E5%AA%92%E4%BD%93%E5%BA%93%2F%E5%9B%BD%E4%BA%A7%E5%89%A7%2F%E7%88%B1%E6%83%85%E5%85%AC%E5%AF%93%20%282009%29%2FSeason%201%2F%E7%88%B1%E6%83%85%E5%85%AC%E5%AF%93%20-%20S01E01%20-%20%E5%A9%9A%E7%A4%BC%E5%A4%A7%E4%B9%B1%E6%96%97.mp4

Alist地址http://192.168.6.181:5244/d/123/%E5%AA%92%E4%BD%93%E5%BA%93/%E5%9B%BD%E4%BA%A7%E5%89%A7/%E7%88%B1%E6%83%85%E5%85%AC%E5%AF%93%20(2009)/Season%201/%E7%88%B1%E6%83%85%E5%85%AC%E5%AF%93%20-%20S01E01%20-%20%E5%A9%9A%E7%A4%BC%E5%A4%A7%E4%B9%B1%E6%96%97.mp4
```

##### 专业路径映射

注意 strm 是什么格式

cloud 模式文件内是 http 开头的链接,local 模式文件内是文件的路径

前面是我 emby 的路径，后面则是跟我一样
![](https://images.symedia.top/2025/04/08/20250408103630_1aeae8ff.png)
![](https://images.symedia.top/2025/04/08/20250408103637_72574592.png)
其他配置
这里则可以修改我们的后台账号密码

以及 115 的 cookie 也可以在这里填写

注意最下面两个需要勾选

全部配置完，我们保存重启即可生效
![](https://images.symedia.top/2025/04/08/20250408103535_26fd9661.png)
另外，比方我们需要反代的第一个第二个 emby 端口，还是需要在配置文件中修改
![](https://images.symedia.top/2025/04/08/20250408103647_d0b25b1e.png)
测试播放
![](https://images.symedia.top/2025/04/08/20250408103635_c0c2da02.png)
![](https://images.symedia.top/2025/04/08/20250408103645_80fe8fd3.png)
如看完不会部署，可添加我的微信，有偿部署
