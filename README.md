# 全栈开发技能清单

> 基于 Skills.sh 生态和 Superpowers 框架整理的软件开发全栈技能清单

## 简介

本项目整理了软件开发全流程中所需的 AI 技能清单，涵盖从需求分析到部署上线的完整开发周期。所有技能均来自 [Skills.sh](https://skills.sh/) 生态，可通过 `npx skills add` 命令快速安装使用。

## 技能分类

| 类别 | 技能数量 | 核心技能 |
| ---- | -------- | -------- |
| 需求分析 | 3 | brainstorming, requirements-analysis, writing-plans |
| 产品设计 | 4 | design-system, design-system-starter |
| UI/UX设计 | 4 | frontend-ui-ux, ui-ux-pro-max, accessibility |
| 前端开发 | 10 | vue, react, frontend-developer, frontend-blueprint |
| 后端开发 | 6 | backend-development, golang-backend-development |
| 数据库设计 | 6 | database-schema-design, database-schema-designer |
| API设计 | 5 | api-design, api-design-patterns, api-design-framework |
| 测试 | 6 | test-driven-development, playwright-testing |
| DevOps | 17 | kubernetes, ci-cd, aws, vercel-deploy |
| 代码质量 | 12 | coding-standards, lint, systematic-debugging |
| AI/LLM | 35+ | langchain, rag-implementation, qdrant, prompt-engineering |
| 项目管理 | 4 | executing-plans, dispatching-parallel-agents |
| 技能开发 | 2 | writing-skills, using-superpowers |

## 快速开始

### 安装必装技能

```bash
# 需求分析
npx skills add jwynia/agent-skills@requirements-analysis

# 数据库设计
npx skills add supercent-io/skills-template@database-schema-design

# API设计
npx skills add yonatangross/orchestkit@api-design

# 后端开发
npx skills add mrgoonie/claudekit-skills@backend-development

# 前端开发
npx skills add onmax/nuxt-skills@vue

# 编码规范
npx skills add sickn33/antigravity-awesome-skills@coding-standards
```

### 安装 Superpowers 完整技能包

```bash
npx skills add obra/superpowers
```

## 完整开发工作流

```
需求分析阶段
brainstorming → requirements-analysis → writing-plans
        ↓
设计阶段
design-system → frontend-ui-ux → database-schema-design
        ↓
开发阶段
frontend-developer/backend-development → api-design
        ↓
test-driven-development (RED-GREEN-REFACTOR)
        ↓
测试阶段
testing → playwright-testing → a11y-testing
        ↓
代码审查
requesting-code-review → receiving-code-review
        ↓
部署阶段
using-git-worktrees → ci-cd → deploy → finishing-a-development-branch
```

## 文件说明

| 文件 | 说明 |
| ---- | ---- |
| [全栈开发技能清单.md](./全栈开发技能清单.md) | 完整的技能清单文档 |
| [download-skills.sh](./download-skills.sh) | Linux/macOS 批量安装脚本 |
| [download-skills-windows.ps1](./download-skills-windows.ps1) | Windows 批量安装脚本 |

## 相关资源

- [Skills.sh 官网](https://skills.sh/)
- [Superpowers GitHub](https://github.com/obra/superpowers)

## License

[MIT](./LICENSE)
