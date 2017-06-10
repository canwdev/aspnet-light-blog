<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="debug.aspx.cs" Inherits="debug" ValidateRequest="false"%>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>除虫工具箱</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h3><a href="Default.aspx">Default.aspx</a></h3>
        <asp:Label ID="lbl_info" runat="server" Text=""></asp:Label>
        <hr />
        <div style="text-align: center">

            <asp:TextBox ID="txt_origin" runat="server" Height="100px" TextMode="MultiLine" ToolTip="输入要加密的原文" Width="300px"></asp:TextBox>
            <br />
            <asp:Button ID="btn_enc" runat="server" OnClick="btn_enc_Click" Text="加密↓" />
            <br />
            <asp:TextBox ID="txt_enced" runat="server" Height="100px" TextMode="MultiLine" ToolTip="加密后的文字" Width="300px"></asp:TextBox>
            <br />
            <asp:Button ID="btn_dec" runat="server" OnClick="btn_dec_Click" Text="解密↓" />
            <br />
            <asp:TextBox ID="txt_deced" runat="server" Height="100px" TextMode="MultiLine" ToolTip="解密后的文字" Width="300px"></asp:TextBox>

        </div>
        <hr />
        <div class="auto-style1">
        <asp:Button ID="btn_genKey" runat="server" Text="生成秘钥对" OnClick="btn_genKey_Click" />
            <br />
        <asp:TextBox ID="txt_privateKey" runat="server" ToolTip="私钥" Width="500px"></asp:TextBox>
            <br />
        <asp:TextBox ID="txt_publicKey" runat="server" ToolTip="公钥" Width="500px"></asp:TextBox>
        </div>
    </form>
</body>
</html>

