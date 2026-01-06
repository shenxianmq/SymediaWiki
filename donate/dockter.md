# 支持 Dockter 发展

<h2 class="gradient-title">成为 Dockter 的支持者</h2>
<p class="subtitle">您的每一份支持都将帮助 Dockter 持续优化与创新，为 Docker 管理提供更强大的功能体验</p>

## 版本说明

<div class="version-grid">
  <div class="version-card">
    <div class="version-header basic-bg">
      <h3>基础版</h3>
      <div class="price">¥139</div>
    </div>
    <div class="version-content">
      <ul>
        <li><strong>Agent 数量：</strong>0 个</li>
        <li>本地 Docker 管理</li>
        <li>基础文件管理</li>
      </ul>
    </div>
  </div>

  <div class="version-card">
    <div class="version-header standard-bg">
      <h3>标准版</h3>
      <div class="price">¥169</div>
    </div>
    <div class="version-content">
      <ul>
        <li><strong>Agent 数量：</strong>5 个</li>
        <li>远程机器 Docker 管理</li>
        <li>文件管理功能</li>
        <li>SSH 命令执行</li>
      </ul>
    </div>
  </div>

  <div class="version-card">
    <div class="version-header advanced-bg">
      <h3>高级版</h3>
      <div class="price">¥219</div>
    </div>
    <div class="version-content">
      <ul>
        <li><strong>Agent 数量：</strong>10 个</li>
        <li>远程机器 Docker 管理</li>
        <li>文件管理功能</li>
        <li>SSH 命令执行</li>
      </ul>
    </div>
  </div>

  <div class="version-card">
    <div class="version-header pro-bg">
      <h3>专业版</h3>
      <div class="price">¥299</div>
    </div>
    <div class="version-content">
      <ul>
        <li><strong>Agent 数量：</strong>20 个</li>
        <li>远程机器 Docker 管理</li>
        <li>文件管理功能</li>
        <li>SSH 命令执行</li>
      </ul>
    </div>
  </div>
</div>

<div class="agent-info">
  <h3>🤖 什么是 Agent？</h3>
  <p>Agent 允许您添加并控制其他机器，通过 Agent 您可以：</p>
  <ul>
    <li>远程操作其他机器的 Docker 容器</li>
    <li>进行远程文件管理</li>
    <li>执行 SSH 命令</li>
  </ul>
</div>

## 获取捐赠授权

<div class="donate-grid">
  <div class="donate-info">
    <div class="info-card blue-bg">
      <h3>💎 捐赠流程</h3>
      <ol>
        <li>选择您需要的版本（基础版/标准版/高级版/专业版）</li>
        <li>扫描右侧二维码支付对应金额</li>
        <li>付款时<b>备注您的邮箱地址和版本</b></li>
        <li>作者会将授权码发送至您提供的邮箱</li>
      </ol>
      <p class="tip">提示：若邮箱过长备注不全，可在付款后使用顾客留言功能</p>
    </div>
    
    <div class="info-card purple-bg">
      <h3>📞 联系方式</h3>
      <p>Tg: <a href="https://t.me/qianqiumq" class="link">@qianqiumq</a></p>
      <p>有任何问题欢迎通过 Tg 联系作者</p>
    </div>
  </div>

  <div class="qrcode-container">
    <img src="/wechat.png" alt="微信支付" class="qrcode">
    <p class="qrcode-label">微信支付</p>
  </div>
</div>

## 友情提醒

<div class="warning-box">
  <h3>⚠️ 重要提示</h3>
  <p>授权码仅限本人使用，在多设备上使用同一授权码可能导致授权被封禁！</p>
</div>

## 免责声明

<div class="disclaimer-box">
  <p>本软件仅用于合法用途，用户不得利用本软件从事违法违规行为，因用户违法使用所产生的一切后果均由用户自行承担。</p>
</div>

<style>
:root {
  --primary-color: #496ECE;
  --secondary-color: #8965e0;
  --warning-color: #ff3b30;
  --text-color: #333;
  --light-text: #666;
  --basic-color: #4a90e2;
  --standard-color: #50c878;
  --advanced-color: #ff6b6b;
  --pro-color: #9b59b6;
}

.center {
  text-align: center;
  margin-bottom: 30px;
}

.gradient-title {
  background-image: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  font-size: 28px;
  padding: 10px 0;
}

.subtitle {
  color: var(--light-text);
  font-size: 16px;
  max-width: 700px;
  margin: 0 auto 20px;
}

.version-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  margin: 30px 0;
}

.version-card {
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.version-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
}

.version-header {
  padding: 20px;
  text-align: center;
  color: white;
}

.basic-bg {
  background: linear-gradient(135deg, var(--basic-color) 0%, #357abd 100%);
}

.standard-bg {
  background: linear-gradient(135deg, var(--standard-color) 0%, #3fa866 100%);
}

.advanced-bg {
  background: linear-gradient(135deg, var(--advanced-color) 0%, #e55555 100%);
}

.pro-bg {
  background: linear-gradient(135deg, var(--pro-color) 0%, #7d3c98 100%);
}

.version-header h3 {
  margin: 0 0 10px 0;
  font-size: 24px;
}

.price {
  font-size: 32px;
  font-weight: bold;
}

.version-content {
  padding: 20px;
  background: white;
}

.version-content ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.version-content li {
  padding: 8px 0;
  border-bottom: 1px solid #f0f0f0;
}

.version-content li:last-child {
  border-bottom: none;
}

.agent-info {
  background: rgba(73, 110, 206, 0.1);
  padding: 20px;
  border-radius: 10px;
  margin: 30px 0;
}

.agent-info h3 {
  margin-top: 0;
  color: var(--primary-color);
}

.agent-info ul {
  padding-left: 20px;
}

.agent-info li {
  margin: 8px 0;
}

.donate-grid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 30px;
  margin: 30px 0;
}

.donate-info {
  flex: 1;
  min-width: 300px;
}

.info-card {
  padding: 20px;
  border-radius: 10px;
  margin-bottom: 20px;
}

.blue-bg {
  background: rgba(73, 110, 206, 0.1);
}

.purple-bg {
  background: rgba(137, 101, 224, 0.1);
}

.info-card h3 {
  margin-top: 0;
  color: var(--primary-color);
}

.purple-bg h3 {
  color: var(--secondary-color);
}

.info-card ol {
  padding-left: 20px;
}

.highlight {
  color: var(--primary-color);
}

.tip {
  font-size: 14px;
  color: var(--light-text);
}

.link {
  color: var(--primary-color);
  text-decoration: none;
}

.qrcode-container {
  flex: 1;
  min-width: 300px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.qrcode {
  max-width: 330px;
  border-radius: 10px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.qrcode-label {
  margin-top: 10px;
  font-weight: bold;
  color: var(--primary-color);
}

.warning-box {
  background: rgba(255, 59, 48, 0.1);
  border-left: 4px solid var(--warning-color);
  padding: 15px;
  border-radius: 4px;
  margin-top: 30px;
}

.warning-box h3 {
  margin-top: 0;
  color: var(--warning-color);
}

.disclaimer-box {
  background: rgba(73, 110, 206, 0.05);
  border-left: 4px solid var(--primary-color);
  padding: 15px;
  border-radius: 4px;
  margin-top: 30px;
  text-align: center;
}

.disclaimer-box p {
  margin: 0;
  color: var(--light-text);
  font-size: 14px;
  line-height: 1.6;
}
</style>
