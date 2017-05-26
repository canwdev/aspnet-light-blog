<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="index" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="jumbotron hidden-xs">
        <h1>山紫水明</h1>
        <p>さんしすいめい scenic beauty. This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
        <p><a class="btn btn-primary btn-lg" href="Detail.aspx?id=4" role="button">详细信息</a></p>
    </div>
    <div class="row">
        <div class="col-md-9">

            <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="LinqHomePageArticle">

                <ItemTemplate>
                    <!-- 文章列表 -->
                    <div class="bs-callout bs-callout-default">
                        <div class="media">
                            <div class="media-body">
                                <h4 class="media-heading">
                                    <a href="Detail.aspx?id=<%# Eval("id") %>">
                                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' /></a>
                                </h4>
                                <asp:Label ID="article_introLabel" runat="server" Text='<%# Eval("article_intro") %>' />
                            </div>
                            <div class="media-right">
                                <a href="Detail.aspx?id=<%# Eval("id") %>">
                                    <img src="res/nyan.gif" height="64px" width="64px"/>
                                </a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <!-- 文章列表分页 -->
                    <center>

 <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                <Fields>
                    <asp:NextPreviousPagerField FirstPageText="&laquo;" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="data_pager" />
                    <asp:NextPreviousPagerField ButtonCssClass="data_pager" PreviousPageText="&lt;" ShowNextPageButton="False" />
                    <asp:NumericPagerField CurrentPageLabelCssClass="data_pager" NumericButtonCssClass="data_pager" />
                    <asp:NextPreviousPagerField ShowPreviousPageButton="False" ButtonCssClass="data_pager" NextPageText="&gt;" />
                    <asp:NextPreviousPagerField LastPageText="&raquo;" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="data_pager" />
                </Fields>
            </asp:DataPager>

                </center>
                </LayoutTemplate>
            </asp:ListView>

            <asp:LinqDataSource ID="LinqHomePageArticle" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" TableName="dc_article" OrderBy="id desc">
            </asp:LinqDataSource>

            

        </div>
        <!-- 导航 -->
        <div class="col-md-3">
            <div class="bs-callout bs-callout-default">
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
    </div>
</asp:Content>

