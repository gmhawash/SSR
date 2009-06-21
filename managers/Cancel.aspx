<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true" CodeFile="Cancel.aspx.cs" Inherits="managers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Please provide a comment for canceling this ticket.<br />
    <asp:TextBox ID="CancelComment" runat="server" Height="178px" 
        TextMode="MultiLine" Width="909px"></asp:TextBox>
    <br />
&nbsp;<asp:Button ID="Yes" runat="server" Text="Yes" onclick="Yes_Click" />
<asp:Button ID="No" runat="server" Text="Oh NO" onclick="No_Click" />
</asp:Content>


