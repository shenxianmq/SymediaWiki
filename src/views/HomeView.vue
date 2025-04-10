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
        <a class="action-button primary" href="/archive/symedia/symedia部署教程">立即开始</a>
        <a class="action-button secondary" href="/donate">下载软件</a>
      </div>
      <p class="hero-note">只是一款自动化工具，不提供任何资源</p>
    </div>

    <div class="ui-padding">
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
    </div>

    <!-- 功能展示 -->
    <div class="home-showcase-container">
      <div class="home-showcase">
        <div v-for="(item, index) in showcases" :key="index" class="showcase-section" :id="`showcase-${index}`">
          <div class="showcase-row" :class="{ reverse: index % 2 === 1 }">
            <div class="showcase-text">
              <h3>{{ item.title }}</h3>
              <div v-for="(section, sectionIndex) in item.content" :key="sectionIndex" class="content-section">
                <div class="content-subtitle">
                  <template v-if="item.content.length > 1">{{ sectionIndex + 1 }}. </template>{{ section.subtitle }}
                </div>
                <ul class="content-points">
                  <li v-for="(point, pointIndex) in section.points" :key="pointIndex">{{ point }}</li>
                </ul>
              </div>
            </div>
            <div class="showcase-image">
              <img v-if="item.image" :src="item.image" alt="功能展示" class="showcase-img">
              <video v-else-if="item.video" class="showcase-video" controls preload="metadata">
                <source :src="item.video" type="video/mp4">
                您的浏览器不支持视频播放，请升级或更换浏览器
              </video>
              <div v-if="item.video" class="copyright-disclaimer">
                <p>版权免责声明：此演示视频仅用于功能展示，所有媒体内容的版权归原作者所有。Symedia与FastEmby仅为技术工具，不提供、存储任何版权内容，不对用户使用行为负责。</p>
              </div>
              <div v-if="!item.image && !item.video" class="image-placeholder"></div>
            </div>
          </div>
        </div>
      </div>
      <!-- 将导航点移到这里，位于showcase外部 -->
      <div class="showcase-nav">
        <div class="showcase-dots">
          <span v-for="(_, dotIndex) in showcases" :key="dotIndex" :class="{ active: dotIndex === currentShowcase }"
            @click="scrollToShowcase(dotIndex)"></span>
        </div>
      </div>
    </div>

    <div class="ui-padding">
      <!-- 配合FastEmby使用 -->
      <div class="home-integration">
        <h2 class="section-title" data-text="与FastEmby完美配合">与FastEmby完美配合</h2>
        <div class="integration-content">
          <div class="integration-text">
            <p>Symedia可与FastEmby无缝配合</p>
            <p>实现媒体文件的一站式管理和播放解决方案：</p>
            <ul class="integration-list">
              <li>自动302重定向，让Emby直接播放网盘内容</li>
              <li>支持傻瓜式路径配置，轻松设置网盘与本地路径映射</li>
              <li>支持多种网盘接入，包括115、阿里云盘、夸克网盘等主流网盘</li>
            </ul>
          </div>
          <div class="integration-image">
            <img :src="fastembyImage" alt="功能展示" class="showcase-img">
          </div>
        </div>
        <!-- <div class="integration-image">
          <video class="fastemby-video" controls preload="metadata">
            <source :src="fastembyVideo" type="video/mp4">
            您的浏览器不支持视频播放，请升级或更换浏览器
          </video>
          <div class="copyright-disclaimer">
            <p>版权免责声明：此演示视频仅用于功能展示，所有媒体内容的版权归原作者所有。Symedia与FastEmby仅为技术工具，不提供、存储任何版权内容，不对用户使用行为负责。</p>
          </div>
        </div>
      </div> -->
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
        <a class="action-button primary enhanced" href="/archive/symedia/symedia部署教程">快速开始</a>
      </div>
    </div>
  </div>
  <!-- 版权信息 -->
  <footer class="home-footer">
    <div class="copyright">
      Copyright © 2024-2025 Shenxian
    </div>
  </footer>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const banner = '/assets/banner.jpg'
const bannerMobile = '/assets/banner-mobile.png'
const fastembyVideo = '/videos/fastemby演示.mp4'
const fastembyImage = '/assets/images/fastemby演示.png'
const features = [
  {
    icon: '/assets/icons/symlink.png',
    title: '链接同步',
    details: '支持多种同步方式，从115网盘自动同步媒体文件，生成STRM或软链接'
  },
  {
    icon: '/assets/icons/archive.png',
    title: '媒体归档',
    details: '智能识别媒体信息，自动分类整理，重命名文件，生成完整元数据'
  },
  {
    icon: '/assets/icons/webhook.png',
    title: 'Webhook监控',
    details: '实时监控网盘变化，自动处理新增文件，支持多种通知工具'
  },
  {
    icon: '/assets/icons/clouddrive.png',
    title: '多网盘支持',
    details: '支持115，123，阿里云盘，天翼云盘，夸克网盘等主流网盘'
  },
  {
    icon: '/assets/icons/plugin.png',
    title: '插件支持',
    details: '内置多种插件，为日常观影提供更多便利'
  },
  {
    icon: '/assets/icons/search.png',
    title: '聚合搜索',
    details: '多网盘聚合搜索，寻找资源更方便'
  }
]

const showcases = [
  {
    title: '智能链路同步引擎',
    content: [
      {
        subtitle: '云端资源本地化加速',
        points: [
          '采用STRM/软链接技术实现媒体库映射，扫描效率提升300%',
          '专为115网盘深度优化的快速同步方案'
        ]
      },
      {
        subtitle: '多维实时同步系统',
        points: [
          '三模监控架构：Webhook即时推送(CloudDrive2深度整合)、事件驱动响应、智能轮询机制',
          '百TB级媒体库秒级响应，突破传统索引技术限制'
        ]
      }
    ],
    image: '/assets/images/链接同步.png'
  },
  {
    title: 'AI增强型媒体处理中枢',
    content: [
      {
        subtitle: '智能媒体管理系统',
        points: [
          '核心识别引擎',
          'TMDB智能匹配（97.6% 精度丨模糊校正）',
          'AI增强模块（ChatGPT+ 多模型丨容错识别）'
        ]
      },
      {
        subtitle: '智能归档体系',
        points: [
          '三级元数据架构（标准化命名丨动态刮削）',
          '多分辨率海报墙（自动生成nfo + 封面矩阵）'
        ]
      },
      {
        subtitle: '流式处理引擎',
        points: [
          '智能响应机制',
          '热文件夹实时触发（TB级增量处理丨秒级更新）',
          '双流协同架构（处理 - 链接并行丨智能调度）'
        ]
      }
    ],
    image: '/assets/images/AI.png'
  },
  {
    title: '自动化媒体管理流程',
    content: [
      {
        subtitle: '构建智能媒体处理流水线',
        points: [
          '影视频道订阅/自带聚合搜索转存Bot智能抓取云端转存',
          '触发Symedia处理链 => 云端归档 => AI刮削 => 动态链接生成 => Emby同步',
          '端到端处理时延 < 5分钟(视文件规模)',
          '从资源获取到观影享受全流程自动化实现用户只需：发现资源→转发链接→享受观影'
        ]
      }
    ],
    image: '/assets/images/归档工作流.png'
  },
  {
    title: '生态化插件平台',
    content: [
      {
        subtitle: 'Emby增强套件',
        points: [
          '智能媒体库同步通知系统',
          '多版本智能合并引擎',
          '动态封面管理系统',
        ]
      },
      {
        subtitle: '云服务扩展组件',
        points: [
          '115 / 123 / 阿里云盘 / 夸克智能转存系统',
          '跨平台传输加速模块',
        ]
      },
      {
        subtitle: '媒体处理工具集',
        points: [
          '多语言字幕提取器',
          '正则表达式批处理引擎',
        ]
      }
    ],
    image: '/assets/images/生态化插件.png'
  },
  {
    title: '响应式布局：让设计适应每一个屏幕',
    content: [
      {
        subtitle: '智能响应式设计',
        points: [
          '让网页能够智能识别设备屏幕尺寸，自动调整内容排版、图片大小及功能交互',
          '内容始终清晰可读，操作触手可及，移动端添加快捷方式到桌面，实现APP级交互体验'
        ]
      }
    ],
    image: '/assets/images/响应式布局.png'
  },
  // {
  //   title: 'FastEmby无缝对接',
  //   content: [
  //     {
  //       subtitle: '媒体网盘直链播放系统',
  //       points: [
  //         '创新302重定向技术，让Emby直接播放115/阿里云盘等网盘内容',
  //         '秒级加载，播放体验媲美本地',
  //       ]
  //     },
  //     {
  //       subtitle: '快速傻瓜式路径映射',
  //       points: [
  //         '智能路径映射，自动匹配网盘与本地Emby路径',
  //       ]
  //     }
  //   ],
  //   video: fastembyVideo
  // },
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
    content: '说到Symedia的使用体验，一句话就够了：老婆也能用的影音整理工具。',
    author: 'IT项目经理鸥歌'
  },
  {
    content: '一键转存、自动整理入库、实时生成Strm、外网满速播放，如此完美的Emby观影体验，目前真的只有Symedia+FastEmby才能实现。',
    author: '陌轩'
  },
  {
    content: '如果你给了115四星好评，那最后一星的体验Symedia替你补了。',
    author: 'Tyboe'
  },
  {
    content: '别让马斯克知道这玩意，不然他下次发射火箭可能偷装 Symedia+FastEmby，"星链？弱爆了，我这叫星际影库！"',
    author: '加勒比海带'
  },
  {
    content: '✨五星力荐！Symedia+FastEmby带来的影音革命！✨可以负责任地说：如此极致流畅的「全链路观影解决方案」，目前唯有Symedia + FastEmby能完美实现！影音爱好者不容错过的终极之选！',
    author: '影音爱好者夜灵峰'
  },
  {
    content: '以前整理7500部电影花了一星期，现在用Symedia配合OpenAPI和ChatGPT助力，半天就能完成。智能识别自动去重，大包整理变得超级轻松！',
    author: '爱影频道 H.T'
  },
  {
    content: '每次女儿想看什么电视的时候，只要跟我说一声，我转存一下，几分钟后就出现在Emby媒体库中了',
    author: '黄毛终结者泰迪熊'
  }
]


const isMobile = ref(false)

const checkIsMobile = () => {
  isMobile.value = window.innerWidth < 768
}

const currentShowcase = ref(0)
const isScrolling = ref(false)

// 添加触摸事件支持
const touchStartY = ref(0)
const touchEndY = ref(0)
const touchThreshold = 50 // 触摸阈值，需要滑动超过这个距离才会触发翻页

// 处理触摸开始事件
const handleTouchStart = (event) => {
  touchStartY.value = event.touches[0].clientY
}

// 处理触摸结束事件
const handleTouchEnd = (event) => {
  // 仅在showcase区域内处理
  const showcaseContainer = document.querySelector('.home-showcase-container')
  if (!showcaseContainer) return

  const rect = showcaseContainer.getBoundingClientRect()
  const isInViewport = (
    rect.top < window.innerHeight &&
    rect.bottom > 0
  )

  if (!isInViewport || isScrolling.value) return

  touchEndY.value = event.changedTouches[0].clientY
  const deltaY = touchStartY.value - touchEndY.value

  if (Math.abs(deltaY) > touchThreshold) {
    // 防止触发默认的页面滚动
    event.preventDefault()
    isScrolling.value = true
    setTimeout(() => { isScrolling.value = false }, 800) // 防抖

    if (deltaY > 0 && currentShowcase.value < showcases.length - 1) {
      // 向上滑动，显示下一个
      scrollToShowcase(currentShowcase.value + 1)
    } else if (deltaY < 0 && currentShowcase.value > 0) {
      // 向下滑动，显示上一个
      scrollToShowcase(currentShowcase.value - 1)
    }
  }
}

// 处理滚轮事件
const handleWheel = (event) => {
  // 仅在showcase区域内处理
  const showcaseContainer = document.querySelector('.home-showcase-container')
  if (!showcaseContainer) return

  const rect = showcaseContainer.getBoundingClientRect()
  const isInViewport = (
    rect.top < window.innerHeight &&
    rect.bottom > 0
  )

  if (!isInViewport || isScrolling.value) return

  isScrolling.value = true
  setTimeout(() => { isScrolling.value = false }, 800) // 防抖

  if (event.deltaY > 0 && currentShowcase.value < showcases.length - 1) {
    // 向下滚动
    scrollToShowcase(currentShowcase.value + 1)
  } else if (event.deltaY < 0 && currentShowcase.value > 0) {
    // 向上滚动
    scrollToShowcase(currentShowcase.value - 1)
  }
}

// 针对移动端优化的滚动函数
const scrollToShowcase = (index) => {
  if (index >= 0 && index < showcases.length) {
    currentShowcase.value = index
    const element = document.getElementById(`showcase-${index}`)
    if (element) {
      // 计算滚动位置
      const elementRect = element.getBoundingClientRect()
      const elementHeight = elementRect.height
      const windowHeight = window.innerHeight
      const elementTop = window.scrollY + elementRect.top

      // 移动端和桌面端不同的处理逻辑
      if (isMobile.value) {
        // 移动端：计算更精确的居中位置
        // 对于每个卡片使用动态计算，而不是固定百分比
        const visibleHeight = Math.min(elementHeight, windowHeight * 0.8) // 限制最大可见高度
        const topOffset = (windowHeight - visibleHeight) / 2 // 居中显示
        window.scrollTo({
          top: elementTop - topOffset + 10, // 微调顶部偏移，+10使其稍微上移
          behavior: 'smooth'
        })
      } else {
        // 桌面端：居中显示
        // 增加顶部偏移量，使卡片在视口中更居中
        const scrollToY = elementTop - ((windowHeight - elementHeight) / 2)
        // 增加垂直偏移量，使卡片更靠上一些
        const topOffset = 20
        window.scrollTo({
          top: Math.max(0, scrollToY - topOffset),
          behavior: 'smooth'
        })
      }
    }
  }
}

onMounted(() => {
  checkIsMobile()
  window.addEventListener('resize', checkIsMobile)
  window.addEventListener('wheel', handleWheel)

  // 添加触摸事件监听器
  window.addEventListener('touchstart', handleTouchStart)
  window.addEventListener('touchend', handleTouchEnd)

  // 添加滚动事件监听器，用于控制导航点的显示和隐藏
  window.addEventListener('scroll', handleScroll)

  // 预加载所有图片，然后再执行对齐操作
  const preloadImages = () => {
    const images = document.querySelectorAll('.showcase-img')
    let loadedCount = 0
    const totalImages = images.length

    if (totalImages === 0) {
      // 如果没有图片，直接执行对齐
      alignTextWithImages()
      return
    }

    images.forEach(img => {
      if (img.complete) {
        loadedCount++
        if (loadedCount === totalImages) {
          alignTextWithImages()
        }
      } else {
        img.onload = () => {
          loadedCount++
          if (loadedCount === totalImages) {
            alignTextWithImages()
          }
        }
      }
    })

    // 设置一个兜底的计时器，确保即使某些图片加载失败也能执行对齐
    setTimeout(() => {
      alignTextWithImages()
    }, 1000)
  }

  // 执行预加载
  preloadImages()

  // 添加窗口尺寸变化时的对齐处理
  window.addEventListener('resize', alignTextWithImages)

  // 在任何异步操作之前注册 onUnmounted 钩子
  let observerInstance = null
  let resizeObserverInstance = null

  // 在组件卸载时清理所有事件监听器和观察器
  onUnmounted(() => {
    if (resizeObserverInstance) {
      resizeObserverInstance.disconnect()
    }
    if (observerInstance) {
      observerInstance.disconnect()
    }
    window.removeEventListener('wheel', handleWheel)
    window.removeEventListener('resize', checkIsMobile)
    window.removeEventListener('touchstart', handleTouchStart)
    window.removeEventListener('touchend', handleTouchEnd)
    window.removeEventListener('scroll', handleScroll)
    window.removeEventListener('resize', alignTextWithImages)
  })

  // 等待Vue完成DOM更新
  setTimeout(() => {
    // 添加滚动监听器来更新当前的showcase
    observerInstance = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const id = entry.target.id
          const index = parseInt(id.split('-')[1])
          if (currentShowcase.value !== index) {
            currentShowcase.value = index
          }
        }
      })
    }, { threshold: 0.5 })

    // 使用ResizeObserver监听窗口大小变化
    if (typeof ResizeObserver !== 'undefined') {
      resizeObserverInstance = new ResizeObserver(debounce(() => {
        // 仅在用户已经滚动到showcase部分时才重新计算位置
        if (currentShowcase.value >= 0 && isInShowcaseView()) {
          scrollToShowcase(currentShowcase.value)
        }
      }, 200)) // 添加防抖

      // 监听body元素大小变化
      resizeObserverInstance.observe(document.body)

      // 观察每个showcase节点
      showcases.forEach((_, index) => {
        const el = document.getElementById(`showcase-${index}`)
        if (el) {
          observerInstance.observe(el)
        }
      })
    } else {
      // 降级处理，如果浏览器不支持ResizeObserver
      showcases.forEach((_, index) => {
        const el = document.getElementById(`showcase-${index}`)
        if (el) observerInstance.observe(el)
      })
    }
  }, 100)
})

// 判断用户是否在showcase视图中
const isInShowcaseView = () => {
  const showcaseContainer = document.querySelector('.home-showcase-container')
  if (!showcaseContainer) return false

  const rect = showcaseContainer.getBoundingClientRect()
  return (
    rect.top < window.innerHeight &&
    rect.bottom > 0
  )
}

// 简单的防抖函数
const debounce = (fn, delay) => {
  let timer = null
  return function () {
    const context = this
    const args = arguments
    clearTimeout(timer)
    timer = setTimeout(() => {
      fn.apply(context, args)
    }, delay)
  }
}

// 处理滚动事件，控制导航点的显示和隐藏
const handleScroll = () => {
  const showcaseContainer = document.querySelector('.home-showcase-container')
  const showcaseNav = document.querySelector('.showcase-nav')
  if (!showcaseContainer || !showcaseNav) return

  const inView = isInShowcaseView()
  if (inView) {
    showcaseNav.classList.add('visible')
  } else {
    showcaseNav.classList.remove('visible')
  }
}

// 新增函数：图片与文字对齐
const alignTextWithImages = () => {
  const showcaseSections = document.querySelectorAll('.showcase-section')
  showcaseSections.forEach(section => {
    // 为每个区域添加加载状态标记
    section.classList.add('showcase-content-loading')
    section.classList.remove('showcase-content-loaded')

    const imageContainer = section.querySelector('.showcase-image')
    const textContainer = section.querySelector('.showcase-text')
    const image = imageContainer.querySelector('.showcase-img, .showcase-video')

    if (imageContainer && textContainer && image) {
      // 在图片加载前，先设置一个默认的顶部对齐
      textContainer.style.paddingTop = '0px'

      // 等待图片完全加载
      if (image instanceof HTMLImageElement) {
        if (!image.complete) {
          image.onload = () => {
            alignSingleSection(imageContainer, textContainer)
            // 加载完毕后标记内容已加载
            section.classList.remove('showcase-content-loading')
            section.classList.add('showcase-content-loaded')
          }
        } else {
          alignSingleSection(imageContainer, textContainer)
          // 图片已加载完毕，直接标记
          section.classList.remove('showcase-content-loading')
          section.classList.add('showcase-content-loaded')
        }
      } else {
        alignSingleSection(imageContainer, textContainer)
        // 非图片类型，直接标记
        section.classList.remove('showcase-content-loading')
        section.classList.add('showcase-content-loaded')
      }
    }
  })
}

// 对齐单个区域的文字和图片
const alignSingleSection = (imageContainer, textContainer) => {
  if (window.innerWidth <= 768) {
    // 移动端直接显示，不需要特殊对齐
    textContainer.style.paddingTop = '0px'
    textContainer.style.paddingBottom = '0px'
    return
  }

  const image = imageContainer.querySelector('.showcase-img, .showcase-video')

  if (image) {
    // 计算图片容器中图片的垂直居中偏移量
    const imageTopOffset = (imageContainer.clientHeight - image.clientHeight) / 2 - 12

    // 设置文字容器的样式，确保与图片区域对齐
    textContainer.style.paddingTop = `${imageTopOffset}px`

    // 计算文字容器内容的高度
    const textContentHeight = textContainer.scrollHeight - imageTopOffset

    // 如果文字内容高度小于图片高度，添加底部填充使其至少与图片一样高
    if (textContentHeight < image.clientHeight) {
      const paddingBottom = image.clientHeight - textContentHeight
      textContainer.style.paddingBottom = `${Math.max(0, paddingBottom)}px`
    } else {
      textContainer.style.paddingBottom = '0px'
    }
  }
}
</script>

<style>
.ui-padding {
  padding: 0 24px;
  margin: 0 auto;
  max-width: 1152px;
  color: var(--vp-c-text-1);
}

/* 添加内容预加载样式 */
.showcase-content-loading .showcase-text {
  opacity: 0;
  transition: opacity 0.3s ease-in-out;
}

.showcase-content-loaded .showcase-text {
  opacity: 1;
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
  word-break: break-word;
  white-space: normal;
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

.home-showcase-container {
  position: relative;
  width: 100%;
  padding: 100px 0;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;

  @media (max-width: 768px) {
    padding: 60px 0;
    min-height: initial;
  }
}

.home-showcase {
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 150px;
  padding: 20px 0;

  @media (max-width: 768px) {
    gap: 80px;
  }
}

.showcase-section {
  width: 90%;
  max-width: 1200px;
  height: 70vh;
  margin: 0;
  padding: 40px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
  overflow: auto;

  background: linear-gradient(45deg, rgba(76, 138, 231, 0.1), rgba(142, 84, 233, 0.1));
  border-radius: 16px;
  box-shadow: 0 8px 24px rgba(76, 138, 231, 0.15);
  border: none;

  @media (max-width: 768px) {
    height: auto;
    min-height: 80vh;
    max-height: 85vh;
    /* 限制最大高度 */
    padding: 20px 15px;
    width: 95%;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    /* 从顶部开始布局 */
  }
}

.showcase-nav {
  position: fixed;
  right: 30px;
  top: 50%;
  transform: translateY(-50%);
  z-index: 100;
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.3s ease, visibility 0.3s ease;
}

.showcase-nav.visible {
  opacity: 1;
  visibility: visible;
}

.showcase-dots {
  display: flex;
  flex-direction: column;
  gap: 15px;

  span {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    background-color: rgba(76, 138, 231, 0.3);
    cursor: pointer;
    transition: all 0.3s ease;

    &.active {
      background: linear-gradient(135deg, #4a8af4, #9254de);
      transform: scale(1.2);
      box-shadow: 0 0 10px rgba(74, 138, 244, 0.5);
    }
  }
}

.showcase-row {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  align-items: flex-start;
  height: 100%;
  overflow: auto;

  &.reverse {
    flex-direction: row-reverse;
  }

  .showcase-text {
    flex: 1;
    padding: 0 30px;
    width: 100%;
    height: 100%;
    overflow-y: auto;
    scrollbar-width: thin;

    &::-webkit-scrollbar {
      width: 5px;
    }

    &::-webkit-scrollbar-thumb {
      background-color: rgba(76, 138, 231, 0.3);
      border-radius: 10px;
    }

    h3 {
      font-size: 34px;
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

    .content-section {
      margin-bottom: 16px;
    }

    .content-subtitle {
      font-size: 18px;
      font-weight: 600;
      margin-bottom: 6px;
      color: #4a9eea;
      display: block;
    }

    .content-points {
      list-style-type: disc;
      padding-left: 20px;

      li {
        font-size: 15px;
        line-height: 1.5;
        font-weight: 600;
        color: var(--vp-c-text-2);
        margin-bottom: 4px;
      }
    }
  }

  .showcase-image {
    flex: 1.5;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 10px;
    height: 100%;
    flex-direction: column;

    .image-placeholder {
      width: 100%;
      height: 280px;
      background-color: var(--vp-c-bg-soft);
      border-radius: 12px;
      border: 1px solid var(--vp-c-divider);
    }

    .showcase-img,
    .showcase-video {
      width: 100%;
      max-width: 700px;
      max-height: 90%;
      border-radius: 12px;
      margin-top: 0;
    }

    .copyright-disclaimer {
      margin-top: 10px;
      padding: 10px;
      background: rgba(0, 0, 0, 0.05);
      border-radius: 8px;
      max-width: 700px;
      width: 100%;

      p {
        font-size: 12px;
        line-height: 1.4;
        color: var(--vp-c-text-3);
        text-align: center;
        margin: 0;
      }
    }
  }
}

.home-integration {
  padding: 60px 0;
  background: linear-gradient(45deg, rgba(76, 138, 231, 0.1), rgba(142, 84, 233, 0.1));
  border-radius: 16px;
  margin: 40px 0;
  position: relative;
  overflow: hidden;
  box-shadow: 0 8px 24px rgba(76, 138, 231, 0.15);
  border: none;

  &::before {
    content: none;
    /* 移除边框 */
  }

  .integration-content {
    display: flex;
    align-items: flex-start;
    padding: 0 40px;

    .integration-text {
      flex: 1;

      p {
        font-size: 18px;
        line-height: 1.6;
        color: var(--vp-c-text-1);
        margin-bottom: 16px;
        font-weight: 500;
      }

      p:first-child {
        font-size: 24px;
        font-weight: 700;
        background-image: linear-gradient(135deg, #4a8af4, #9254de);
        -webkit-background-clip: text;
        background-clip: text;
        -webkit-text-fill-color: transparent;
        color: transparent;
        display: inline-block;
        margin-bottom: 8px;
      }
    }

    .integration-image {
      flex: 1;

      .fastemby-video {
        width: 100%;
        max-height: 400px;
        border-radius: 12px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        transition: all 0.3s ease;
        clip-path: inset(5px 0 0 0);
        margin-top: -5px;
      }

      .copyright-disclaimer {
        margin-top: 10px;
        padding: 10px;
        background: rgba(0, 0, 0, 0.05);
        border-radius: 8px;

        p {
          font-size: 12px;
          line-height: 1.4;
          color: var(--vp-c-text-3);
          text-align: center;
          margin: 0;
        }
      }
    }
  }

  .integration-list {
    padding-left: 0;
    margin-top: 24px;

    li {
      margin-bottom: 18px;
      color: var(--vp-c-text-1);
      font-size: 16px;
      line-height: 1.6;
      position: relative;
      list-style-type: none;
      padding-left: 30px;
      background: linear-gradient(90deg, rgba(76, 138, 231, 0.05), transparent);
      padding: 8px 12px 8px 36px;
      border-radius: 8px;
      transition: all 0.3s ease;

      &:hover {
        transform: translateX(5px);
        background: linear-gradient(90deg, rgba(76, 138, 231, 0.1), transparent);
      }

      &:before {
        content: '✓';
        position: absolute;
        left: 10px;
        color: #42b983;
        font-weight: bold;
        font-size: 18px;
      }
    }
  }
}

.section-title[data-text="与FastEmby完美配合"] {
  margin-bottom: 30px;
  background-image: linear-gradient(135deg, #4a8af4, #9254de);
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  color: transparent;
  font-size: 34px;
  position: relative;
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
    display: flex;
    flex-direction: column;
    height: 100%;
    min-height: 200px;

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
      flex-grow: 1;
    }

    .testimonial-author {
      display: flex;
      flex-direction: column;
      margin-top: auto;

      .author-name {
        font-weight: 600;
        font-size: 16px;
        color: transparent;
        background-image: linear-gradient(135deg, #4a8af4, #9254de);
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

  .home-showcase-container {
    padding: 40px 0;
    min-height: auto;
  }

  .home-showcase {
    gap: 60px;
  }

  .showcase-section {
    height: auto;
    min-height: 75vh;
    max-height: 85vh;
    /* 限制最大高度，避免过长 */
    padding: 20px 15px;
    width: 95%;
    overflow-y: auto;
    /* 允许内容溢出时滚动 */
    margin: 20px 0;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    /* 确保内容分布均匀 */
  }

  .home-showcase .showcase-row,
  .home-showcase .showcase-row.reverse {
    flex-direction: column;
    padding: 5px;
    height: auto;

    .showcase-text {
      padding: 0;
      margin-bottom: 15px;
      height: auto;
      max-height: 40vh;
      overflow-y: auto;

      h3 {
        font-size: 24px;
        margin-bottom: 10px;
        /* text-align: center; */
      }

      .content-subtitle {
        font-size: 16px;
      }

      .content-points {
        padding-left: 15px;

        li {
          font-size: 14px;
          line-height: 1.4;
          margin-bottom: 3px;
        }
      }
    }

    .showcase-image {
      padding: 0;
      width: 100%;
      height: auto;
      max-height: 35vh;
      margin-top: auto;
      flex-direction: column;

      .showcase-img,
      .showcase-video {
        max-width: 100%;
        max-height: 30vh;
        margin: 0 auto;
      }

      .copyright-disclaimer {
        max-width: 100%;
        margin-top: 5px;

        p {
          font-size: 10px;
        }
      }
    }
  }

  .showcase-section {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }

  .showcase-nav {
    position: fixed;
    bottom: 20px;
    top: auto;
    right: 50%;
    transform: translateX(50%);
    z-index: 1000;
  }

  .showcase-dots {
    flex-direction: row;
    gap: 10px;
    padding: 8px 12px;
    background: rgba(0, 0, 0, 0.3);
    border-radius: 20px;
    backdrop-filter: blur(4px);

    span {
      width: 8px;
      height: 8px;

      &.active {
        width: 10px;
        height: 10px;
      }
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

  /* 确保FastEmby集成部分的响应式 */
  .home-integration .integration-content {
    flex-direction: column;

    .integration-text {
      padding: 0;
      margin-bottom: 30px;
    }

    .integration-image {
      width: 100%;

      .fastemby-video {
        max-width: 100%;
        max-height: 300px;
        margin: 0 auto;
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