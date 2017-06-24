<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="admin_users.aspx.cs" Inherits="dc_admin_admin_users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-horizontal">
        <label for="ContentPlaceHolder1_chk_set_regist_enabled" class="col-sm-2 control-label" style="line-height: 5px;">开启用户注册</label>
        <div class="col-sm-5">
            <asp:CheckBox ID="chk_set_regist_enabled" runat="server" OnCheckedChanged="chk_SetRegEna_Changed" AutoPostBack="True" />
        </div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="LinqDataSource1"
        class="table table-hover" GridLines="None">
        <Columns>
            <asp:BoundField DataField="uid" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="uid" />
            <asp:BoundField DataField="gid" HeaderText="组ID" SortExpression="gid" />
            <asp:BoundField DataField="uname" HeaderText="注册名" SortExpression="uname" />
            <asp:BoundField DataField="nickname" HeaderText="昵称" SortExpression="nickname" />
            <asp:TemplateField HeaderText="简介" SortExpression="intro">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("intro") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <div style="max-width: 300px; overflow: hidden;">
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("intro") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="uid" DataNavigateUrlFormatString="admin_modify_info.aspx?id={0}" Text="编辑" HeaderText="编辑" />

            <asp:TemplateField ShowHeader="False" HeaderText="&lt;span class=&quot;glyphicon glyphicon-pencil&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;" Visible="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField ShowHeader="False" HeaderText="&lt;span class=&quot;glyphicon glyphicon-trash&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="javascript:return confirm('确定要删除吗？');"></asp:LinkButton>
                </ItemTemplate>
                <ControlStyle ForeColor="#FF0066" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="dc_user">
    </asp:LinqDataSource>

</asp:Content>

