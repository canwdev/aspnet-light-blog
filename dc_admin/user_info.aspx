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
                <asp:ListView ID="ListView1" runat="server" DataSourceID="LinqDataSource1">
                    <ItemTemplate>
                        <h3>
                            <asp:Label ID="nicknameLabel" runat="server" Text='<%# Eval("nickname") %>' />
                            <div>
                                <a href="#admin_info_mod" onclick="parent.goAdmin_info_mod();">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                </a>
                            </div>
                        </h3>
                        <h5><asp:Label ID="Label1" runat="server" Text='<%# Eval("intro") %>' /></h5>
                        <hr />
                        <ul>
                            <li>
                                <div>用户名</div>
                                <asp:Label ID="unameLabel" runat="server" Text='<%# Eval("uname") %>' /></li>
                            <li>
                                <div>ID</div>
                                <asp:Label ID="uidLabel" runat="server" Text='<%# Eval("uid") %>' /></li>
                            <li>
                                <div>组ID</div>
                                <asp:Label ID="gidLabel" runat="server" Text='<%# Eval("gid") %>' /></li>
                        </ul>
                    </ItemTemplate>

                </asp:ListView>

                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" Select="new (uid, uname, nickname, gid, intro)" TableName="dc_user" Where="uname == @uname">
                    <WhereParameters>
                        <asp:CookieParameter CookieName="UserName" DefaultValue="" Name="uname" Type="String" />
                    </WhereParameters>
                </asp:LinqDataSource>

            </div>
        </div>
    </form>
</body>
</html>
