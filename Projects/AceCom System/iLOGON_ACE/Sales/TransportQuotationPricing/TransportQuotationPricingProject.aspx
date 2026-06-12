<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportQuotationPricingProject.aspx.cs" Inherits="iWMS.Web.Sales.TransportQuotationPricing.TransportQuotationPricingProject" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Project @ Transport Quotation Pricing</title>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="SaveBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" CssClass="white" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button runat="server" ID="QuotationBtn" Text="Quotation" CausesValidation="false"
                        UseSubmitBehavior="false" CssClass="blue" OnClientClick="disableBtn(this.id)" OnClick="QuotationBtn_Click" />
                </td>
            </tr>
            <tr>
                <td>
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="DescriptionTxtBox" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadTextBox ID="DescriptionTxtBox" runat="server" Width="1450px" Height="600px" TextMode="MultiLine" Resize="Both"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
