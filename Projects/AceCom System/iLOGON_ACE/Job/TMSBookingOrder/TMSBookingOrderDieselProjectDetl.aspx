<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderDieselProjectDetl.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderDieselProjectDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Diesel Project @ TMS Booking Order</title>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
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
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Panel ID="ButtonPanel" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="PrevBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevBtn_Click" Text="Prev" CausesValidation="false"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="SaveBtn" runat="server" OnClick="SaveBtn_Click"
                                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" />
                                    &nbsp;
                                    <asp:Button ID="CloseWindowBtn" runat="server" Text="Close Window" OnClick="CloseWindowBtn_Click"
                                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="LongLabelWhite" CausesValidation="false" />
                                    &nbsp;
                                    <asp:Button ID="NextBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextBtn_Click" Text="Next" CausesValidation="false"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="ChkPanel" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="CrossDayJobChkBox" runat="server" Enabled="false" />
                                    <asp:Label ID="CrossDayJobLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="CrossDayJob" ForeColor="Black"></asp:Label>
                                </td>
                                <td style="padding-left: 75px;">
                                    <asp:CheckBox ID="SaveOnPanChkBox" ToolTip="SaveOnPan" runat="server" />
                                    <asp:Label ID="SaveOnPanLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                                </td>
                                <td style="padding-left: 65px;">
                                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl_JBHead" runat="server"></iWMS:iForm>
                            <iWMS:iForm ID="formCtl_JBCtnr" runat="server"></iWMS:iForm>
                            <iWMS:iForm ID="formCtl_JBTrip" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
