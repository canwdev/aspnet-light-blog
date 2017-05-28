<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="article_list.aspx.cs" Inherits="dc_admin_article_list" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
        DataKeyNames="id" DataSourceID="LinqArticleList" class="table table-striped table-bordered " GridLines="None">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:TemplateField HeaderText="标题" SortExpression="title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <div style="max-width: 90px;">
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                    </div>

                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="time_commit" HeaderText="发布时间" SortExpression="time_commit" Visible="False" />
            <asp:BoundField DataField="time_update" HeaderText="更新时间" SortExpression="time_update" />
            <asp:TemplateField HeaderText="作者" SortExpression="author">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("author") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <div style="max-width: 80px;">
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("author") %>'></asp:Label>
                    </div>
                </ItemTemplate>
                <ControlStyle />
            </asp:TemplateField>
            <asp:BoundField DataField="article_tag_id" HeaderText="标签" SortExpression="article_tag_id" />
            <asp:TemplateField HeaderText="文章简介" SortExpression="article_intro">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("article_intro") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <div style="max-width: 600px; max-height: 100px; overflow-y: scroll;">
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("article_intro") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="文章内容" SortExpression="article_context" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("article_context") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <div style="max-height: 100px; overflow-y: scroll;">
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("article_context") %>'></asp:Label>
                    </div>

                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="article_addmod.aspx?id={0}" HeaderText="&lt;span class=&quot;glyphicon glyphicon-pencil&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;" Text="编辑" />
            <asp:TemplateField ShowHeader="False" HeaderText="&lt;span class=&quot;glyphicon glyphicon-trash&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;">
                <ItemTemplate>
                    
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="javascript:return confirm('确定要删除吗？');"></asp:LinkButton>
                </ItemTemplate>
                <ControlStyle ForeColor="#FF0066" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqArticleList" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="dc_article" OrderBy="id desc">
    </asp:LinqDataSource>
    <p>
    </p>

</asp:Content>

