<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetRegisterV2Copy.aspx.cs" Inherits="iWMS.Web.Sales.CostingSheetRegisterV2.CostingSheetRegisterV2Copy" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>CostingSheetRegisterV2Copy</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

    <base target="_self">
    <meta content="no-cache" http-equiv="Pragma">
    <style type="text/css">
        .style1 {
            width: 36px;
        }

        .style4 {
            width: 6.15%;
        }

        .style5 {
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
                    <td class="style5">&nbsp;CopyFromCostingSheetNo
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
                    <td class="style5">&nbsp;CopyToAccount
                    </td>
                    <tr>
                        <td valign="top">
                          <%--  <telerik:RadDropDownList ID="toAccountDDL" TabIndex="5" runat="server" Skin="WebBlue">
                            </telerik:RadDropDownList>--%>

<%--                            <telerik:RadComboBox ID="toAccountDDL" runat="server" DataTextField="Code" DataValueField="Acid" RenderMode="Lightweight" Skin="WebBlue" Width="170px"                                
                                HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" OnItemsRequested="toAccountDDL_ItemsRequested">
                            </telerik:RadComboBox>--%>
                             <iWMS:iForm ID="formCtl" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <td class="style5">&nbsp;ShipperName
                    </td>
                    <tr>
                        <td valign="top">
                            <telerik:RadTextBox ID="ShipperNameTxt" runat="server" Skin="WebBlue">
                            </telerik:RadTextBox>&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <td class="style5">&nbsp;POL
                    </td>
                    <tr>
                        <td valign="top">
                            <telerik:RadComboBox ID="POLCBB" runat="server" Skin="WebBlue" RenderMode="Lightweight" 
                                CausesValidation="false" Filter="Contains">
                            </telerik:RadComboBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <td class="style5">&nbsp;POD
                    </td>
                    <tr>
                        <td valign="top">
                            <telerik:RadComboBox ID="PODCBB" runat="server" Skin="WebBlue" RenderMode="Lightweight" 
                                CausesValidation="false" Filter="Contains" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <br>
                <br />
                <asp:CheckBox ID="detailChkBox" runat="server" Text="IncludeCostingSheetLines" Checked="true"></asp:CheckBox>
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
            <td valign="top"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <%--<telerik:RadButton ID="CopyBtn" RenderMode="Lightweight" runat="server" Text=" Copy "
                    Enabled="False" CssClass="detailbutton" Skin="WebBlue" OnClick="CopyBtn_Click">
                </telerik:RadButton>--%>
                <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy"
                    OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
            </td>
        </tr>
        </table>
    &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
