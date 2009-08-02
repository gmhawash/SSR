<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="managers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" 
        ForeColor="Black" GridLines="Vertical">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" 
                SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                SortExpression="Active" />
            <asp:BoundField DataField="Dept" HeaderText="Dept" ReadOnly="True" 
                SortExpression="Dept" />
            <asp:BoundField DataField="Group" HeaderText="Group" ReadOnly="True" 
                SortExpression="Group" />
            <asp:TemplateField ShowHeader="False">
              <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                  CommandName="Delete" Text="Delete"></asp:LinkButton>
              </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    
    <div style="margin-left:3em"><small>Note: Cannot delete products which are assigned to SSRs...</small></div>
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/managers/ProjectEdit.aspx">New</asp:HyperLink>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>" 
        SelectCommand="spGetProjects" SelectCommandType="StoredProcedure" 
      DeleteCommand="DELETE FROM Projects WHERE (Id = @Id)" >
      <DeleteParameters>
        <asp:Parameter Name="Id" />
      </DeleteParameters>
        
    </asp:SqlDataSource>
</asp:Content>

