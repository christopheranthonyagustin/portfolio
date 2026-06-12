<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssuePackBySKU.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssuePackBySKU" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>PackBySKU @ GoodsIssue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" href="../../css/iWMStelerik.css" type="text/css">
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function SelectAll(invoker) {
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
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="NotifyOpsBtn" runat="server" CssClass="white" Text="Notify Ops" OnClick="NotifyOpsBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh"
                        OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
                <td align="right">
                    <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnBatchEditCommand="ResultDG_BatchEditCommand">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="550px" />
            </ClientSettings>
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top" EditMode="Batch" ItemStyle-HorizontalAlign="Left">
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
                                onserverclick="PTDetlDelete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                    runat="server"></a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="No" AllowFiltering="false"
                        HeaderText="No" ItemStyle-Width="50px" HeaderStyle-Width="50px">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OPNo" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exline" UniqueName="exline" SortExpression="exline" HeaderText="ExLine" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="60px" HeaderStyle-Width="60px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skucode" UniqueName="skucode" SortExpression="skucode" HeaderText="Sku" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr" UniqueName="skudescr" SortExpression="skudescr" HeaderText="Description" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="true" ItemStyle-Width="300px" HeaderStyle-Width="300px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Loc" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridNumericColumn DataField="PackedQty" HeaderStyle-Width="140px" ItemStyle-Width="140px" HeaderText="Packed Qty" FilterControlWidth="60px"
                        SortExpression="PackedQty" UniqueName="PackedQty" DataFormatString="{0:#,0.##}" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridNumericColumn>
                    <telerik:GridBoundColumn HeaderText="Lot4" DataField="lot4" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px"
                        SortExpression="lot4" UniqueName="lot4" Reorderable="true" DataFormatString="&nbsp;{0}" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot5" DataField="lot5" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px"
                        SortExpression="lot5" UniqueName="lot5" Reorderable="true" DataFormatString="&nbsp;{0}" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridNumericColumn DataField="isdorigqty" HeaderStyle-Width="140px" ItemStyle-Width="140px" HeaderText="Original Qty" FilterControlWidth="60px"
                        SortExpression="OriginalQty" UniqueName="OriginalQty" DataFormatString="{0:#,0.##}" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridNumericColumn>
                    <telerik:GridNumericColumn DataField="SKUPackQty" HeaderStyle-Width="140px" ItemStyle-Width="140px" HeaderText="Picked Qty" FilterControlWidth="60px"
                        SortExpression="SKUPackQty" UniqueName="SKUPackQty" DataFormatString="{0:#,0.##}" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridNumericColumn>
                    <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM" ReadOnly="true"
                        ItemStyle-Wrap="false" FilterControlWidth="60px" ItemStyle-Width="140px" HeaderStyle-Width="140px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn DataField="paloccode" UniqueName="paloccode" HeaderText="PALoc" SortExpression="paloccode"
                        ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        <ItemTemplate>
                            <asp:TextBox ID="palocText" runat="server" Visible="true" Text='<%# Eval("paloccode") %>' Width="150px">                          
                            </asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="paloccheckdigit" UniqueName="paloccheckdigit" SortExpression="paloccheckdigit"
                        HeaderText="PaLocCheckDigits" ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        <ItemTemplate>
                            <asp:TextBox ID="pacheckdigitText" runat="server" Visible="true" Text='<%# Eval("paloccheckdigit") %>' Width="150px">                          
                            </asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TUNO1" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="paqty" UniqueName="paqty" HeaderText="PaQty" SortExpression="paqty" FilterControlWidth="60px"
                        ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pauom" UniqueName="pauom" HeaderText="Pa Uom" SortExpression="pauom"
                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pastatus" UniqueName="pastatus" HeaderText="PaStatus" SortExpression="pastatus"
                        ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skupackpackedqty" SortExpression="skupackpackedqty" ReadOnly="true" FilterControlWidth="60px"
                        HeaderText="PackedQty" DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TotalNetWt" DataField="totnetwt" AllowFiltering="true" ItemStyle-Width="160px" HeaderStyle-Width="160px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        SortExpression="totnetwt" UniqueName="totnetwt" Reorderable="true" DataFormatString="{0:#,0.##}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rcdate" UniqueName="rcdate" SortExpression="rcdate" HeaderText="RcvDate" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno2" UniqueName="tuno2" SortExpression="tuno2" HeaderText="TU#2" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lotid" UniqueName="lotid" SortExpression="lotid" HeaderText="LotID" ItemStyle-Width="160px" HeaderStyle-Width="160px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
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
                        HeaderText="EditUser" ItemStyle-Width="140px" HeaderStyle-Width="140px" ReadOnly="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PTId" UniqueName="PTId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="id" Display="False">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
