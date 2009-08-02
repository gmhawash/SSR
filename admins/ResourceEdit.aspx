<%@ Page Language="C#" MasterPageFile="~/admins/MasterPage.master" AutoEventWireup="true" CodeFile="ResourceEdit.aspx.cs" Inherits="admins_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="clear:both">
Username:<label style="font-style:italic">&nbsp; <%= Membership.GetUser(new Guid(Request["Id"])).UserName  %></label>
<br />
<br />
  <asp:CheckBox ID="Active" runat="server" Text="Active" /> 
  <br />
  
<asp:Panel ID="Panel1" runat="server">
</asp:Panel>
<br />
  <asp:Button ID="Save" runat="server" Text="Save Changes" 
    onclick="Save_Click"  />
  <asp:Button ID="Cancel" runat="server" Text="Cancel" onclick="Cancel_Click" />
  </div>
</asp:Content>

