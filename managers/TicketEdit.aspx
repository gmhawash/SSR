<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true" CodeFile="TicketEdit.aspx.cs" Inherits="managers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id='Dept' class="field">
    <asp:Label ID="lb_dept" runat="server" Text="Dept: "></asp:Label>
    <asp:DropDownList ID="DeptDropDown" runat="server" 
        DataTextField="Description" DataValueField="Description" 
        ></asp:DropDownList>
  </div>

</asp:Content>

