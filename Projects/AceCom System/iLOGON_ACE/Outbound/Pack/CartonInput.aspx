<%@ Page Language="c#" CodeBehind="CartonInput.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Pack.CartonInput" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Pack Unit @ Pack</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td class="pagetitle" style="display: none">&nbsp;
                <asp:Label ID="ModeLbl" runat="server"></asp:Label>&nbsp;
                <asp:Label ID="PackingUnitLbl" runat="server">Packing Unit</asp:Label>&nbsp;
                <asp:Label ID="IdLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br>
                    <asp:Panel Name="AddPanel" runat="server" ID="AddPanel">
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="SaveBtn" runat="server"
                                        Text="Add" CssClass="white" OnClick="SaveBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                                    &nbsp;&nbsp;
                                    <asp:Button ID="closebtn" runat="server" Text="Close" CssClass="white"
                                        OnClick="closebtn_Click" CausesValidation="false"></asp:Button>&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:CheckBox ID="AddChk" ToolTip="ContinuousAdd" runat="server" />
                                    <asp:Label ID="AddChkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="ContinuousAdd" ForeColor="Black" OnClientClick="disableBtn(this.id,true)"></asp:Label>

                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel Name="UpdatePanel" runat="server" ID="UpdatePanel">
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update" Enabled="true"
                                        OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" />
                                    <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black" OnClientClick="disableBtn(this.id,true)"></asp:Label>

                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                    <table>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
            </tr>
        </table>

    </form>
</body>
</html>
