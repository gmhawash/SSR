<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true" CodeFile="ShowTicket.aspx.cs" Inherits="managers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="ShowTicketView" runat="server" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4"  
        ForeColor="Black" GridLines="Vertical" Height="50px" Width="125px" AutoGenerateRows="false"
        >
        <FooterStyle BackColor="#CCCC99" />
        <RowStyle BackColor="#F7F7DE" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <Fields>
            <asp:BoundField DataField="Number" HeaderText="Number" />
            <asp:BoundField DataField="ProjectName" HeaderText="Project" />
            <asp:BoundField DataField="DeptName" HeaderText="Department" />
            <asp:BoundField DataField="PriorityName" HeaderText="Priority" />
            <asp:BoundField DataField="GroupName" HeaderText="Group" />
            <asp:BoundField DataField="TeamName" HeaderText="Team" />
            <asp:BoundField DataField="StatusName" HeaderText="Status" />
            <asp:BoundField DataField="Creater" HeaderText="Created By" />
            <asp:BoundField DataField="Requester" HeaderText="Requested By" />
            <asp:BoundField DataField="Summary" HeaderText="Summary" />
            <asp:BoundField DataField="QARequired" HeaderText="QA Required" />
            <asp:BoundField DataField="WorkOrderNumber" HeaderText="Work Order Number" />
            <asp:BoundField DataField="EstimatedHours" HeaderText="Estimated Hours" />
            <asp:BoundField DataField="EstimatedCost" HeaderText="Estimated Cost" />
            <asp:BoundField DataField="ActualHours" HeaderText="Actual Hours" />
            <asp:BoundField DataField="ActualCost" HeaderText="Actual Cost" />
        </Fields>
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>

</asp:Content>

