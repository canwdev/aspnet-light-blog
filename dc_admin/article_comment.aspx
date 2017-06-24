<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="article_comment.aspx.cs" Inherits="article_comment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-horizontal">
        <label for="ContentPlaceHolder1_chk_set_comment_enabled" class="col-sm-2 control-label" style="line-height: 5px;">开启评论</label>
        <div class="col-sm-5">
            <asp:CheckBox ID="chk_set_comment_enabled" runat="server" OnCheckedChanged="chk_SetCommEna_Changed" AutoPostBack="True" />
        </div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="LinqDataSource1"
        class="table table-hover" GridLines="None" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="评论ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="article_id" HeaderText="文章ID" SortExpression="article_id" />
            <asp:BoundField DataField="author_id" HeaderText="作者UID" SortExpression="author_id" />
            <asp:BoundField DataField="time_commit" HeaderText="发表时间" SortExpression="time_commit" />
            <asp:TemplateField HeaderText="评论内容" SortExpression="comment_text">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("comment_text") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <div style="max-width: 400px; overflow: hidden;">
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("comment_text") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="authorized" HeaderText="审核通过" SortExpression="authorized" Visible="False" />
            <asp:TemplateField ShowHeader="False" HeaderText="&lt;span class=&quot;glyphicon glyphicon-trash&quot; aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="javascript:return confirm('确定要删除吗？');"></asp:LinkButton>
                </ItemTemplate>
                <ControlStyle ForeColor="#FF0066" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="dc_article_comment">
    </asp:LinqDataSource>

</asp:Content>

