<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV7Order.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV7.TripPlanningV7Order" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Trip Planning V7 Order</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self" />
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
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
            width="100%">
            <tr>
                <td>
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="Button1" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" CausesValidation="false"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                    &nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" />
                    <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:CheckBox ID="SMSCheckBox" ToolTip="SMS" runat="server" Enabled="false" />
                    <asp:Label ID="SMSLabel" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SMS" ForeColor="Black"></asp:Label>
                </td>
                <td align="left">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:CheckBox ID="NewContainerChk" ToolTip="NewContainer" runat="server" Visible="false" OnCheckedChanged="NewContainerChk_CheckedChanged" AutoPostBack="true" />
                            <asp:Label ID="NewContainerLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="NewContainer" ForeColor="Black" Visible="false"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
            width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                        <iWMS:iForm ID="formCtl_JBCtnr" runat="server"></iWMS:iForm>
                                        <iWMS:iForm ID="formCtl_JBCtnrTrip" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                                <br />
                                <br />
                                <tr>
                                    <td>
                                        <asp:Label ID="Countlbl" runat="server" Style="color: red; font-size: medium; font-weight: bold"></asp:Label>
                                        <asp:Label ID="TripNoLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr align="right" style="padding-top: 24%">
                <td style="padding-top: 24%"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                    <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>