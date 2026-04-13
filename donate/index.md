# 支持 Symedia 发展

<h2 class="gradient-title">成为 Symedia 的支持者</h2>
<p class="subtitle">您的每一份支持都将帮助 Symedia 持续优化与创新，为影音爱好者提供更优质的服务体验</p>

<script setup>
import { computed, ref } from 'vue'

const showingBackupQrcode = ref(false)

const currentQrcodeSrc = computed(() =>
  showingBackupQrcode.value ? '/wechat-2.png' : '/wechat.png'
)

const currentQrcodeAlt = computed(() =>
  showingBackupQrcode.value ? '微信支付2' : '微信支付'
)

const currentQrcodeLabel = computed(() =>
  showingBackupQrcode.value ? '微信支付2' : '微信支付'
)

const toggleButtonText = computed(() =>
  showingBackupQrcode.value ? '切换回默认微信收款码' : '切换到备用微信收款码'
)

function toggleWechatQrcode() {
  showingBackupQrcode.value = !showingBackupQrcode.value
}
</script>

## 获取捐赠授权

<div class="donate-grid">
  <div class="donate-info">
    <div class="info-card blue-bg">
      <h3>💎 捐赠流程</h3>
      <ol>
        <li>扫描右侧二维码支付 <b class="highlight">179元</b></li>
        <li>付款时<b>备注您的邮箱地址</b></li>
        <li>作者会将授权码发送至您提供的邮箱</li>
        <li>若扫码支付显示无法支付，可过个10-20分钟支付，或换一个微信账号进行支付</li>
        <li>如两个收款码都无法支付，请Tg联系作者 @qianqiumq 购买</li>
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
    <div class="qrcode-switcher">
      <img :src="currentQrcodeSrc" :alt="currentQrcodeAlt" class="qrcode">
      <p class="qrcode-label">{{ currentQrcodeLabel }}</p>
      <button type="button" class="qrcode-toggle-btn" @click="toggleWechatQrcode">
        {{ toggleButtonText }}
      </button>
      <p class="qrcode-alert">若提示无法支付，请点击上方按钮切换到备用收款码</p>
    </div>

  </div>
</div>

## 友情提醒

<div class="warning-box">
  <h3>⚠️ 重要提示</h3>
  <p>授权码仅限支持同时在线1个容器，超出数量会导致授权被封禁！</p>
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

.qrcode-switcher {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 12px;
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

.qrcode-toggle-btn {
  border: none;
  border-radius: 999px;
  padding: 12px 22px;
  background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
  color: #fff;
  font-size: 15px;
  font-weight: bold;
  cursor: pointer;
  box-shadow: 0 8px 18px rgba(73, 110, 206, 0.25);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.qrcode-toggle-btn:hover {
  transform: translateY(-1px);
  box-shadow: 0 12px 24px rgba(73, 110, 206, 0.32);
}

.qrcode-alert {
  margin: 0;
  color: var(--warning-color);
  font-size: 16px;
  font-weight: 700;
  line-height: 1.6;
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
