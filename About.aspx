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
                <img src="res/nyan.gif" class="img-thumbnail" style="height: 50%; width: 50%;" /><br />
            </div>
        </div>
    </div>
    <!-- 导航 -->
    <div class="col-md-3">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">标签</h3>
            </div>
            <ul class="nav bs-docs-sidenav">
                <asp:ListView ID="ListView3" runat="server" DataKeyNames="id" DataSourceID="LinqArticleTags">
                        <ItemTemplate>
                            <li class=""><a href="Detail.aspx?tagid=<%# Eval("id") %>">
                                <asp:Label ID="article_tag_nameLabel" runat="server" Text='<%# Eval("article_tag_name") %>' /></a>
                            </li>
                        </ItemTemplate>

                    </asp:ListView>

                    <asp:LinqDataSource ID="LinqArticleTags" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" TableName="dc_article_tag">
                    </asp:LinqDataSource>
            </ul>
        </div>
    </div>

    
</asp:Content>

