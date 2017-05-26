<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="admin_modify_info.aspx.cs" Inherits="dc_admin_admin_modify_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="col-md-3 bs-example bs-example-form">
        <center><h4><b>修改密码</b></h4></center>

        <div class="form-group">
            <label>原始密码</label>
            <asp:TextBox ID="txt_origin_password" runat="server" class="form-control" type="password"
                name="password" placeholder="原始密码" autocomplete="on"></asp:TextBox>
            <div style="text-align:right;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ErrorMessage="密码不能为空" ControlToValidate="txt_origin_password"
                Display="Dynamic" ForeColor="#FF0066" ></asp:RequiredFieldValidator>
            </div>
            
        </div>

        <div class="form-group">
            <label>新密码</label>
            <asp:TextBox ID="txt_new_password" runat="server" class="form-control" type="password"
                name="password" placeholder="新密码" autocomplete="on"></asp:TextBox>
            <div style="text-align:right;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="密码不能为空" ControlToValidate="txt_new_password"
                    Display="Dynamic" ForeColor="#FF0066"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <label>确认密码</label>
            <asp:TextBox ID="txt_password_repeat" runat="server" class="form-control" type="password"
                name="password" placeholder="确认密码" autocomplete="on"></asp:TextBox>
            <div style="text-align:right;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="密码不能为空" ControlToValidate="txt_password_repeat"
                    Display="Dynamic" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server"
                    ControlToCompare="txt_password_repeat" ControlToValidate="txt_new_password"
                    ErrorMessage="&amp;nbsp密码不一致&amp;nbsp  " Display="Dynamic" ForeColor="#FF0066"></asp:CompareValidator>
            </div>
        </div>

        <div style="text-align: right;">
            <div style="float:left;">
                <asp:Label ID="lbl_modpwd_ok" runat="server" ForeColor="Green" Visible="False"></asp:Label>
                <asp:Label ID="lbl_modpwd_error" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </div>
            
            <asp:Button ID="btn_modpwd" runat="server" class="btn" Text="修改"
                OnClick="btn_modpwd_Click" />
            

        </div>




    </div>

    </div>
</asp:Content>

