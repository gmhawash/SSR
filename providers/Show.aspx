<%@ Page Title="" Language="C#" MasterPageFile="./MasterPage.master" AutoEventWireup="true"
  CodeFile="Show.aspx.cs" Inherits="providers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:Panel ID="View1" runat="server" CssClass="clear">
    <asp:Label ID="Id" Visible="false" runat="server" />
    <asp:Table ID="Table1" runat="server" Width="900px">
      <asp:TableRow ID="TableRow1" runat="server" VerticalAlign="Top">
      </asp:TableRow>
      <asp:TableRow ID="TableRow2" runat="server" VerticalAlign="Top">
      </asp:TableRow>
    </asp:Table>
      <div style="padding: 1em;">
        <asp:Button ID="Back" runat="server" Text="Back" OnClick="Back_Click" />
      </div>
    <fieldset>
      <div class='editbox'>
        <div>
          Summary:</div>
        <asp:TextBox ID="Summary" runat="server" CssClass="editbox" Rows="4" TextMode="MultiLine"
          Enabled="false" /></div>
      <div class='editbox'>
        <div>
          Description:</div>
        <asp:TextBox ID="Description" runat="server" CssClass="editbox" Rows="4" TextMode="MultiLine"
          Enabled="false" /></div>
      <div class='editbox'>
        <div>
          Cancel Comment:</div>
        <asp:TextBox ID="CancelComment" runat="server" CssClass="editbox" Rows="4" TextMode="MultiLine"
          Enabled="false" /></div>
          </fieldset>
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
