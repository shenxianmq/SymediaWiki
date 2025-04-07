import { defineConfig } from "vitepress";
import { set_sidebar } from "./utils/auto_sidebar.mjs";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  base: "/SymediaWiki/",
  lang: "zh-CN",
  title: "Symedia",
  description: "智能云端媒体库管家",
  head: [["link", { rel: "icon", href: "/favicon.png" }]],
  vite: {
    build: {
      assetsInlineLimit: 0,
    },
    publicDir: "public",
  },
  themeConfig: {
    siteTitle: " ",
    logo: { light: "/logo-light.png", dark: "/logo-dark.png" },
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "主页", link: "/" },
      {
        text: "Wiki",
        items: [
          { text: "Symedia", link: "/archive/symedia/symedia部署教程" },
          { text: "FastEmby", link: "/archive/fastemby/fastemby部署教程" },
        ],
      },
    ],
    outlineTitle: "目录",
    outline: [2, 6],

    //返回顶部文字修改(移动端)
    returnToTopLabel: "返回顶部",
    sidebar: {
      "/archive/symedia/": [
        {
          text: "Symedia",
          collapsed: false,
          items: set_sidebar("/archive/symedia"),
        },
      ],
      "/archive/fastemby/": [
        {
          text: "FastEmby",
          collapsed: false,
          items: set_sidebar("/archive/fastemby"),
        },
      ],
    },
    // sidebar: [
    //   {
    //     text: "Symedia",
    //     collapsed: false,
    //     items: set_sidebar("/archive/symedia"),
    //   },
    //   {
    //     text: "FastEmby",
    //     collapsed: false,
    //     items: set_sidebar("/archive/fastemby"),
    //   },
    // ],
    search: {
      provider: "local",
      options: {
        translations: {
          button: {
            buttonText: "搜索文档",
            buttonAriaLabel: "搜索文档",
          },
          modal: {
            noResultsText: "无法找到相关结果",
            resetButtonTitle: "清除查询条件",
            footer: {
              selectText: "选择",
              navigateText: "切换",
            },
          },
        },
      },
    },
    socialLinks: [
      { icon: "github", link: "https://github.com/shenxianmq/Symedia" },
    ],
  },
});
