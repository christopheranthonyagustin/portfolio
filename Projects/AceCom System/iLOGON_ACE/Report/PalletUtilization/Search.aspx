<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.Pallet_Utilization.Search" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pallet Utilization </title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        .style1
        {
            height: 21px;
        }
        .style2
        {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
        width="100%">
        <%--<tr>
            <td valign="top" width="30%">
                <table width="100%">
                    <tr>
                        <td class="style1">
                            &nbsp;
                        </td>
                        <td class="ModuleTitle" align="right">
                            <div class="rounded-box1" style="background-color: #660000; width: 30%">
                                <div class="top-right-corner1">
                                    <div class="top-right-inside1" style="background-color: #ffffff; color: #660000">
                                        •</div>
                                </div>
                                <div class="top-left-corner1">
                                    <div class="top-left-inside1" style="background-color: #ffffff; color: #660000">
                                        •</div>
                                </div>
                                <div class="box-contents1" style="padding-bottom: 5px; padding-left: 3px; padding-right: 5px;
                                    font-size: 10pt; font-weight: bold; padding-top: 3px; left: 2px">
                                    <asp:Label ID="ReportNameLbl" runat="server">User Access Audit Trail</asp:Label></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>--%>
        <tr>
            <td valign="top" width="30%">
                &nbsp;&nbsp;<iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
            <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <td class="style5">
                            &nbsp;&nbsp;SKU Group
                        </td>
                    <tr>
                        <td style="width: 400px" valign="top">
                            &nbsp;&nbsp;<telerik:RadListBox runat="server" ID="SKUList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSKUList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="SKUList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedSKUList" Height="120px" Width="200px"
                                Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false">
                            </telerik:RadListBox>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
               <td>
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
               </td>
            </tr>
        <tr>
            <td>                
                <telerik:RadButton ID="CompileBtn" CausesValidation="false" runat="server" Skin="WebBlue" Text="Compile"
                    CssClass="detailButton" OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();">
                </telerik:RadButton>&nbsp;
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../Image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

    </form>
</body>
</html>

