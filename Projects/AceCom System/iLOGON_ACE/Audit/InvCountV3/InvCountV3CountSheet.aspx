<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3CountSheet.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3CountSheet" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head id="Head1" runat="server">
    <title>InvCountV3CountSheet</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
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
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel" runat="server">
        <table cellspacing="1" cellpadding="1" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="MsgLbl" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="CountSheetLbl" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="SelectCSReq" runat="server" ControlToValidate="CountSheetCombo"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
<%--                    <telerik:RadDropDownList ID="SelectCSDDL" runat="server" Skin="WebBlue" Width="200px"></telerik:RadDropDownList> --%>
                    <telerik:RadComboBox ID="CountSheetCombo" runat="server" Skin="WebBlue" RenderMode="Lightweight"
                        EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol" OnItemsRequested="CountSheetCombo_ItemsRequested"
                        ItemsPerRequest="200" ShowMoreResultsBox="true" HighlightTemplatedItems="true" CausesValidation="false" AutoPostBack="true" OnLoad="CountSheetCombo_Load">
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td width="18%">
                    &nbsp;
                </td>
                <td width="72%" align="left">
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="PrintBtn" CssClass="white" runat="server" OnClick="PrintBtn_Click" Text="Print"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />                  
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>