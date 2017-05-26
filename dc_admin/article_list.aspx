<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="article_list.aspx.cs" Inherits="dc_admin_article_list" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="LinqArticleList" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
        <asp:BoundField DataField="time_commit" HeaderText="time_commit" SortExpression="time_commit" />
        <asp:BoundField DataField="time_update" HeaderText="time_update" SortExpression="time_update" />
        <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
        <asp:TemplateField HeaderText="article_intro" SortExpression="article_intro">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("article_intro") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <div style="margin:10px; max-height: 500px; overflow-y:scroll;">
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("article_intro") %>'></asp:Label>
                    </div>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="article_context" SortExpression="article_context">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("article_context") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <div style="margin:10px; max-height: 500px; overflow-y:scroll;">
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("article_context") %>'></asp:Label>
                </div>
                
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
    </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
<asp:LinqDataSource ID="LinqArticleList" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="dc_article" OrderBy="id desc">
</asp:LinqDataSource>
<p>
</p>

</asp:Content>

