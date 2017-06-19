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

            <div class="input-group">
                <div class="btn-group">
                    <asp:Button ID="btn_set_title_img" runat="server" Text="选择图片" CssClass="btn btn-default"  
                    OnClientClick="ContentPlaceHolder1_FileUpload1.click(); return false;" />
                <asp:Button ID="btn_set_title_img_real" runat="server" Text="设置" CssClass="btn btn-default" OnClick="btn_SetTitleImg_Click"/>
                </div>
            </div>
            <div class="input-group">
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="txtFile btn btn-default" Style="visibility: hidden" />
            </div>
        </div>
        <div class="form-group">
            <asp:TextBox ID="txt_intro" runat="server" class="form-control" placeholder="填写简介，在主页上显示" TextMode="MultiLine"></asp:TextBox>
            <div style="margin-top:10px;">
                <asp:TextBox ID="txt_context" runat="server" class="form-control" placeholder="内容" Height="500px" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        <script src="../wangEditor/js/wangEditor.min.js"></script>
        <script type="text/javascript">
            var editor = new wangEditor('ContentPlaceHolder1_txt_context');
            editor.config.uploadImgUrl = '../wangEditor/uploadImage.ashx';

            editor.config.uploadHeaders = {
                'Accept': 'text/x-json'
            };

            //editor.config.hideLinkImg = true;
            editor.create();

        </script>

        <div style="text-align: right;">
            <div style="float: left;">
                <asp:Label ID="lbl_modpwd_ok" runat="server" ForeColor="Green" Visible="False"></asp:Label>
                <asp:Label ID="lbl_modpwd_error" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </div>

            <div class="btn-group">
            <asp:Button ID="btn_cancel" runat="server" class="btn btn-default" Text="返回" OnClick="btn_cancel_Click" Visible="False" />
            <asp:Button ID="btn_delete" runat="server" class="btn btn-danger" Text="删除" OnClientClick="javascript:return confirm('确定要删除吗？这将无法撤销。');" OnClick="btn_delete_Click"/>
            <asp:Button ID="btn_submit" runat="server" class="btn btn-primary" Text="提交" OnClick="btn_submit_Click" />
                </div>

        </div>




    </div>
</asp:Content>

