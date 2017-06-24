<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="col-md-10">

        <!-- 正文内容 -->
        <article>
            <div id="title_img" class="jumbotron detail_headimg">
                <h2 class="media-heading">
                    <asp:Label ID="lbl_title" runat="server" Text="标题"></asp:Label></h2>
                <div class="text-right">
                    <small>
                        <asp:Label ID="lbl_edit" runat="server" Text="编辑" Visible="False"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                        <asp:Label ID="lbl_tag" runat="server" Text="标签无效"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                        <asp:Label ID="lbl_time_update" runat="server" Text="更新时间"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        <asp:Label ID="lbl_author" runat="server" Text="作者"></asp:Label>
                    </small>
                </div>
            </div>

            <hr />
            <div class="main_article animated fadeIn">
                <asp:Label ID="lbl_article_context" runat="server" Text=""></asp:Label>
            </div>


        </article>

        <hr />

        <asp:Panel ID="Panel_comment_all" runat="server">
            <!-- 评论控件 -->
            <div class="bs-example bs-example-form" id="id_comment_area">
                <asp:Panel ID="Panel_comment_need_login" runat="server">
                    <h4>请<a href="dc_admin/admin_login.aspx">登录</a>后发表评论</h4>
                </asp:Panel>
                <asp:Panel ID="Panel_comment_disabled" runat="server" Visible="False">
                    <h4>评论关闭</h4>
                </asp:Panel>
                <asp:Panel ID="Panel_comment_area" runat="server" Visible="False">
                    <div class=" form-inline">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                            <asp:TextBox ID="txt_uname" runat="server" class="form-control" placeholder="Your Name" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>
                    <asp:TextBox ID="txt_comment_text" runat="server" TextMode="MultiLine" Rows="4" placeholder="写下你的评论..." 
                         required="yes" class="form-control span6" Style="margin-bottom: 10px;" ></asp:TextBox>
                    <div style="text-align: right;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入评论" ControlToValidate="txt_comment_text" Display="Dynamic" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                        <asp:Button ID="btn_submit_comment" runat="server" Text="评论" class="btn btn-primary" OnClick="btn_submit_comment_Click" />
                    </div>
                </asp:Panel>
            </div>
            <asp:Panel ID="Panel_comments" runat="server">
                <legend>全部评论</legend>

                <!-- 评论本体 -->
                <asp:ListView ID="ListView_comments" runat="server" DataKeyNames="id" DataSourceID="LinqAtricleComments">
                    <EmptyDataTemplate>
                        <div class="bs-callout bs-callout">没有评论</div>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="bs-callout bs-callout">
                            <h4 class="media-heading">
                                <a href="dc_admin/user_info.aspx?id=<%# Eval("author_id")%>" >
                                <img src="<%# dcSettings.LoadUserHeadImg((int) Eval("author_id")) %>"  class="img-circle" style="border-radius: 50% !important;" Height="32" Width="32" />
                                <%# dcSettings.LoadUserName((int)Eval("author_id"))%>
                                </a><div style="float: right;"><small><%# Eval("time_commit") %><%--&nbsp;&nbsp;#<%# Eval("id") %>--%></small></div>
                            </h4>
                            <p><%# Eval("comment_text") %></p>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                        <div class="text-center">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="10">
                            <Fields>
                                <asp:NextPreviousPagerField FirstPageText="&laquo;" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="data_pager" />
                                <asp:NextPreviousPagerField ButtonCssClass="data_pager" PreviousPageText="&lt;" ShowNextPageButton="False" />
                                <asp:NumericPagerField CurrentPageLabelCssClass="data_pager" NumericButtonCssClass="data_pager" />
                                <asp:NextPreviousPagerField ShowPreviousPageButton="False" ButtonCssClass="data_pager" NextPageText="&gt;" />
                                <asp:NextPreviousPagerField LastPageText="&raquo;" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="data_pager" />
                            </Fields>
                        </asp:DataPager>
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:LinqDataSource ID="LinqAtricleComments" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" TableName="dc_article_comment" Where="article_id == @article_id &amp;&amp; authorized == @authorized" OrderBy="id desc">
                    <WhereParameters>
                        <asp:QueryStringParameter DefaultValue="" Name="article_id" QueryStringField="id" Type="Int32" />
                        <asp:Parameter DefaultValue="yes" Name="authorized" Type="String" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </asp:Panel>
        </asp:Panel>

    </div>

    <!-- 标签导航 -->
    <div class="col-md-2">
        <div class="bs-callout bs-callout-default">
            <div class="panel-heading">
                <h3 class="panel-title">标签</h3>
            </div>
            <ul class="nav bs-docs-sidenav">

                <asp:ListView ID="ListView_tags" runat="server" DataKeyNames="id" DataSourceID="LinqArticleTags">
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

