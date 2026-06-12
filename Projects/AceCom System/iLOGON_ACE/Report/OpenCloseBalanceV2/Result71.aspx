<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result71.aspx.cs" Inherits="iWMS.Web.Report.OpenCloseBalanceV2.Result71" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OpenCloseBalanceV2</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>
<body>
  <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
      <table width="100%">
            <tr class="graytitle">
                <td class="style2" colspan="3">
                    <asp:Label ID="LicenseNameLbl" runat="server" CssClass="Graytitle"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr class="graytitle">
                <td class="style4">
                    <asp:Label ID="TitleLabel" runat="server">Open Close Balance V2</asp:Label>
                </td>
                <td>:
                </td>
                <td>
                    <asp:Label ID="TitleLbl" runat="server"></asp:Label>
                </td>
            </tr>
           <tr class="graytitle">
                <td>
                    <asp:Label ID="FormatLbl" runat="server"></asp:Label>                                      
                </td>                                
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="excelImgBtn" runat="server" class="green" Text="Excel" OnClick="ButtonExcel_Click"
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
