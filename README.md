# umi project

## Getting Started

Install dependencies,

```bash
$ yarn
```

Start the dev server,

```bash
$ yarn start
```

```
.
├── README.md
├── codeGen      // 脚本模版
│   ├── cache.js
│   ├── componnet
│   │   ├── index.less.tpl
│   │   └── index.tsx.tpl
│   ├── data.config.js
│   ├── data.json.js
│   ├── drawer
│   │   ├── definition.ts.tpl
│   │   ├── detail.tsx.tpl
│   │   ├── detail2.tsx.tpl
│   │   ├── form.tsx.tpl
│   │   ├── index.less.tpl
│   │   ├── index.tsx.tpl
│   │   ├── mock.ts.tpl
│   │   ├── model.ts.tpl
│   │   ├── print.tpl
│   │   ├── service.ts.tpl
│   │   └── upload.tsx.tpl
│   ├── hooks
│   │   ├── definition.ts.tpl
│   │   ├── detail.tsx.tpl
│   │   ├── form.tsx.tpl
│   │   ├── index.less.tpl
│   │   ├── index.tsx.tpl
│   │   ├── mock.ts.tpl
│   │   ├── model.ts.tpl
│   │   ├── print.tsx.tpl
│   │   ├── service.ts.tpl
│   │   └── upload.tsx.tpl
│   └── page
├── config // 配置信息
│   ├── config.dev.ts
│   ├── config.mock.ts
│   ├── config.pre.ts
│   ├── config.routes.ts
│   ├── config.test.ts
│   ├── config.ts
│   ├── defaultSettings.ts
│   └── proxy.ts
├── mock   // 模拟数据
│   ├── global.ts
│   └── user.ts
├── package.json
├── public // 静态资源
│   ├── assets
│   ├── favicon1.ico
│   └── logo.png
├── src
│   ├── access.ts // 权限
│   ├── app.tsx // 入口
│   ├── assets  // 资源
│   │   ├── fonts
│   │   └── images
│   ├── commonType.ts // 公共 interface
│   ├── components // 组件
│   │   ├── Footer
│   │   │   └── index.tsx
│   │   ├── HeaderDropdown
│   │   │   ├── index.less
│   │   │   └── index.tsx
│   │   ├── PageLoading
│   │   │   └── index.tsx
│   │   └── RightContent
│   │       ├── AvatarDropdown.tsx
│   │       ├── index.less
│   │       └── index.tsx
│   ├── consts // 常量
│   │   ├── const.ts
│   │   └── pagePath.ts
│   ├── global.less
│   ├── models // store
│   ├── pages // 页面
│   │   ├── 404.tsx
│   │   ├── index.less
│   │   └── index.tsx
│   ├── services // 请求
│   │   ├── API.d.ts
│   │   ├── login.ts
│   │   └── user.ts
│   ├── styles // 样式
│   │   ├── common-fonts.less
│   │   ├── common-layout.less
│   │   ├── common-page.less
│   │   ├── common-widget.less
│   │   ├── overwrite.less
│   │   └── print.less
│   └── utils // 工具
│       ├── auth.ts
│       ├── cache
│       │   ├── CacheClass.ts
│       │   └── index.ts
│       ├── money.ts
│       ├── request.ts
│       └── util.ts
├── tsconfig.json // ts配置
├── typings.d.ts // 类型
└── yarn.lock

25 directories, 75 files

```