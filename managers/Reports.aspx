﻿<%@ Page Title="" Language="C#" MasterPageFile="~/managers/MasterPage.master" AutoEventWireup="true"
    CodeFile="Reports.aspx.cs" Inherits="managers_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2"
        Font-Names="Verdana" Font-Size="1em" ForeColor="#284E98" StaticSubMenuIndent="10px"
        Orientation="Horizontal" OnMenuItemClick="Menu1_MenuItemClick">
        <StaticSelectedStyle BackColor="#507CD1" />
        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
        <DynamicMenuStyle BackColor="#B5C7DE" />
        <DynamicSelectedStyle BackColor="#507CD1" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
        <Items>
            <asp:MenuItem Text="Canceled" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="Pending" Value="1"></asp:MenuItem>
            <asp:MenuItem Text="In Progress" Value="2"></asp:MenuItem>
            <asp:MenuItem Text="Completed" Value="3"></asp:MenuItem>
            <asp:MenuItem Text="Resources" Value="4"></asp:MenuItem>
        </Items>
    </asp:Menu>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="Tab1" runat="server">
            <table width="600" height="400" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="TabArea" style="width: 600px">
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False"
                            DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                            BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                            <RowStyle BackColor="#F7F7DE" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"
                                    Visible="false" />
                                <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" />
                                <asp:BoundField DataField="WorkOrderNumber" HeaderText="WorkOrderNumber" SortExpression="WorkOrderNumber" />
                                <asp:BoundField DataField="Requester" HeaderText="Requested By" SortExpression="Requester" />
                                <asp:BoundField DataField="Creator" HeaderText="CreatedBy" SortExpression="Creator" />
                                <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                <asp:BoundField DataField="Cancelor" HeaderText="Canceled By" ReadOnly="True" SortExpression="Cancelor" />
                                <asp:BoundField DataField="CanceledOn" HeaderText="CanceledOn" SortExpression="CanceledOn" />
                                <asp:BoundField DataField="CancelComment" HeaderText="CancelComment" SortExpression="CancelComment" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
                            SelectCommand="spGetCanceledTicketsByCreator" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserId" SessionField="UserId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="Tab2" runat="server">
            <table width="600px" height="400px" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="TabArea" style="width: 600px">
                        <br />
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                            DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                            BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                            <RowStyle BackColor="#F7F7DE" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"
                                    Visible="false" />
                                <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" />
                                <asp:BoundField DataField="WorkOrderNumber" HeaderText="WorkOrderNumber" SortExpression="WorkOrderNumber" />
                                <asp:BoundField DataField="Requester" HeaderText="Requested By" SortExpression="Requester" />
                                <asp:BoundField DataField="Creator" HeaderText="CreatedBy" SortExpression="Creator" />
                                <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
                            SelectCommand="spGetTicketsByCreatorAndStatus" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserId" SessionField="UserId" />
                                <asp:Parameter DefaultValue="Pending" Name="Status" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="Tab3" runat="server">
            <table width="600px" height="400px" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="TabArea" style="width: 600px">
                        <br />
                        <br />
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"
                            DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                            BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                            <RowStyle BackColor="#F7F7DE" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"
                                    Visible="false" />
                                <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" />
                                <asp:BoundField DataField="WorkOrderNumber" HeaderText="WorkOrderNumber" SortExpression="WorkOrderNumber" />
                                <asp:BoundField DataField="Requester" HeaderText="Requested By" SortExpression="Requester" />
                                <asp:BoundField DataField="Creator" HeaderText="CreatedBy" SortExpression="Creator" />
                                <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
                            SelectCommand="spGetTicketsByCreatorAndStatus" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserId" SessionField="UserId" />
                                <asp:Parameter DefaultValue="In Progress" Name="Status" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="Tab4" runat="server">
            <table width="600px" height="400px" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="TabArea" style="width: 600px">
                        <br />
                        <br />
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4"
                            DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                            BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                            <RowStyle BackColor="#F7F7DE" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"
                                    Visible="false" />
                                <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" />
                                <asp:BoundField DataField="WorkOrderNumber" HeaderText="WorkOrderNumber" SortExpression="WorkOrderNumber" />
                                <asp:BoundField DataField="Requester" HeaderText="Requested By" SortExpression="Requester" />
                                <asp:BoundField DataField="Creator" HeaderText="CreatedBy" SortExpression="Creator" />
                                <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
                            SelectCommand="spGetTicketsByCreatorAndStatus" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserId" SessionField="UserId" />
                                <asp:Parameter DefaultValue="Complete" Name="Status" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="Tab5" runat="server">
            <table width="600px" height="400px" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="TabArea" style="width: 600px">
                        <br />
                        <br />
                        <asp:GridView ID="ResourcesGridView" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" DataSourceID="ResourceDataSource" DataKeyNames="Id" >
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false"/>
                                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username"
                                    ReadOnly="True" />
                                <asp:BoundField DataField="DeptName" HeaderText="DeptName" ReadOnly="True" SortExpression="DeptName" />
                                <asp:BoundField DataField="TeamName" HeaderText="TeamName" ReadOnly="True" SortExpression="TeamName" />
                                <asp:BoundField DataField="GroupName" HeaderText="GroupName" ReadOnly="True" SortExpression="GroupName" />
                                <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" ReadOnly="true" />
                                <asp:BoundField DataField="RoleName" HeaderText="Role Name" ReadOnly="true" SortExpression="RoleName" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="ResourceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
                            SelectCommand="spGetProviders"
                            SelectCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
