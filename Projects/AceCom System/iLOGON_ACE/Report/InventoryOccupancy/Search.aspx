
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.InventoryOccupancy.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>UserTransactionStatistics</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 193px;
        }
    </style>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div>
        <table border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td valign="top">
                    <table>
                            <tr class="graytitle">
                                <td valign="top" class="style1" >
                                   <asp:Label ID="lblsite" runat ="server" Text="Site" ></asp:Label> 
                                </td>
                            </tr>
                            <td valign="top" class="style1">
                                <telerik:RadListBox runat="server" ID="SiteList" Height="120px" Width="200px" ButtonSettings-AreaWidth="35px"
                                    AllowTransfer="true" TransferToID="SelectedSiteList" TransferMode="Move" AllowTransferDuplicates="false"
                                    SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                                    AutoPostBackOnTransfer="true" OnTransferred="SiteList_Transferred">
                                </telerik:RadListBox>
                            </td>
                            <td style="width: 400px" valign="top">
                                <telerik:RadListBox runat="server" ID="SelectedSiteList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    Skin="Sunset" AllowDelete="false">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                Zone
                            </td>
            </tr>
            <td valign="top" class="style1">
                <telerik:RadListBox runat="server" ID="ZoneList" Height="120px" Width="200px" ButtonSettings-AreaWidth="35px"
                    AllowTransfer="true" TransferToID="SelectedZoneList" TransferMode="Move" AllowTransferDuplicates="false"
                    SelectionMode="Multiple" Skin="Sunset" AllowReorder="false" AllowDelete="false"
                    AutoPostBackOnTransfer="true" OnTransferred="ZoneList_Transferred">
                </telerik:RadListBox>
            </td>
            <td style="width: 400" valign="top">
                <telerik:RadListBox runat="server" ID="SelectedZoneList" Height="120px" Width="200px"
                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                    Skin="Sunset" AllowDelete="false">
                </telerik:RadListBox>
            </td>
            </tr>
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </table>
        <tr>
            <td>
                <telerik:RadButton ID="CompileBtn" CausesValidation="false" runat="server" Text="Compile"
                    OnClick="CompileBtn_Click">
                </telerik:RadButton>
                <br />
                <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
            <td>
                &nbsp;
                <br />
            </td>
        </tr>
        </table>
    </div>
    </form>
</body>
</html>
