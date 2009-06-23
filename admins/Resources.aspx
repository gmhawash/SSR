<%@ Page Title="" Language="C#" MasterPageFile="~/admins/MasterPage.master" AutoEventWireup="true" CodeFile="Resources.aspx.cs" Inherits="admins_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="ResourcesGridView" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="ResourceDataSource" 
        OnRowDeleted="ResourcesGridView_RowDeleted">
        <RowStyle BackColor="#EFF3FB" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            No resources are found in the system...
        </EmptyDataTemplate>
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
        
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false"/>
            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                SortExpression="Active" />
            <asp:BoundField DataField="Username" HeaderText="Username" 
                SortExpression="Username" ReadOnly="True" />
            <asp:BoundField DataField="DeptName" HeaderText="DeptName" ReadOnly="True" 
                SortExpression="DeptName" />
            <asp:BoundField DataField="TeamName" HeaderText="TeamName" ReadOnly="True" 
                SortExpression="TeamName" />
            <asp:BoundField DataField="GroupName" HeaderText="GroupName" ReadOnly="True" 
                SortExpression="GroupName" />
            <asp:BoundField DataField="RoleName" HeaderText="RoleName" ReadOnly="true" 
                SortExpression="RoleName" />
            <asp:CommandField ShowEditButton="True" />
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

