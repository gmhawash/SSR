<%@ Page Title="" Language="C#" MasterPageFile="~/admins/MasterPage.master" AutoEventWireup="true"
    CodeFile="Config.aspx.cs" Inherits="admins_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    DEPARTMENTS
    <asp:GridView ID="DeptGridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="Id" DataSourceID="DeptDataSource" ForeColor="#333333" GridLines="None"
        ShowFooter="True" HorizontalAlign="Center" >
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" Visible="false" SortExpression="Id" />
            
            <asp:TemplateField HeaderText="Code" SortExpression="Code">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="InsertCode" Text='<%# Bind("Code") %>' />
                </FooterTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="InsertDescription" Text='<%# Bind("Description") %>' />
                </FooterTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit"></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton runat="server" ID="InsertNew"  OnClick="InsertNew_Click" Text="Insert" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <EmptyDataTemplate>
            Code:<asp:TextBox runat="server" ID="NoDataCode" />
            Description:<asp:TextBox runat="server" ID="NoDataDescription" />
            <asp:Button runat="server" ID="NoDataInsert" Text="Insert" OnClick="NoDataInsert_Click" />
        </EmptyDataTemplate>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="DeptDataSource" runat="server" DataObjectTypeName="DeptsBLL"
        DeleteMethod="DeleteDept" InsertMethod="AddDept" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDepts" TypeName="DeptsBLL" UpdateMethod="UpdateDept">
        <InsertParameters>
            <asp:Parameter Name="code" Type="String" />
            <asp:Parameter Name="description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>

    GROUPS    
    <asp:GridView ID="GroupGridView" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="Id" DataSourceID="GroupDataSource" 
        ForeColor="#333333" GridLines="None" ShowFooter="true" HorizontalAlign="Center">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True"  Visible="false"
                SortExpression="Id" />
            <asp:TemplateField HeaderText="DeptId" SortExpression="DeptId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DeptId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DeptId") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Code" SortExpression="Code">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit"></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton runat="server" ID="InsertNew"  OnClick="InsertNew_Click" Text="Insert" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" />

        </Columns>
        <EmptyDataTemplate>
            Code:<asp:TextBox runat="server" ID="GroupEmptyCode" />
            Name:<asp:TextBox runat="server" ID="GroupEmptyName" />
            <asp:DropDownList ID="GroupEmptyDeptId" runat="server" 
                DataSourceID="DeptDataSource" DataTextField="Code" DataValueField="Id">
            </asp:DropDownList>
            <asp:Button runat="server" ID="NoDataInsert" Text="Insert" OnClick="GroupInsertFirst_Click" />
        </EmptyDataTemplate>

        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
</asp:GridView>
    <asp:ObjectDataSource ID="GroupDataSource" runat="server" 
        DataObjectTypeName="GroupsBLL" DeleteMethod="DeleteGroup" 
        InsertMethod="AddGroup" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetGroups" TypeName="GroupsBLL" UpdateMethod="UpdateGroup">
        <InsertParameters>
            <asp:Parameter Name="code" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter DbType="Guid" Name="deptId" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

