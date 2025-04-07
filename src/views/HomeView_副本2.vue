<template>
  <div class="ui-home">
    <!-- Hero 部分 -->
    <div class="home-hero">
      <div class="hero-banner-container">
        <img :src="isMobile ? bannerMobile : banner" alt="banner" class="hero-banner">
        <div class="hero-content">
          <h1 class="hero-title">Symedia</h1>
          <div class="hero-subtitle">智能云端媒体库管家</div>
          <p class="hero-slogan">网盘用户的终极解决方案</p>
        </div>
      </div>
      <div class="hero-actions" style="margin-top: 20px;">
        <a class="action-button primary" href="/guide/getting-started">立即开始</a>
        <a class="action-button secondary" href="/download">下载软件</a>
      </div>
      <p class="hero-note">只是一款自动化工具，不提供任何资源</p>
    </div>

    <div class="ui-main">
      <!-- 核心功能介绍 -->
      <div class="home-intro">
        <h2 class="section-title" data-text="专为媒体爱好者打造的自动化工具">专为媒体爱好者打造的自动化工具</h2>
        <p class="section-desc">Symedia是一款功能强大的媒体管理工具，支持115网盘、123网盘、阿里云盘、天翼云盘等主流网盘，Emby无缝连接，实现媒体文件的自动化管理</p>
      </div>

      <!-- 特性部分 -->
      <div class="home-features">
        <div class="features-container">
          <div class="feature-item" v-for="(feature, index) in features" :key="index">
            <div class="feature-icon">
              <img :src="feature.icon" alt="feature icon">
            </div>
            <h3 class="feature-title">{{ feature.title }}</h3>
            <p class="feature-details">{{ feature.details }}</p>
          </div>
        </div>
      </div>

      <!-- 功能展示 -->
      <div class="home-showcase">
        <div class="showcase-row" v-for="(item, index) in showcases" :key="index" :class="{ reverse: index % 2 === 1 }">
          <div class="showcase-text">
            <h3>{{ item.title }}</h3>
            <p v-html="item.content"></p>
          </div>
          <div class="showcase-image">
            <img v-if="item.image" :src="item.image" alt="功能展示" class="showcase-img">
            <div v-else class="image-placeholder"></div>
          </div>
        </div>
      </div>

      <!-- 配合FastEmby使用 -->
      <div class="home-integration">
        <h2 class="section-title" data-text="与FastEmby完美配合">与FastEmby完美配合</h2>
        <div class="integration-content">
          <div class="integration-text">
            <p>Symedia可与FastEmby无缝配合，实现媒体文件的一站式管理和播放解决方案：</p>
            <ul class="integration-list">
              <li>自动302重定向，让Emby直接播放115网盘内容</li>
              <li>支持傻瓜式路径配置，轻松设置网盘与本地路径映射</li>
              <li>支持多种网盘接入，包括115、123等</li>
              <li>内置自动刮削功能，生成完整媒体元数据</li>
            </ul>
          </div>
          <div class="integration-image">
            <div class="image-placeholder"></div>
          </div>
        </div>
      </div>

      <!-- 用户评价 -->
      <div class="home-testimonials">
        <h2 class="section-title" data-text="用户真实评价">用户真实评价</h2>
        <div class="testimonials-container">
          <div class="testimonial-item" v-for="(review, index) in testimonials" :key="index">
            <p class="testimonial-content">{{ review.content }}</p>
            <div class="testimonial-author">
              <span class="author-name">{{ review.author }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 开始使用区域 -->
    <div class="home-cta">
      <h2>开始使用Symedia</h2>
      <p>只需简单几步配置，即可享受全自动的媒体管理体验</p>
      <div class="cta-buttons">
        <a class="action-button primary enhanced" href="/guide/getting-started">快速开始</a>
      </div>
    </div>

    <!-- 版权信息 -->
    <footer class="home-footer">
      <div class="copyright">
        Copyright © 2024-2025 Shenxian
      </div>
    </footer>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const banner = new URL('../../public/assets/banner.jpg', import.meta.url).href
const bannerMobile = new URL('../../public/assets/banner-mobile.png', import.meta.url).href

const features = [
  {
    icon: new URL('../../public/assets/icons/symlink.png', import.meta.url).href,
    title: '链接同步',
    details: '支持多种同步方式，从115网盘自动同步媒体文件，生成STRM或软链接'
  },
  {
    icon: new URL('../../public/assets/icons/archive.png', import.meta.url).href,
    title: '媒体归档',
    details: '智能识别媒体信息，自动分类整理，重命名文件，生成完整元数据'
  },
  {
    icon: new URL('../../public/assets/icons/webhook.png', import.meta.url).href,
    title: 'Webhook监控',
    details: '实时监控网盘变化，自动处理新增文件，支持多种通知工具'
  },
  {
    icon: new URL('../../public/assets/icons/clouddrive.png', import.meta.url).href,
    title: '多网盘支持',
    details: '支持115，123，阿里云盘，天翼云盘，夸克网盘等主流网盘'
  },
  {
    icon: new URL('../../public/assets/icons/plugin.png', import.meta.url).href,
    title: '插件支持',
    details: '内置多种插件，为日常观影提供更多便利'
  },
  {
    icon: new URL('../../public/assets/icons/search.png', import.meta.url).href,
    title: '聚合搜索',
    details: '多网盘聚合搜索，寻找资源更方便'
  }
]

const showcases = [
  {
    title: '智能链路同步引擎',
    content: '1.云端资源本地化加速<br>&nbsp&nbsp&nbsp·采用STRM/软链接技术实现媒体库映射，扫描效率提升300%<br>&nbsp&nbsp&nbsp·专为115网盘深度优化的快速同步方案<br><br>2.多维实时同步系统<br>&nbsp&nbsp&nbsp·三模监控架构：Webhook即时推送(CloudDrive2深度整合)、事件驱动响应、智能轮询机制<br>&nbsp&nbsp&nbsp百TB级媒体库秒级响应，突破传统索引技术限制',
    image: new URL('../../public/assets/images/showcase_1.jpg', import.meta.url).href
  },
  {
    title: 'AI增强型媒体处理中枢',
    content: '1.智能媒体资产管理系统<br>&nbsp&nbsp&nbsp·TMDB智能匹配引擎：97.6%精准识别率，支持模糊匹配校正<br>&nbsp&nbsp&nbsp·ChatGPT增强识别插件：归档辅助识别，当内置模块无法识别媒体信息时，启用自动识别，可添加多种AI模型<br>&nbsp&nbsp&nbsp·多维度归档策略：三级目录架构+影视元数据标准化命名体系<br>&nbsp&nbsp&nbsp·动态刮削矩阵：自动生成标准nfo元数据文件及多分辨率海报墙<br><br>2.流式处理工作流<br>&nbsp&nbsp&nbsp·热文件夹监控技术：触发式自动处理机制<br>&nbsp&nbsp&nbsp·与链路同步模块深度耦合，实现"处理-链接"双流并行<br>&nbsp&nbsp&nbsp·增量处理技术确保TB级媒体库更新秒级响应',
    image: new URL('../../public/assets/images/showcase_2.jpg', import.meta.url).href
  },
  {
    title: '自动化媒体管理流程',
    content: '构建智能媒体处理流水线<br>&nbsp&nbsp&nbsp·影视频道订阅/自带聚合搜索转存Bot智能抓取云端转存<br>&nbsp&nbsp&nbsp·触发Symedia处理链 => 云端归档 => AI刮削 => 动态链接生成 => Emby同步<br>&nbsp&nbsp&nbsp·端到端处理时延 < 5分钟(视文件规模)<br>&nbsp&nbsp&nbsp从资源获取到观影享受全流程自动化实现用户只需：发现资源→转发链接→享受观影',
    image: new URL('../../public/assets/images/showcase_3.jpg', import.meta.url).href
  },
  {
    title: '响应式布局：让设计适应每一个屏幕',
    content: '&nbsp&nbsp&nbsp·让网页能够智能识别设备屏幕尺寸，自动调整内容排版、图片大小及功能交互<br>&nbsp&nbsp&nbsp·内容始终清晰可读，操作触手可及，移动端添加快捷方式到桌面，实现APP级交互体验',
    image: new URL('../../public/assets/images/showcase_4.jpg', import.meta.url).href
  }
]
const testimonials = [
  {
    content: '使用Symedia让我的媒体管理效率提高了十倍，再也不用手动整理文件了，自动刮削功能特别好用！',
    author: 'NAS爱好者老杨'
  },
  {
    content: '与FastEmby配合使用，完美解决了我的115网盘媒体播放需求，界面简洁易用，配置也很简单。',
    author: '资深影音玩家老魏'
  },
  {
    content: 'Webhook监控功能太赞了，新增文件自动同步，再也不用手动操作，Telegram通知也很方便。',
    author: '建库狂人老文'
  },
  {
    content: '我每次去找我的小姐妹的时候，在包间里都可以一起愉快的观影了。',
    author: '洗浴专家泰迪熊'
  }
]


const isMobile = ref(false)

const checkIsMobile = () => {
  isMobile.value = window.innerWidth < 768
}

onMounted(() => {
  checkIsMobile()
  window.addEventListener('resize', checkIsMobile)
})
</script>

<style>
.ui-main {
  padding: 0 24px;
  margin: 0 auto;
  max-width: 1152px;
  color: var(--vp-c-text-1);
}

.section-title {
  font-size: 32px;
  font-weight: 700;
  text-align: center;
  margin: 0 0 40px 0;
  padding: 10px 0;
  color: transparent;
  background-image: var(--sy-gradient-cyan-blue);
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  line-height: 1.5;
}

.home-hero {
  padding: 0px 0 60px;
  text-align: center;

  .hero-title {
    font-size: 48px;
    font-weight: 800;
    line-height: 1.2;
    margin: 0 0 24px;
    letter-spacing: -0.02em;
    background-image: var(--sy-gradient-cyan-blue);
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    color: transparent;
    display: inline-block;
  }

  .hero-description {
    font-size: 24px;
    font-weight: 400;
    color: var(--vp-c-text-2);
    margin: 0 0 40px;
    max-width: 640px;
    margin-left: auto;
    margin-right: auto;
  }

  .hero-note {
    font-size: 14px;
    color: var(--vp-c-text-3);
    margin-top: 24px;
  }

  .hero-actions {
    display: flex;
    justify-content: center;
    gap: 16px;

    .action-button {
      display: inline-block;
      border-radius: 28px;
      padding: 14px 32px;
      font-size: 18px;
      font-weight: 500;
      transition: all 0.3s ease;

      &.primary {
        background: var(--sy-gradient-blue-cyan);
        color: white;
        box-shadow: 0 4px 12px var(--sy-primary-shadow-light);

        &:hover {
          transform: translateY(-2px);
          box-shadow: 0 6px 16px var(--sy-primary-shadow-dark);
        }
      }

      &.secondary {
        border: 1px solid var(--sy-primary-color);
        color: var(--sy-primary-color);

        &:hover {
          background-color: var(--sy-primary-color-light);
        }
      }
    }
  }
}

.home-intro {
  text-align: center;
  padding: 40px 0;
  max-width: 800px;
  margin: 0 auto;

  .section-desc {
    font-size: 18px;
    color: var(--vp-c-text-2);
    line-height: 1.6;
  }
}

/* 特别长的标题需要更大的空间 */
.home-intro .section-title {
  padding: 10px 16px;
  max-width: 100%;
  word-break: keep-all;
  white-space: nowrap;
}

.home-features {
  padding: 40px 0 80px;

  .features-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 24px;
  }

  .feature-item {
    /* background-color: var(--vp-c-bg-soft); */
    border: 2px solid var(--vp-c-divider);
    border-radius: 16px;
    padding: 24px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 16px var(--vp-c-shadow-1);
    position: relative;
    overflow: hidden;

    &::before {
      content: none;
    }

    &:hover {
      box-shadow: 0 8px 24px var(--vp-c-shadow-2);
      transform: translateY(-5px);
    }

    .feature-icon {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 56px;
      height: 56px;
      border-radius: 12px;
      margin-bottom: 20px;

      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
        border-radius: 12px;
      }
    }

    .feature-title {
      font-size: 20px;
      font-weight: 600;
      margin: 0 0 12px;
    }

    .feature-details {
      font-size: 15px;
      color: var(--vp-c-text-2);
      line-height: 1.6;
      margin: 0;
    }
  }
}

.home-showcase {
  padding: 40px 0;

  .showcase-row {
    display: flex;
    align-items: center;
    margin-bottom: 60px;

    &.reverse {
      flex-direction: row-reverse;
    }

    .showcase-text {
      flex: 1;
      padding: 0 40px;

      h3 {
        font-size: 24px;
        font-weight: 600;
        margin-bottom: 16px;
        color: transparent;
        background-image: var(--sy-gradient-cyan-blue);
        -webkit-background-clip: text;
        background-clip: text;
        -webkit-text-fill-color: transparent;
        padding: 5px 0;
        line-height: 1.4;
      }

      p {
        font-size: 16px;
        line-height: 1.6;
        color: var(--vp-c-text-2);
      }
    }

    .showcase-image {
      flex: 1;

      .image-placeholder {
        width: 100%;
        height: 280px;
        background-color: var(--vp-c-bg-soft);
        border-radius: 12px;
        border: 1px solid var(--vp-c-divider);
      }

      .showcase-img {
        width: 100%;
        border-radius: 16px;
        box-shadow: 0 4px 12px var(--vp-c-shadow-1);
        transition: all 0.3s ease;

        &:hover {
          transform: translateY(-5px);
          box-shadow: 0 8px 24px var(--vp-c-shadow-2);
        }
      }
    }
  }
}

.home-integration {
  padding: 60px 0;
  background: var(--vp-c-bg-soft);
  border-radius: 16px;
  margin: 40px 0;
  position: relative;
  overflow: hidden;

  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 6px;
    background: var(--sy-gradient-blue-purple);
  }

  .integration-content {
    display: flex;
    align-items: center;
    padding: 0 40px;

    .integration-text {
      flex: 1;

      p {
        font-size: 16px;
        line-height: 1.6;
        color: var(--vp-c-text-2);
        margin-bottom: 20px;
      }
    }

    .integration-image {
      flex: 1;

      .image-placeholder {
        width: 100%;
        height: 280px;
        background-color: var(--vp-c-bg-mute);
        border-radius: 12px;
        border: 1px solid var(--vp-c-divider);
      }
    }
  }

  .integration-list {
    padding-left: 20px;

    li {
      margin-bottom: 12px;
      color: var(--vp-c-text-2);
      font-size: 16px;
      line-height: 1.6;
    }
  }
}

.home-testimonials {
  padding: 60px 0;

  .testimonials-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 24px;
  }

  .testimonial-item {
    background-color: var(--vp-c-bg-soft);
    border-radius: 16px;
    padding: 24px;
    box-shadow: 0 4px 16px var(--vp-c-shadow-1);
    position: relative;
    overflow: hidden;

    &:nth-child(3n+1)::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 4px;
      height: 100%;
      background: var(--sy-gradient-primary);
    }

    &:nth-child(3n+2)::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 4px;
      height: 100%;
      background: var(--sy-gradient-blue-purple);
    }

    &:nth-child(3n+3)::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 4px;
      height: 100%;
      background: var(--sy-gradient-blue-cyan);
    }

    &:nth-child(4n)::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 4px;
      height: 100%;
      background: var(--sy-gradient-hot);
    }

    .testimonial-content {
      font-size: 15px;
      line-height: 1.6;
      color: var(--vp-c-text-2);
      margin-bottom: 16px;
      font-style: italic;
    }

    .testimonial-author {
      display: flex;
      flex-direction: column;

      .author-name {
        font-weight: 600;
        font-size: 16px;
        color: transparent;
        background-image: var(--sy-gradient-cyan-blue);
        -webkit-background-clip: text;
        background-clip: text;
        -webkit-text-fill-color: transparent;
        padding: 3px 0;
      }
    }
  }
}

.home-cta {
  background: var(--sy-gradient-blue-purple);
  border-radius: 16px;
  padding: 60px 40px;
  text-align: center;
  position: relative;
  overflow: hidden;

  h2 {
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 16px;
    color: white;
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
  }

  p {
    font-size: 18px;
    color: rgba(255, 255, 255, 0.9);
    margin-bottom: 32px;
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
  }

  .cta-buttons {
    display: flex;
    justify-content: center;
    gap: 16px;

    .action-button {
      &.primary {
        border-color: white;
        color: white;
      }

      &.secondary {
        border-color: white;
        color: white;

        &:hover {
          background-color: rgba(255, 255, 255, 0.1);
        }
      }
    }
  }
}

.home-cta .action-button.enhanced {
  background: linear-gradient(45deg, #2196f3, #00bcd4, #4caf50);
  background-size: 200% 200%;
  color: white;
  font-size: 20px;
  padding: 16px 42px;
  border-radius: 30px;
  border: none;
  box-shadow: 0 8px 24px rgba(33, 150, 243, 0.3);
  transition: all 0.5s ease;
  animation: gradientShift 3s ease infinite;
}

.home-cta .action-button.enhanced:hover {
  box-shadow: 0 12px 28px rgba(33, 150, 243, 0.5);
  transform: translateY(-5px);
}

@keyframes gradientShift {
  0% {
    background-position: 0% 50%
  }

  50% {
    background-position: 100% 50%
  }

  100% {
    background-position: 0% 50%
  }
}

@media (max-width: 768px) {
  .home-hero {
    padding: 60px 0 40px;

    .hero-title {
      font-size: 36px;
    }

    .hero-description {
      font-size: 18px;
    }
  }

  .section-title {
    font-size: 28px;
  }

  .home-showcase .showcase-row,
  .home-showcase .showcase-row.reverse,
  .home-integration .integration-content {
    flex-direction: column;

    .showcase-text,
    .integration-text {
      padding: 0;
      margin-bottom: 30px;
    }
  }

  .home-cta {
    padding: 40px 20px;

    .cta-buttons {
      flex-direction: column;
      align-items: center;
      gap: 16px;

      .action-button {
        width: 100%;
        max-width: 300px;
      }
    }
  }
}

.hero-banner-container {
  position: relative;
  width: 100%;
  height: 600px;
  overflow: hidden;
}

.hero-banner {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.hero-content {
  position: absolute;
  top: 40%;
  left: 15%;
  transform: translateY(-50%);
  text-align: left;
  z-index: 2;
  width: 50%;
  padding: 0 20px;
}

.hero-title {
  font-size: 48px;
  margin-bottom: 5px !important;
  background-image: var(--sy-gradient-cyan-blue);
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  color: transparent;
}

.hero-subtitle {
  font-size: 36px;
  line-height: 1.4;
  margin-top: 10px;
  margin-bottom: 0px !important;
  font-weight: 900;
  background-image: var(--sy-gradient-cyan-blue);
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  color: transparent;
}

.hero-slogan {
  font-size: 24px;
  margin-top: 0px;
  color: white;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
}

@media (max-width: 768px) {
  .hero-content {
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    width: 100%;
  }

  .hero-banner {
    content: v-bind(bannerMobile);
  }
}

.home-footer {
  text-align: center;
  padding: 30px 0;
  border-top: 1px solid var(--vp-c-divider);
}

.copyright {
  font-size: 14px;
  color: var(--vp-c-text-3);
}
</style>