<%@ Page Title="" Language="C#" MasterPageFile="~/admins/MasterPage.master" AutoEventWireup="true" CodeFile="Resources.aspx.cs" Inherits="admins_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="ResourcesGridView" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="ResourcesDataSource">
        <Columns>
            <asp:TemplateField HeaderText="Id" SortExpression="Id">
                <EditItemTemplate>
                    <asp:TextBox ID="UserId" runat="server" Text='<%# Bind("Id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="NewResource.aspx">New</asp:HyperLink>
    <asp:SqlDataSource ID="ResourcesDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>" 
        SelectCommand="spGetResources" SelectCommandType="StoredProcedure" 
        DeleteCommand="DELETE FROM Resources WHERE (Id = @UserId)" >
        <DeleteParameters>
            <asp:Parameter Name="UserId" DbType="Object"  />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>

