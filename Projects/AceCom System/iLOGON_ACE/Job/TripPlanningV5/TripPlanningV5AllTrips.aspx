<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV5AllTrips.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV5.TripPlanningV5AllTrips" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TripPlanningV5AllTrips</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function OnClientClose(sender, args) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }
        </script>
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

            function CheckCtnrNoDigit(sender, eventArgs) {
                var grid = $find("<%=ResultDG.ClientID %>");
                var MasterTable = grid.get_masterTableView();

                for (var i = 0; i < MasterTable.get_dataItems().length ; i++) {
                    var dataItems = MasterTable.get_dataItems()[i];
                    var ctnrno = dataItems.findControl("ContainerNoTxt").get_textBoxValue();

                    if (ctnrno != "") {
                        var returnstr = ContainerNoCheckDigit(ctnrno);
                        if (returnstr != "Valid") {
                            alert(returnstr + " - [ " + ctnrno + " ]");
                            dataItems.findControl("ContainerNoTxt").focus();
                        }
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
   <form id="Form" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                </td>
            </tr>
        </table>
       <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="false" Skin="Metro" RenderMode="Lightweight"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" MasterTableView-AllowSorting="true"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" AllowSorting="true" Height="95%"
                            AllowFilteringByColumn="true" ClientSettings-AllowColumnsReorder="true">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="true" />
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" Width="150%" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                                PageSize="50" HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="None" TableLayout="Auto">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="80px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="80px"></ItemStyle>
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CMS" ItemStyle-HorizontalAlign="Center" DataField="CMSDone" HeaderText="CMS" SortExpression="CMSDone" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="50px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="50px"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="CMSDoneLbl" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="RequiredDate" HeaderText="Required <br/> Date" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" HeaderStyle-Width="60px"
                                        SortExpression="ExpDate" AllowSorting="true" AutoPostBackOnFilter="true" ItemStyle-Wrap="false" DataField="ExpEqpspecialinstruction">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "ExpEqpspecialinstruction", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                                            <br />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="JobNo/Account/BookingNo" ItemStyle-HorizontalAlign="Center" DataField="JobAcBookingNo"
                                        HeaderText="JobNo <br/> Account <br/> BookingNo" SortExpression="JobAcBookingNo" AutoPostBackOnFilter="true" ItemStyle-Wrap="true" ItemStyle-Width="80px" HeaderStyle-Width="80px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",  Eval("JobAcBookingNo")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="BillSizeType/TripOption" HeaderText="BillSizeType <br/> TripOption" ItemStyle-HorizontalAlign="Center"
                                        SortExpression="billsizetype" AllowFiltering="false" ItemStyle-Wrap="false">
                                        <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="60px" />
                                        <ItemStyle Wrap="true" HorizontalAlign="Center" Width="60px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "billsizetype")%>
                                                 </br>
                                                 </br>
                                                  <%# DataBinder.Eval(Container.DataItem, "Sector")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripTypeDoubleStatus" ItemStyle-HorizontalAlign="Center" HeaderText="TripType <br/> Double <br/> Status"
                                        SortExpression="StatusDescr" AllowFiltering="false" AllowSorting="true">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "TripTypeDoubleStatus")%>
                                            </br>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" SortExpression="FrServicePt" AllowFiltering="false">
                                        <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="120px" />
                                        <ItemStyle Wrap="true" HorizontalAlign="Center" Width="120px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "fraddr")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" SortExpression="ToServicePt" AllowFiltering="false">
                                        <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="180px" />
                                        <ItemStyle Wrap="true" HorizontalAlign="Center" Width="180px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "toaddr")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="JobSpecialInstruction" HeaderText="JobSpecialInstruction" SortExpression="JobSpecialInstruction" AllowFiltering="false">
                                        <HeaderStyle Wrap="true" HorizontalAlign="Center" Width="160px" />
                                        <ItemStyle Wrap="true" HorizontalAlign="Center" Width="160px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "JobSpecialInstruction")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Vehicle/Driver/Trailer" HeaderText="Vehicle <br/> Driver<br/> Trailer" ItemStyle-HorizontalAlign="Center"
                                        SortExpression="VehNoDriverTrailer" AllowFiltering="false" AllowSorting="true" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "VehNoDriverTrailer")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ContainerNo/SealNo" ItemStyle-HorizontalAlign="Center" HeaderText="ContainerNo <br/> SealNo"
                                        SortExpression="ContainerNo" AllowFiltering="false" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "ContainerNo")%>
                                                 </br>
                                                 </br>
                                                  <%# DataBinder.Eval(Container.DataItem, "SealNo")%>
                                            <telerik:RadTextBox runat="server" ID="ContainerNoTxt" Width="120px" Display="false"></telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ETA/Vessel/Voyage" HeaderText="ETA <br/> Vessel <br/> Voyage" DataField="ETAVesselVoyage"
                                        ItemStyle-HorizontalAlign="Center" SortExpression="ETAVesselVoyage" AutoPostBackOnFilter="true" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",  Eval("ETAVesselVoyage")) %>
                                            <br />
                                            </br>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Shipper" HeaderText="Shipper" DataField="Shipper"
                                        ItemStyle-HorizontalAlign="Center" SortExpression="Shipper" AutoPostBackOnFilter="true" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",  Eval("Shipper")) %>
                                            <br />
                                            </br>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripSpecialInstruction" HeaderText="TripSpecialInstruction" SortExpression="TripSpecialInstruction" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="160px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="160px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="InternalDocNo/OutsourceDocNo" ItemStyle-HorizontalAlign="Center" HeaderText="InternalDocNo <br/> OutsourceDocNo"
                                        SortExpression="InternalDocNo" AllowFiltering="false" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "InternalDocNo")%>
                                                 </br>
                                                 </br>
                                            <%# DataBinder.Eval(Container.DataItem, "OutsourceDocNo")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="False"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="jbcid" UniqueName="jbcid" Display="False"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                                    <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                                    <telerik:GridBoundColumn DataField="trailerno" UniqueName="trailerno" Display="False" />
                                    <telerik:GridBoundColumn DataField="sector" UniqueName="sector" Display="False" />
                                    <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="RequiredDateColour" UniqueName="RequiredDateColour" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CMSDone" UniqueName="CMSV" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JBCTNRId" UniqueName="JBCTNRId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="IsImportant" UniqueName="IsImportant" Display="False" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                    </ContentTemplate>
                </asp:UpdatePanel>
    </form>
</body>
</html>
