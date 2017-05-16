<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
      <div class="col-md-9">

          <article>
             <h2 class="media-heading"><a href="#">Media heading</a></h2>
             <h3 class="text-right"><small>Right aligned text.</small></h3>
             <hr />
             <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.</p>
              <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
                  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
                  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
                  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
                  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
              </p>
              <img src="res/dc_logo.png" class="img-thumbnail" style="height:50%; width:50%;"/>
              <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.</p>
              <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
                  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
                  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
                  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
                  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
              </p>
  
          </article>

        <nav aria-label="...">
          <ul class="pager">
            <li class="previous disabled"><a href="#">Previous</a></li>
            <li class="next"><a href="#">Next</a></li>
          </ul>
        </nav>
          <hr />

        <div>
              <div class="bs-example">
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

                  <textarea class="form-control span6" rows="4" placeholder="输入你的评论，评论审核成功后显示。" style="margin-top:10px; margin-bottom:10px;"></textarea>
                  <div style="text-align:right;"><button type="submit" class="btn btn-default">发布评论</button></div>
              </div>

              <div class="bs-callout bs-callout">
                    <h4 class="media-heading">测试评论<small class="text-right"><a href="mailto:name@email.com">name@email.com</a></small></h4>
                    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
              </div>

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
            </nav>

        <hr />
        </div>

      </div>

      <div class="col-md-3 hidden-xs">
          <nav class="bs-docs-sidebar">
            <ul class="nav bs-docs-sidenav">
               <li class=""><a href="#overview-doctype">HTML5 文档类型</a></li>
               <li class=""><a href="#overview-mobile">移动设备优先</a></li>
               <li class=""><a href="#overview-type-links">排版与链接</a></li>
               <li class=""><a href="#overview-normalize">Normalize.css</a></li>
               <li class=""><a href="#overview-container">布局容器</a></li>
            </ul>
          </nav>
      </div>
</asp:Content>

