<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="article_addmod.aspx.cs" Inherits="dc_admin_article_addmod" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bs-example bs-example-form">
        <legend><asp:Label ID="lbl_head_title" runat="server" Text="文章"></asp:Label></legend>

        <div class=" form-inline">
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-star" aria-hidden="true"></span></span>
                <asp:TextBox ID="txt_title" runat="server" class="form-control" placeholder="文章标题" required="yes" autofocus="autofocus"></asp:TextBox>
                

            </div>

            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                <asp:TextBox ID="txt_author" runat="server" class="form-control" placeholder="作者" autocomplete="on"></asp:TextBox>
                
            </div>

            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-tags" aria-hidden="true"></span></span>
                <asp:DropDownList ID="ddl_article_tag" runat="server" class="form-control" ></asp:DropDownList>
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


            <asp:Button ID="btn_cancel" runat="server" class="btn btn-default" Text="返回" OnClick="btn_cancel_Click" Visible="False" />
            <asp:Button ID="btn_delete" runat="server" class="btn btn-danger" Text="删除" OnClientClick="javascript:return confirm('确定要删除吗？这将无法撤销。');" OnClick="btn_delete_Click"/>
            <asp:Button ID="btn_submit" runat="server" class="btn btn-primary" Text="提交" OnClick="btn_submit_Click" />


        </div>




    </div>
</asp:Content>

