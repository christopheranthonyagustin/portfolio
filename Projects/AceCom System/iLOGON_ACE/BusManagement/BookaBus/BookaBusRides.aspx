<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookaBusRides.aspx.cs" Inherits="iWMS.Web.BusManagement.BookaBus.BookaBusRides" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookaBusRides</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab Id="GeneralTab" Text="General" Value="10" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="IncentiveTab" Text="Incentive" Value="20" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="RidesPageView">
                <br />
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Button ID="Button2" runat="server" CssClass="white" Text="New" ValidationGroup="reqvalgrp"
                        OnClick="newRidesBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                        OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="Button3" runat="server" CssClass="white" Text="Alternative"
                        OnClick="alternativeRidesBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="OpenRidesBtn" runat="server" CssClass="white" OnClick="OpenRidesBtn_Click"
                        Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                    <asp:Button ID="AssignRidesBtn" runat="server" CssClass="white" OnClick="AssignRidesBtn_Click"
                        Text="Assigned" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                    <asp:Button ID="CompletedRidesBtn" runat="server" CssClass="white" OnClick="CompletedRidesBtn_Click"
                        Text="Completed" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                      &nbsp; 
                    <asp:Button ID="DeleteRidesBtn" runat="server" CssClass="white" Text="Delete"
                        OnClick="DeleteRidesBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />


                    <br />
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server">
                </asp:Panel>
                <br />
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="RadGridRides" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                            AllowMultiRowSelection="true" OnNeedDataSource="RadGridRides_NeedDataSource"
                            OnItemDataBound="RadGridRides_ItemDataBound" OnItemCommand="RadGridRides_ItemCommand"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" AllowExpandCollapse="false">
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White" />
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" Width="100%" EditMode="InPlace">
                                <SortExpressions>
                                    <telerik:GridSortExpression FieldName="TripFrDate" SortOrder="Ascending" />
                                </SortExpressions>
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="100px" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />&nbsp;
                                            <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                Width="15" Height="15" AlternateText="Edit" BackColor="Transparent" OnClick="RideEdit_Click"
                                                BorderWidth="0"></asp:ImageButton>&nbsp;
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="DelRide"
                                                ImageUrl="../../image/Deleted.png" Width="15" Height="15" AlternateText="Delete"
                                                CommandName="DeleteRide" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="35px">
                                        <ItemTemplate>
                                            <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.JBTripId")%>' onserverclick="copyRides_Click"
                                                runat="server">
                                                <img id="copyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy" onserverclick="copyRides_Click"
                                                    title="Copy" runat="server" />
                                            </a>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="35px">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="SMSIcon" Enabled="false"
                                                ImageUrl="../../image/SMS.png" Width="18" Height="18" AlternateText="SMSicon"
                                                BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            <br />
                                            <br />
                                            <br />
                                            <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="EmailIcon" Enabled="false"
                                                ImageUrl="../../image/Email.png" Width="18" Height="18" AlternateText="Emailicon"
                                                BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="50px">
                                        <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                        <HeaderTemplate>
                                            TripNo
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="AltPerId" UniqueName="AltPerId" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltPerName" UniqueName="AltPerName" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltVehNo" UniqueName="AltVehNo" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltPerMobileNo" UniqueName="AltPerMobileNo" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltRemarks" UniqueName="AltRemarks" Display="False" />
                                    <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TripFrDate" UniqueName="TripFrDate" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="jbctnrid" UniqueName="jbctnrid" SortExpression="jbctnrid" HeaderText="jbctnrid"
                                        Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="Bill" HeaderText="BillSizeType <br/> BillOption1" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Larger" ItemStyle-Font-Bold="true">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("billsizetypedescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("billoption1descr")) %>
                                            <br />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="BookingDateTime" HeaderText="Booking DateTime">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("TripFrDate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripFrExpDOW")) %>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <%# string.Format("{0:}",Eval("TripToExpDOW")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripFrTime")) %>
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <%# string.Format("{0:}",Eval("TripToExpTime")) %>
                                            <br />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Vehicle" HeaderText="Vehicle <br/> Driver">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("VehNo")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("Name")) %>
                                            <br />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("FrServicePtDescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("FrAddr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("FrPostalCode")) %>
                                            <br />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("ToServicePtDescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("ToAddr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("ToPostalCode")) %>
                                            <br />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TourGuide" HeaderText="TourGuide <br/> MobileNo" ItemStyle-VerticalAlign="NotSet">
                                        <HeaderTemplate>
                                            TourGuide
                                            <br />
                                            MobileNo
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a id="tourguide" onserverclick="Auto_Fill" runat="server">AutoFill</a>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("TourGuideName")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("TourGuideContactNo")) %>
                                            <br />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripDescr" HeaderText="TripDescription <br/> SpecialInstruction">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripDescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripSpecialInstruction")) %>
                                            <br />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                                    <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                                    <telerik:GridBoundColumn DataField="SMSDetected" UniqueName="SMSDetected" Display="False" />
                                    <telerik:GridBoundColumn DataField="EmailDetected" UniqueName="EmailDetected" Display="False" />
                                    <telerik:GridBoundColumn DataField="TourGuideName" UniqueName="TourGuideName" Display="False" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="IncentiveRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
