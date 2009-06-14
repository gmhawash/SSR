<%@ Page Title="" Language="C#" MasterPageFile="~/admins/MasterPage.master" AutoEventWireup="true"
    CodeFile="NewResource.aspx.cs" Inherits="admins_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="float_left">
        <fieldset>
    <asp:CreateUserWizard 
                ID="CreateUserWizard1" 
                runat="server" 
                oncreateduser="CreateUserWizard1_CreatedUser" 
                OnFinishButtonClick="Wizard_FinishClick"
                ContinueDestinationPageUrl="~/admins/Resources.aspx">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" />
            <asp:WizardStep ID="Panel1" runat="server" StepType="Finish">
            </asp:WizardStep>
<asp:CompleteWizardStep runat="server"></asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
        </fieldset>
    </div>
    <asp:SqlDataSource ID="RsrcDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
        SelectCommand="SELECT * FROM [Resources]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ResourceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:aspnetdbConnectionString1 %>"
        SelectCommand="spGetResources" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:ObjectDataSource ID="ResourceDataBase" runat="server"></asp:ObjectDataSource>
</asp:Content>
