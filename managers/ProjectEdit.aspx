<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true"
    CodeFile="ProjectEdit.aspx.cs" Inherits="managers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1"
        DefaultMode="Insert">
        <InsertItemTemplate>
            <asp:Label ID="IdLabel1" runat="server" Visible="false" />
            <br />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" />
            <br />
            <br />
            Active:
            <asp:CheckBox ID="ActiveCheckBox" runat="server" />
            <br />
            <br />
            Dept:
            <asp:DropDownList ID="Dept" runat="server" DataSourceID="SqlDataSource1" DataTextField="Description"
                DataValueField="Description">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
                SelectCommand="SELECT [Description] FROM [Depts]"></asp:SqlDataSource>
            <br />
            <br />
            Group:
            <asp:DropDownList ID="Group" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name"
                DataValueField="Name">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
                SelectCommand="SELECT [Name] FROM [Groups]"></asp:SqlDataSource>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" 
                Text="Insert" OnClick="InsertButton_Click" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancel" OnClick="Cancel_Click"/>
        </InsertItemTemplate>
        <ItemTemplate>
            Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Active:
            <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>'
                Enabled="false" />
            <br />
            DeptId:
            <asp:Label ID="DeptIdLabel" runat="server" Text='<%# Bind("DeptId") %>' />
            <br />
            GroupId:
            <asp:Label ID="GroupIdLabel" runat="server" Text='<%# Bind("GroupId") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
        DeleteCommand="DELETE FROM [Projects] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Projects] ([Id], [Name], [Active], [DeptId], [GroupId]) VALUES (@Id, @Name, @Active, (SELECT [Id] FROM [Depts] WHERE @Dept = [Depts].[Description]), (SELECT [Id] FROM [Groups] WHERE @Group = [Groups].[Name]))"
        SelectCommand="SELECT * FROM [Projects]" UpdateCommand="UPDATE [Projects] SET [Name] = @Name, [Active] = @Active, [DeptId] = @DeptId, [GroupId] = @GroupId WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Object" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="DeptId" Type="Object" />
            <asp:Parameter Name="GroupId" Type="Object" />
            <asp:Parameter Name="Id" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Object" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="DeptId" Type="Object" />
            <asp:Parameter Name="GroupId" Type="Object" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
