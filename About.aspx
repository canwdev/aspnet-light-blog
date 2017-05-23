<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- 关于 -->
    <div class="col-md-9">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">关于 DigitalCreek 轻型博客</h3>
            </div>
            <div class="panel-body">
                <p>一个轻型博客，基于以下技术构建：ASP.NET、Bootstrap</p>
                <p>By canw</p>
                <img src="res/dc_logo.png" class="img-thumbnail" style="height: 80%; width: 80%;" /><br />
            </div>
        </div>
    </div>
    <!-- 导航 -->
    <div class="col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">轻型博客</h3>
            </div>
            <ul class="nav bs-docs-sidenav">
                <li class=""><a href="#overview-doctype">HTML5 文档类型</a></li>
                <li class=""><a href="#overview-mobile">移动设备优先</a></li>
                <li class=""><a href="#overview-type-links">排版与链接</a></li>
                <li class=""><a href="#overview-normalize">Normalize.css</a></li>
                <li class=""><a href="#overview-container">布局容器</a></li>
            </ul>
        </div>
    </div>
</asp:Content>

