// https://vitepress.dev/guide/custom-theme
import { h } from "vue";
import type { Theme } from "vitepress";
import DefaultTheme from "vitepress/theme";
import "./style.css";
import Home from "./views/HomeView.vue";
import "./styles/tailwind.css";

// 定义主题扩展
const theme = {
  extends: DefaultTheme,
  Layout: () => {
    return h(DefaultTheme.Layout, null, {
      // https://vitepress.dev/guide/extending-default-theme#layout-slots
    });
  },
  enhanceApp({ app, router, siteData }) {
    // 注册全局组件
    app.component("Home", Home);
  },
} satisfies Theme;

export default theme;
