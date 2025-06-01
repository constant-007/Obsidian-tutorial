---
publish: true
---

# 示例

所有今天到期的未完成任务：

    ```tasks
    not done
    due today
    ```

---

所有在未来两周内到期但不过期（今天或之后到期）的未完成任务：

    ```tasks
    not done
    due AFTER yesterday
    due BEFORE in two weeks
    ```

大多数查询指令可以包含[[About Queries#Capitals in Query Instructions - Case Insensitivity|大写字母]]，这里用于强调。

---

所有在未来两周内到期，并且具有`#inbox`标签或在Inbox笔记中的未完成任务：

    ```tasks
    not done
    (due after yesterday) AND (due before in two weeks)
    (tags include #inbox) OR (path includes Inbox)
    ```

（`AND`和`OR`必须大写。）

---

所有在下个日历月到期但未计划的未完成任务：

    ```tasks
    not done
    due next month
    no scheduled date
    ```

---

所有在库中任何位置的`tasks`标题下（例如`## Tasks`）的已完成任务：

    ```tasks
    done
    heading includes tasks
    ```

---

所有本日历月完成但在上个月到期或计划的任务：

    ```tasks
    (due last month) OR (scheduled last month)
    done this month
    ```

---

显示所有未完成、在2021年4月9日到期且路径包含`GitHub`的任务：

    ```tasks
    not done
    due on 2021-04-09
    path includes GitHub
    ```

---

显示所有在两周范围内（包含）到期的未完成任务，隐藏截止日期和编辑按钮：

    ```tasks
    not done
    due 2021-05-01 2021-05-14
    hide due date
    hide edit button
    ```

---

显示所有在2020年12月1日之前完成的任务：

    ```tasks
    done before 2020-12-01
    ```

---

显示所有本季度计划且有标签的任务：

    ```tasks
    scheduled this quarter
    has tags
    ```

---

显示一个在5月5日到期且描述中包含`#prio1`的任务：

    ```tasks
    not done
    due on 2021-05-05
    description includes #prio1
    limit to 1 tasks
    ```

---

所有今天或更早到期的未完成任务，按截止日期排序，然后按包含任务的文件夹分组：

    ```tasks
    not done
    due before tomorrow
    sort by due
    group by folder
    ```

---

所有以`HH:mm`格式的时间戳开头，后跟任何空白字符的未完成任务：

    ```tasks
    not done
    description regex matches /^[012][0-9]:[0-5][0-9]\s/
    ```
