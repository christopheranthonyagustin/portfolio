<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result31.aspx.cs" Inherits="iWMS.Web.Graphlet.FreightAnalysis.Result31" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Freight Analysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .style2 {
        }

        .style3 {
            width: 12px;
        }

        .style4 {
            width: 100px;
        }

        .stylewrap {
            white-space: pre-line;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="FormatLbl" runat="server" CssClass="Graytitle" Text="Format"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="FormatTxt" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="EntityLbl" runat="server" CssClass="Graytitle" Text="Entity"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="EntityTxt" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="BranchLbl" runat="server" CssClass="Graytitle" Text="Branch"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="BranchTxt" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="DepartmentLbl" runat="server" CssClass="Graytitle" Text="Department"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="DepartmentTxt" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="AsAtDateLbl" runat="server" CssClass="Graytitle" Text="As At Date"></asp:Label>
                </td>
                <td class="style3">:
                </td>
                <td>
                    <asp:Label ID="AsAtDateTxt" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <br />
                    <asp:Button ID="excelImgBtn" runat="server" class="green" Text="Excel" OnClick="ExcelBtn_Click"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Panel ID="PanelResult" runat="server">
        </asp:Panel>
    </form>
</body>
</html>
