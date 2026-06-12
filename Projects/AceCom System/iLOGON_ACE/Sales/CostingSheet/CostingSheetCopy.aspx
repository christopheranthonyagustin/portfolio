<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetCopy.aspx.cs"
    Inherits="iWMS.Web.Sales.CostingSheet.CostingSheetCopy" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>CostingSheetCopy</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <base target="_self">
    <meta content="no-cache" http-equiv="Pragma">
    <style type="text/css">
        .style1
        {
            width: 36px;
        }
        .style4
        {
            width: 6.15%;
        }
        .style5
        {
            width: 5.25%;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table cellspacing="2" cellpadding="2">
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <td class="style5">
                        &nbsp;CopyFromCostingSheetNo
                    </td>
                    <tr>
                        <td valign="top">
                            <telerik:RadTextBox ID="QuCodeTxt" runat="server" AutoPostBack="True" BackColor="Yellow"
                                OnTextChanged="QuCodeTxt_TextChanged">
                            </telerik:RadTextBox>&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <td class="style5">
                        &nbsp;CopyToAccount
                    </td>
                    <tr>
                        <td valign="top">
                            <telerik:RadDropDownList ID="toAccountDDL" TabIndex="5" runat="server" Skin="WebBlue">
                            </telerik:RadDropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <br>
                <br />
                <asp:CheckBox ID="detailChkBox" runat="server" Text="IncludeCostingSheetLines" Checked="true">
                </asp:CheckBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <br>
                <br />
                <asp:CheckBox ID="NoOfRevChkBox" runat="server" Text="NewRevision" OnCheckedChanged="NoOfRevChkBox_CheckChanged"
                    AutoPostBack="true"></asp:CheckBox>
                <br />
                <br />
                <br />
            </td>
            <td valign="top">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <telerik:RadButton ID="CopyBtn" RenderMode="Lightweight" runat="server" Text=" Copy "
                    Enabled="False" CssClass="detailbutton" Skin="WebBlue" OnClick="CopyBtn_Click">
                </telerik:RadButton>
            </td>
        </tr>
    </table>
    &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
