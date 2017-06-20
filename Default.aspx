<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="jumbotron animated fadeIn">
        <h1><%=dcSettings.LoadValue("hero_title")%></h1>
        <p><%=dcSettings.LoadValue("hero_context")%></p>
        <p><a class="btn btn-primary btn-lg hvr-grow" href="Detail.aspx?id=<%=dcSettings.LoadValue("hero_link_id")%>" role="button">详细信息</a></p>
    </div>
    <div class="row">
        <div class="col-md-10">

            <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="LinqHomePageArticle">

                <ItemTemplate>
                    <!-- 文章列表 -->
                    <div class="card">
                        <div class="media">
                            <div class="media-left">
                                <a href="Detail.aspx?id=<%# Eval("id") %>">
                                    <div class="">
                                        <img class="card_title_img"  style="border:none" src="<%# Eval("title_img") %>"/>
                                    </div>
                                </a>
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="Detail.aspx?id=<%# Eval("id") %>">
                                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' /></a>
                                    <div style="float:right;"><small><%# Eval("time_update") %>&nbsp;&nbsp;<%# Eval("author") %></small></div>
                                </h3>
                                
                                <asp:Label ID="article_introLabel" runat="server" Text='<%# Eval("article_intro") %>' /><a href="Detail.aspx?id=<%# Eval("id") %>">...查看更多</a>
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
        <!-- 标签导航 -->
        <div class="col-md-2">
            <asp:ListView ID="ListView2" runat="server"></asp:ListView>
            <div class="bs-callout bs-callout-default">
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


    </div>
</asp:Content>

