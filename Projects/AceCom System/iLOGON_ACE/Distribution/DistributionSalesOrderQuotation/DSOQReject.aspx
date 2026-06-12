<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DSOQReject.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrderQuotation.DSOQReject" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reject @Sales Order Quotation</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function Close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Sales Order Quotation Reject</asp:Label>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <asp:Label ID="MsgLbl" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="ReasonLbl" runat="server" Font-Size="Small">Reason</asp:Label>
                    <br />
                    <telerik:RadTextBox ID="ReasonTxtBox" runat="server" Resize="Both" TextMode="MultiLine" Rows="6" Width="220px" BackColor="#ded7c6" Skin="Sunset"></telerik:RadTextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ReasonTxtBox" ErrorMessage="*" Font-Bold="true" ForeColor="Red" Font-Size="Large"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="ConfirmBtn" runat="server" CssClass="white" Text="Confirm" OnClientClick="disableBtn(this.id, true)"
                        OnClick="ConfirmBtn_Click" UseSubmitBehavior="false"></asp:Button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
