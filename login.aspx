<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs"  Inherits="login" MasterPageFile="~/MasterPage.master"%>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h2>Please login:</h2>
        <div align="center">
    <asp:Login ID="Login1" runat="server"  DestinationPageUrl="~/Default.aspx" 
            BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" 
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" >
        <TextBoxStyle Font-Size="0.8em" />
        <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
            ForeColor="White" />
    </asp:Login>
    </div>

        <br />
  <asp:HyperLink ID="HyperLink1" NavigateUrl="~/ForgotPassword.aspx" runat="server">Forgot Password</asp:HyperLink>
</asp:Content>
