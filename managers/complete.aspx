<%@ Page Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true" CodeFile="complete.aspx.cs" Inherits="managers_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="field">
      <label class="required">
        Implementation Date:</label>
      <asp:TextBox ID="ImplemenatationDate" CssClass="date" runat="server">
      </asp:TextBox>
      <a href="javascript:OpenPopupPage('calendar.aspx','<%= ImplemenatationDate.ClientID %>','<%= Page.IsPostBack %>');">
        <img src="../images/icon-calendar.gif" border="0" align="absBottom" width="24" height="23"></a>
    </div>
    
<div style="clear:both;margin-left:3em;">
<asp:Button ID="Submit" runat="server" Text="Submit" onclick="Yes_Click" />
<asp:Button ID="Cancel" runat="server" Text="Cancel" onclick="No_Click" />
</div>    
    
</asp:Content>

