<%@ Page Title="" Language="C#" MasterPageFile="~/admins/MasterPage.master" AutoEventWireup="true"
    CodeFile="NewResource.aspx.cs" Inherits="admins_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="float_left">
        <fieldset>
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser"
                OnFinishButtonClick="Wizard_FinishClick" 
                ContinueDestinationPageUrl="~/admins/Resources.aspx" LoginCreatedUser="false"
                style="margin-right: 297px" Width="299px">
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" />
                    <asp:WizardStep ID="Panel1" runat="server" StepType="Finish">
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep1" runat="server" StepType="Complete">
                        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                        <br /><asp:Button runat="server" PostBackUrl="~/admins/Resources.aspx" Text="Continue"/>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:CreateUserWizard>
        </fieldset>
    </div>
</asp:Content> 