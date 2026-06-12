<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SGTraDexManagerDataElementRequest.aspx.cs" Inherits="iWMS.Web.Interface.SGTraDexManager.SGTraDexManagerDataElementRequest" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SGTraDexManager DataElementRequest</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">

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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>


    <style type="text/css">
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="ReleaseDepotTab" Text="Release Depot" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="StoringDepotTab" Text="Storing Depot" Value="50" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ElectronicDeliveryOrderTab" Text="Electronic Delivery Order" Value="100" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="VesselVoyageScheduleTab" Text="Vessel Voyage Schedule" Value="150" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="DepotTimeslotBookingTab" Text="Depot Timeslot Booking" Value="200" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="HaulierDepotEntryExitTab" Text="Haulier Depot Entry Exit" Value="250" readonly="readonly" runat="server">
                </telerik:RadTab>
                 <telerik:RadTab Id="HaulierTripDetailsTab" Text="Haulier Trip Details" Value="300" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="DataElementReleaseDepotRadPageView">
                <table border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <td>
                            <asp:Button ID="Button1" CssClass="white" runat="server" OnClick="RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />

                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" EnableLinqExpressions="false"
                    AllowPaging="false" Skin="Metro" AllowSorting="true" AllowFilteringByColumn="false" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>

                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames=""
                        EditMode="Batch" CommandItemDisplay="None">
                        <BatchEditingSettings EditType="Row" />
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ReadOnly="true" Display="true" HeaderStyle-Wrap="true" 
                                ItemStyle-Wrap="true" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" AutoPostBack="false" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="1080px" ID="DataElementStoringDepotRadPageView" />
            <telerik:RadPageView runat="server" Height="1080px" ID="DataElementElectronicDeliveryOrderRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="DataElementVesselVoyageScheduleRadPageView" />
            <telerik:RadPageView runat="server" Height="1080px" ID="DataElementDepotTimeslotBookingRadPageView" />
            <telerik:RadPageView runat="server" Height="1080px" ID="DataElementHaulierDepotEntryExitRadPageView" />
            <telerik:RadPageView runat="server" Height="1080px" ID="DataElementHaulierTripDetailsRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
