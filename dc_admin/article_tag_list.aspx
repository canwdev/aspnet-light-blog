<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="article_tag_list.aspx.cs" Inherits="dc_admin_article_tag_mgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <a class="btn btn-default" href="article_tag_addmod.aspx" role="button">添加标签</a>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="LinqDataSource1"
         class="table table-striped table-bordered " GridLines="None">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="article_tag_name" HeaderText="article_tag_name" SortExpression="article_tag_name" />
            <asp:BoundField DataField="article_tag_intro" HeaderText="article_tag_intro" SortExpression="article_tag_intro" />
            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="article_tag_addmod.aspx?id={0}" HeaderText="&lt;span class=&quot;glyphicon glyphicon-pencil&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;" Text="编辑" />
            <asp:TemplateField HeaderText="&lt;span class=&quot;glyphicon glyphicon-trash&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="javascript:return confirm('删除标签可能使部分文章的标签失效，且不能恢复，是否删除？');"></asp:LinkButton>
                </ItemTemplate>
                <ControlStyle ForeColor="#FF0066" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="dc_article_tag">
    </asp:LinqDataSource>
</asp:Content>

