<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterSalesInvoiceAssociatedBL.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterSalesInvoiceAssociatedBL" %>


<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Associate BL @ Sales Invoice</title>
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
    </script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= AssociatedBLResultDG.ClientID %>").get_masterTableView();
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

        function CheckALLAssociatedNotBLResultDG(id) {
            var masterTable = $find("<%= AssociatedNotBLResultDG.ClientID %>").get_masterTableView();
            var row = masterTable.get_dataItems();
            if (id.checked == true) {
                for (var i = 0; i < row.length; i++) {
                    masterTable.get_dataItems()[i].findElement("AssociatedNotBLCHKObjective").checked = true;
                }
            }
            else {
                for (var i = 0; i < row.length; i++) {
                    masterTable.get_dataItems()[i].findElement("AssociatedNotBLCHKObjective").checked = false;
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
                    <asp:UpdatePanel ID="FormCtrlUpdatePanel" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>

        </table>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip_AsscoiatedBL" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Id="RadTab1" Text="Associated BL" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="RadPageView1" Height="200px">
                <asp:UpdatePanel ID="AssociatedBLUpdatePanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="AssociatedBLResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight" OnItemDataBound="AssociatedBLResultDG_ItemDataBound"
                            AllowMultiRowSelection="true" OnNeedDataSource="AssociatedBLResultDG_NeedDataSource" AllowFilteringByColumn="false" Height="200px"
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
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" TableLayout="Fixed" Name="AssociatedBLGrid">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="CheckAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="AssociatedBLDeleteIcon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <a id="AssociatedBLDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                onserverclick="AssociatedBLDelete_ServerClick" runat="server" causesvalidation="false">
                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Bank"
                                                    runat="server"></a>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn UniqueName="BLNO" HeaderText="BLNO" AllowFiltering="false" DataField="BLNO" HeaderStyle-Width="150px" ItemStyle-Width="150px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="BLType" HeaderText="BLType" AllowFiltering="false" DataField="BLType" HeaderStyle-Width="200px" ItemStyle-Width="200px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="ShipperName" HeaderText="ShipperName" AllowFiltering="false" DataField="ShipperName" HeaderStyle-Width="150px" ItemStyle-Width="150px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="ConsigneeName" HeaderText="ConsigneeName" AllowFiltering="false" DataField="ConsigneeName" HeaderStyle-Width="100px" ItemStyle-Width="100px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="Id" DataField="Id" Display="false"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip_AsscoiatedNotBL" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="BL not associated" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:HiddenField ID="NetWtHiddenValue" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="HeaderRadPageView">
                <asp:Button ID="AssociatedBtn" runat="server" CssClass="LongLabelWhite" Text="Associate" CausesValidation="false"
                    OnClick="AssociatedBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                <br />
                <br />
                <asp:UpdatePanel ID="AssociatedNotBLUpdatePanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="AssociatedNotBLResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight"
                            AllowMultiRowSelection="true" OnNeedDataSource="AssociatedNotBLResultDG_NeedDataSource" AllowFilteringByColumn="false"
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
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" TableLayout="Fixed" Name="AssociatedNotBLGrid">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <input id="AssociatedNotBLSelectAll" name="AssociatedNotBLSelectAll" type="checkbox" onclick="CheckALLAssociatedNotBLResultDG(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="AssociatedNotBLCHKObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn UniqueName="BLNO" HeaderText="BLNO" AllowFiltering="false" DataField="BLNO" HeaderStyle-Width="150px" ItemStyle-Width="150px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="BLType" HeaderText="BLType" AllowFiltering="false" DataField="BLType" HeaderStyle-Width="200px" ItemStyle-Width="200px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="ShipperName" HeaderText="ShipperName" AllowFiltering="false" DataField="ShipperName" HeaderStyle-Width="150px" ItemStyle-Width="150px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="ConsigneeName" HeaderText="ConsigneeName" AllowFiltering="false" DataField="ConsigneeName" HeaderStyle-Width="100px" ItemStyle-Width="100px"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="Id" DataField="Id" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="DrId" DataField="DrId" Display="false"></telerik:GridBoundColumn>
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
