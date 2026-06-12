<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutboundDeliveryExplode.aspx.cs" Inherits="iWMS.Web.Outbound.OutboundDelivery.OutboundDeliveryExplode" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>IssueExplode</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div>
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td style="width: 20%;">
                    &nbsp; <b>
                        <asp:Label ID="UomLbl" runat="server">UOM</asp:Label><input id="HIDDEN_Uom" type="hidden"
                            runat="server" /></b>
                </td>
                <td style="width: 80%;" valign="top">
                    <asp:DropDownList ID="TEXT_Uom" runat="server" OnSelectedIndexChanged="TEXT_Uom_SelectedIndexChanged"
                        AutoPostBack="true" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 2px;">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 20%;">
                    &nbsp; <b>
                        <asp:Label ID="QtyLbl" runat="server">Qty</asp:Label></b>
                    <asp:RequiredFieldValidator ID="QtyReq" runat="server" ControlToValidate="INTEGER_Qty"
                        ErrorMessage="*"></asp:RequiredFieldValidator><asp:CompareValidator ID="QtyVal" runat="server"
                            ControlToValidate="INTEGER_Qty" ErrorMessage="#" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator><asp:CompareValidator
                                ID="QtyValueVal" runat="server" ControlToValidate="INTEGER_Qty" ErrorMessage="#"
                                Type="Integer" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td style="width: 80%;" valign="top">
                    <asp:TextBox ID="INTEGER_Qty" runat="server" BackColor="Yellow" Width="80px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 5px;">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                    <asp:Button ID="Populate_Btn" runat="server" OnClick="Populate_Btn_Click" Text=" POPULATE " UseSubmitBehavior="false"  OnClientClick="disableBtn(this.id, true)"
                        CssClass="white" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

