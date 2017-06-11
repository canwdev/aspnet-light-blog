<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="dc_admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="table table-hover">
            <colgroup>
                <col width="15%">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>标题</th>
                <th>内容</th>
              
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td>浏览器版本号：  </td>
                    <td><%=Request.Browser["Browser"]+" "+Request.Browser["Version"] %></td>
                </tr>
                <tr>
                    <td>服务器IP：</td>
                    <td><%=Request.ServerVariables["LOCAL_ADDR"]%></td>
                </tr>
                <tr>
                    <td>接受请求的服务器IP：</td>
                    <td><%=Request.ServerVariables["REMOTE_ADDR"]%></td>
                </tr>
                <tr>
                    <td>当前页面物理路径：</td>
                    <td><%=Request.ServerVariables["PATH_TRANSLATED"]%></td>
                </tr>
                
                <tr>
                    <td>服务器计算机名：</td>
                    <td><%=Request.ServerVariables["SERVER_NAME"]%></td>
                </tr>
                
                <tr>
                    <td>服务器Web端口：</td>
                    <td><%=Request.ServerVariables["SERVER_PORT"]%></td>
                </tr>
               
            </tbody>
        </table>
        <hr />

            <div class="panel panel-default" style="max-height: 500px; overflow-y: scroll; word-wrap:break-word; font-family: Consolas; background-color:black; color: lawngreen;">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">显示全部信息
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <%
                            foreach (string x in Request.ServerVariables)
                                Response.Write(x + ":   " + Request.ServerVariables[x] + "<br />");
                        %>
                    </div>
                </div>
            </div>


    
</asp:Content>

