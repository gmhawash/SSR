<%@ Page Title="" Language="C#" MasterPageFile="~/admins/MasterPage.master" AutoEventWireup="true"
    CodeFile="Config.aspx.cs" Inherits="admins_Config" %>

<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
    <asp:Label ID="Label4"  runat="server" >Departmentsss</asp:Label>
    <asp:GridView ID="DeptGridView" runat="server" CellPadding="4" ForeColor="#333333"
        GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
        DataKeyNames="Id" ShowFooter="True"  
            DataSourceID="ObjectDataSource1">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
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
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                        Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton runat="server" ID="Insert" Text="Insert" CommandName="InsertNew" />
                </FooterTemplate>
            </asp:TemplateField>
            
        </Columns>
        <EmptyDataTemplate>
            Code:<asp:TextBox runat="server" ID="NoDataCode" />
            Description:<asp:TextBox runat="server" ID="NoDataDescription" />
            <asp:Button runat="server" ID="NoDataInsert" CommandName="NoDataInsert" Text="Insert" />
        </EmptyDataTemplate>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>



        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            DataObjectTypeName="System.Guid" DeleteMethod="DeleteProduct" 
            InsertMethod="AddDept" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDepts" TypeName="DeptsBLL" UpdateMethod="UpdateDept">
            <UpdateParameters>
                <asp:Parameter DbType="Guid" Name="id" />
                <asp:Parameter Name="code" Type="String" />
                <asp:Parameter Name="description" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="code" Type="String" />
                <asp:Parameter Name="description" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:EntityDataSource ID="EntityDataSource2" runat="server">
        </asp:EntityDataSource>
</div>
</asp:Content>
