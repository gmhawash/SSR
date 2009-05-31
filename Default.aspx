<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:LoginView ID="LoginView1" runat="server">
      <LoggedInTemplate>
        Welcome
        <asp:LoginName ID="LoginName1" runat="server" />
        &nbsp;<asp:LoginStatus ID="LoginStatus2" runat="server" />
        &nbsp;
      </LoggedInTemplate>
      <AnonymousTemplate>
        Welcome to to the Resource&nbsp;
        <asp:LoginStatus ID="LoginStatus1" runat="server"  />   
      </AnonymousTemplate>
    </asp:LoginView>

</asp:Content>

