<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true" CodeFile="Assign.aspx.cs" Inherits="managers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label">Select resources to assign to the project:</asp:Label>
    <asp:GridView ID="Resources" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" ShowHeader="False" 
        DataSourceID="SqlDataSource1" onprerender="Resources_PreRender">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:CheckBox ID="SelectUser" runat="server" commandName="Select" CausesValidation="False"/>  
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Id" SortExpression="Id">
                <ItemTemplate>
                    <asp:Label ID="Id" Visible="false" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField  DataField="Username" HeaderText="Username"  
                SortExpression="Username" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>" 
        SelectCommand="spGetProviders" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:Button ID="Assign" runat="server" Text="Assign" onclick="Assign_Click" />
    <asp:Button ID="Cancel" runat="server" Text="Cancel" onclick="Cancel_Click" />
</asp:Content>

