<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssuePackDetl.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssuePackDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PKCtn @ Pack</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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

        function close() {
            GetRadWindow().close();
        }

        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked;
                }
            }
        }
    </script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckALLPTDetlResultDG(id) {
                var masterTable = $find("<%= PTDetlResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("PTDetlCHKObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("PTDetlCHKObjective").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="FormBtn" CssClass="white" runat="server" OnClick="FormBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CancelBtn" class="longlabelwhite" runat="server" OnClick="CancelBtn_Click" Text="Close Window" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;   
                            <asp:CheckBox ID="SaveOnPanChk" ToolTip="SaveOnPan" runat="server" />
                    <asp:Label ID="SaveOnPanChkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="FormCtrlUpdatePanel" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtlPKCtn" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="PKDetlUpdatePanel" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="PKDetlResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                    AllowMultiRowSelection="true" OnNeedDataSource="PKDetlResultDG_NeedDataSource" AllowFilteringByColumn="false" OnItemDataBound="PKDetlResultDG_ItemDataBound1"
                    AllowPaging="true" AutoGenerateColumns="false" GridLines="None" OnBatchEditCommand="PTDetlResultDG_BatchEditCommand">
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" TableLayout="Auto" EditMode="Batch" CommandItemDisplay="TopAndBottom" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <CommandItemSettings ShowAddNewRecordButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="20px" ItemStyle-Width="20px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="PKDetlDeleteIcon" AllowFiltering="false" HeaderStyle-Width="20px" ItemStyle-Width="20px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton ID="Delete" runat="server" Visible="True" ImageUrl="../../image/bin.gif" ToolTip="Delete"
                                        Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="PKDetlDelete_ServerClick"
                                        OnClientClick="return confirm('Are you sure you want to delete?');"
                                        BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="SKUCode" HeaderText="SKU" ReadOnly="true"
                                AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SKUDescr" HeaderText="Descr" ReadOnly="true"
                                AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SKUPackPackedQty" UniqueName="SKUPackPackedQty" HeaderText="Qty" DataFormatString="{0:0.##}"
                                AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="90px" HeaderStyle-Width="90px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SKUPackUOMDescr" UniqueName="SKUPackUOMDescr" HeaderText="UOM" ReadOnly="true"
                                AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Lot4" UniqueName="Lot4" HeaderText="Lot4" ReadOnly="true" DataFormatString="{0:0.##}"
                                AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Id" UniqueName="Id" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Items Not Packed" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="lineInformationTab" Text="Line Information" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="HeaderRadPageView">
                <asp:UpdatePanel ID="PTDetlNotPackedPanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="PTDetlResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                            AllowMultiRowSelection="true" OnNeedDataSource="PTDetlResultDG_NeedDataSource" AllowFilteringByColumn="false"
                            AllowPaging="true" AutoGenerateColumns="false" GridLines="None">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" TableLayout="Fixed" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <input id="PTDetlCBSelectAll" name="PTDetlCBSelectAll" type="checkbox" onclick="CheckALLPTDetlResultDG(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="PTDetlCHKObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="No" AllowFiltering="false"
                                        HeaderText="No" ItemStyle-Width="50px" HeaderStyle-Width="50px">
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OPNo" Display="false"
                                        AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="exline" UniqueName="exline" SortExpression="exline" HeaderText="ExLine"
                                        AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="60px" HeaderStyle-Width="60px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="skucode" UniqueName="skucode" SortExpression="skucode" HeaderText="Sku"
                                        ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="skudescr" UniqueName="skudescr" SortExpression="skudescr" HeaderText="Description"
                                        ItemStyle-Wrap="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Loc" Display="false"
                                        ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridNumericColumn DataField="qty" HeaderStyle-Width="140px" ItemStyle-Width="140px" HeaderText="Qty"
                                        SortExpression="Qty" UniqueName="Qty" DataFormatString="{0:#,0.##}" ItemStyle-HorizontalAlign="Right">
                                    </telerik:GridNumericColumn>
                                    <telerik:GridTemplateColumn DataField="loccheckdigit" UniqueName="loccheckdigit" SortExpression="loccheckdigit" Display="false"
                                        HeaderText="Checkdigits" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        <ItemTemplate>
                                            <asp:TextBox ID="checkdigitText" runat="server" Visible="true" Text='<%# Eval("loccheckdigit") %>'>
                                            </asp:TextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM" UniqueName="uomdescr"
                                        ItemStyle-Wrap="false" FilterControlWidth="60px" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn DataField="paloccode" UniqueName="paloccode" HeaderText="PALoc" SortExpression="paloccode" Display="false"
                                        ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn DataField="paloccheckdigit" UniqueName="paloccheckdigit" SortExpression="paloccheckdigit" Display="false"
                                        HeaderText="PaLocCheckDigits" ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TUNO1" ItemStyle-Width="140px" HeaderStyle-Width="140px" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="paqty" UniqueName="paqty" HeaderText="PaQty" SortExpression="paqty" Display="false"
                                        ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="pauom" UniqueName="pauom" HeaderText="Pa Uom" SortExpression="pauom" Display="false"
                                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="pastatus" UniqueName="pastatus" HeaderText="PaStatus" SortExpression="pastatus" Display="false"
                                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="skupackpackedqty" SortExpression="skupackpackedqty"
                                        HeaderText="PackedQty" DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot4" DataField="Lot4" AllowFiltering="true" Display="false"
                                        SortExpression="Lot4" UniqueName="Lot4" Reorderable="true" DataFormatString="&nbsp;{0}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot1" DataField="Lot1" AllowFiltering="true" Display="false"
                                        SortExpression="Lot1" UniqueName="Lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot5" DataField="Lot5" AllowFiltering="true" Display="false"
                                        SortExpression="Lot5" UniqueName="Lot5" Reorderable="true" DataFormatString="&nbsp;{0}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot6" DataField="Lot6" AllowFiltering="true" Display="false"
                                        SortExpression="Lot6" UniqueName="Lot6" Reorderable="true" DataFormatString="&nbsp;{0}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot7" DataField="Lot7" AllowFiltering="true"
                                        SortExpression="Lot7" UniqueName="Lot7" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot2" DataField="Lot2" AllowFiltering="true"
                                        SortExpression="Lot2" UniqueName="Lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot3" DataField="Lot3" AllowFiltering="true"
                                        SortExpression="Lot3" UniqueName="Lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot8" DataField="Lot8" AllowFiltering="true" Display="false"
                                        SortExpression="Lot8" UniqueName="Lot8" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot9" DataField="Lot9" AllowFiltering="true"
                                        SortExpression="Lot9" UniqueName="Lot9" Reorderable="true" DataFormatString="&nbsp;{0}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot10" DataField="Lot10" AllowFiltering="true"
                                        SortExpression="Lot10" UniqueName="Lot10" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot11" DataField="Lot11" AllowFiltering="true"
                                        SortExpression="Lot11" UniqueName="Lot11" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot12" DataField="Lot12" AllowFiltering="true"
                                        SortExpression="Lot12" UniqueName="Lot12" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot13" DataField="Lot13" AllowFiltering="true"
                                        SortExpression="Lot13" UniqueName="Lot13" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot14" DataField="Lot14" AllowFiltering="true"
                                        SortExpression="Lot14" UniqueName="Lot14" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot15" DataField="Lot15" AllowFiltering="true"
                                        SortExpression="Lot15" UniqueName="Lot15" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot16" DataField="Lot16" AllowFiltering="true"
                                        SortExpression="Lot16" UniqueName="Lot16" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot17" DataField="Lot17" AllowFiltering="true"
                                        SortExpression="Lot17" UniqueName="Lot17" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot18" DataField="Lot18" AllowFiltering="true"
                                        SortExpression="Lot18" UniqueName="Lot18" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot19" DataField="Lot19" AllowFiltering="true"
                                        SortExpression="Lot19" UniqueName="Lot19" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot20" DataField="Lot20" AllowFiltering="true"
                                        SortExpression="Lot20" UniqueName="Lot20" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot21" DataField="Lot21" AllowFiltering="true"
                                        SortExpression="Lot21" UniqueName="Lot21" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot22" DataField="Lot22" AllowFiltering="true"
                                        SortExpression="Lot22" UniqueName="Lot22" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot23" DataField="Lot23" AllowFiltering="true"
                                        SortExpression="Lot23" UniqueName="Lot23" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot24" DataField="Lot24" AllowFiltering="true"
                                        SortExpression="Lot24" UniqueName="Lot24" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot25" DataField="Lot25" AllowFiltering="true"
                                        SortExpression="Lot25" UniqueName="Lot25" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot26" DataField="Lot26" AllowFiltering="true"
                                        SortExpression="Lot26" UniqueName="Lot26" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot27" DataField="Lot27" AllowFiltering="true"
                                        SortExpression="Lot27" UniqueName="Lot27" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot28" DataField="Lot28" AllowFiltering="true"
                                        SortExpression="Lot28" UniqueName="Lot28" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot29" DataField="Lot29" AllowFiltering="true"
                                        SortExpression="Lot29" UniqueName="Lot29" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot30" DataField="Lot30" AllowFiltering="true"
                                        SortExpression="Lot30" UniqueName="Lot30" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot31" DataField="Lot31" AllowFiltering="true"
                                        SortExpression="Lot31" UniqueName="Lot31" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot32" DataField="Lot32" AllowFiltering="true"
                                        SortExpression="Lot32" UniqueName="Lot32" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot33" DataField="Lot33" AllowFiltering="true"
                                        SortExpression="Lot33" UniqueName="Lot33" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot34" DataField="Lot34" AllowFiltering="true"
                                        SortExpression="Lot34" UniqueName="Lot34" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot35" DataField="Lot35" AllowFiltering="true"
                                        SortExpression="Lot35" UniqueName="Lot35" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot36" DataField="Lot36" AllowFiltering="true"
                                        SortExpression="Lot36" UniqueName="Lot36" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot37" DataField="Lot37" AllowFiltering="true"
                                        SortExpression="Lot37" UniqueName="Lot37" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot38" DataField="Lot38" AllowFiltering="true"
                                        SortExpression="Lot38" UniqueName="Lot38" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot39" DataField="Lot39" AllowFiltering="true"
                                        SortExpression="Lot39" UniqueName="Lot39" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot40" DataField="Lot40" AllowFiltering="true"
                                        SortExpression="Lot40" UniqueName="Lot40" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot41" DataField="Lot41" AllowFiltering="true"
                                        SortExpression="Lot41" UniqueName="Lot41" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot42" DataField="Lot42" AllowFiltering="true"
                                        SortExpression="Lot42" UniqueName="Lot42" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot43" DataField="Lot43" AllowFiltering="true"
                                        SortExpression="Lot43" UniqueName="Lot43" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot44" DataField="Lot44" AllowFiltering="true"
                                        SortExpression="Lot44" UniqueName="Lot44" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot45" DataField="Lot45" AllowFiltering="true"
                                        SortExpression="Lot45" UniqueName="Lot45" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot46" DataField="Lot46" AllowFiltering="true"
                                        SortExpression="Lot46" UniqueName="Lot46" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot47" DataField="Lot47" AllowFiltering="true"
                                        SortExpression="Lot47" UniqueName="Lot47" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot48" DataField="Lot48" AllowFiltering="true"
                                        SortExpression="Lot48" UniqueName="Lot48" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot49" DataField="Lot49" AllowFiltering="true"
                                        SortExpression="Lot49" UniqueName="Lot49" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot50" DataField="Lot50" AllowFiltering="true"
                                        SortExpression="Lot50" UniqueName="Lot50" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot51" DataField="Lot51" AllowFiltering="true"
                                        SortExpression="Lot51" UniqueName="Lot51" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot52" DataField="Lot52" AllowFiltering="true"
                                        SortExpression="Lot52" UniqueName="Lot52" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot53" DataField="Lot53" AllowFiltering="true"
                                        SortExpression="Lot53" UniqueName="Lot53" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot54" DataField="Lot54" AllowFiltering="true"
                                        SortExpression="Lot54" UniqueName="Lot54" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot55" DataField="Lot55" AllowFiltering="true"
                                        SortExpression="Lot55" UniqueName="Lot55" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot56" DataField="Lot56" AllowFiltering="true"
                                        SortExpression="Lot56" UniqueName="Lot56" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot57" DataField="Lot57" AllowFiltering="true"
                                        SortExpression="Lot57" UniqueName="Lot57" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot58" DataField="Lot58" AllowFiltering="true"
                                        SortExpression="Lot58" UniqueName="Lot58" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot59" DataField="Lot59" AllowFiltering="true"
                                        SortExpression="Lot59" UniqueName="Lot59" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Lot60" DataField="Lot60" AllowFiltering="true"
                                        SortExpression="Lot60" UniqueName="Lot60" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="TotalNetWt" DataField="totnetwt" AllowFiltering="true" Display="false"
                                        SortExpression="totnetwt" UniqueName="totnetwt" Reorderable="true" DataFormatString="{0:#,0.##}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="RCDate" UniqueName="RCDate" SortExpression="RCDate" HeaderText="RcvDate" Display="false"
                                        DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TUNO2" UniqueName="TUNO2" SortExpression="TUNO2" HeaderText="TU#2" ItemStyle-Width="160px" HeaderStyle-Width="160px" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Lotid" UniqueName="Lotid" SortExpression="Lotid" HeaderText="LotID" ItemStyle-Width="160px" HeaderStyle-Width="160px" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ZoneCode" UniqueName="ZoneCode" SortExpression="ZoneCode" HeaderText="Zone" Display="false"
                                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate" HeaderText="AddDate" Display="false"
                                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" HeaderText="AddUser" Display="false"
                                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" HeaderText="EditDate" Display="false"
                                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="edituser" ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px" Display="false"
                                        HeaderText="EditUser">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="UOM" UniqueName="UOM" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="LineInformationRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
