<%@ Page Language="c#" CodeBehind="PickDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Issue.PickDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>PickDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" href="../../css/iWMStelerik.css" type="text/css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
    <script type="text/javascript">
        function SelectAll(invoker) {
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
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
         <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="LineTab" Text="Line" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="SerialNo" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
         <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
            <table width="100%" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td>
                    <br />
                    <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh"
                        OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    <asp:Button ID="NotifyOpsBtn" runat="server" CssClass="white" Text="Notify Ops" OnClick="NotifyOpsBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="ConfirmPicked" runat="server" CssClass="white" Text="Picked" OnClick="ConfirmPickedBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>
                    <asp:Button ID="SendPickListBtn" runat="server" class="white" Text="SendPickList" OnClick="SendPickListBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="false" />
                    &nbsp;
                    <asp:Button ID="ButtonExcel" runat="server" OnClick="ExportExcel" Text="Excel"
                        CssClass="green" ToolTip="Export To Excel" />
                </td>
                <td align="right">
                    <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabelBig"></asp:Label>
                </td>
                <td align="left">
                    <br />
                    &nbsp;<asp:Label ID="IdLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label><br />
                    &nbsp;<asp:Button ID="BackBtn" runat="server" Text="Back" CssClass="detailButton"
                        Style="z-index: 0" Visible="false" OnClick="BackBtn_Click" /><br />
                    <br />
                </td>
                <td align="right">
                    <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <br>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" RenderMode="Lightweight" ShowStatusBar="true"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
            OnGridExporting="ResultDG_GridExporting" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" ClientSettings-AllowColumnsReorder="true"
            OnNeedDataSource="ResultDG_NeedDataSource" OnBatchEditCommand="ResultDG_BatchEditCommand" OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="550px" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id"
                CommandItemDisplay="Top" EditMode="Batch">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                <CommandItemSettings ShowAddNewRecordButton="false" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="CHKIcon" AllowFiltering="false" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                        <HeaderTemplate>
                            <input id="CBSelectAll" name="CBSelectAll" type="checkbox" onclick="SelectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="PickTask_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                    runat="server"></a>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="No" AllowFiltering="false"
                        HeaderText="No" ItemStyle-Width="50px" HeaderStyle-Width="50px">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%--    <telerik:GridBoundColumn DataField="id" Display="False" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>--%>
                    <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OPNo" ReadOnly="true"
                        AllowFiltering="true" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="160px" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="PTDetlID" ReadOnly="true"
                        AllowFiltering="true" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="160px" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exline" UniqueName="exline" SortExpression="exline" HeaderText="ExLine"
                        AllowFiltering="true" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="160px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="PTDContainerNo" UniqueName="PTDContainerNo" SortExpression="PTDContainerNo" HeaderText="ContainerNo"
                        AllowFiltering="true" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="160px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skucode" UniqueName="skucode" SortExpression="skucode" HeaderText="Sku"
                        ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr" UniqueName="skudescr" SortExpression="skudescr" HeaderText="Description"
                        ItemStyle-Wrap="true" ItemStyle-Width="300px" HeaderStyle-Width="300px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="length" UniqueName="length" SortExpression="length" HeaderText="Length" DataFormatString="{0:N3}"
                        ItemStyle-Wrap="true" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="width" UniqueName="width" SortExpression="width" HeaderText="Width" DataFormatString="{0:N3}"
                        ItemStyle-Wrap="true" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="height" UniqueName="height" SortExpression="height" HeaderText="Height" DataFormatString="{0:N3}"
                        ItemStyle-Wrap="true" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vol" UniqueName="vol" SortExpression="vol" HeaderText="Volumn" DataFormatString="{0:N3}"
                        ItemStyle-Wrap="true" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Loc"
                        ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TUNO1"
                        ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TUNO2"
                        ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn DataField="loccheckdigit" UniqueName="loccheckdigit" SortExpression="loccheckdigit"
                        HeaderText="Checkdigits" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                        <ItemTemplate>
                            <asp:TextBox ID="checkdigitText" runat="server" Visible="true" Text='<%# Eval("loccheckdigit") %>' Width="150px">
                            </asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridNumericColumn DataField="PTDTOriginalQty" HeaderStyle-Width="140px" ItemStyle-Width="140px" HeaderText="Original Qty" FilterControlWidth="60px"
                        SortExpression="OriginalQty" UniqueName="OriginalQty" DataFormatString="{0:#,0.##}" ItemStyle-HorizontalAlign="Right" ReadOnly="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true">
                    </telerik:GridNumericColumn>
                    <telerik:GridNumericColumn DataField="ptd2isduomqty" HeaderStyle-Width="140px" ItemStyle-Width="140px" HeaderText="Picked Qty" FilterControlWidth="60px"
                        SortExpression="ptd2isduomqty" UniqueName="ptd2isduomqty" DataFormatString="{0:#,0.##}" ItemStyle-HorizontalAlign="Right" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true">
                    </telerik:GridNumericColumn>
                    <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM" ReadOnly="true"
                        ItemStyle-Wrap="false" FilterControlWidth="60px" ItemStyle-Width="140px" HeaderStyle-Width="140px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn DataField="paloccode" UniqueName="paloccode" HeaderText="PALoc" SortExpression="paloccode" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                        <ItemTemplate>
                            <asp:TextBox ID="palocText" runat="server" Visible="true" Text='<%# Eval("paloccode") %>' Width="150px">                          
                            </asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="paloccheckdigit" UniqueName="paloccheckdigit" SortExpression="paloccheckdigit" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        HeaderText="PaLocCheckDigits" ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                        <ItemTemplate>
                            <asp:TextBox ID="pacheckdigitText" runat="server" Visible="true" Text='<%# Eval("paloccheckdigit") %>' Width="150px">                          
                            </asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TUNO1" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="paqty" UniqueName="paqty" HeaderText="PaQty" SortExpression="paqty" FilterControlWidth="60px"
                        ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pauom" UniqueName="pauom" HeaderText="Pa Uom" SortExpression="pauom" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pastatus" UniqueName="pastatus" HeaderText="PaStatus" SortExpression="pastatus" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skupackpackedqty" SortExpression="skupackpackedqty" ReadOnly="true" FilterControlWidth="60px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        HeaderText="PackedQty" DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot4" DataField="lot4" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot4" UniqueName="lot4" Reorderable="true" DataFormatString="&nbsp;{0}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot1" DataField="lot1" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot5" DataField="lot5" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot5" UniqueName="lot5" Reorderable="true" DataFormatString="&nbsp;{0}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot6" DataField="lot6" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot6" UniqueName="lot6" Reorderable="true" DataFormatString="&nbsp;{0}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot7" DataField="lot7" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot7" UniqueName="lot7" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot2" DataField="lot2" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot3" DataField="lot3" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot3" UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot8" DataField="lot8" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot8" UniqueName="lot8" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot9" UniqueName="lot9" Reorderable="true" DataFormatString="&nbsp;{0}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot10" UniqueName="lot10" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot11" UniqueName="lot11" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot12" UniqueName="lot12" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot13" DataField="lot13" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot13" UniqueName="lot13" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot14" DataField="lot14" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot14" UniqueName="lot14" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot15" DataField="lot15" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot15" UniqueName="lot15" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot16" DataField="lot16" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot16" UniqueName="lot16" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot17" DataField="lot17" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot17" UniqueName="lot17" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot18" DataField="lot18" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot18" UniqueName="lot18" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot19" DataField="lot19" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot19" UniqueName="lot19" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot20" DataField="lot20" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot20" UniqueName="lot20" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot21" DataField="lot21" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot21" UniqueName="lot21" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot22" DataField="lot22" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot22" UniqueName="lot22" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot23" DataField="lot23" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot23" UniqueName="lot23" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot24" DataField="lot24" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot24" UniqueName="lot24" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot25" DataField="lot25" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot25" UniqueName="lot25" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot26" DataField="lot26" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot26" UniqueName="lot26" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot27" DataField="lot27" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot27" UniqueName="lot27" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot28" DataField="lot28" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot28" UniqueName="lot28" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot29" DataField="lot29" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot29" UniqueName="lot29" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot30" DataField="lot30" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot30" UniqueName="lot30" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot31" DataField="lot31" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot31" UniqueName="lot31" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot32" DataField="lot32" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot32" UniqueName="lot32" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot33" DataField="lot33" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot33" UniqueName="lot33" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot34" DataField="lot34" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot34" UniqueName="lot34" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot35" DataField="lot35" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot35" UniqueName="lot35" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot36" DataField="lot36" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot36" UniqueName="lot36" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot37" DataField="lot37" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot37" UniqueName="lot37" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot38" DataField="lot38" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot38" UniqueName="lot38" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot39" DataField="lot39" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot39" UniqueName="lot39" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot40" DataField="lot40" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot40" UniqueName="lot40" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot41" DataField="lot41" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot41" UniqueName="lot41" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot42" DataField="lot42" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot42" UniqueName="lot42" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot43" DataField="lot43" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot43" UniqueName="lot43" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot44" DataField="lot44" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot44" UniqueName="lot44" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot45" DataField="lot45" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot45" UniqueName="lot45" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot46" DataField="lot46" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot46" UniqueName="lot46" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot47" DataField="lot47" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot47" UniqueName="lot47" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot48" DataField="lot48" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot48" UniqueName="lot48" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot49" DataField="lot49" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot49" UniqueName="lot49" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot50" DataField="lot50" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot50" UniqueName="lot50" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot51" DataField="lot51" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot51" UniqueName="lot51" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot52" DataField="lot52" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot52" UniqueName="lot52" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot53" DataField="lot53" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot53" UniqueName="lot53" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot54" DataField="lot54" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot54" UniqueName="lot54" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot55" DataField="lot55" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot55" UniqueName="lot55" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot56" DataField="lot56" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot56" UniqueName="lot56" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot57" DataField="lot57" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot57" UniqueName="lot57" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot58" DataField="lot58" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot58" UniqueName="lot58" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot59" DataField="lot59" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot59" UniqueName="lot59" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot60" DataField="lot60" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="lot60" UniqueName="lot60" Reorderable="true" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TotalNetWt" DataField="totnetwt" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="totnetwt" UniqueName="totnetwt" Reorderable="true" DataFormatString="{0:#,0.##}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rcdate" UniqueName="rcdate" SortExpression="rcdate" HeaderText="RcvDate" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                        DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno2" UniqueName="tuno2" SortExpression="tuno2" HeaderText="TU#2" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lotid" UniqueName="lotid" SortExpression="lotid" HeaderText="LotID" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="zonecode" UniqueName="zonecode" SortExpression="zonecode" HeaderText="Zone"
                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" UniqueName="adddate" SortExpression="adddate" HeaderText="AddDate" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" UniqueName="adduser" SortExpression="adduser" HeaderText="AddUser" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" UniqueName="editdate" SortExpression="editdate" HeaderText="EditDate" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" UniqueName="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                        HeaderText="EditUser" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PTId" UniqueName="PTId" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="SerialNoRadPageView" Height="500px" />
        </telerik:RadMultiPage>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground" X="300" Y="100">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Style="text-decoration: none;" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
    </form>
</body>
</html>
