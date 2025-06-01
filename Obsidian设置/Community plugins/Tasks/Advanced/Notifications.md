---
publish: true
---

# 通知

<span class="related-pages">#plugin/reminder</span>

在Tasks中，通知可以通过使用[obsidian-reminder](https://github.com/uphy/obsidian-reminder)来实现。
这利用了标准的Tasks日期（作为到期日期），并可以通过包含⏰和格式为`⏰ YYYY-MM-DD HH:MM`的日期/时间来扩展额外的提醒日期。
此外，可以基于Tasks的"到期日期"启用默认提醒。
要启用此功能，请确保obsidian-reminder已启用tasks插件格式，如下所示：

![obsidian-reminder setting](../images/reminder.png)
_注意这是reminder插件设置的截图，不是Tasks的。_

## 在哪里添加提醒日期

编写任务时顺序很重要。Tasks要求提醒日期在任务描述之后、任何其他Tasks字段之前。Reminders[要求提醒日期和到期日期之间没有内容](https://uphy.github.io/obsidian-reminder/guide/interop-tasks.html#distinguish-due-date-and-reminder-date)。

```markdown
- [ ] #task task name ⏰ YYYY-MM-DD HH:mm 📅 YYYY-MM-DD ⏫ 🔁 every week 🛫 YYYY-MM-DD ⏳ YYYY-MM-DD
```

---

> [!warning]
> "创建或编辑任务"命令的输出不会将到期日期直接放在提醒日期后面，而这是Reminders想要的位置。
如果您想使用Reminders的"推迟"命令，您必须手动修复此问题；
**否则（截至2022年8月），使用Reminders"推迟"命令将覆盖⏰和📅表情符号之间的所有信息！**
请参阅[Reminders中的此问题以检查当前状态](https://github.com/uphy/obsidian-reminder/issues/100)。

## 如何完成提醒

完成任务时提醒日期不会改变，只有当您从提醒弹出窗口或从通知中完成时，日期才会改变。

![image](https://user-images.githubusercontent.com/38974541/143463881-e4af4b91-426f-48e8-938e-4a1053b06677.png)
![image](https://user-images.githubusercontent.com/38974541/143464983-542675ae-a467-41c0-aaca-1075c42f8328.png)

---

> [!warning]
> 截至2022年8月，完成重复任务在Reminders中无法正常工作。
请参阅[Reminders中的此问题以检查当前状态](https://github.com/uphy/obsidian-reminder/issues/93)。

---
