<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="article_addmod.aspx.cs" Inherits="dc_admin_article_addmod" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bs-example bs-example-form">
        <center><h4><b><asp:Label ID="lbl_head_title" runat="server" Text="文章"></asp:Label></b></h4></center>
        <div class=" form-inline">
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                <asp:TextBox ID="txt_title" runat="server" class="form-control" placeholder="文章标题" autocomplete="on"></asp:TextBox>
                

            </div>

            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                <asp:TextBox ID="txt_author" runat="server" class="form-control" placeholder="作者" autocomplete="on"></asp:TextBox>
                
            </div>

            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" ></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <label>简介</label>
            <asp:TextBox ID="txt_intro" runat="server" class="form-control" placeholder="填写简介，在主页上显示" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>内容</label>
            <asp:TextBox ID="txt_context" runat="server" class="form-control" placeholder="内容" Height="300px" TextMode="MultiLine"></asp:TextBox>
            <div style="text-align: right;">
            </div>
        </div>

        <div style="text-align: right;">
            <div style="float: left;">
                <asp:Label ID="lbl_modpwd_ok" runat="server" ForeColor="Green" Visible="False"></asp:Label>
                <asp:Label ID="lbl_modpwd_error" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </div>

            <asp:Button ID="btn_submit" runat="server" class="btn" Text="提交" OnClick="btn_submit_Click" />


        </div>




    </div>
</asp:Content>

