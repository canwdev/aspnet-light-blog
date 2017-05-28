<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="article_tag_addmod.aspx.cs" Inherits="dc_admin_article_addmod" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bs-example bs-example-form">
        <center><h4><b><asp:Label ID="lbl_head_title" runat="server" Text="文章"></asp:Label></b></h4></center>
        
            
        <div class="form-group">
            <label>标签标题</label>
            <asp:TextBox ID="txt_name" runat="server" class="form-control" placeholder="标签的标题" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>标签介绍</label>
            <asp:TextBox ID="txt_context" runat="server" class="form-control" placeholder="标签的简介" Height="300px" TextMode="MultiLine"></asp:TextBox>
            <div style="text-align: right;">
            </div>
        </div>

        <div style="text-align: right;">
            <div style="float: left;">
                <asp:Label ID="lbl_modpwd_ok" runat="server" ForeColor="Green" Visible="False"></asp:Label>
                <asp:Label ID="lbl_modpwd_error" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </div>

            <asp:Button ID="btn_cancel" runat="server" class="btn btn-default" Text="返回" OnClick="btn_cancel_Click" Visible="False" />

            <asp:Button ID="btn_submit" runat="server" class="btn btn-primary" Text="提交" OnClick="btn_submit_Click" />


        </div>




    </div>
</asp:Content>

