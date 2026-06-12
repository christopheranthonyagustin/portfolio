<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PTScanOut.aspx.cs" Inherits="iWMS.Web.Outbound.OutgoingShipment.PTScanOut" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PTScanOut via Issue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <base target="_self">
        <meta http-equiv="Pragma" content="no-cache">
        <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
</head>
<body onload="javascript:window.focus();" bottommargin="0" leftmargin="0" topmargin="0"
    rightmargin="0">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td colspan="2">
             <telerik:RadLabel ID="ScanOutLbl" runat="server" CssClass="pagetitle">Pick Ticket Scan Out</telerik:RadLabel>
            </td>
        </tr>
    </table>
    <asp:Panel ID="ScanOutPanel" runat="server">
        <table cellspacing="4" cellpadding="0" width="100%">
            <tr>
                <td width="40%">
                    <telerik:RadLabel ID="PickerCodeLbl" runat="server">PickerId</telerik:RadLabel>
                    <br />
                    <telerik:RadTextBox ID="PickerCodeTxt" runat="server" AutoPostBack="True" BackColor ="#ded7c6" Skin ="Sunset"></telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="PickerIdReq" runat="server" ControlToValidate="PickerCodeTxt"
                        ErrorMessage="*" CssClass="errorLabel"></asp:RequiredFieldValidator>&nbsp;
                    <asp:Label ID="Label2" runat="server" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="40%">
                    <telerik:RadLabel ID="PickTicketLbl" runat="server">PickTicketNo</telerik:RadLabel>
                    <br />
                    <telerik:RadTextBox ID="PtIdTxt" runat="server" AutoPostBack="True" Skin ="Sunset" BackColor ="#ded7c6" OnTextChanged="PtIdTxt_TextChanged"></telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="PTIdReq" runat="server" ControlToValidate="PtIdTxt"
                        ErrorMessage="*" CssClass="errorLabel"></asp:RequiredFieldValidator>&nbsp;
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
            <tr>                
                <td>
                <br />
                    <telerik:RadButton ID="ScanOutBtn" runat="server" Enabled="False" CssClass="detailbutton" Skin ="WebBlue"
                        Text="Scan Out" OnClick="ScanOutBtn_Click"></telerik:RadButton>&nbsp;
                    <asp:CheckBox Style="z-index: 0" ID="AutoPackChkBox" runat="server" Text="Auto-Pack"
                        Checked="True"></asp:CheckBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>
