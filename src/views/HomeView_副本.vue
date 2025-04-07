<template>
  <div class="ui-home">
    <!-- Hero 部分 -->
    <div class="home-hero">
      <h1 class="hero-title">前端开源项目推荐</h1>
      <p class="hero-description">发现优质的前端开源项目，提升你的开发效率</p>
      <div class="hero-actions">
        <a class="action-button primary" href="/guide/getting-started">开始免费试用</a>
      </div>
      <p class="hero-note">只是一个展示平台，不提供任何资源，但可以连接开源社区。</p>
    </div>

    <!-- 核心功能介绍 -->
    <div class="home-intro">
      <h2 class="section-title">连接您开发环境的前端工具，完成项目自动化</h2>
      <p class="section-desc">我们精选了最优质的前端开源项目，让你的开发效率提升到新高度。</p>
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
          <h3>轻松发现优质项目</h3>
          <p>通过分类、标签和评分系统，快速找到符合你需求的开源项目。我们提供详细的项目介绍、使用说明和社区评价。</p>
        </div>
        <div class="showcase-image">
          <div class="image-placeholder"></div>
        </div>
      </div>

      <div class="showcase-row reverse">
        <div class="showcase-text">
          <h3>项目对比与分析</h3>
          <p>提供同类型项目的横向对比，包括性能数据、API设计、生态系统等多维度分析，帮助你做出最佳选择。</p>
        </div>
        <div class="showcase-image">
          <div class="image-placeholder"></div>
        </div>
      </div>
    </div>

    <!-- 试用区域 -->
    <div class="home-cta">
      <h2>立即加入免费体验</h2>
      <p>我们提供全面的前端开源项目推荐，助你提升开发效率</p>
      <a class="action-button primary" href="/signup">开始免费体验</a>
    </div>

    <!-- 评价部分 -->
    <div class="home-testimonials">
      <h2 class="section-title">深受开发者喜爱</h2>
      <div class="testimonials-container">
        <div class="testimonial-item" v-for="(review, index) in testimonials" :key="index">
          <p class="testimonial-content">{{ review.content }}</p>
          <div class="testimonial-author">
            <span class="author-name">{{ review.author }}</span>
            <span class="author-title">{{ review.title }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
const features = [
  {
    icon: 'i-carbon-chart-evaluation',
    title: '精选项目',
    details: '经过专业评估和社区反馈筛选的高质量前端开源项目'
  },
  {
    icon: 'i-carbon-code',
    title: '代码示例',
    details: '每个项目都附带详细的使用说明和实际应用示例'
  },
  {
    icon: 'i-carbon-catalog',
    title: '分类完善',
    details: '按照框架、工具、UI组件库等多维度分类，方便快速查找'
  }
]

const testimonials = [
  {
    content: '这个平台帮我找到了许多优质的前端工具，大大提高了我的开发效率，特别是那些隐藏的小众项目真是宝藏！',
    author: '前端小王子',
    title: '来自掘金社区'
  },
  {
    content: '作为一名初级前端开发者，这个平台让我快速了解各种主流框架和工具，对比分析功能尤其有用。',
    author: '代码青铜',
    title: '来自知乎'
  },
  {
    content: '项目的详细文档和实例代码让我节省了大量时间，不用再到处搜索使用方法，推荐给所有前端开发者！',
    author: '全栈老张',
    title: '来自CSDN博客'
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
    gap: 32px;
  }

  .feature-item {
    background-color: #fff;
    border-radius: 16px;
    padding: 32px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);

    &:hover {
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
      transform: translateY(-8px);
    }

    .feature-icon {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 64px;
      height: 64px;
      border-radius: 12px;
      background-color: rgba(62, 175, 124, 0.1);
      color: #3eaf7c;
      font-size: 28px;
      margin-bottom: 24px;
    }

    .feature-title {
      font-size: 22px;
      font-weight: 600;
      margin: 0 0 16px;
    }

    .feature-details {
      font-size: 16px;
      color: #666;
      line-height: 1.6;
      margin: 0;
    }
  }
}

.home-showcase {
  padding: 60px 0;

  .showcase-row {
    display: flex;
    align-items: center;
    margin-bottom: 80px;

    &.reverse {
      flex-direction: row-reverse;
    }

    .showcase-text {
      flex: 1;
      padding: 0 40px;

      h3 {
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 16px;
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
        height: 300px;
        background-color: #f5f5f5;
        border-radius: 12px;
      }
    }
  }
}

.home-cta {
  background-color: #f8f8f8;
  border-radius: 24px;
  padding: 60px 40px;
  text-align: center;
  margin: 60px 0;

  h2 {
    font-size: 32px;
    font-weight: 700;
    margin-bottom: 16px;
  }

  p {
    font-size: 18px;
    color: #666;
    margin-bottom: 32px;
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
  }
}

.home-testimonials {
  padding: 60px 0 100px;

  .testimonials-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 32px;
  }

  .testimonial-item {
    background-color: #fff;
    border-radius: 16px;
    padding: 32px;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);

    .testimonial-content {
      font-size: 16px;
      line-height: 1.6;
      color: #333;
      margin-bottom: 24px;
      font-style: italic;
    }

    .testimonial-author {
      display: flex;
      flex-direction: column;

      .author-name {
        font-weight: 600;
        font-size: 16px;
      }

      .author-title {
        font-size: 14px;
        color: #666;
      }
    }
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

  .home-showcase {
    .showcase-row {
      flex-direction: column;
      margin-bottom: 60px;

      &.reverse {
        flex-direction: column;
      }

      .showcase-text {
        padding: 0;
        margin-bottom: 30px;
      }
    }
  }
}
</style>