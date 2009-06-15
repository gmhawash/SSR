<%@ Page Title="" Language="C#" MasterPageFile="~/admins/MasterPage.master" AutoEventWireup="true"
    CodeFile="Tickets.aspx.cs" Inherits="admins_Tickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" 
        ForeColor="#333333" GridLines="None" AllowPaging="True" 
    AllowSorting="True">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" 
                SortExpression="Id" visible="false"/>
            <asp:BoundField DataField="Number" HeaderText="Number" 
                SortExpression="Number" />
            <asp:BoundField DataField="WorkOrderNumber" HeaderText="WorkOrderNumber" 
                SortExpression="WorkOrderNumber" />
            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" 
                SortExpression="CreatedBy" />
            <asp:BoundField DataField="Dept" HeaderText="Dept" ReadOnly="True" 
                SortExpression="Dept" />
            <asp:BoundField DataField="Group" HeaderText="Group" ReadOnly="True" 
                SortExpression="Group" />
            <asp:BoundField DataField="Project" HeaderText="Project" ReadOnly="True" 
                SortExpression="Project" />
            <asp:BoundField DataField="Team" HeaderText="Team" ReadOnly="True" 
                SortExpression="Team" />
            <asp:BoundField DataField="Priority" HeaderText="Priority" ReadOnly="True" 
                SortExpression="Priority" />
            <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" 
                SortExpression="Status" />            <asp:BoundField DataField="CanceledBy" HeaderText="CanceledBy" 
                SortExpression="CanceledBy" />
            <asp:BoundField DataField="Summary" HeaderText="Summary" 
                SortExpression="Summary" />
            <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                SortExpression="EndDate" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>" 
        SelectCommand="spGetTicket" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

</asp:Content>
