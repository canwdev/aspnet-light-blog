<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/docs.css" rel="stylesheet" />
    <title>登录</title>
</head>
<body>
    <form id="form1" runat="server">

        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="../"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>登录</a>
                </div>
            </div>
        </nav>

        <div class="container" style="max-width: 400px;">

            <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
                <ul id="myTabs" class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">
                        <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>登录</a></li>
                    <li role="presentation" class=""><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>注册账号</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                        <asp:Panel ID="panel_login" runat="server" DefaultButton="btn_login">
                            <div class="bs-example bs-example-form">
                                <%--<legend>登录</legend>--%>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                                    <asp:TextBox ID="txt_username" runat="server" placeholder="用户名"
                                        class="form-control" ControlToValidate="txt_username" autofocus="autofocus"></asp:TextBox>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                                    <asp:TextBox ID="txt_password" runat="server" class="form-control" placeholder="密码"
                                        TextMode="Password"></asp:TextBox>
                                </div>

                                <div style="text-align: right;">
                                    <div style="float: left;">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                                            DisplayMode="List" ForeColor="#FF0066" ValidationGroup="valid_login" />

                                    </div>

                                    <asp:Button ID="btn_login" runat="server" Text="登陆" class="btn"
                                        OnClick="btn_login_Click" ValidationGroup="valid_login" UseSubmitBehavior="False" />
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名不能为空" ControlToValidate="txt_username" Display="None" ValidationGroup="valid_login"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="密码不能为空" ControlToValidate="txt_password" Display="None"
                                    ForeColor="#FF0066" ValidationGroup="valid_login"></asp:RequiredFieldValidator>
                            </div>
                        </asp:Panel>

                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                        <asp:Panel ID="panel_register_disabled" runat="server" Visible="False" CssClass="text-center">
                            <asp:Label ID="Label1" runat="server" Text="注册功能已关闭_(:3」∠)_" Font-Size="Medium"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="panel_register" runat="server" DefaultButton="btn_regist">
                            <div class="bs-example bs-example-form">
                                <%--注册</legend>--%>


                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                                    <asp:TextBox ID="txt_reg_username" runat="server" placeholder="用户名"
                                        class="form-control" ControlToValidate="txt_username" autofocus="autofocus"></asp:TextBox>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                                    <asp:TextBox ID="txt_reg_password" runat="server" class="form-control" placeholder="输入密码"
                                        TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                                    <asp:TextBox ID="txt_reg_password_confirm" runat="server" class="form-control" placeholder="重复密码"
                                        TextMode="Password"></asp:TextBox>
                                </div>

                                <div style="text-align: right;">
                                    <div style="float: left;">
                                        <asp:ValidationSummary ID="ValidationSummary2" runat="server"
                                            DisplayMode="List" ForeColor="#FF0066" ValidationGroup="valid_regist" />
                                        <asp:Label ID="lbl_reg_err" runat="server" ForeColor="#FF0066"></asp:Label>
                                    </div>

                                    <asp:Button ID="btn_regist" runat="server" Text="注册" class="btn" ValidationGroup="valid_regist" UseSubmitBehavior="False" OnClick="btn_regist_Click" />
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ErrorMessage="用户名不能为空" ControlToValidate="txt_reg_username" Display="None" ValidationGroup="valid_regist"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ErrorMessage="密码不能为空" ControlToValidate="txt_reg_password" Display="None"
                                    ForeColor="#FF0066" ValidationGroup="valid_regist"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server"
                                    ControlToCompare="txt_reg_password_confirm" ControlToValidate="txt_reg_password"
                                    ErrorMessage="密码不一致" ForeColor="#FF0066" ValidationGroup="valid_regist" Display="None"></asp:CompareValidator>
                            </div>
                        </asp:Panel>

                    </div>
                </div>
                <asp:Label ID="lbl_err" runat="server" ForeColor="#FF0066"></asp:Label>
                <asp:Label ID="lbl_ok" runat="server" ForeColor="#00CC00"></asp:Label>
            </div>


        </div>

    </form>
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
