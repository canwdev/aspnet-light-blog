<%@ Page Title="" Language="C#" MasterPageFile="~/dc_admin/admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="dc_admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>欢迎登陆！！</p>
    <asp:Chart ID="Chart2" runat="server" DataSourceID="LinqDataSource1">
        <Series>
            <asp:Series ChartType="Stock" Name="Series1" XValueMember="time_update" YValueMembers="id" YValuesPerPoint="4">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="LinqDataSource1">
        <Series>
            <asp:Series Name="Series1" ChartType="Radar" XValueMember="id" YValueMembers="article_tag_id" YValuesPerPoint="4"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" TableName="dc_article">
    </asp:LinqDataSource>
</asp:Content>

