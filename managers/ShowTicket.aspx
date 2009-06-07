<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true" CodeFile="ShowTicket.aspx.cs" Inherits="managers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="Id" DataSourceID="ObjectDataSource1" 
        ForeColor="Black" GridLines="Vertical" Height="50px" Width="125px">
        <FooterStyle BackColor="#CCCC99" />
        <RowStyle BackColor="#F7F7DE" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" 
                SortExpression="Id" />
            <asp:BoundField DataField="ProjectId" HeaderText="ProjectId" 
                SortExpression="ProjectId" />
            <asp:BoundField DataField="DeptId" HeaderText="DeptId" 
                SortExpression="DeptId" />
            <asp:BoundField DataField="PriorityId" HeaderText="PriorityId" 
                SortExpression="PriorityId" />
            <asp:BoundField DataField="StatusId" HeaderText="StatusId" 
                SortExpression="StatusId" />
            <asp:BoundField DataField="GroupId" HeaderText="GroupId" 
                SortExpression="GroupId" />
            <asp:BoundField DataField="TeamId" HeaderText="TeamId" 
                SortExpression="TeamId" />
            <asp:BoundField DataField="CanceledBy" HeaderText="CanceledBy" 
                SortExpression="CanceledBy" />
            <asp:BoundField DataField="Number" HeaderText="Number" 
                SortExpression="Number" />
            <asp:BoundField DataField="Summary" HeaderText="Summary" 
                SortExpression="Summary" />
            <asp:BoundField DataField="RequestedBy" HeaderText="RequestedBy" 
                SortExpression="RequestedBy" />
            <asp:BoundField DataField="ReceivedOn" HeaderText="ReceivedOn" 
                SortExpression="ReceivedOn" />
            <asp:CheckBoxField DataField="QARequired" HeaderText="QARequired" 
                SortExpression="QARequired" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:BoundField DataField="WorkOrderNumber" HeaderText="WorkOrderNumber" 
                SortExpression="WorkOrderNumber" />
            <asp:BoundField DataField="EstimatedHours" HeaderText="EstimatedHours" 
                SortExpression="EstimatedHours" />
            <asp:BoundField DataField="EstimatedCost" HeaderText="EstimatedCost" 
                SortExpression="EstimatedCost" />
            <asp:BoundField DataField="ActualHours" HeaderText="ActualHours" 
                SortExpression="ActualHours" />
            <asp:BoundField DataField="ActualCost" HeaderText="ActualCost" 
                SortExpression="ActualCost" />
            <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                SortExpression="EndDate" />
            <asp:BoundField DataField="QAStartDate" HeaderText="QAStartDate" 
                SortExpression="QAStartDate" />
            <asp:BoundField DataField="QADueDate" HeaderText="QADueDate" 
                SortExpression="QADueDate" />
            <asp:BoundField DataField="QACompletedDate" HeaderText="QACompletedDate" 
                SortExpression="QACompletedDate" />
            <asp:BoundField DataField="AcceptedOn" HeaderText="AcceptedOn" 
                SortExpression="AcceptedOn" />
            <asp:BoundField DataField="CaneledOn" HeaderText="CaneledOn" 
                SortExpression="CaneledOn" />
            <asp:BoundField DataField="CancelComment" HeaderText="CancelComment" 
                SortExpression="CancelComment" />
            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" 
                SortExpression="CreatedBy" />
        </Fields>
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
</asp:Content>

