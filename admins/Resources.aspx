<%@ Page Title="" Language="C#" MasterPageFile="~/admins/MasterPage.master" AutoEventWireup="true"
  CodeFile="Resources.aspx.cs" Inherits="admins_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:Panel runat="server" Width="600">
    <asp:GridView ID="ResourcesGridView" runat="server" AllowPaging="True" AllowSorting="True"
      AutoGenerateColumns="False" DataSourceID="ResourceDataSource" DataKeyNames="Id"
      OnRowDeleted="ResourcesGridView_RowDeleted" OnRowUpdating="ResourcesGridView_RowUpdating">
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
        <asp:BoundField DataField="Id" ReadOnly="true" HeaderText="Id" SortExpression="Id"
          Visible="false" />
        <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username"
          ReadOnly="True" />
        <asp:BoundField DataField="DeptName" HeaderText="DeptName" ReadOnly="True" SortExpression="DeptName" />
        <asp:BoundField DataField="TeamName" HeaderText="TeamName" ReadOnly="True" SortExpression="TeamName" />
        <asp:BoundField DataField="GroupName" HeaderText="GroupName" ReadOnly="True" SortExpression="GroupName" />
        <asp:BoundField DataField="RoleName" HeaderText="RoleName" ReadOnly="true" SortExpression="RoleName" />
        <asp:TemplateField ShowHeader="False">
          <EditItemTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
              Text="Update"></asp:LinkButton>
            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
              Text="Cancel"></asp:LinkButton>
          </EditItemTemplate>
          <ItemTemplate>
            <asp:HyperLink ID="LinkButton1" runat="server" CausesValidation="False" 
            NavigateUrl='<%# Eval("Id", "ResourceEdit.aspx?Id={0}") %>' Text="Edit" ></asp:HyperLink>
          </ItemTemplate>
        </asp:TemplateField>
      </Columns>
    </asp:GridView>
  </asp:Panel>
  <asp:SqlDataSource ID="ResourceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
    SelectCommand="spGetResources" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE [Resources] SET [Active] = @Active WHERE (Id = @Id)">
    <UpdateParameters>
      <asp:Parameter Name="Id" />
      <asp:Parameter Name="Active" />
    </UpdateParameters>
  </asp:SqlDataSource>
  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="NewResource.aspx">New</asp:HyperLink>
</asp:Content>
