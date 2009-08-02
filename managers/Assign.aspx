<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true"
  CodeFile="Assign.aspx.cs" Inherits="managers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <center><asp:Table ID="Table1" runat="server">
    <asp:TableRow ID="TableRow1" runat="server" VerticalAlign="Top">
      <asp:TableCell Width="300px">
        <asp:Label ID="Label1" runat="server" Text="Label">Select resources to assign to the project:</asp:Label>
        <asp:GridView ID="Resources" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
          ShowHeader="true" DataSourceID="SqlDataSource1" OnPreRender="Resources_PreRender"
          AllowPaging="True" AllowSorting="True" ShowFooter="True">
          <Columns>
            <asp:TemplateField ShowHeader="False">
              <ItemTemplate>
                <asp:CheckBox ID="SelectUser" runat="server" commandName="Select" CausesValidation="False" />
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="false">
              <ItemTemplate>
                <asp:Label ID="Id" Visible="false" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username"
              HeaderStyle-Width="200" />
          </Columns>
          <RowStyle BackColor="#F7F7DE" />
          <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
          <FooterStyle BackColor="#CCCC99" />
          <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
          <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
      </asp:TableCell>
    </asp:TableRow>
  </asp:Table>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
    SelectCommand="spGetProviders" SelectCommandType="StoredProcedure" ></asp:SqlDataSource>
  <asp:Button ID="Assign" runat="server" Text="Assign" OnClick="Assign_Click" />
  <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" /></center>
  </asp:Panel>
</asp:Content>
