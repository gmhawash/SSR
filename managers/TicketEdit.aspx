<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true"
    CodeFile="TicketEdit.aspx.cs" Inherits="managers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="float_right">
        <asp:Button ID="Discard" runat="server" Text="Discard" OnClick="Discard_Click" />
        <asp:Button ID="Create" runat="server" Text="Create" OnClick="Create_Click" />
        <asp:Button ID="CreateAndAssign" runat="server" Text="Create and Assign" OnClick="Create_Click" />
    </div>
    <fieldset style='width: 93%'>
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
            <asp:Textbox ID="TicketId" runat="server" Visible="false"></asp:Textbox>
        <div class="field">
            Received Date:
            <asp:TextBox ID="ReceivedDate" CssClass="date" runat="server">
            </asp:TextBox>
            <a href="javascript:OpenPopupPage('calendar.aspx','<%= ReceivedDate.ClientID %>','<%= Page.IsPostBack %>');">
                <img src="../images/icon-calendar.gif" border="0" align="absBottom" width="24" height="23"></a>
        </div>
        <div class="field">
            <br />
            <asp:CheckBox ID="NeedsQA" runat="server" />
            Needs QA
        </div>
        <div class="clear">
            <div class='field'>
                Actual Hours<asp:TextBox ID="Actual_Hours" runat="server"></asp:TextBox></div>
            <div class='field'>
                Actual Dollars<asp:TextBox ID="Actual_Cost" runat="server"></asp:TextBox></div>
        </div>
        <div class="editbox">
            <label class='required'>
                Summary:</label>
            <asp:TextBox ID="Summary" runat="server" CssClass="editbox" Rows="4" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="editbox">
            <label class='required'>
                Full Description:</label>
            <asp:TextBox ID="Description" runat="server" CssClass="editbox" Rows="8" TextMode="MultiLine"></asp:TextBox>
        </div>
    </fieldset>
</asp:Content>
