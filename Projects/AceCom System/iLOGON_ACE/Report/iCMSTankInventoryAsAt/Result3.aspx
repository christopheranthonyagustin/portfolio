<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result3.aspx.cs" Inherits="iWMS.Web.Report.iCMSTankInventoryAsAt.Result3" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>iCMS Tank Inventory As At [TankCurrentBooking] Result</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />

    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 6%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td class="style2" colspan="4">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
                <td width="70%" align="right">
                    <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                        <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/Excel.png"
                            runat="server"></a>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="4">
                    <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="PortLbl" runat="server">Port</asp:Label>
                </td>
                <td>:
                </td>
                &nbsp;&nbsp;<td class="style1">
                    <asp:Label ID="PortDesrLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="Label3" runat="server">Format</asp:Label>
                </td>
                <td>:
                </td>
                &nbsp;&nbsp;<td class="style1">
                    <asp:Label ID="FormatLbl" runat="server"></asp:Label>
                </td>
            </tr>

        </table>
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" Skin="Office2007" OnGridExporting="ResultDG_GridExporting"
            AllowPaging="false" OnItemDataBound="ResultDG_ItemDataBound">
            <ExportSettings OpenInNewWindow="true" />
            <MasterTableView AutoGenerateColumns="true" ShowHeader="false">
                <ItemTemplate>
                    <br />
                    <telerik:RadGrid ID="SubResultDG" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                        OnNeedDataSource="SubResultDG_NeedDataSource" OnItemDataBound="SubResultDG_ItemDataBound">
                        <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                        <MasterTableView AutoGenerateColumns="true">
                        </MasterTableView>
                    </telerik:RadGrid>
                    <br />
                    <telerik:RadGrid ID="SubResultDG2" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                        OnNeedDataSource="SubResultDG2_NeedDataSource" OnItemDataBound="SubResultDG2_ItemDataBound">
                        <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                        <MasterTableView AutoGenerateColumns="true">
                        </MasterTableView>
                    </telerik:RadGrid>
                    <br />
                    <telerik:RadGrid ID="SubResultDG3" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                        OnNeedDataSource="SubResultDG3_NeedDataSource" OnItemDataBound="SubResultDG3_ItemDataBound">
                        <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                        <MasterTableView AutoGenerateColumns="true">
                        </MasterTableView>
                    </telerik:RadGrid>
                    <br />
                    <telerik:RadGrid ID="SubResultDG4" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                        OnNeedDataSource="SubResultDG4_NeedDataSource" OnItemDataBound="SubResultDG4_ItemDataBound">
                        <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                        <MasterTableView AutoGenerateColumns="true">
                        </MasterTableView>
                    </telerik:RadGrid>
                </ItemTemplate>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

