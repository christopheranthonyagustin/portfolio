<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result83.aspx.cs" Inherits="iWMS.Web.Graphlet.FreightAnalysis.Result83" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>FreightAnalysis</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label ID="LicenseNameLbl" class="graytitle" Font-Bold="true" Font-Size="Large" runat="server"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="TitleLabel" runat="server" class="graytitle" Text="Freight Analysis :" />
                </td>
                <td>
                    <asp:Label ID="TitleLbl" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="EntityLbl" runat="server" class="graytitle" Text="Entity :" />
                </td>
                <td>
                    <asp:Label ID="EntityName" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="BranchLbl" runat="server" class="graytitle" Text="Branch :" />
                </td>
                <td>
                    <asp:Label ID="BranchTxt" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="DepartmentLbl" runat="server" class="graytitle" Text="Department :" />
                </td>
                <td>
                    <asp:Label ID="DepartmentTxt" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="AddDateLbl" runat="server" Visible="false" class="graytitle" Text="Add Date :" />
                </td>
                <td>
                    <asp:Label ID="JobAddDateLbl" class="graytitle" runat="server" Visible="false"></asp:Label>
                </td>
            <tr>
                <td>
                    <asp:Label ID="UserLbl" runat="server" class="graytitle" Text="Printed by :" />
                </td>
                <td>
                    <asp:Label ID="UserText" class="graytitle" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="excelImgBtn" runat="server" class="green" Text="Excel" OnClick="excelImgBtn_Click"
                        UseSubmitBehavior="false" />
                    &nbsp; &nbsp;
                    <asp:Label ID="RowCountLbl" Font-Bold="true" Font-Size="Large" runat="server"></asp:Label>
                </td>
            </tr>
        </table>

        <br />
        <asp:Panel ID="PanelResult" runat="server">
        </asp:Panel>
    </form>
</body>
</html>