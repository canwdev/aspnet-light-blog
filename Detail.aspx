<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="col-md-9">

        <!-- 正文内容 -->
        <article>
            <h2 class="media-heading">
                <asp:Label ID="lbl_title" runat="server" Text="标题"></asp:Label></h2>
            <div class="text-right"><small>
                <asp:Label ID="lbl_edit" runat="server" Text="编辑" Visible="False"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span><asp:Label ID="lbl_tag" runat="server" Text="标签无效"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="glyphicon glyphicon-time" aria-hidden="true"></span><asp:Label ID="lbl_time_update" runat="server" Text="更新时间"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span><asp:Label ID="lbl_author" runat="server" Text="作者"></asp:Label>
            </small></div>
            <hr />
            <div class="main_article animated fadeIn">
                <asp:Label ID="lbl_article_context" runat="server" Text="正文内容"></asp:Label>
            </div>
            

        </article>

        <!-- 正文的分页栏 
        <nav aria-label="...">
            <ul class="pager">
                <li class="previous disabled"><a href="#">Previous</a></li>
                <li class="next"><a href="#">Next</a></li>
            </ul>
        </nav>-->
        <hr />
        <div>
        <!-- 评论控件 
            <div class="bs-example bs-example-form">
                <div class=" form-inline">
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                        <input type="text" class="form-control" id="exampleInputName2" placeholder="Your Name">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
                        <input type="email" class="form-control" id="exampleInputEmail2" placeholder="name@example.com">
                    </div>
                </div>

                <textarea class="form-control span6" rows="4" placeholder="输入你的评论，评论审核成功后显示。" style="margin-bottom: 10px;"></textarea>
                <div style="text-align: right;">
                    <button type="submit" class="btn">发布评论</button>
                </div>
            </div>
            <!-- 评论本体 
            <div class="bs-callout bs-callout">
                <h4 class="media-heading">测试评论<small class="text-right"><a href="mailto:name@email.com">name@email.com</a></small></h4>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
            </div>
            <!-- 评论分页 
            <nav aria-label="Page navigation" class="invisible">
                <ul class="pager">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>-->
            
        </div>
   </div>
  
    <!-- 标签导航 -->
        <div class="col-md-3">
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
</asp:Content>

