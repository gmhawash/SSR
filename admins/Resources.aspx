<%@ Page Title="" Language="C#" MasterPageFile="~/admins/MasterPage.master" AutoEventWireup="true" CodeFile="Resources.aspx.cs" Inherits="admins_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="ResourcesGridView" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="ResourceDataSource" DataKeyNames="Id" 
        OnRowDeleted="ResourcesGridView_RowDeleted">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:BoundField DataField="Username" HeaderText="Username" 
                SortExpression="Username" ReadOnly="True" />
            <asp:BoundField DataField="DeptName" HeaderText="DeptName" ReadOnly="True" 
                SortExpression="DeptName" />
            <asp:BoundField DataField="TeamName" HeaderText="TeamName" ReadOnly="True" 
                SortExpression="TeamName" />
            <asp:BoundField DataField="GroupName" HeaderText="GroupName" ReadOnly="True" 
                SortExpression="GroupName" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                SortExpression="Active" />
            <asp:CommandField ShowDeleteButton="True"  />
        </Columns>
    </asp:GridView>
    
    <asp:SqlDataSource ID="ResourceDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>" 
        DeleteCommand="DELETE FROM Resources WHERE (Id = @Id)" 
        SelectCommand="spGetResources" SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" />
        </DeleteParameters>
    </asp:SqlDataSource>
    
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="NewResource.aspx">New</asp:HyperLink>
    </asp:Content>

