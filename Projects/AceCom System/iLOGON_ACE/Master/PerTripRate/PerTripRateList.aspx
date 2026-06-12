<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerTripRateList.aspx.cs"
    Inherits="iWMS.Web.Master.PerTripRate.PerTripRateList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<title>PerTripRate</title>
<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
<meta name="CODE_LANGUAGE" content="C#">
<meta name="vs_defaultClientScript" content="JavaScript">
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
<link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
<link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
<html>
<head id="Head1" runat="server">
</head>
<asp:boundcolumn datafield="adddate" sortexpression="adddate" headertext="Add Date"
    dataformatstring="{0:dd/MMM/yyyy HH:mm:ss}">

    <body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
           <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    <asp:Panel ID="AddPanel" runat="server" Visible="False">
        <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
            <tr>
                <td>
                 <%--  <asp:ImageButton ID="SaveAndNextBtn" runat="server" ImageUrl="../../Image/SaveAndNext.png"
                Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                ImageAlign="AbsMiddle" ToolTip="Save & Next" OnClick="SaveNextBtn_Click" />  
                    &nbsp;
                     <asp:ImageButton ID="SavBtn" runat="server" ImageUrl="../../Image/Save.png"
                Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                ImageAlign="AbsMiddle" ToolTip="Save" OnClick="SaveBtn_Click" />   &nbsp;
                     <asp:Imag
                     eButton ID="ClosePanelBtn" runat="server" ImageUrl="../../Image/Hide.png"
                Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                ImageAlign="AbsMiddle" ToolTip="Search" OnClick="ClosePanelBtn_Click" OnClientClick="return busyBox.Show();" />  --%>


                  <%--  <telerik:RadButton ID="ClosePanelBtn" CausesValidation="false" runat="server" Text="- Hide"
                    CssClass="detailButton" OnClick="ClosePanelBtn_Click" OnClientClick="return busyBox.Show();" ></telerik:RadButton>--%>
                           <asp:Button ID="SaveAndNextBtn" class="white" runat="server" OnClick="SaveNextBtn_Click" ToolTip="Save & Next"
                            Text="Save+Next" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" Visible="true" />
                        &nbsp;
                    <asp:Button ID="SaveBtn" class="white" runat="server" OnClick="SaveBtn_Click" ToolTip="Save"
                        Text="Save" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" Visible="true" CausesValidation="false"/>
                        &nbsp;
                    <asp:Button ID="ClosePanelBtn" class="white" runat="server" OnClick="ClosePanelBtn_Click"
                        Text="Hide"  CausesValidation="false"/>
                        &nbsp;
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1"><br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
    </asp:Panel>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting"
        AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true">
        
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
        <Selecting AllowRowSelect="true"  />  
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                        <asp:ImageButton runat="server" ID="ldEdit" ImageUrl="../../image/pencil.gif" Width="15"
                            Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                            OnClick = "ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                        <asp:ImageButton runat="server" ID="ldAdd" ImageUrl="../../image/add.png" Width="15"
                            Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Add Detail"
                            OnClick = "ldAdd_Click"  CausesValidation="False"></asp:ImageButton>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="PerTripRateDelete" runat="server">
                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Service Chit"
                                runat="server"></a>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                     <telerik:GridBoundColumn DataField="Code" SortExpression="Code" HeaderText="Account"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="pergradedescr" SortExpression="pergradedescr" HeaderText="PerGrade"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="opsunitdescr" SortExpression="opsunitdescr" HeaderText="OpsUnitCode"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="billsizetypedescr" SortExpression="billsizetypedescr" HeaderText="BillSizeType"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="ctnrsizedescr" SortExpression="ctnrsizedescr" HeaderText="CtnrSize"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="jobtypedescr" SortExpression="jobtypedescr" HeaderText="JobType"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="tpttypedescr" SortExpression="tpttypedescr" HeaderText="TptType"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="triptypedescr" SortExpression="triptypedescr" HeaderText="TripType"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sectordescr" SortExpression="sectordescr" HeaderText="TripOption/Sector"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <%--Added by ZZT 21/09/2016--%>
                        <telerik:GridBoundColumn DataField="trailertype" SortExpression="trailertype" HeaderText="TrailerType"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="triprate" SortExpression="triprate" HeaderText="TripRate"
                            ItemStyle-Wrap="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        
                        <%--Added by XR 24/05/2016--%>
                        <telerik:GridBoundColumn DataField="InctMethodDescr" SortExpression="InctMethodDescr" HeaderText="InctMethod"
                            ItemStyle-Wrap="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        
                        <telerik:GridBoundColumn DataField="InctCalcMethodDescr" SortExpression="InctCalcMethodDescr" HeaderText="InctCalcMethod"
                            ItemStyle-Wrap="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        
                        <telerik:GridBoundColumn DataField="AllowanceMethodDescr" SortExpression="AllowanceMethodDescr" HeaderText="AllowMethod"
                            ItemStyle-Wrap="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        
                        <telerik:GridBoundColumn DataField="AllowanceCalcMethodDescr" SortExpression="AllowanceCalcMethodDescr" HeaderText="AllowCalcMethod"
                            ItemStyle-Wrap="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="Left">
                        </telerik:GridBoundColumn>
                        
                        <%--Add End--%>
                         <telerik:GridBoundColumn DataField="incttypedescr" SortExpression="incttypedescr" HeaderText="InctType"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="inctcatdescr" SortExpression="inctcatdescr" HeaderText="InctCat"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         
                         <telerik:GridBoundColumn DataField="routedescr" SortExpression="routedescr" HeaderText="Route"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         
                         <telerik:GridBoundColumn DataField="starttimefr" SortExpression="starttimefr" HeaderText="StartTimeFr"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="starttimeto" SortExpression="starttimeto" HeaderText="StartTimeTo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="starttimefactor" SortExpression="starttimefactor" HeaderText="StartTimeFactor"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="canceltripfactor" SortExpression="canceltripfactor" HeaderText="CancelTripFactor"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="canceltriprate" SortExpression="canceltriprate" HeaderText="CancelTripRate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="effectivedate" SortExpression="effectivedate" HeaderText="EffectiveDate"
                       DataFormatString="{0:dd/MMM/yyyy}"     ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="canceltriprate" SortExpression="canceltriprate" HeaderText="CancelTripRate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="overtimehourlyrate" SortExpression="overtimehourlyrate"
                    HeaderText="OT Hourly Rate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="afterhoursstarttime" SortExpression="afterhoursstarttime" HeaderText="AftHrStartTime"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="afterhoursunitrate" SortExpression="afterhoursunitrate"
                    HeaderText="AftHrUnitRate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="AllowanceExtraType" SortExpression="AllowanceExtraType"
                    HeaderText="AllowanceExtraType"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="AllowancePHSunRate" SortExpression="AllowancePHSunRate"
                    HeaderText="AllowancePHSunRate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="AllowanceTimeBlock01Rate" SortExpression="AllowanceTimeBlock01Rate"
                    HeaderText="AllowanceTimeBlock01Rate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="AllowanceTimeBlock02Rate" SortExpression="AllowanceTimeBlock02Rate"
                    HeaderText="AllowanceTimeBlock02Rate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AllowanceTimeBlock03Rate" SortExpression="AllowanceTimeBlock03Rate"
                    HeaderText="AllowanceTimeBlock03Rate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="phsundayrate" SortExpression="phsundayrate"
                    HeaderText="PHSundayRate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="nightjobrate" SortExpression="nightjobrate"
                    HeaderText="NightRate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="hourlyrate" SortExpression="hourlyrate"
                    HeaderText="HourlyRate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="MinimumHour" SortExpression="MinimumHour"
                    HeaderText="MinimumHour"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="allowanceextrarate" SortExpression="allowanceextrarate"
                    HeaderText="AllowanceExtraRate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                         </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
