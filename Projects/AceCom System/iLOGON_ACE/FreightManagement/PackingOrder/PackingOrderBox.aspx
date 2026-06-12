<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackingOrderBox.aspx.cs" Inherits="iWMS.Web.FreightManagement.PackingOrder.PackingOrderHUaspx" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Box @ Packing Order</title>
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
    <%--Use for Fucture
    <telerik:RadCodeBlock runat="server" ID="RadCodeBlock1">
        <script type="text/javascript">
            function CalculateNetWt(CheckBox) {
                var MasterTable = $find("<%=PKOItemNotPackedResultDG.ClientID%>").get_masterTableView();
                var RowCount = MasterTable.get_dataItems().length;
                var Checkbox;
                var NetWt = 0, TotalNetWt = 0;
                for (var i = 0; i < RowCount; i++) {
                    var item = MasterTable.get_dataItems()[i];
                    Checkbox = item.findElement("PKOItemNotPackedCHKObjective");
                    if (Checkbox.checked) {
                        var Qty = MasterTable.getCellByColumnUniqueName(MasterTable.get_dataItems()[i], "Qty").innerHTML;
                        var Weight = MasterTable.getCellByColumnUniqueName(MasterTable.get_dataItems()[i], "Weight").innerHTML;
                        if (Weight == "&nbsp;") {
                            Weight = 0;
                        }
                        TotalNetWt = parseInt(NetWt, 10) + TotalNetWt;
                    }
                }
                var NetWtHidden = document.getElementById("NetWtHiddenValue");
                NetWtHidden.value = TotalNetWt;
            }
        </script>
    </telerik:RadCodeBlock>--%>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                            <asp:Button ID="FormBtn" class="white" runat="server" OnClick="FormBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
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
                            <iWMS:iForm ID="formCtlHU" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="PKOItemsInListBoxUpdatePanel" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="PKOItemInListBoxResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" OnItemDataBound="PKOItemInListBoxResultDG_ItemDataBound"
                    AllowMultiRowSelection="true" OnNeedDataSource="PKOItemInListBoxResultDG_NeedDataSource" AllowFilteringByColumn="false"
                    AllowPaging="true" AutoGenerateColumns="false" GridLines="None">
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" TableLayout="Fixed">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="PKOItemDeleteIcon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <a id="PKOItemDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                        onserverclick="PKOItemDelete_ServerClick" runat="server" causesvalidation="false">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Bank"
                                            runat="server"></a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn UniqueName="PartNo" HeaderText="PartNo" AllowFiltering="false" DataField="PartNo" HeaderStyle-Width="150px" ItemStyle-Width="150px"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="PartDescr" HeaderText="PartDescr" AllowFiltering="false" DataField="PartDescription" HeaderStyle-Width="200px" ItemStyle-Width="200px"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="WorkOrderNo" HeaderText="WorkOrderNo" AllowFiltering="false" DataField="WorkOrderNo" HeaderStyle-Width="150px" ItemStyle-Width="150px"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Qty" HeaderText="Qty" AllowFiltering="false" DataField="Qty" HeaderStyle-Width="100px" ItemStyle-Width="100px"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Weight" HeaderText="Weight" AllowFiltering="false" DataField="Weight" HeaderStyle-Width="100px" ItemStyle-Width="100px"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="TotalWt" HeaderText="TotalWt" AllowFiltering="false" DataField="TotalItemWeight" HeaderStyle-Width="100px" ItemStyle-Width="100px"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="WorkOrderNo" HeaderText="WorkOrderNo" AllowFiltering="false" DataField="WorkOrderNo" HeaderStyle-Width="150px" ItemStyle-Width="150px"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Id" DataField="Id" Display="false"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Items Not Packed" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:HiddenField ID="NetWtHiddenValue" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="HeaderRadPageView">
                <asp:UpdatePanel ID="PKOItemNotPackedPanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="PKOItemNotPackedResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                            AllowMultiRowSelection="true" OnNeedDataSource="PKOItemNotPackedResultDG_NeedDataSource" AllowFilteringByColumn="false"
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
                                            <input id="PKOItemNotPackedCBSelectAll" name="PKOItemNotPackedCBSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="PKOItemNotPackedCHKObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn UniqueName="PartNo" HeaderText="PartNo" AllowFiltering="false" DataField="PartNo" HeaderStyle-Width="150px" ItemStyle-Width="150px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="PartDescr" HeaderText="PartDescr" AllowFiltering="false" DataField="PartDescription" HeaderStyle-Width="200px" ItemStyle-Width="200px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="WorkOrderNo" HeaderText="WorkOrderNo" AllowFiltering="false" DataField="WorkOrderNo" HeaderStyle-Width="150px" ItemStyle-Width="150px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="Qty" HeaderText="Qty" AllowFiltering="false" DataField="qty" HeaderStyle-Width="100px" ItemStyle-Width="100px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="Weight" HeaderText="Weight" AllowFiltering="false" DataField="Weight" HeaderStyle-Width="100px" ItemStyle-Width="100px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="TotalWt" HeaderText="TotalWt" AllowFiltering="false" DataField="TotalItemWeight" HeaderStyle-Width="100px" ItemStyle-Width="100px"></telerik:GridBoundColumn>
                                    
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
