<%@ Page Title="" Language="C#" MasterPageFile="~/admins/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default2.aspx.cs" Inherits="admins_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="DeptGridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="Id" DataSourceID="DeptDataSource" ForeColor="#333333" GridLines="None"
        ShowFooter="True">
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
                    <asp:TextBox runat="server" ID="InsertCode" Text='' />
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
        <UpdateParameters>
            <asp:Parameter DbType="Guid" Name="id" />
            <asp:Parameter Name="code" Type="String" />
            <asp:Parameter Name="description" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter DbType="Guid" Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="code" Type="String" />
            <asp:Parameter Name="description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
