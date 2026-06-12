<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTransportPlanningOrder.aspx.cs" Inherits="iWMS.Web.Job.DailyTransportPlanning.DailyTransportPlanningOrder" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Booking @ Daily Transport Planning</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
<%--    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function Close() {
            GetRadWindow().close();
        }
    </script>--%>
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

        function Close() {
            GetRadWindow().close();
        }
    </script>

</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab Id="GeneralTab" Text="General" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="IncentiveTab" Text="Incentive" Value="50" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab Id="QRCodeTab" Text="QRCode" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attc" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DeliveryItemsTab" Text="Delivery Items" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="250" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="GeneralRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Panel ID="ButtonPanel" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <br />
                                            <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Text="Prev"
                                                CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            &nbsp;
                                            <asp:Button ID="AddBtn" CssClass="white" runat="server" OnClick="AddBtn_Click"
                                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                            &nbsp;
                                            <asp:Button ID="CloseWindowBtn" CssClass="LongLabelWhite" runat="server" OnClick="CloseWindowBtn_Click" Text="Close Window" CausesValidation="false"
                                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            &nbsp;
                                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Text="Next"
                                                CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
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
                                            <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" />
                                            <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding-left: 60px">
                                            <asp:CheckBox ID="SMSchkObjective" ToolTip="SMS" runat="server" />
                                            <asp:Label ID="SMSchkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SMS" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding-left: 20px">
                                            <asp:CheckBox ID="AssignCheckBox" ToolTip="Assign" runat="server" />
                                            <asp:Label ID="AssignLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="Assign" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding-left: 30px">
                                            <asp:CheckBox ID="CompleteChk" ToolTip="Complete" runat="server" />
                                            <asp:Label ID="CompleteLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="Complete" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding-left: 60px">
                                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>

                <table>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server" ID="UpdatePanel">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <iWMS:iForm ID="formCtl_1" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_2" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_3" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_4" runat="server"></iWMS:iForm>
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
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="IncentiveRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="QRCodeRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="AttcRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="DeliveryItemsRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="LogRadPageView" Height="700px" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
