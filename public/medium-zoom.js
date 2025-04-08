// 从CDN加载medium-zoom库
(function () {
  const script = document.createElement("script");
  script.src =
    "https://cdn.jsdelivr.net/npm/medium-zoom@1.0.6/dist/medium-zoom.min.js";
  script.async = true;
  script.onload = function () {
    // 库加载完成后初始化
    setTimeout(() => {
      const zoom = mediumZoom(".content img", {
        background: "var(--vp-c-bg)",
        margin: 24,
        scrollOffset: 40,
      });

      // 为新添加的图片绑定放大事件
      const observer = new MutationObserver(() => {
        const images = document.querySelectorAll(
          ".content img:not(.medium-zoom-image)"
        );
        if (images.length > 0) {
          zoom.attach(images);
        }
      });

      // 监听内容变化
      const content = document.querySelector(".VPContent");
      if (content) {
        observer.observe(content, {
          childList: true,
          subtree: true,
        });
      }
    }, 1000);
  };
  document.head.appendChild(script);
})();
