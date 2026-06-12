<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookPaymentTransfer.aspx.cs" Inherits="iWMS.Web.Accounting.CashBookPayment.CashBookPaymentTransfer" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head runat="server">
    <title>SMSQUEUE Check Credit</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <base target="_self" />

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            sender.setUrl("about:blank");
        }
    </script>
    <style type="text/css">
        .preference .rwWindowContent {
            background-color: #E6EAFF !important;
        }
    </style>

    <style type="text/css">
        .style1 {
            padding-left: 90px;
        }

        .style2 {
            padding-left: 220px;
        }
    </style>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindow runat="server" ID="BankTransferRadWindow" VisibleOnPageLoad="true" Title="Inter-Bank Transfer @ Cash Book Payment"
            Width="800" Height="550" VisibleStatusbar="false" OnClientClose="OnClientClose">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 3%">
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 3%">
                            <br />
                            <asp:Button ID="TransferBtn" runat="server" Text="Transfer" CssClass="white" ToolTip="Transfer"
                                OnClick="TransferBtn_Click" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </telerik:RadWindow>
    </form>
</body>
</html>
