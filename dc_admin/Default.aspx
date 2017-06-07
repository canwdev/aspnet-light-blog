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
                    <td>服务器语言：</td>
                    <td>zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4,ja;q=0.2,zh-TW;q=0.2,la;q=0.2,sm;q=0.2</td>
                </tr>
                <tr>
                    <td>服务器Web端口：</td>
                    <td><%=Request.ServerVariables["SERVER_PORT"]%></td>
                </tr>
               
            </tbody>
        </table>
        <hr />
        <div class="bs-example bs-example-form" style="max-height: 500px; overflow-y: scroll; word-wrap:break-word; font-family: Consolas;">
            <legend>其他信息输出</legend>
                <%
            foreach (string x in Request.ServerVariables)
            Response.Write(x +":   "+ Request.ServerVariables[x] +"<br />");
            %>
        </div>

    
</asp:Content>

