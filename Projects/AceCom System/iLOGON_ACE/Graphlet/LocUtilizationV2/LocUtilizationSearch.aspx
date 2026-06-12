<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocUtilizationSearch.aspx.cs"
    Inherits="iWMS.Web.Graphlet.LocUtilizationV2.LocUtilizationSearch" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>LocUtilization</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <style type="text/css">
        .style1
        {
            height: 11px;
        }
        .style2
        {
            width: 2%;
        }
        .style3
        {
            width: 2%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%" class="style1">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="20%" class="style1">
                <%--<table border="0" cellspacing="2" cellpadding="2" width="100%" visible="false">
                    <tr>
                        <td>
                            <asp:Label ID="SelectLbl" runat="server">Display</asp:Label>&nbsp;:
                            <input onclick="checkBoxes(this.form, this.checked)" value="ALL SBU" type="checkbox"
                                name="checkall">&nbsp;ALL
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBoxList ID="DisplayChkBoxList" runat="server" RepeatColumns="3" Width="511px"
                                CellSpacing="4" CellPadding="5">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                </table>--%>
            </td>
        </tr>
        <table border="0" cellspacing="2" cellpadding="2" width="75%">
      
            <tr>
                <td width="15%">
            Zone</td>
            <td align="center" class="style3">
            &nbsp;</td>
            <td width="15%">
            ToExclude</td>
            <td width="26%">
            &nbsp;</td>
            </td>
        </tr>
        <tr>
                <td class="style2">
                               <telerik:RadListBox runat="server" ID="ZoneList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="ZoneToExclList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="ZoneList_Transferred">
                                </telerik:RadListBox>
                                </td>
                <td class="style3">
                    &nbsp;</td>
                <td width="8%" align="center">
                                <telerik:RadListBox runat="server" ID="ZoneToExclList" Height="120px" Width="200px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false">
                                </telerik:RadListBox>
                                </td>
                <td width="15%">
                    &nbsp;</td>
                <td width="26%">
                    &nbsp;</td>
            </tr>
        </table>
        <table border="0" cellspacing="2" cellpadding="2" width="75%">
        <tr>
            <td width="15%">
            LocationCat</td>
            <td align="center" class="style3">
            &nbsp;</td>
            <td width="15%">
            ToExclude</td>
            <td width="26%">
            &nbsp;</td>
            </td>
        </tr>
        <tr>
                <td class="style2">
                               <telerik:RadListBox runat="server" ID="LocationCatList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="LoccatToExclList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="LocationCatList_Transferred">
                                </telerik:RadListBox>
                                </td>
                <td class="style3">
                    &nbsp;</td>
                <td width="8%" align="center">
                                <telerik:RadListBox runat="server" ID="LoccatToExclList" Height="120px" Width="200px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false">
                                </telerik:RadListBox>
                                </td>
                <td width="15%">
                    &nbsp;</td>
                <td width="26%">
                    &nbsp;</td>
            </tr>
        </table>
        <tr>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
            <telerik:RadButton ID="CompileBtn" runat="server" OnClick="CompileBtn_Click" Skin="WebBlue"
        Text="Run">
    </telerik:RadButton>
                &nbsp;<telerik:RadButton ID="resetBtn" runat="server" OnClick="resetBtn_Click" Skin="WebBlue"
        Text="Reset">
    </telerik:RadButton>
    </td><td><br>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
