# Digital Creek Lightweight Blog

## 项目说明
~~~
这是一个用ASP.NET实现的轻量级博客（实验版）
VisualStudio 2017 + SQL Server 2008 R2
~~~

## 目前实现的功能
~~~
1. 管理员登录、密码修改
2. 文章发布、编辑、删除
3. 用标签来进行文章分类
~~~

## 更新日志
~~~
2017-6-10 20:47:37
修复严重bug：在IIS下不能登录的问题，修复秘钥登录方法
~~~

## 部分目录文件结构
~~~
digital_creek			根目录		
│  Default.aspx			首页
│  Default.aspx.cs
│  Detail.aspx			文章页
│  Detail.aspx.cs
│  index.master			前台模板页
│  index.master.cs
│
├─App_Code
│      DataClasses.dbml			数据库引用
│      DataClasses.dbml.layout
│      DataClasses.designer.cs
│      Js.cs					快速调用JavaScript类
│      Key.cs					存放公钥和私钥
│      RSA.cs					RSA加解密与用户验证
│
├─database_backup		备份
│      dc_Database.bak	SQLServer2008R2数据库备份
│
├─dc_admin				管理后台
│  │  admin.master		后台母版页
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
│
└─res		资源文件
~~~

## 感谢以下开源项目
* [Bootstrap](http://v3.bootcss.com/)
* [Bootstrap Cerulean Theme](http://bootswatch.com/cerulean/)
* [animate.css](https://github.com/daneden/animate.css)
* [hover.css](https://github.com/IanLunn/Hover)
* [jQuery](https://jquery.com/)
* [wangEditor](https://github.com/wangfupeng1988/wangEditor)
