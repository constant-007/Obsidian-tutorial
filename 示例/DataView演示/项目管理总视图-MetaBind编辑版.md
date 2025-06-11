---
cssclasses:
  - dataview
总任务数: 8
当前完成数: 4
完成度: 50%
obsidianUIMode: preview
savedFilters: '[{"column":"assignee","columnName":"负责人","condition":"notEquals","value":"张三"}]'
savedSort: '{"column":"priority","ascending":false}'

---
## 🎯 项目概览 - Meta Bind 可编辑版本

> 🚀 **新功能**：这个版本使用 Meta Bind 插件实现表格内直接编辑！点击表格中的字段即可修改，更改会自动保存到对应的任务文件中。

```dataviewjs
// 创建数据库视图 - Meta Bind 增强版
const pages = dv.pages('"示例/DataView演示/任务数据"').sort(p => p.file.name, 'asc');

const savedFilters = dv.current().savedFilters ? JSON.parse(dv.current().savedFilters) : []; 
const savedSort = dv.current().savedSort ? JSON.parse(dv.current().savedSort) : {column: "priority", ascending: false};

console.log("页面总数:", pages.length);
console.log("页面中的Status值示例:", pages.slice(0, 3).map(p => ({名称: p.file.name, 状态: p.status})));

// 计算任务统计数据
const totalTasks = pages.length;
const completedTasks = pages.filter(p => {
    const status = (p.status || "").toString().trim();
    return status === "已完成";
}).length;

const completionRate = totalTasks > 0 ? Math.round((completedTasks / totalTasks) * 100) : 0;

// 获取当前文件的属性值
const currentFile = dv.current().file;
const currentTotal = dv.current().总任务数;
const currentCompleted = dv.current().当前完成数;
const currentRate = dv.current().完成度;

console.log("比较: 当前值 vs 新值", {
    总任务数: [currentTotal, totalTasks],
    当前完成数: [currentCompleted, completedTasks],
    完成率: [currentRate, `${completionRate}%`]
});

const isTotalChanged = Number(currentTotal) !== Number(totalTasks);
const isCompletedChanged = Number(currentCompleted) !== Number(completedTasks);
const isRateChanged = currentRate !== `${completionRate}%`;

try {
    if (app.plugins.plugins["metaedit"]) {
        const { update } = app.plugins.plugins["metaedit"].api;
        
        let needsUpdate = false;
        
        if (isTotalChanged) {
            update("总任务数", totalTasks, currentFile.path);
            needsUpdate = true;
        }
        
        if (isCompletedChanged) {
            update("当前完成数", completedTasks, currentFile.path);
            needsUpdate = true;
        }
        
        const newRate = `${completionRate}%`;
        if (isRateChanged) {
            update("完成度", newRate, currentFile.path);
            needsUpdate = true;
        }
        
        if (needsUpdate) {
            console.log("属性已通过MetaEdit更新");
        }
    } else {
        if (isTotalChanged) dv.current().总任务数 = totalTasks;
        if (isCompletedChanged) dv.current().当前完成数 = completedTasks;
        if (isRateChanged) dv.current().完成度 = `${completionRate}%`;
        
        console.log("MetaEdit插件未安装，使用备用方法更新属性");
    }
} catch (error) {
    console.error("更新属性时出错:", error);
    if (isTotalChanged) dv.current().总任务数 = totalTasks;
    if (isCompletedChanged) dv.current().当前完成数 = completedTasks;
    if (isRateChanged) dv.current().完成度 = `${completionRate}%`;
}

// 预定义选项
const predefinedOptions = {
    "status": ["未开始", "进行中", "已完成", "已暂停"],
    "priority": ["高", "中", "低"],
    "category": ["前端开发", "后端开发", "设计", "测试", "文档", "运维"],
    "assignee": ["张三", "李四", "王五", "赵六"]
};

// 数值类型的列
const numberColumns = ["estimate_hours", "actual_hours", "progress"];

// Meta Bind 字段创建函数 - 修复版本
function createMetaBindSelect(filePath, property, currentValue, options) {
    const bindTarget = `${filePath}#${property}`;
    
    // 创建选项字符串
    const optionsArray = options.map(opt => `option("${opt}", "${opt}")`);
    const optionsStr = optionsArray.join(', ');
    
    // 返回正确的Meta Bind语法（不用反引号包裹）
    return `INPUT[select(${optionsStr}):${bindTarget}]`;
}

function createMetaBindNumber(filePath, property, currentValue) {
    const bindTarget = `${filePath}#${property}`;
    return `INPUT[number:${bindTarget}]`;
}

function createMetaBindSlider(filePath, property, currentValue) {
    const bindTarget = `${filePath}#${property}`;
    return `INPUT[slider(minValue(0), maxValue(100), stepSize(5)):${bindTarget}]`;
}

function createMetaBindDate(filePath, property, currentValue) {
    const bindTarget = `${filePath}#${property}`;
    return `INPUT[date:${bindTarget}]`;
}

function createMetaBindText(filePath, property, currentValue) {
    const bindTarget = `${filePath}#${property}`;
    return `INPUT[text:${bindTarget}]`;
}

// 定义列设置 - Meta Bind 增强版
const columns = [
    {
        id: "filename", 
        name: "任务名称", 
        display: p => p.file.link, 
        property: "file.name",
        editable: false
    },
    {
        id: "status", 
        name: "状态", 
        display: p => createMetaBindSelect(p.file.path, "status", p.status || "未开始", predefinedOptions.status),
        property: "status",
        editable: true
    },
    {
        id: "priority", 
        name: "优先级", 
        display: p => createMetaBindSelect(p.file.path, "priority", p.priority || "中", predefinedOptions.priority),
        property: "priority",
        editable: true
    },
    {
        id: "category", 
        name: "分类", 
        display: p => createMetaBindSelect(p.file.path, "category", p.category || "前端开发", predefinedOptions.category),
        property: "category",
        editable: true
    },
    {
        id: "assignee", 
        name: "负责人", 
        display: p => createMetaBindSelect(p.file.path, "assignee", p.assignee || "张三", predefinedOptions.assignee),
        property: "assignee",
        editable: true
    },
    {
        id: "estimate_hours", 
        name: "预估工时", 
        display: p => createMetaBindNumber(p.file.path, "estimate_hours", p.estimate_hours || 0),
        property: "estimate_hours",
        editable: true
    },
    {
        id: "actual_hours", 
        name: "实际工时", 
        display: p => createMetaBindNumber(p.file.path, "actual_hours", p.actual_hours || 0),
        property: "actual_hours",
        editable: true
    },
    {
        id: "progress", 
        name: "进度%", 
        display: p => createMetaBindSlider(p.file.path, "progress", p.progress || 0),
        property: "progress",
        editable: true
    },
    {
        id: "due_date", 
        name: "截止日期", 
        display: p => createMetaBindDate(p.file.path, "due_date", p.due_date || ""),
        property: "due_date",
        editable: true
    },
    {
        id: "created", 
        name: "创建日期", 
        display: p => p.file.cday, 
        property: "file.cday",
        editable: false
    }
];

// 创建筛选控件
const container = this.container;

// 添加CSS样式
const style = document.createElement('style');
style.textContent = `
.demo-db-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
    border-bottom: 2px solid var(--interactive-accent);
    padding-bottom: 10px;
}
.demo-db-title {
    font-size: 1.8em;
    font-weight: bold;
    color: var(--interactive-accent);
}
.demo-db-controls {
    display: flex;
    gap: 8px;
    position: sticky;
    top: 0;
    z-index: 10;
    background-color: var(--background-primary);
    padding: 5px 0;
}
.demo-dropdown {
    position: relative;
    display: inline-block;
}
.demo-dropdown-content {
    display: none;
    position: absolute;
    background-color: var(--background-primary);
    min-width: 200px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 8px 0;
    z-index: 1;
    border-radius: 4px;
    max-height: 300px;
    overflow-y: auto;
    border: 1px solid var(--background-modifier-border);
}
.demo-applied-filters {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 10px;
    padding: 8px;
    background-color: rgba(var(--interactive-accent-rgb), 0.1);
    border-radius: 4px;
    min-height: 30px;
}
.demo-filter-pill {
    display: inline-flex;
    align-items: center;
    background-color: var(--interactive-accent);
    color: var(--text-on-accent);
    border-radius: 16px;
    padding: 4px 10px;
    margin-right: 8px;
    margin-bottom: 4px;
    font-size: 0.9em;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}
.demo-dropdown-content.show {
    display: block;
}
.demo-filter-item {
    padding: 8px 12px;
    cursor: pointer;
}
.demo-filter-item:hover {
    background-color: var(--background-secondary);
}
.demo-filter-select {
    padding: 8px 12px;
    border: none;
    width: 100%;
    background-color: var(--background-primary);
    color: var(--text-normal);
    cursor: pointer;
}
.demo-filter-pill-close {
    margin-left: 6px;
    cursor: pointer;
    font-weight: bold;
}
.demo-db-button {
    background-color: var(--background-secondary);
    border: 1px solid var(--background-modifier-border);
    border-radius: 6px;
    padding: 8px 12px;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 4px;
    font-weight: 500;
    transition: all 0.2s ease;
}
.demo-db-button:hover {
    background-color: var(--interactive-hover);
    transform: translateY(-1px);
}
.demo-sticky-controls-container {
    position: sticky;
    top: 0;
    z-index: 100;
    background-color: var(--background-primary);
    padding: 10px 0;
    margin-bottom: 10px;
    border-bottom: 1px solid var(--background-modifier-border);
}
.demo-table-count-info {
    margin-top: 10px; 
    padding: 12px; 
    background-color: var(--background-secondary); 
    border-radius: 6px; 
    text-align: center;
    font-weight: bold;
    border-left: 4px solid var(--interactive-accent);
}
.demo-no-results-message {
    padding: 40px 20px;
    text-align: center;
    background-color: var(--background-secondary);
    border-radius: 8px;
    margin: 20px 0;
}
.metabind-info-box {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 20px;
    text-align: center;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}
.metabind-demo-table {
    background-color: var(--background-secondary);
    border-radius: 8px;
    padding: 10px;
    margin: 10px 0;
}
/* Meta Bind 字段样式优化 */
.meta-bind-input {
    min-width: 120px;
    font-size: 0.9em;
}
.meta-bind-slider {
    width: 100px;
}
`;
container.appendChild(style);

// 添加 Meta Bind 信息提示
const metaBindInfo = container.createEl("div", {cls: "metabind-info-box"});
metaBindInfo.innerHTML = `
    <h3>🎨 Meta Bind 表格编辑演示</h3>
    <p>✨ 下方表格中的字段都可以直接编辑！修改后会自动保存到对应的任务文件中</p>
    <p>🔄 支持：下拉选择、数字输入、滑块调节、日期选择等多种输入方式</p>
`;

// 创建数据库标题和控件区域
const headerDiv = container.createEl("div", {cls: "demo-db-header"});
headerDiv.createEl("div", {cls: "demo-db-title", text: "📋 任务管理面板 - Meta Bind 可编辑版"});

// 创建固定在顶部的容器
const stickyContainer = container.createEl("div", {cls: "demo-sticky-controls-container"});
const controlsDiv = stickyContainer.createEl("div", {cls: "demo-db-controls"});

// 创建清除按钮
const clearButton = controlsDiv.createEl("button", {cls: "demo-db-button"});
clearButton.innerHTML = `<span>🗑️ 清除筛选</span>`;
clearButton.addEventListener("click", () => {
    currentFilters = [];
    renderFilterPills();
    renderTable();
    saveUserSettings();
});

// 创建排序按钮
const sortDropdown = controlsDiv.createEl("div", {cls: "demo-dropdown"});
const sortButton = sortDropdown.createEl("button", {cls: "demo-db-button"});
sortButton.innerHTML = `<span>📊 排序</span>`;
const sortContent = sortDropdown.createEl("div", {cls: "demo-dropdown-content"});

// 创建筛选按钮
const filterDropdown = controlsDiv.createEl("div", {cls: "demo-dropdown"});
const filterButton = filterDropdown.createEl("button", {cls: "demo-db-button"});
filterButton.innerHTML = `<span>🔍 筛选</span>`;
const filterContent = filterDropdown.createEl("div", {cls: "demo-dropdown-content"});

// 添加刷新按钮
const refreshButton = controlsDiv.createEl("button", {cls: "demo-db-button"});
refreshButton.innerHTML = `<span>🔄 刷新表格</span>`;
refreshButton.addEventListener("click", () => {
    console.log("手动刷新表格");
    location.reload(); // 重新加载页面以刷新 Meta Bind 字段
});

// 当前筛选和排序状态
let currentFilters = [];
if (savedFilters && savedFilters.length > 0) {
    currentFilters = JSON.parse(JSON.stringify(savedFilters));
} else {
    currentFilters = [];
}

let currentSort = savedSort || {
    column: "priority",
    ascending: false
};

// 添加排序选项
columns.forEach(column => {
    const sortItem = sortContent.createEl("div", {cls: "demo-filter-item"});
    sortItem.textContent = column.name + " ↑";
    sortItem.addEventListener("click", () => {
        currentSort = {
            column: column.id,
            ascending: true
        };
        updateSortButtonText();
        renderTable();
        saveUserSettings();
        sortContent.classList.remove("show");
    });
    
    const sortItemDesc = sortContent.createEl("div", {cls: "demo-filter-item"});
    sortItemDesc.textContent = column.name + " ↓";
    sortItemDesc.addEventListener("click", () => {
        currentSort = {
            column: column.id,
            ascending: false
        };
        updateSortButtonText();
        renderTable();
        saveUserSettings();
        sortContent.classList.remove("show");
    });
});

// 添加筛选字段选项
columns.forEach(column => {
    const filterItem = filterContent.createEl("div", {cls: "demo-filter-item"});
    filterItem.textContent = column.name;
    filterItem.addEventListener("click", () => {
        showFilterOptionsForColumn(column);
        filterContent.classList.remove("show");
    });
});

// 显示列筛选选项
function showFilterOptionsForColumn(column) {
    const modal = document.createElement("div");
    modal.style.cssText = `
        position: fixed; top: 0; left: 0; width: 100%; height: 100%;
        background-color: rgba(0, 0, 0, 0.5); display: flex;
        justify-content: center; align-items: center; z-index: 1000;
    `;
    
    const dialog = document.createElement("div");
    dialog.style.cssText = `
        background-color: var(--background-primary); padding: 20px;
        border-radius: 8px; width: 350px; max-height: 80%; overflow-y: auto;
        border: 1px solid var(--background-modifier-border);
    `;
    
    const header = document.createElement("div");
    header.style.cssText = "display: flex; justify-content: space-between; margin-bottom: 15px;";
    
    const title = document.createElement("h3");
    title.textContent = `筛选: ${column.name}`;
    title.style.margin = "0";
    
    const closeBtn = document.createElement("button");
    closeBtn.textContent = "×";
    closeBtn.style.cssText = `
        background: none; border: none; font-size: 1.5em; cursor: pointer;
        color: var(--text-muted);
    `;
    closeBtn.onclick = () => document.body.removeChild(modal);
    
    header.appendChild(title);
    header.appendChild(closeBtn);
    dialog.appendChild(header);
    
    // 获取该列所有可能的值
    let values = [];
    
    if (predefinedOptions[column.property]) {
        const existingValues = getExistingValues(column.property);
        values = [...new Set([...predefinedOptions[column.property], ...existingValues])];
    } else {
        values = getExistingValues(column.property);
    }
    
    function getExistingValues(property) {
        try {
            const valueSet = new Set();
            
            pages.forEach(p => {
                try {
                    let value;
                    if (property.startsWith("file.")) {
                        const propPath = property.split(".");
                        value = p;
                        for (const prop of propPath) {
                            value = value[prop];
                        }
                    } else {
                        value = p[property];
                    }
                    
                    if (Array.isArray(value)) {
                        value.forEach(v => {
                            if (v !== null && v !== undefined && v !== "") {
                                valueSet.add(String(v));
                            }
                        });
                    } else if (value !== null && value !== undefined && value !== "") {
                        valueSet.add(String(value));
                    }
                } catch (e) {}
            });
            
            return Array.from(valueSet).sort();
        } catch (e) {
            console.error("获取列值错误:", e);
            return [];
        }
    }
    
    // 创建选项
    const select = document.createElement("select");
    select.className = "demo-filter-select";
    select.style.cssText = "width: 100%; margin-bottom: 15px; padding: 8px; border-radius: 4px;";
    
    const defaultOption = document.createElement("option");
    defaultOption.value = "";
    defaultOption.textContent = "选择筛选条件...";
    select.appendChild(defaultOption);
    
    ["equals", "notEquals", "contains"].forEach(condition => {
        const option = document.createElement("option");
        option.value = condition;
        option.textContent = {
            "equals": "等于",
            "notEquals": "不等于", 
            "contains": "包含"
        }[condition];
        select.appendChild(option);
    });
    
    if (numberColumns.includes(column.property)) {
        ["greater", "less"].forEach(condition => {
            const option = document.createElement("option");
            option.value = condition;
            option.textContent = condition === "greater" ? "大于" : "小于";
            select.appendChild(option);
        });
    }
    
    dialog.appendChild(select);
    
    // 值输入区域
    const inputArea = document.createElement("div");
    
    const valueSelect = document.createElement("select");
    valueSelect.style.cssText = "width: 100%; padding: 8px; margin-bottom: 15px; display: none; border-radius: 4px;";
    
    const emptyOption = document.createElement("option");
    emptyOption.value = "";
    emptyOption.textContent = "选择一个值...";
    valueSelect.appendChild(emptyOption);
    
    if (Array.isArray(values)) {
        values.sort().forEach(value => {
            if (value !== null && value !== undefined && value !== "") {
                const option = document.createElement("option");
                option.value = String(value);
                option.textContent = String(value);
                valueSelect.appendChild(option);
            }
        });
    }
    
    const valueInput = document.createElement("input");
    valueInput.type = "text";
    valueInput.style.cssText = "width: 100%; padding: 8px; margin-bottom: 15px; display: none; border-radius: 4px;";
    valueInput.placeholder = "输入筛选值...";
    
    const numberInput = document.createElement("input");
    numberInput.type = "number";
    numberInput.style.cssText = "width: 100%; padding: 8px; margin-bottom: 15px; display: none; border-radius: 4px;";
    numberInput.placeholder = "输入数字...";
    
    inputArea.appendChild(valueSelect);
    inputArea.appendChild(valueInput);
    inputArea.appendChild(numberInput);
    dialog.appendChild(inputArea);
    
    select.onchange = () => {
        valueSelect.style.display = "none";
        valueInput.style.display = "none";
        numberInput.style.display = "none";
        
        const selectedOption = select.value;
        if (!selectedOption) return;
        
        if (numberColumns.includes(column.property) && ["greater", "less"].includes(selectedOption)) {
            numberInput.style.display = "block";
        } else if (values.length > 0 && ["equals", "notEquals", "contains"].includes(selectedOption)) {
            valueSelect.style.display = "block";
        } else {
            valueInput.style.display = "block";
        }
    };
    
    // 添加按钮
    const buttonContainer = document.createElement("div");
    buttonContainer.style.cssText = "display: flex; justify-content: flex-end; gap: 10px;";
    
    const cancelBtn = document.createElement("button");
    cancelBtn.textContent = "取消";
    cancelBtn.className = "demo-db-button";
    cancelBtn.onclick = () => document.body.removeChild(modal);
    
    const applyBtn = document.createElement("button");
    applyBtn.textContent = "应用";
    applyBtn.className = "demo-db-button";
    applyBtn.style.cssText = "background-color: var(--interactive-accent); color: var(--text-on-accent);";
    
    applyBtn.onclick = () => {
        const condition = select.value;
        let value = '';
        
        if (numberColumns.includes(column.property) && ["greater", "less"].includes(condition)) {
            value = numberInput.value.trim();
        } else if (valueSelect.style.display === "block") {
            value = valueSelect.value.trim();
        } else {
            value = valueInput.value.trim();
        }
        
        if (condition) {
            if (!value) {
                if (predefinedOptions[column.property] && predefinedOptions[column.property].length > 0) {
                    value = predefinedOptions[column.property][0];
                } else {
                    alert("请输入筛选值");
                    return;
                }
            }
            
            const existingFilterIndex = currentFilters.findIndex(f => f.column === column.id);
            
            if (existingFilterIndex >= 0) {
                currentFilters[existingFilterIndex] = {
                    column: column.id,
                    columnName: column.name,
                    condition,
                    value
                };
            } else {
                currentFilters.push({
                    column: column.id,
                    columnName: column.name,
                    condition,
                    value
                });
            }
            
            saveUserSettings();
            renderFilterPills();
            renderTable();
            document.body.removeChild(modal);
        } else {
            alert("请选择筛选条件");
        }
    };
    
    buttonContainer.appendChild(cancelBtn);
    buttonContainer.appendChild(applyBtn);
    dialog.appendChild(buttonContainer);
    
    modal.appendChild(dialog);
    document.body.appendChild(modal);
}

// 应用筛选条件过滤页面
function filterPages(pages) {
    if (currentFilters.length === 0) return pages;
    
    return pages.filter(page => {
        return currentFilters.every(filter => {
            const column = columns.find(c => c.id === filter.column);
            if (!column) return true;
            
            let pageValue;
            try {
                if (column.property.startsWith("file.")) {
                    const propPath = column.property.split(".");
                    let value = page;
                    for (const prop of propPath) {
                        value = value[prop];
                    }
                    pageValue = value;
                } else {
                    pageValue = page[column.property];
                }
            } catch (e) {
                return false;
            }
            
            if (pageValue === undefined || pageValue === null) {
                if (filter.condition === "notEquals") {
                    return filter.value !== "";
                }
                return false;
            }
            
            const stringValue = String(pageValue).toLowerCase();
            const filterValue = filter.value.toLowerCase();
            
            switch (filter.condition) {
                case "equals":
                    return stringValue === filterValue;
                case "notEquals":
                    return stringValue !== filterValue;
                case "contains":
                    return stringValue.includes(filterValue);
                case "greater":
                    return parseFloat(pageValue) > parseFloat(filter.value);
                case "less":
                    return parseFloat(pageValue) < parseFloat(filter.value);
                default:
                    return true;
            }
        });
    });
}

// 渲染筛选条件Pills
function renderFilterPills() {
    const existingPills = container.querySelector(".demo-applied-filters");
    if (existingPills) {
        existingPills.remove();
    }
    
    const pillsContainer = stickyContainer.createEl("div", {cls: "demo-applied-filters"});
    
    if (currentFilters.length === 0) {
        pillsContainer.createEl("div", {
            cls: "filter-info",
            text: "💡 点击上方的筛选按钮添加筛选条件",
            attr: {style: "color: var(--text-muted); font-style: italic;"}
        });
        return;
    }
    
    const filterLabel = pillsContainer.createEl("div", {
        cls: "filter-label",
        text: "🔍 当前筛选: ",
        attr: {style: "margin-right: 10px; font-weight: bold;"}
    });
    
    currentFilters.forEach((filter, index) => {
        const pill = pillsContainer.createEl("div", {cls: "demo-filter-pill"});
        
        let conditionText;
        switch (filter.condition) {
            case "equals": conditionText = "等于"; break;
            case "notEquals": conditionText = "不等于"; break;
            case "contains": conditionText = "包含"; break;
            case "greater": conditionText = "大于"; break;
            case "less": conditionText = "小于"; break;
            default: conditionText = filter.condition;
        }
        
        pill.textContent = `${filter.columnName} ${conditionText} ${filter.value}`;
        
        const closeBtn = pill.createEl("span", {cls: "demo-filter-pill-close", text: "×"});
        closeBtn.addEventListener("click", () => {
            currentFilters.splice(index, 1);
            renderFilterPills();
            renderTable();
            saveUserSettings();
        });
    });
}

// 更新排序按钮文本
function updateSortButtonText() {
    const column = columns.find(c => c.id === currentSort.column);
    if (column) {
        sortButton.innerHTML = `<span>📊 排序: ${column.name} ${currentSort.ascending ? '↑' : '↓'}</span>`;
    }
}

// 安全的排序函数
function safeSort(pages, sortFunc) {
    try {
        return pages.sort(sortFunc);
    } catch (error) {
        console.error("排序错误:", error);
        return pages.sort((a, b) => a.file.name.localeCompare(b.file.name));
    }
}

// 渲染表格函数 - Meta Bind 增强版
function renderTable() {
    const existingTable = container.querySelector("table");
    if (existingTable) {
        existingTable.remove();
    }
    
    const noResultsMessage = container.querySelector(".demo-no-results-message");
    if (noResultsMessage) {
        noResultsMessage.remove();
    }
    
    const existingCountInfo = container.querySelector(".demo-table-count-info");
    if (existingCountInfo) {
        existingCountInfo.remove();
    }
    
    // 应用筛选
    let filteredPages = pages;
    
    if (currentFilters.length > 0) {
        filteredPages = filterPages(filteredPages);
    }
    
    // 如果没有匹配结果
    if (filteredPages.length === 0 && currentFilters.length > 0) {
        const messageDiv = container.createEl("div", {
            cls: "demo-no-results-message"
        });
        
        messageDiv.innerHTML = `
            <h3>😅 没有找到匹配的任务</h3>
            <p>请尝试调整筛选条件或清除所有筛选</p>
            <button class="demo-db-button clear-filters-btn" style="margin: 10px auto; display: block; background-color: var(--interactive-accent); color: var(--text-on-accent);">
                🗑️ 清除所有筛选条件
            </button>
        `;
        
        messageDiv.querySelector(".clear-filters-btn").addEventListener("click", () => {
            currentFilters = [];
            renderFilterPills();
            renderTable();
            saveUserSettings();
        });
        
        try {
            dv.table(
                columns.map(col => col.name),
                []
            );
            
            const countInfo = container.createEl("div", {
                cls: "demo-table-count-info"
            });
            countInfo.innerHTML = `<span>📊 显示任务: 0 / ${totalTasks}</span>`;
        } catch (error) {
            console.error("表格渲染错误:", error);
        }
        
        return;
    }
    
    // 应用排序
    const sortFunc = getSortFunction(currentSort.column);
    const sortedPages = currentSort.ascending ? 
        safeSort([...filteredPages], sortFunc) : 
        safeSort([...filteredPages], sortFunc).reverse();
    
    try {
        // 创建表格 - 使用 Meta Bind 字段
        dv.table(
            columns.map(col => col.name), 
            sortedPages.map(p => columns.map(col => {
                try {
                    return col.display(p);
                } catch (error) {
                    console.error(`显示错误 (${col.id}):`, error);
                    return "-";
                }
            }))
        );
        
        // 添加计数功能
        const countInfo = container.createEl("div", {
            cls: "demo-table-count-info"
        });
        
        countInfo.innerHTML = `<span>📊 显示任务: ${sortedPages.length} / ${totalTasks} | 🎯 已完成: ${completedTasks} (${completionRate}%) | ✨ Meta Bind 可编辑模式</span>`;
    } catch (error) {
        console.error("表格渲染错误:", error);
        const errorDiv = container.createEl("div");
        errorDiv.innerHTML = `<p style="color: red">⚠️ 表格渲染出错: ${error.message}</p>`;
    }
}

// 获取排序函数
function getSortFunction(columnId) {
    switch(columnId) {
        case "filename":
            return (a, b) => (a?.file?.name || "").localeCompare(b?.file?.name || "");
        case "created":
            return (a, b) => (a?.file?.cday || 0) - (b?.file?.cday || 0);
        case "priority":
            return (a, b) => {
                const priorityOrder = {"高": 3, "中": 2, "低": 1};
                const aVal = priorityOrder[a.priority] || 0;
                const bVal = priorityOrder[b.priority] || 0;
                return aVal - bVal;
            };
        default:
            const column = columns.find(c => c.id === columnId);
            if (!column) return (a, b) => 0;
            
            const property = column.property;
            
            if (numberColumns.includes(property) || ["estimate_hours", "actual_hours", "progress"].includes(columnId)) {
                return (a, b) => {
                    let aVal, bVal;
                    try {
                        if (property.startsWith("file.")) {
                            const propPath = property.split(".");
                            let valueA = a;
                            let valueB = b;
                            for (const prop of propPath) {
                                valueA = valueA?.[prop];
                                valueB = valueB?.[prop];
                            }
                            aVal = parseFloat(valueA) || 0;
                            bVal = parseFloat(valueB) || 0;
                        } else {
                            aVal = parseFloat((a?.[property] || "0").toString().replace("%", "")) || 0;
                            bVal = parseFloat((b?.[property] || "0").toString().replace("%", "")) || 0;
                        }
                    } catch (e) {
                        aVal = 0;
                        bVal = 0;
                    }
                    return aVal - bVal;
                };
            } else {
                return (a, b) => {
                    let aVal, bVal;
                    try {
                        if (property.startsWith("file.")) {
                            const propPath = property.split(".");
                            let valueA = a;
                            let valueB = b;
                            for (const prop of propPath) {
                                valueA = valueA?.[prop];
                                valueB = valueB?.[prop];
                            }
                            aVal = String(valueA || "");
                            bVal = String(valueB || "");
                        } else {
                            aVal = String(a?.[property] || "");
                            bVal = String(b?.[property] || "");
                        }
                    } catch (e) {
                        aVal = "";
                        bVal = "";
                    }
                    return aVal.localeCompare(bVal);
                };
            }
    }
}

function saveUserSettings() {
    try {
        if (app.plugins.plugins["metaedit"]) {
            const { update } = app.plugins.plugins["metaedit"].api;
            
            console.log("保存筛选条件:", JSON.stringify(currentFilters));
            
            update("savedFilters", JSON.stringify(currentFilters), currentFile.path);
            update("savedSort", JSON.stringify(currentSort), currentFile.path);
            
            console.log("设置已保存");
        } else {
            console.log("MetaEdit插件未安装");
            dv.current().savedFilters = JSON.stringify(currentFilters);
            dv.current().savedSort = JSON.stringify(currentSort);
        }
    } catch (error) {
        console.error("保存设置失败:", error);
    }
}

// 事件监听器
sortButton.addEventListener("click", event => {
    event.stopPropagation();
    sortContent.classList.toggle("show");
    filterContent.classList.remove("show");
});

filterButton.addEventListener("click", event => {
    event.stopPropagation();
    filterContent.classList.toggle("show");
    sortContent.classList.remove("show");
});

document.addEventListener("click", () => {
    sortContent.classList.remove("show");
    filterContent.classList.remove("show");
});

// 初始渲染
updateSortButtonText();
renderTable();
renderFilterPills();

console.log("应用筛选条件:", currentFilters);

setInterval(() => {
    const pillsContainer = container.querySelector(".demo-applied-filters");
    if (!pillsContainer && currentFilters.length > 0) {
        console.log("检测到筛选条件显示丢失，重新渲染");
        renderFilterPills();
    }
}, 2000);
```

## 📝 Meta Bind 可编辑表格使用说明

### 🎨 **新增功能 - 表格内直接编辑**

1. **状态字段** - 下拉选择框：未开始/进行中/已完成/已暂停
2. **优先级字段** - 下拉选择框：高/中/低  
3. **分类字段** - 下拉选择框：前端开发/后端开发/设计/测试/文档/运维
4. **负责人字段** - 下拉选择框：张三/李四/王五/赵六
5. **预估工时/实际工时** - 数字输入框
6. **进度字段** - 滑块控件 (0-100%)
7. **截止日期** - 日期选择器

### 🔄 **实时同步机制**
- 所有编辑会立即保存到对应任务文件的 frontmatter
- DataView 会自动检测文件变化并更新显示
- 支持多用户协作编辑

### 🛠️ **Meta Bind 语法示例**

在表格中使用的 Meta Bind 语法：
- `INPUT[select():filePath#property]` - 下拉选择
- `INPUT[number():filePath#property]` - 数字输入  
- `INPUT[slider():filePath#property]` - 滑块控件
- `INPUT[date():filePath#property]` - 日期选择

### 🎯 **操作指南**
1. 直接点击表格中的任何可编辑字段
2. 修改值后，变更会自动保存
3. 使用"🔄 刷新表格"按钮重新加载 Meta Bind 字段
4. 筛选和排序功能与编辑功能完全兼容

### ⚡ **技术优势**
- **无需手动保存** - 实时同步到文件
- **类型安全** - 每种字段类型都有适当的输入控件  
- **数据一致性** - 直接修改源文件，保证数据准确性
- **用户体验** - 类似电子表格的编辑体验