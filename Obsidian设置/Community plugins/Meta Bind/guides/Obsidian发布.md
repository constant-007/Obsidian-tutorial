---
title: Obsidian Publish 支持
description: 设置 Meta Bind 在 Publish 中工作的教程。
---

:::danger

我目前正在等待 Obsidian 团队兑现对 Obsidian Publish API 改进的承诺。
在此之前，Meta Bind 的发布支持将被破坏。

使用风险自负。我目前不接受针对发布特定问题的问题和功能请求。

:::

本指南假设您已经设置了 Obsidian Publish 和自定义域名，以便您可以使用 `publish.js` 文件。

要让 Meta Bind 在 Obsidian Publish 中工作，您需要将[此文件](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/master/PublishLoad.js)的内容复制到您的 `publish.js` 文件中。
为了正确的外观，您需要将[此文件](https://github.com/mProjectsCode/obsidian-meta-bind-plugin/blob/master/styles.css)复制到您的 `publish.css` 文件中。
