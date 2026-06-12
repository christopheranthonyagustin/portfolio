<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PutawayWorkbenchItemizedRecords.aspx.cs" Inherits="iWMS.Web.Inbound.PutawayWorkbench.PutawayWorkbenchItemizedRecords" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="ItemizedTitle" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
</head>
      <script type="text/javascript">
          function OnClientClose_Edit(sender, args) {
              document.location.href = document.location.href;
          }
      </script>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <table>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server" />
                </td>
                <td>
                    <asp:CheckBox ID="AllOrdersChk" runat="server" CssClass="BigCheckBox" Style="vertical-align: middle" Checked="true" />
                    <asp:Label ID="AllOrdersChkLbl" runat="server" Font-Bold="true" Text="All records" ForeColor="Black"></asp:Label>
                    &nbsp;&nbsp;
                </td>
                <td>
                    <asp:Button ID="CloseWindowBtn" runat="server" CssClass="LongLabelWhite" Text="Close Window"
                        OnClick="CloseWindowBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="UnallocateBtn" runat="server" CssClass="white" Text="Unallocate" Visible="false"
                        OnClick="UnallocateBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="ReleasePalletBtn" runat="server" CssClass="LongLabelWhite" Text="Release Pallet"
                        OnClick="ReleasePalletBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="UpdatePalletBtn" runat="server" CssClass="LongLabelWhite" Text="Update Pallet"
                        OnClick="UpdatePalletBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                </td>
                 <td>
                   <asp:Button ID="WriteOffBtn" runat="server" CssClass="LongLabelWhite" Text="Write-Off"
                        OnClick="WriteOffBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Visible="false" />
                </td>

            </tr>
        </table>
         <br />
                <asp:HiddenField ID="Hidden1" runat="server" />
                <asp:HiddenField ID="Hidden2" runat="server" />
                <asp:HiddenField ID="JSONHiddenValue" runat="server" />
        <br />
        &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage2" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="NonContainerizedTripRadPageView">
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" RenderMode="Lightweight"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                    <%-- OnBatchEditCommand="ResultDG_BatchEditCommand"  OnItemDataBound="ResultDG_ItemDataBound"--%>
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <ClientEvents OnBatchEditClosed="BatchEditClosed" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>

                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" Name="MainGrid" EditMode="Batch" AllowFilteringByColumn="false" CommandItemDisplay="None">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <CommandItemSettings ShowAddNewRecordButton="false" />

                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="false" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="SerialNumber" HeaderText="S/No" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="SerialNumberLbl" Text='<%# DataBinder.Eval(Container.DataItem, "S/No")%>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn UniqueName="PalletNo" DataField="PalletNo" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="PalletNumber" HeaderText="Pallet No" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="PalletNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "PalletNo")%>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="StorageType" HeaderText="Storage Type" HeaderStyle-Width="110px" ItemStyle-Width="110px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="StorageTypeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "StorageType")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="StorageTypeCombo" runat="server" DataTextField="Descr" DataValueField="Item"
                                        RenderMode="Lightweight" Skin="WebBlue" OnItemsRequested="StorageTypeCombo_ItemsRequested"
                                        HighlightTemplatedItems="true" Filter="Contains" EnableLoadOnDemand="true" DropDownAutoWidth="Enabled">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Account" HeaderText="Account" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="AccountLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Account")%>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Brand" HeaderText="Brand" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="BrandLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Brand")%>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="SKU_Count" HeaderText="SKU Count" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="SKUCountLbl" Text='<%# DataBinder.Eval(Container.DataItem, "SKU Count")%>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="QTY" HeaderText="QTY" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="QTYLbl" Text='<%# DataBinder.Eval(Container.DataItem, "QTY")%>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                 <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="400px" Height="400px"
              Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose_Edit" Visible="false" Behaviors="Move, Close">
             </telerik:RadWindow>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                function CheckAll(id) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    var row = masterTable.get_dataItems();
                    if (id.checked == true) {
                        for (var i = 0; i < row.length; i++) {
                            masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                        }
                    }
                    else {
                        for (var i = 0; i < row.length; i++) {
                            masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                        }
                    }
                }
                function BatchEditClosed(sender, args) {
                    var StorageType = "", PalletNo = "";
                    var JsonArr = [];

                    var Hidden1 = document.getElementById('<%= Hidden1.ClientID %>');

                    PalletNo = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "PalletNo").innerText;

                    var StorageTypeTxt = sender.get_masterTableView()._getCellByColumnUniqueNameFromTableRowElement(args.get_row(), "StorageType");
                    if (StorageTypeTxt != null) {
                        StorageType = StorageTypeTxt.innerText;
                }

                JsonArr.push({
                    "PalletNo": PalletNo,
                    "StorageType": StorageType
                });

                Hidden1.value = JSON.stringify(JsonArr);

                    var Hidden2 = document.getElementById('<%= Hidden2.ClientID %>');

                    if (Hidden2 != null && Hidden2.value != "") {
                        Hidden2.value = Hidden2.value + "^" + Hidden1.value;
                    }
                    else {
                        Hidden2.value = Hidden1.value;
                    }

                    console.log(Hidden2.value);
                }
            </script>
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
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
