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
    <!--- Do not delete this panel, it is used in the code.. --->
    </asp:Panel>
    <asp:TextBox ID="TicketId" runat="server" Visible="false"></asp:TextBox>
    <div class="field">
      <label class="required">
        Received Date:</label>
      <asp:TextBox ID="ReceivedDate" CssClass="date" runat="server">
      </asp:TextBox>
      <a href="javascript:OpenPopupPage('calendar.aspx','<%= ReceivedDate.ClientID %>','<%= Page.IsPostBack %>');">
        <img src="../images/icon-calendar.gif" border="0" align="absBottom" width="24" height="23"></a>
    </div>
    <div class='field'>
      Actual Hours<asp:TextBox ID="Actual_Hours" runat="server"></asp:TextBox></div>
    <div class='field'>
      Actual Dollars<asp:TextBox ID="Actual_Cost" runat="server"></asp:TextBox></div>
    <asp:panel ID="QAPanel" runat="server" CssClass="panel">
        <div class="checkbox">
          <asp:CheckBox ID="NeedsQA" runat="server"></asp:CheckBox>
          <label>Needs QA?</label>
        </div>
        <div class="field">
          <label>Due to QA On:</label>
          <asp:TextBox ID="DueToQADate" runat="server" CssClass="date" ></asp:TextBox>
          <a href="javascript:OpenPopupPage('calendar.aspx','<%= DueToQADate.ClientID %>','<%= Page.IsPostBack %>');">
            <img src="../images/icon-calendar.gif" border="0" align="absBottom" width="24" height="23"></a>
        </div>
        <div class="field">
          <label >QA Complete Date:</label>
          <asp:TextBox ID="QACompleteDate" runat="server" CssClass="date" ></asp:TextBox>
          <a href="javascript:OpenPopupPage('calendar.aspx','<%= QACompleteDate.ClientID %>','<%= Page.IsPostBack %>');">
            <img src="../images/icon-calendar.gif" border="0" align="absBottom" width="24" height="23"></a>
        </div>
      </asp:panel>
    <asp:panel ID="InProgressPanel" runat="server" CssClass="panel">
        <div class="field">
          <label >
            User Testing On:</label>
          <asp:TextBox ID="UserTestDueDate" CssClass="date" runat="server"></asp:TextBox>
          <a href="javascript:OpenPopupPage('calendar.aspx','<%= UserTestDueDate.ClientID %>','<%= Page.IsPostBack %>');">
            <img src="../images/icon-calendar.gif" border="0" align="absBottom" width="24" height="23"></a>
        </div>
        <div class="field">
          <label >
            User Testing Complete On:</label>
          <asp:TextBox ID="UserCompleteDate" runat="server" CssClass="date" ></asp:TextBox>
          <a href="javascript:OpenPopupPage('calendar.aspx','<%= UserCompleteDate.ClientID %>','<%= Page.IsPostBack %>');">
            <img src="../images/icon-calendar.gif" border="0" align="absBottom" width="24" height="23"></a>
        </div>
        <div class="field">
          <label >
            Planned Implementation Date:</label>
          <asp:TextBox ID="ImplementationDate" runat="server" CssClass="date" ></asp:TextBox>
          <a href="javascript:OpenPopupPage('calendar.aspx','<%= ImplementationDate.ClientID %>','<%= Page.IsPostBack %>');">
            <img src="../images/icon-calendar.gif" border="0" align="absBottom" width="24" height="23"></a>
        </div>
      </asp:panel>

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
