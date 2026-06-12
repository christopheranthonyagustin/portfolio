<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMSeaJobRegisterForm.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMSeaJobRegisterForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMSeaJobRegisterForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server"></telerik:RadCodeBlock>

    <script type="text/javascript">
        function ShowHideBtn_Click() {
            document.getElementById("DescriptionTxt").removeAttribute("disabled");
        }

        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
    <style type="text/css">
        .align {
            margin-left: 37.5%;
        }
    </style>
    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }
        function ShowHideBtn_Click() {
            document.getElementById("DescriptionTxt").removeAttribute("disabled");
        }
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager2" runat="server"></telerik:RadWindowManager>
        <br />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="GeneralTab" Text="General" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="TruckingTab" Text="Trucking" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="RouteTab" Text="Route" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="PackTab" Text="Pack" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DocTab" Text="Doc" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="BillingTab" Text="Billing" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attachment" Value="600" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="700" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DutiesAndTaxesTab" Text="Duty&Tax" Value="800" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="MilestonesTab" Text="Milestones" Value="900" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="GeodisTab" Text="Geodis" Value="1000" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>

                <td>
                    <telerik:RadMenu ID="DepatureRadMenu" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false"
                        OnItemClick="DepatureRadMenu_ItemClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" Skin="Default" CssClass="mainMenu RadMenu_CUSTOM_Blue">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Depature" PostBack="false" Value="Depature">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="BookingConfirmation" Text="Booking Confirmation" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CarrierBookingRequest" Text="Carrier Booking Request" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CargoManifest" Text="Cargo Manifest" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DepotReleaseOrder" Text="Depot Release Order" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DepartureTruckingAdvice" Text="Trucking Advice" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ShippingOrder" Text="Shipping Order" />
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
                <td>
                    <telerik:RadMenu ID="ArrivalRadMenu" runat="server" ShowToggleHandle="false" ClickToOpen="true" ExpandAnimation-Type="None" EnableEmbeddedSkins="false"
                        OnItemClick="ArrivalRadMenu_ItemClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" Skin="Default" CausesValidation="false" CssClass="RadMenu_CUSTOM_Blue">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Arrival" PostBack="false" Value="Arrival">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ArrivalNotice" Text="Arrival Notice" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="AuthorisationRelease" Text="Authorisation Release" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="AuthorisationReleaseExcel" Text="Authorisation Release(Excel)" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DeliveryOrder" Text="Delivery Order" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DepotStoringOrder" Text="Depot Storing Order" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ArrivalTruckingAdvice" Text="Trucking Advice" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="LetterofIndemnity" Text="Letter of Indemnity" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="LetterofIndemnityExcel" Text="Letter of Indemnity(Excel)" />
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>

                <td>
                    <telerik:RadMenu ID="DepatureEmailRadMenu" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false"
                        OnItemClick="DepatureEmailRadMenu_ItemClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" Skin="Default" CssClass="RadMenu_CUSTOM_Green">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Email <br/> Depature" PostBack="false" Value="Email_Depature">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="BookingConfirmation" Text="Booking Confirmation" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CarrierBookingRequest" Text="Carrier Booking Request" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CargoManifest" Text="Cargo Manifest" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DepotReleaseOrder" Text="Depot Release Order" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DepartureTruckingAdvice" Text="Trucking Advice" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ShippingOrder" Text="Shipping Order" />
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>

                </td>

                <td>
                    <telerik:RadMenu ID="ArrivalEmailRadMenu" runat="server" ShowToggleHandle="false" ClickToOpen="true" EnableEmbeddedSkins="false"
                        OnItemClick="ArrivalEmailRadMenu_ItemClick" OnClientItemClicked="RadMenuClientOnClick" RenderMode="Lightweight" Skin="Default" CssClass="RadMenu_CUSTOM_Green">
                        <Items>
                            <telerik:RadMenuItem runat="server" Text="Email <br/> Arrival" PostBack="false" Value="Email_Arrival">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ArrivalNotice" Text="Arrival Notice" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="AuthorisationRelease" Text="Authorisation Release" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="AuthorisationReleaseExcel" Text="Authorisation Release(Excel)" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DeliveryOrder" Text="Delivery Order" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DepotStoringOrder" Text="Depot Storing Order" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ArrivalTruckingAdvice" Text="Trucking Advice" />
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>

                <td>
                    <asp:Button ID="CloseBtn" runat="server" CssClass="white" Text="Close"
                        OnClick="CloseBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="JobListBtn" runat="server" CssClass="white" Text="Job List" Visible="false"
                        OnClick="JobListBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label Text="BOL" runat="server" Font-Bold="true" Font-Size="Small"></asp:Label>
                            </td>
                            <td style="font-size: smaller; font-weight: bold">:</td>
                            <td>
                                <asp:Label ID="BOLLbl" runat="server" Font-Bold="true" Font-Size="Small"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="HouseBill" runat="server" Font-Bold="true" Font-Size="Small"></asp:Label>
                            </td>
                            <td style="font-size: smaller; font-weight: bold">:</td>
                            <td>
                                <asp:Label ID="SeaHouseBill" runat="server" Font-Bold="true" Font-Size="Small"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" Visible="false" BackColor="Pink" OnClick="PrevItemBtn_Click" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;&nbsp;
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel" CausesValidation="false" Visible="false"
                                OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;&nbsp;
                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" Visible="false" BackColor="Pink" OnClick="NextItemBtn_Click" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;&nbsp;
                            <asp:Label ID="GridLineLbl" runat="server" Visible="false" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" Visible="false" />
                            <asp:Label ID="chkLbl" runat="server" Visible="false" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black" OnClientClick="disableBtn(this.id,true)"></asp:Label>
                            <br />
                            <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td rowspan="9" colspan="9" valign="top">
                                                <br />
                                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                            </td>

                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td colspan="9" rowspan="9" valign="top">
                                                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                                <br />
                                                <telerik:RadLabel ID="MarksAndNumberLbl" Text="MarksAndNumber" Font-Size="Small" runat="server">
                                                </telerik:RadLabel>
                                                &nbsp;
                                                <telerik:RadLabel ID="DescriptionLbl" Text="Description" Font-Size="Small" runat="server" CssClass="align">
                                                </telerik:RadLabel>
                                                <br />
                                                <telerik:RadTextBox ID="MarksAndNumberTxt" TextMode="MultiLine" runat="server" Width="320px" Height="320px" Resize="Both"
                                                    Font-Size="Medium" Skin="WebBlue" ToolTip="MarksAndNumber">
                                                </telerik:RadTextBox>
                                                &nbsp;
                                                <telerik:RadTextBox ID="DescriptionTxt" TextMode="MultiLine" runat="server" Width="320px" Height="320px" Resize="Both"
                                                    Font-Size="Medium" Skin="WebBlue" ToolTip="Description">
                                                </telerik:RadTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="100%" ID="TruckingRadPageView" />
            <telerik:RadPageView runat="server" Height="100%" ID="RouteRadPageView" />
            <telerik:RadPageView runat="server" Height="100%" ID="PackRadPageView" />
            <telerik:RadPageView runat="server" Height="100%" ID="DOCRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="ChargePageView" />
            <telerik:RadPageView runat="server" Height="100%" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="100%" ID="LogRadPageView" />
            <telerik:RadPageView runat="server" Height="100%" ID="DutiesAndTaxesRadPageView" />
            <telerik:RadPageView runat="server" Height="100%" ID="MilestonesRadPageView" />
            <telerik:RadPageView runat="server" Height="100%" ID="GeodisRadPageView" />
        </telerik:RadMultiPage>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmApproveBtn" Text="" Style="display: none;" OnClick="ConfirmApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
                <td>
                    <asp:Button ID="ConfirmNoneApproveBtn" Text="" Style="display: none;" OnClick="ConfirmNoneApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmApproveCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmApproveBtn.UniqueID %>", "");
                }
            }
            function ConfirmNoneBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmNoneApproveBtn.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>

