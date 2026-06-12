<%@ Page Language="c#" CodeBehind="VehicleHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Vehicle.VehicleHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>VehicleHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <div id="div-datagrid" style="height: 92%">
                    <table style="width: 100%; height: 30px">
                        <tr>
                            <td align="right">
                                <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                            </td>
                        </tr>
                    </table>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>

                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro"
                        OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.vehno")%>' onclick="return confirm('Confirm delete?')"
                                            onserverclick="Vehicle_Delete" runat="server">
                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Vehicle"
                                                runat="server"></a>
                                        <a id="lnkResult" href='<%#DataBinder.Eval(Container,"DataItem.vehno")%>'
                                            onserverclick="Vehicle_Result" runat="server">
                                            <img id="resultImg" src="../../image/BlackTyre.png" width="15" height="15" border="0" tooltip="Vehicle Result"
                                                runat="server"></a>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="VehNo"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Description"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="typeDescr" SortExpression="typeDescr" HeaderText="Type"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="DefaultDriver"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="trailerno" SortExpression="trailerno" HeaderText="DefaultTrailer"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <%--//Ticket #1549, pt 45 added by JL, 11th May 2016--%>
                                <telerik:GridBoundColumn DataField="DefaultCtnrNo" SortExpression="DefaultCtnrNo" HeaderText="DefaultCtnrNo"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <%--End of Ticket #1549--%>
                                <telerik:GridBoundColumn DataField="iuno" SortExpression="iuno" HeaderText="In-VehicleUnitNo"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehregisterentitydescr" SortExpression="vehregisterentitydescr"
                                    HeaderText="RegisterEntity" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="opsunitcodedescr" SortExpression="opsunitcodedescr"
                                    HeaderText="OpsUnit" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="VehLength" SortExpression="VehLength"
                                    HeaderText="Length" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="vehwidth" SortExpression="vehwidth"
                                    HeaderText="Width" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="vehheight" SortExpression="vehheight"
                                    HeaderText="Height" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="maxcargoheight" SortExpression="maxcargoheight"
                                    HeaderText="Maximum Cargo Height" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehparkdescr" SortExpression="vehparkdescr" HeaderText="VehPark"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="route" SortExpression="route" HeaderText="Route"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehmake" HeaderText="VehMake" SortExpression="vehmake"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehmodel" HeaderText="VehModel" SortExpression="vehmodel"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehyearmfg" HeaderText="VehYearMfg" SortExpression="vehyearmfg"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehchassisno" HeaderText="VehChassisNo" SortExpression="vehchassisno"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehengineno" HeaderText="VehEngineNo" SortExpression="vehengineno"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehmodel" HeaderText="VehModel" SortExpression="vehmodel"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="descr2" HeaderText="VehDescription" SortExpression="descr2"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="cat" HeaderText="Category" SortExpression="cat"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="cranetypecode" SortExpression="cranetypecode"
                                    HeaderText="CraneTypeCode" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="cranemake" HeaderText="CraneMake" SortExpression="cranemake"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="cranemodel" HeaderText="CraneModel" SortExpression="cranemodel"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="craneyearmfg" HeaderText="CraneYearMfg" SortExpression="craneyearmfg"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="cranechassisno" HeaderText="CraneChassisNo" SortExpression="cranechassisno"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="grosswt" SortExpression="typedescr" HeaderText="Gross Wt."
                                    DataFormatString="{0:#,0.##}" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="nettwt" SortExpression="nettwt" HeaderText="Nett Wt."
                                    DataFormatString="{0:#,0.##}" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="grossvol" SortExpression="grossvol" HeaderText="Gross Vol."
                                    DataFormatString="{0:#,0.##}" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="nettvol" SortExpression="nettvol" HeaderText="Nett.Vol."
                                    DataFormatString="{0:#,0.##}" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="inspectionexpirydate" HeaderText="InspectionExpDate"
                                    SortExpression="inspectionexpirydate" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="inspectionrefdate" HeaderText="InspectionRefDate"
                                    SortExpression="inspectionrefdate" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="inspectionamt" HeaderText="InspectionAmt" SortExpression="inspectionamt"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="inspectionremarks" HeaderText="InspectionRemarks"
                                    SortExpression="inspectionremarks" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="inspectionstatus" HeaderText="InspectionStatus"
                                    SortExpression="inspectionstatus" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statusdescr" HeaderText="Status" SortExpression="statusdescr"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                                    ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statuscolor" Display="False" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="False">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
