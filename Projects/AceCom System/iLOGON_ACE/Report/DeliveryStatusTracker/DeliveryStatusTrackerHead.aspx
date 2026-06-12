<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryStatusTrackerHead.aspx.cs" Inherits="iWMS.Web.Report.DeliveryStatusTracker.DeliveryStatusTrackerHead" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubPrintMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TripOrganizerHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>

    <style type="text/css">
        .style1 {
            width: 95%;
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
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
                var masterTable = $find("<%= TSQResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }

            function AcceptedOnClientClose(sender, args) {
                var masterTable = $find("<%= TSQResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }
        </script>
    </telerik:RadCodeBlock>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    
    <form id="Form1" method="post" runat="server">
         <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table style="width: 100%; height: 30px">
                <tr>
                    <td class="style1">
                        <asp:Button ID="TripStatusQueryBtn" class="LONGLABELBLUE" runat="server" OnClick="TripStatusQueryBtn_Click" Text="Trip Status Query" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Enable="false" />
                        &nbsp;
                            <asp:Button ID="TripStatusTrackingBtn" class="LONGLABELBLUE" runat="server" OnClick="TripStatusTrackingBtn_Click" Text="Trip Status Tracking" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Enable="false" />
                        &nbsp;
                  
                    </td>
                </tr>
            </table>
            <table style="width: 1000px; height: 30px">
                <tr>
                    <td class="style1" style="width: 100px;">
                       
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                    <td class="style1" style="width:900px;">
                                <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" Visible="false"
                            OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Search" UseSubmitBehavior="false" />&nbsp;
    
                         <asp:Button ID="ExcelBtn" runat="server" Text="Excel" OnClick="ExcelBtn_Click1" Visible="false"
                           OnClientClick="disableBtn(this.id,false)" CssClass="green" ToolTip="Excel" UseSubmitBehavior="false" />&nbsp;
                           
                    </td>
                </tr>
                </table>
            <div>
                <telerik:RadGrid ID="TSQResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Visible="false"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Office2007" OnNeedDataSource="TSQResultDG_NeedDataSource" AllowPaging="true"
                    OnItemDataBound="TSQResultDG_ItemDataBound">
                    <GroupingSettings CaseSensitive="false" />
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JbTripId" Name="ParentGrid">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="TSQ_Detail" ImageUrl="../../image/detail.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Detail Trip Status Query"
                                        OnClick="TSQ_Detail_Click" CausesValidation="False"></asp:ImageButton>

                                    <asp:ImageButton runat="server" Visible="True" ID="TSQ_Attc" ImageUrl="../../image/attached.jpg"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Attc Trip Status Query"
                                        OnClick="TSQ_Attc_Click" CausesValidation="False"></asp:ImageButton>

                                    <asp:ImageButton runat="server" Visible="True" ID="TSQ_HistoryList" ImageUrl="../../image/HistoryList.png"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="History Trip Status Query"
                                        OnClick="TSQ_HistoryList_Click" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn Display="false" DataField="JbTripId" HeaderText="JbTripId">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="false" DataField="jbid" HeaderText="jbid">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn UniqueName="StatusReceiptName" HeaderText="Status" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="statusdescr">
                                <ItemTemplate>
                                    <%# string.Format("{0}", Eval("statusdescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="CustReferenceRefDate" HeaderText="CustReference <br/> CustRefDate" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="CustRefCustRefDate">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1:dd/MMM/yyyy HH:mm}", Eval("CustReference"), Eval("CustRefDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="AccountJobTypePartner" HeaderText="Account <br/> JobType <br/> Partner" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="AcCodeJobTypePartner">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1} <br/> {2}", Eval("AcCode"), Eval("JobType"),Eval("Partner")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="ETDATD" HeaderText="ETD <br/> ATD" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="ETDATD">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm} <br/> {1}", Eval("ETD"), Eval("ATD").ToString() != Eval("ETD").ToString() ? string.Format("{0:dd/MMM/yyyy HH:mm}", Eval("ATD")) : "<br/>") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="ETAATA" HeaderText="ETA <br/> ATA" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="ETAATA">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm} <br/> {1}", Eval("ETA"), Eval("ATA").ToString() != Eval("ETA").ToString() ? string.Format("{0:dd/MMM/yyyy HH:mm}", Eval("ATA")) : "<br/>") %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="WeightVolume" HeaderText="Weight <br/> Volume" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="WeightVolume">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("Weight"), Eval("Volume")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="PackagesCollies" HeaderText="Packages <br/> Collies" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="PackagesCollies">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("Packages"),Eval("Collies")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="PickUpFrCityFrRoute" HeaderText="PickUp <br/> FrCity <br/> FrRoute" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="PickUpNameFrCityCodeFromRoute">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1} <br/> {2}", Eval("PickUpName"), Eval("FrCityCode"),Eval("FromRoute")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="DropOffToCityToRoute" HeaderText="DropOff <br/> ToCity <br/> ToRoute" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="DropOffNameToCityCodeToRoute">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1} <br/> {2}", Eval("DropOffName"),Eval("ToCityCode"),Eval("ToRoute")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="VehicleDriverMobileNo" HeaderText="Vehicle <br/> Driver <br/> MobileNo" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="DriverMobileNo">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="VehicelInfo1" OnClick="VehicelInfo_Click"><%# Eval("VehNo") %></asp:LinkButton>
                                    <br />
                                    <%# string.Format("{0} <br/> {1}", Eval("Driver"), Eval("MobileNo")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="RecipientNameRemarksTripSpecialInstruction" HeaderText="RecipientName <br/> Remarks <br/> TripSpecialInstruction" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="RecipientNameRemarksSpecialInstruction">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1} <br/> {2}", Eval ("RecipientName"),Eval("Remarks"), Eval("SpecialInstruction")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>

            <div>
                <telerik:RadGrid ID="TSTResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Visible="false"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Office2007" OnNeedDataSource="TSTResultDG_NeedDataSource" AllowPaging="true"
                    OnItemDataBound="TSTResultDG_ItemDataBound">
                    <GroupingSettings CaseSensitive="false" />
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JbTripId" Name="ParentGrid">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Wrap="true" ItemStyle-Width="40px" HeaderStyle-Width="30px" HeaderStyle-Wrap="true">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn Display="false" DataField="JbTripId" HeaderText="JbTripId">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="false" DataField="jbid" HeaderText="jbid">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn UniqueName="StatusReceiptName" HeaderText="Status" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="StatusDescr">
                                <ItemTemplate>
                                    <%# string.Format("{0}", Eval("StatusDescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="CustReferenceRefDate" HeaderText="CustReference <br/> CustRefDate" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="CustRefCustRefDate">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1:dd/MMM/yyyy HH:mm}", Eval("CustReference"), Eval("CustRefDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="ATDATA" HeaderText="ATD <br/> ATA" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField ="ATDATA">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm} <br/> {1:dd/MMM/yyyy HH:mm}", Eval("ATD"), Eval("ATA")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="WeightVolume" HeaderText="Weight <br/> Volume" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="WeightVolume">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("Weight"), Eval("Volume")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="PackagesCollies" HeaderText="Packages <br/> Collies" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="PackagesCollies">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("Packages"), Eval("Collies")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="PickUpFrCityFrRoute" HeaderText="PickUp <br/> FrCity <br/> FrRoute" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField="PickUpFrCityFrRoute">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1} <br/> {2}", Eval("PickUp"), Eval("FrCity"), Eval("FrRoute")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="DropOffToCityToRoute" HeaderText="DropOff <br/> ToCity <br/> ToRoute" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField ="DropOffToCityToRoute">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1} <br/> {2}", Eval("DropOff"), Eval("ToCity"), Eval("ToRoute")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="VehicleDriver" HeaderText="Vehicle <br/> Driver <br/> MobileNo" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField ="VehNoDriverMobileNo">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1} <br/> {2}", Eval("vehno"), Eval("Driver"), Eval("MobileNo")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="RecipientNameRemarksTripSpecialInstruction" HeaderText="RecipientName <br/> Remarks <br/> TripSpecialInstruction" HeaderStyle-Width="100px" ItemStyle-Width="100px" DataField ="RecipientNameRemarksSpecialInstruction">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1} <br/> {2}", Eval ("RecipientName"),Eval("Remarks"), Eval("SpecialInstruction")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>

        </div>
        <br />
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="400px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
