# Digital Creek Lightweight Blog

## 说明
~~~
用ASP.NET实现的一个轻量级博客（实验版）
VisualStudio 2017 + SQL Server 2008 R2
~~~

## 目前实现的功能
~~~
1. 管理员的登录、密码修改
2. 文章的发布编辑删除
3. 用标签来进行文章分类
~~~

## 目录结构
~~~
digital_creek			根目录
│  .gitattributes		
│  .gitignore			
│  About.aspx			关于页面
│  About.aspx.cs
│  Default.aspx			首页
│  Default.aspx.cs
│  Detail.aspx			文章页
│  Detail.aspx.cs
│  index.master			前台模板页
│  index.master.cs
│  README.md
│  Web.config			网站配置
│  Web.Debug.config
│
├─App_Code
│      DataClasses.dbml	数据库引用
│      DataClasses.dbml.layout
│      DataClasses.designer.cs
│      Js.cs			快速调用JavaScript类
│      PrivateKey.cs	用户密码加密私钥
│      RSA.cs			RSA加密算法与用户验证
│
├─bootstrap				使用了开源的bootstrap前端框架
│
├─css
│      animate.css		使用了开源的animate.css
│      dc_index.css
│      debug.css
│      docs.css			使用了bootstrap官方文档中的docs.css
│      docs.min.css
│      hover.css		使用了开源的animate.css
│
├─database_backup		备份
│      dc_Database.bak	SQL Server 2008 R2 数据库备份
│
├─dc_admin				管理员后台
│  │  admin.master		管理员后台母版页
│  │  admin.master.cs
│  │  admin_login.aspx	管理员登录
│  │  admin_login.aspx.cs
│  │  admin_modify_info.aspx	修改管理员信息
│  │  admin_modify_info.aspx.cs
│  │  article_addmod.aspx		添加与修改文章
│  │  article_addmod.aspx.cs
│  │  article_list.aspx			显示文章编辑列表
│  │  article_list.aspx.cs
│  │  article_tag_addmod.aspx	添加与修改文章标签
│  │  article_tag_addmod.aspx.cs
│  │  article_tag_list.aspx		显示标签编辑列表
│  │  article_tag_list.aspx.cs
│  │  Default.aspx				管理员后台首页
│  │  Default.aspx.cs
│  │
│  └─css
│
├─js
└─res		资源文件
~~~