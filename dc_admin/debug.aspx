<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="debug.aspx.cs" Inherits="debug" ValidateRequest="false" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/docs.css" rel="stylesheet" />
    <title>调试工具箱</title>
</head>
<body>
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Default.aspx</a>
            </div>
        </div>
    </nav>
    <div class="container">
        <form id="form1" runat="server">
            <h3><a href="Default.aspx"></a></h3>
            <asp:Label ID="lbl_info" runat="server" Text=""></asp:Label>
            <hr />
            <div>

                <asp:TextBox ID="txt_origin" runat="server" Height="100px" TextMode="MultiLine" ToolTip="输入要加密的原文" CssClass="form-control"></asp:TextBox>

                <asp:Button ID="btn_enc" runat="server" OnClick="btn_enc_Click" Text="加密↓" CssClass="btn btn-default"/>

                <asp:TextBox ID="txt_enced" runat="server" Height="100px" TextMode="MultiLine" ToolTip="加密后的文字" CssClass="form-control"></asp:TextBox>

                <asp:Button ID="btn_dec" runat="server" OnClick="btn_dec_Click" Text="解密↓" CssClass="btn btn-default"/>

                <asp:TextBox ID="txt_deced" runat="server" Height="100px" TextMode="MultiLine" ToolTip="解密后的文字" CssClass="form-control"></asp:TextBox>

            </div>
            <hr />
            <div>
                <asp:Button ID="btn_genKey" runat="server" Text="生成秘钥对" OnClick="btn_genKey_Click" CssClass="btn btn-primary"/>
                <asp:TextBox ID="txt_privateKey" runat="server" ToolTip="私钥" Height="150px"  CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                <asp:TextBox ID="txt_publicKey" runat="server" ToolTip="公钥" Height="100px"  CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>
        </form>
    </div>
</body>
</html>

