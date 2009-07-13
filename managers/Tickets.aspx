<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true"
    CodeFile="Tickets.aspx.cs" Inherits="managers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
        DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None"
        AllowPaging="True" AllowSorting="True">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"
                Visible="false" />
            <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" />
            <asp:BoundField DataField="Creator" HeaderText="Created By" SortExpression="Created By" />
            <asp:BoundField DataField="Dept" HeaderText="Dept" ReadOnly="True" SortExpression="Dept" />
            <asp:BoundField DataField="Group" HeaderText="Group" ReadOnly="True" SortExpression="Group" />
            <asp:BoundField DataField="Project" HeaderText="Project" ReadOnly="True" SortExpression="Project" />
            <asp:BoundField DataField="Team" HeaderText="Team" ReadOnly="True" SortExpression="Team" />
            <asp:BoundField DataField="Priority" HeaderText="Priority" ReadOnly="True" SortExpression="Priority" />
            <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" SortExpression="Status" />
            <asp:TemplateField HeaderText="Summary" SortExpression="Summary">
                <ItemTemplate>
                    <asp:Literal ID="Label1" runat="server" Text='<%# Utility.TrimString(Eval("Summary")) %>' ></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
            <asp:HyperLinkField HeaderText="" 
                                Text="Edit" 
                                DataNavigateUrlFields="Id"
                                DataNavigateUrlFormatString="~/managers/TicketEdit.aspx?Id={0}" />
            <asp:HyperLinkField HeaderText="" 
                                Text="Cancel" 
                                DataNavigateUrlFields="Id"
                                DataNavigateUrlFormatString="~/managers/Cancel.aspx?Id={0}" />
            <asp:HyperLinkField HeaderText="" 
                                Text="Show" 
                                DataNavigateUrlFields="Id"
                                DataNavigateUrlFormatString="~/managers/Show.aspx?Id={0}" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
        SelectCommand="spGetTicketByCreator" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="UserId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/managers/TicketEdit.aspx">New</asp:HyperLink>
</asp:Content>
