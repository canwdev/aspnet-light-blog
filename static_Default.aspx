<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="static_Default.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="jumbotron hidden-xs">
        <h1>山紫水明</h1>
        <p>さんしすいめい scenic beauty. This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
        <p><a class="btn btn-primary btn-lg" href="Detail.aspx" role="button">详细信息</a></p>
    </div>
    <div class="row">
        <div class="col-md-9">
            <!-- 文章列表 -->
            <div class="bs-callout bs-callout-default">
                <div class="media">
                    <div class="media-body">
                        <h4 class="media-heading"><a href="Detail.aspx">Media heading</a></h4>
                        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
                    </div>
                    <div class="media-right">
                        <a href="#">
                            <img src="res/test.png" />
                             </a>
                    </div>
                </div>
            </div>

            <!-- 文章列表分页 -->
             <center>
                  <nav aria-label="Page navigation">
                  <ul class="pagination">
                    <li>
                      <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                      <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                  </ul>
                </nav>
            </center>
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

