<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="members_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id='Dept' class="field">
    <asp:Label ID="lb_dept" runat="server" Text="Dept: "></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="DEPT_NAME" DataValueField="DEPT_NAME"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>" 
        SelectCommand="SELECT [DEPT_NAME] FROM [DEPT]"></asp:SqlDataSource>
  </div>

<div id='Group' class="field">
    <asp:Label ID="lb_group" runat="server" Text="Group: "></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" 
        DataTextField="GROU_NAME" DataValueField="GROU_NAME"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>" 
        SelectCommand="SELECT [GROU_NAME] FROM [GROUPS]"></asp:SqlDataSource>
  </div>

</asp:Content>

