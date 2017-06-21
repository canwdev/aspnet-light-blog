<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_info.aspx.cs" Inherits="dc_admin_user_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/docs.css" rel="stylesheet" />
    <title>user_info</title>
    <link href="css/user_info.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" style="text-align: center;">
        <div class="uinfo_container">
            <asp:Image ID="img_headimg1" runat="server" Height="128" Width="128" class="img-circle" />
            <div class="uinfo_main">

                        <h3>
                            <asp:Label ID="lbl_nickname" runat="server" Text='' />
                                <div><a href="#admin_info_mod" onclick="parent.goAdmin_info_mod();">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                </a></div>
                        </h3>
                        <h5><asp:Label ID="lbl_intro" runat="server" Text='' /></h5>
                        <hr />
                        <ul>
                            <li>
                                <div>用户名</div>
                                <asp:Label ID="lbl_uname" runat="server" Text='' /></li>
                            <li>
                                <div>ID</div>
                                <asp:Label ID="lbl_uid" runat="server" Text='' /></li>
                            <li>
                                <div>组ID</div>
                                <asp:Label ID="lbl_gid" runat="server" Text='' /></li>
                        </ul>
            </div>
        </div>
    </form>
</body>
</html>
