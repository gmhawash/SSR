<%@ Page Title="" Language="C#" MasterPageFile="~/admins/MasterPage.master" AutoEventWireup="true" CodeFile="Config.aspx.cs" Inherits="admins_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="DEPT_ID" 
    DataSourceID="SqlDataSource1">
    <EditItemTemplate>
       <asp:Label  Visible="false" ID="DEPT_IDLabel1" runat="server" Text='<%# Eval("DEPT_ID") %>' />
        <br />
        DEPT_CODE:
        <asp:TextBox ID="DEPT_CODETextBox" runat="server" 
            Text='<%# Bind("DEPT_CODE") %>' />
        <br />
        DEPT_NAME:
        <asp:TextBox ID="DEPT_NAMETextBox" runat="server" 
            Text='<%# Bind("DEPT_NAME") %>' />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
            CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <InsertItemTemplate>
        <asp:TextBox  Visible="false" ID="DEPT_IDTextBox" runat="server" Text='<%# Bind("DEPT_ID") %>' />
        <br />
        DEPT_CODE:
        <asp:TextBox ID="DEPT_CODETextBox" runat="server" 
            Text='<%# Bind("DEPT_CODE") %>' />
        <br />
        DEPT_NAME:
        <asp:TextBox ID="DEPT_NAMETextBox" runat="server" 
            Text='<%# Bind("DEPT_NAME") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="Insert" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        <asp:Label Visible="false" ID="DEPT_IDLabel" runat="server" Text='<%# Eval("DEPT_ID") %>' />
        <br />
        DEPT_CODE:
        <asp:Label ID="DEPT_CODELabel" runat="server" Text='<%# Bind("DEPT_CODE") %>' />
        <br />
        DEPT_NAME:
        <asp:Label ID="DEPT_NAMELabel" runat="server" Text='<%# Bind("DEPT_NAME") %>' />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
            CommandName="Edit" Text="Edit" />
        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
            CommandName="Delete" Text="Delete" />
        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
            CommandName="New" Text="New" />
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>" 
    DeleteCommand="DELETE FROM [DEPT] WHERE [DEPT_ID] = @DEPT_ID" 
    InsertCommand="INSERT INTO [DEPT] ([DEPT_ID], [DEPT_CODE], [DEPT_NAME]) VALUES (@DEPT_ID, @DEPT_CODE, @DEPT_NAME)" 
    SelectCommand="SELECT [DEPT_ID], [DEPT_CODE], [DEPT_NAME] FROM [DEPT]" 
    UpdateCommand="UPDATE [DEPT] SET [DEPT_CODE] = @DEPT_CODE, [DEPT_NAME] = @DEPT_NAME WHERE [DEPT_ID] = @DEPT_ID">
    <DeleteParameters>
        <asp:Parameter Name="DEPT_ID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="DEPT_CODE" Type="String" />
        <asp:Parameter Name="DEPT_NAME" Type="String" />
        <asp:Parameter Name="DEPT_ID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="DEPT_ID" Type="Int32" />
        <asp:Parameter Name="DEPT_CODE" Type="String" />
        <asp:Parameter Name="DEPT_NAME" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
</asp:Content>

