<template>
  <div class="ui-home">
    <!-- Hero 部分 -->
    <div class="home-hero">
      <h1 class="hero-title">Symedia</h1>
      <p class="hero-description">Emby直链115神器，削刮、整理、重命名一站式解决方案</p>
      <div class="hero-actions">
        <a class="action-button primary" href="/guide/getting-started">立即开始</a>
        <a class="action-button secondary" href="/download">下载软件</a>
      </div>
      <p class="hero-note">只是一款自动化工具，不提供任何资源</p>
    </div>

    <!-- 核心功能介绍 -->
    <div class="home-intro">
      <h2 class="section-title">专为媒体爱好者打造的自动化工具</h2>
      <p class="section-desc">Symedia是一款功能强大的媒体管理工具，能够与115网盘、Emby无缝连接，实现媒体文件的自动化管理</p>
    </div>

    <!-- 特性部分 -->
    <div class="home-features">
      <div class="features-container">
        <div class="feature-item" v-for="(feature, index) in features" :key="index">
          <div class="feature-icon">
            <i :class="feature.icon"></i>
          </div>
          <h3 class="feature-title">{{ feature.title }}</h3>
          <p class="feature-details">{{ feature.details }}</p>
        </div>
      </div>
    </div>

    <!-- 功能展示 -->
    <div class="home-showcase">
      <div class="showcase-row">
        <div class="showcase-text">
          <h3>链接同步功能</h3>
          <p>支持多种同步方式：目录树同步（推荐）、星标同步、常规同步。可以从115网盘同步媒体文件，自动生成STRM文件或软链接，并支持云端与本地路径的灵活配置。</p>
        </div>
        <div class="showcase-image">
          <div class="image-placeholder"></div>
        </div>
      </div>

      <div class="showcase-row reverse">
        <div class="showcase-text">
          <h3>媒体归档系统</h3>
          <p>自动识别媒体文件名，提取年份、季数等信息，智能归档到指定目录。支持电影、剧集的分类管理，重命名后整齐有序，便于Emby等媒体库软件索引。</p>
        </div>
        <div class="showcase-image">
          <div class="image-placeholder"></div>
        </div>
      </div>

      <div class="showcase-row">
        <div class="showcase-text">
          <h3>Webhook监控</h3>
          <p>接入CloudDrive2的webhook功能，实时监控网盘文件变化，自动处理新增文件，无需手动操作即可完成同步。支持多种通知方式，让您随时了解媒体库更新情况。</p>
        </div>
        <div class="showcase-image">
          <div class="image-placeholder"></div>
        </div>
      </div>
    </div>

    <!-- 配合FastEmby使用 -->
    <div class="home-integration">
      <h2 class="section-title">与FastEmby完美配合</h2>
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
      <h2 class="section-title">用户真实评价</h2>
      <div class="testimonials-container">
        <div class="testimonial-item" v-for="(review, index) in testimonials" :key="index">
          <p class="testimonial-content">{{ review.content }}</p>
          <div class="testimonial-author">
            <span class="author-name">{{ review.author }}</span>
          </div>
        </div>
      </div>
    </div>

    <!-- 开始使用区域 -->
    <div class="home-cta">
      <h2>开始使用Symedia</h2>
      <p>只需简单几步配置，即可享受全自动的媒体管理体验</p>
      <div class="cta-buttons">
        <a class="action-button primary" href="/guide/installation">安装教程</a>
        <a class="action-button secondary" href="/guide/configuration">配置指南</a>
      </div>
    </div>
  </div>
</template>

<script setup>
const features = [
  {
    icon: 'i-carbon-data-share',
    title: '链接同步',
    details: '支持多种同步方式，从115网盘自动同步媒体文件，生成STRM或软链接'
  },
  {
    icon: 'i-carbon-folder-details',
    title: '媒体归档',
    details: '智能识别媒体信息，自动分类整理，重命名文件，生成完整元数据'
  },
  {
    icon: 'i-carbon-notification',
    title: 'Webhook监控',
    details: '实时监控网盘变化，自动处理新增文件，支持Telegram机器人通知'
  },
  {
    icon: 'i-carbon-cookie',
    title: '115 Cookie管理',
    details: '支持多账号管理，自动检测风控，内置扫码登录功能'
  },
  {
    icon: 'i-carbon-video',
    title: '媒体刮削',
    details: '自动获取影片封面、简介、演员等信息，生成完整NFO文件'
  },
  {
    icon: 'i-carbon-integration',
    title: 'FastEmby集成',
    details: '与FastEmby无缝集成，实现115网盘内容在Emby中的直接播放'
  }
]

const testimonials = [
  {
    content: '使用Symedia让我的媒体管理效率提高了十倍，再也不用手动整理文件了，自动刮削功能特别好用！',
    author: 'NAS爱好者小王'
  },
  {
    content: '与FastEmby配合使用，完美解决了我的115网盘媒体播放需求，界面简洁易用，配置也很简单。',
    author: '资深影音玩家'
  },
  {
    content: 'Webhook监控功能太赞了，新增文件自动同步，再也不用手动操作，Telegram通知也很方便。',
    author: '懒癌晚期患者'
  }
]
</script>

<style>
.ui-home {
  padding: 0 24px;
  margin: 0 auto;
  max-width: 1152px;
  color: #2c3e50;
}

.section-title {
  font-size: 32px;
  font-weight: 700;
  text-align: center;
  margin-bottom: 40px;
}

.home-hero {
  padding: 80px 0 60px;
  text-align: center;

  .hero-title {
    font-size: 48px;
    font-weight: 700;
    line-height: 1.2;
    margin: 0 0 24px;
    letter-spacing: -0.02em;
  }

  .hero-description {
    font-size: 24px;
    font-weight: 400;
    color: rgba(60, 60, 67, 0.78);
    margin: 0 0 40px;
    max-width: 640px;
    margin-left: auto;
    margin-right: auto;
  }

  .hero-note {
    font-size: 14px;
    color: #666;
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
        background-color: #3eaf7c;
        color: white;
        box-shadow: 0 4px 12px rgba(62, 175, 124, 0.3);

        &:hover {
          background-color: #369f6b;
          transform: translateY(-2px);
          box-shadow: 0 6px 16px rgba(62, 175, 124, 0.4);
        }
      }

      &.secondary {
        border: 1px solid #3eaf7c;
        color: #3eaf7c;

        &:hover {
          background-color: rgba(62, 175, 124, 0.1);
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
    color: #666;
    line-height: 1.6;
  }
}

.home-features {
  padding: 40px 0 80px;

  .features-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 24px;
  }

  .feature-item {
    background-color: #fff;
    border-radius: 16px;
    padding: 24px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.05);

    &:hover {
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
      transform: translateY(-5px);
    }

    .feature-icon {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 56px;
      height: 56px;
      border-radius: 12px;
      background-color: rgba(62, 175, 124, 0.1);
      color: #3eaf7c;
      font-size: 26px;
      margin-bottom: 20px;
    }

    .feature-title {
      font-size: 20px;
      font-weight: 600;
      margin: 0 0 12px;
    }

    .feature-details {
      font-size: 15px;
      color: #666;
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
        color: #3eaf7c;
      }

      p {
        font-size: 16px;
        line-height: 1.6;
        color: #666;
      }
    }

    .showcase-image {
      flex: 1;

      .image-placeholder {
        width: 100%;
        height: 280px;
        background-color: #f5f7fa;
        border-radius: 12px;
        border: 1px solid #eaecef;
      }
    }
  }
}

.home-integration {
  padding: 60px 0;
  background-color: #f8f9fa;
  border-radius: 16px;
  margin: 40px 0;

  .integration-content {
    display: flex;
    align-items: center;
    padding: 0 40px;

    .integration-text {
      flex: 1;

      p {
        font-size: 16px;
        line-height: 1.6;
        color: #666;
        margin-bottom: 20px;
      }
    }

    .integration-image {
      flex: 1;

      .image-placeholder {
        width: 100%;
        height: 280px;
        background-color: #f5f7fa;
        border-radius: 12px;
        border: 1px solid #eaecef;
      }
    }
  }

  .integration-list {
    padding-left: 20px;

    li {
      margin-bottom: 12px;
      color: #666;
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
    background-color: #fff;
    border-radius: 16px;
    padding: 24px;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.05);

    .testimonial-content {
      font-size: 15px;
      line-height: 1.6;
      color: #555;
      margin-bottom: 16px;
      font-style: italic;
    }

    .testimonial-author {
      display: flex;
      flex-direction: column;

      .author-name {
        font-weight: 600;
        font-size: 16px;
        color: #3eaf7c;
      }
    }
  }
}

.home-cta {
  background-color: #f8f9fa;
  border-radius: 16px;
  padding: 60px 40px;
  text-align: center;
  margin: 60px 0;

  h2 {
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 16px;
    color: #3eaf7c;
  }

  p {
    font-size: 18px;
    color: #666;
    margin-bottom: 32px;
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
  }

  .cta-buttons {
    display: flex;
    justify-content: center;
    gap: 16px;
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
</style>