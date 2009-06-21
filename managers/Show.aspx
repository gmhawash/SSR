﻿<%@ Page Title="" Language="C#" MasterPageFile="~/providers/MasterPage.master" AutoEventWireup="true"
    CodeFile="Show.aspx.cs" Inherits="providers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="View1" runat="server">
        <asp:Label ID="Id" Visible="false" runat="server" />
        <div class='field'>
            <div>
                Number:</div>
            <asp:Label ID="Number" runat="server" /></div>
        <div class='field'>
            <div>
                Work Order Number:</div>
            <asp:Label ID="WorkOrderNumber" runat="server" /></div>
        <div class='field'>
            <div>
                Summary:</div>
            <asp:Label ID="Summary" runat="server" /></div>
        <div class='field'>
            <div>
                Description:</div>
            <asp:Label ID="Description" runat="server" /></div>
        <div class='field'>
            <div>
                Received On:</div>
            <asp:Label ID="ReceivedOn" runat="server" /></div>
        <div class='field'>
            <div>QA Required:</div>
            <asp:CheckBox ID="QARequired" runat="server" /></div>
        <div class='field'>
        <div>Estimated Hours:</div>
            <asp:Label ID="EstimatedHours" runat="server" /></div>
        <div class='field'>
        <div>Estimated Cost:</div>
            <asp:Label ID="EstimatedCost" runat="server" /></div>
        <div class='field'>
        <div>Acutal Hours:</div>
            <asp:Label ID="ActualHours" runat="server" /></div>
        <div class='field'>
        <div>Actual Cost:</div>
            <asp:Label ID="ActualCost" runat="server" /></div>
        <div class='field'>
        <div>Department:</div>
            <asp:Label ID="Dept" runat="server" /></div>
        <div class='field'>
        <div>Group:</div>
            <asp:Label ID="Group" runat="server" /></div>
        <div class='field'>
        <div>Project:</div>    
        <asp:Label ID="Project" runat="server" /></div>
        <div class='field'>
        <div>Team:</div>
            <asp:Label ID="Team" runat="server" /></div>
        <div class='field'>
        <div>Priority:</div>
            <asp:Label ID="Priority" runat="server" /></div>
        <div class='field'>
        <div>Created By:</div>
            <asp:Label ID="Creator" runat="server" /></div>
    </asp:Panel>
    <fieldset>
        Add your note to this ticket:
        <asp:TextBox ID="Note" runat="server" Height="146px" TextMode="MultiLine" Width="876px"></asp:TextBox>
        <br />
        <asp:Button ID="AddNote" runat="server" Text="Add Note" OnClick="AddNote_Click" />
    </fieldset>
    <fieldset>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <br />
                <br />
                Posted By: <strong>
                    <%# Eval("Username") %>
                    On:
                    <%# Eval("CreatedOn") %>
                </strong>
                <div class="note">
                    <%# Eval("Body") %>
                </div>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <br />
                <br />
                Posted By: <strong>
                    <%# Eval("Username") %>
                    On:
                    <%# Eval("CreatedOn") %>
                </strong>
                <div class="note2">
                    <%# Eval("Body") %>
                </div>
            </AlternatingItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
            SelectCommand="spGetMessages" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="TicketId" SessionField="TicketId" />
            </SelectParameters>
        </asp:SqlDataSource>
    </fieldset>
</asp:Content>
