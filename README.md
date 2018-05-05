# iyeeku

项目说明
    
        该项目个人用于实战学习互联网开发一些技术，微服务设计等等.......

演示地址 

## 特性

-   基于spring + springMVC + myBatis 开发 ，Maven管理项目，JDK1.8，数据库：ORACLE。
-   页面设计全仿写[开源中国](https://www.oschina.net/),（UI设计太头疼，主要用于学习互联网架构知识，全仿写页面）
-   搜索引擎使用 [ElasticSearch](http://www.elastic.co/products/elasticsearch) , 分布式服务框架使用 [Dubbo](http://dubbo.apache.org/)。
-   富文本编辑器 [ckeditor](https://github.com/ckeditor)
## 更新日志

### 1.1.0

`2018-04-29`

-   基础环境搭建

## 开发构建

### 目录结构

```bash
├── /dist/           # 项目输出目录
├── /iyeeku-blog/    # 博客模块
│ ├── /src/          # 源代码
│ │ ├── skin.less    # 全局样式
│ │ └── vars.less    # 全局样式变量
│ ├── /routes/       # 路由组件 
├── package.json     # 项目信息
├── .init.sql        # 数据脚本
└── .pom.xml         # maven依赖配置文件
```

文件命名说明

