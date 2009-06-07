<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true" CodeFile="Assign.aspx.cs" Inherits="managers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetUsers" 
        TypeName="TrackerTableAdapters.aspnet_UsersTableAdapter" UpdateMethod="Update">
    </asp:ObjectDataSource>
    <asp:Label ID="Label1" runat="server" Text="Label">Select resources to assign to the project:</asp:Label>
    <asp:GridView ID="Resources" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ApplicationId,LoweredUserName" ShowHeader="False" 
        DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:CheckBox ID="SelectUser" runat="server" commandName="Select" CausesValidation="False"/>  
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserName" HeaderText="Resource" 
                SortExpression="UserName" />
            <asp:TemplateField HeaderText="UserId" SortExpression="UserId">
                <ItemTemplate>
                    <asp:Label ID="UserId" runat="server" Visible="false" Text='<%# Bind("UserId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="Assign" runat="server" Text="Assign" onclick="Assign_Click" />
    <asp:Button ID="Cancel" runat="server" Text="Cancel" onclick="Cancel_Click" />
</asp:Content>

