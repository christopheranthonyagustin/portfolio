<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderForm.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesOrderForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Distribution Sales Order Form</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
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
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ContainerTab" Text="Container" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attachment" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>

                                    <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                        OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                    &nbsp;
                            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip2_TabClick">
                    <Tabs>
                        <telerik:RadTab Id="ItemTab" Text="Item" Value="10" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="SubItemTab" Text="SubItem" Value="15" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="AllocatedLotTab" Text="Allocated" Value="20" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="CollectedTab" Text="Collected" Value="30" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="FumigationDocumentTab" Text="FumigationDocument" Value="40" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="InvoiceTab" Text="Invoice" Value="50" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="ItemAttcTab" Text="Attch" Value="60" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="90%" ID="GLDistributionRadPageView">
                        <br />
                        <asp:Panel ID="NewBtnPanel" runat="server">
                            <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New"
                                OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />&nbsp;
                            <asp:Button ID="GenrateFabricationBtn" runat="server" CssClass="longlabelwhite" Text="Generate Fabrication"
                                OnClick="GenrateFabricationBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="GenerateFumigationDocBtn" runat="server" CssClass="longlabelwhite" Text="Generate FumigationDoc"
                                OnClick="GenerateFumigationDocBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="CollectedBtn" runat="server" CssClass="white" Text="Collect"
                                OnClick="CollectedBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            <asp:Button ID="PopulateDO" runat="server" CssClass="LongLabelWhite" Text="&nbsp;&nbsp;Populate &nbsp;&nbsp; Delivery Order"
                                OnClick="PopulateDO_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="SplitLineBtn" CssClass="LongLabelWhite" runat="server" OnClick="SplitLineBtn_Click" Text="Split Line"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="ExpandBtn" CssClass="LongLabelWhite" runat="server" OnClick="ExpandBtn_Click" Text="Generate LineNo"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="InsertLineNo" CssClass="LongLabelWhite" runat="server" OnClick="InsertLineNoBtn_Click" Text="Insert LineNo"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <asp:Button ID="DeleteBtn" CssClass="LongLabelWhite" runat="server" OnClick="DeleteBtn_Click" Text="Delete"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <br />
                        </asp:Panel>
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                            AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="SalesOrderItemId">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PODetailEdit"
                                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit" CausesValidation="false"
                                                OnClick="PODetailEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            &nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="delImg"
                                        ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                        OnClick="PODelete_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="LineNo" DataField="LineNo" SortExpression="LineNo" UniqueName="LineNo"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="No" DataField="LineReferenceNo" SortExpression="LineReferenceNo" UniqueName="LineReferenceNo"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Container" DataField="ContainerNo" SortExpression="ContainerNo" UniqueName="ContainerNo"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemCode" DataField="ItemCode" SortExpression="ItemCode" UniqueName="ItemCode"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemDescription" DataField="ItemDescription" SortExpression="ItemDescription" UniqueName="ItemDescription"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemType" DataField="ItemType" SortExpression="ItemType" UniqueName="ItemType"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemQty" DataField="expecteduomqty" SortExpression="ItemQty" UniqueName="ItemQty"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemAllocatedQty" DataField="allocateduomqty" SortExpression="allocateduomqty" UniqueName="allocateduomqty"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemCollectedQty" DataField="ItemCollectedUomQty" SortExpression="ItemCollectedUomQty" UniqueName="ItemCollectedUomQty"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemDeliveredQty" DataField="delivereduomqty" SortExpression="delivereduomqty" UniqueName="delivereduomqty"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemUOM" DataField="ItemUOM" SortExpression="ItemUOM" UniqueName="ItemUOM"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemUnitPrice" DataField="ItemUnitPrice" SortExpression="ItemUnitPrice" UniqueName="ItemUnitPrice"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                      <telerik:GridBoundColumn HeaderText="TaxType" DataField="TaxType" SortExpression="TaxType" UniqueName="TaxType"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                      <telerik:GridBoundColumn HeaderText="TaxAmt" DataField="TaxAmt" SortExpression="TaxAmt" UniqueName="TaxAmt"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn HeaderText="TotalAmt" DataField="TotalAmt" SortExpression="TotalAmt" UniqueName="TotalAmt"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="IsCollection" DataField="IsCollectionItem" SortExpression="IsCollectionItem" UniqueName="IsCollectionItem"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="IsNonStock" DataField="IsNonStockItem" SortExpression="IsNonStockItem" UniqueName="IsNonStockItem"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="FabricationCode" DataField="FabricationCode" SortExpression="FabricationCode" UniqueName="FabricationCode"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemLength" DataField="ItemLength" SortExpression="ItemLength" UniqueName="ItemLength"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemWidth" DataField="ItemWidth" SortExpression="ItemWidth" UniqueName="ItemWidth"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemHeight" DataField="ItemHeight" SortExpression="ItemHeight" UniqueName="ItemHeight"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemVol" DataField="ItemVol" SortExpression="ItemVol" UniqueName="ItemVol"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemWt" DataField="ItemWT" SortExpression="ItemWT" UniqueName="ItemWT"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemNetWt" DataField="ItemNetWT" SortExpression="ItemNetWT" UniqueName="ItemNetWT"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="InternalLength" DataField="InternalLength" SortExpression="InternalLength" UniqueName="InternalLength"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="InternalWidth" DataField="InternalWidth" SortExpression="InternalWidth" UniqueName="InternalWidth"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="InternalHeight" DataField="InternalHeight" SortExpression="InternalHeight" UniqueName="InternalHeight"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="InternalVol" DataField="InternalVol" SortExpression="InternalVol" UniqueName="InternalVol"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="InternalWt" DataField="InternalWt" SortExpression="InternalWt" UniqueName="InternalWt"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="InternalNetWt" DataField="InternalNetWt" SortExpression="InternalNetWt" UniqueName="InternalNetWt"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ExternalLength" DataField="ExternalLength" SortExpression="ExternalLength" UniqueName="ExternalLength"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExternalWidth" DataField="ExternalWidth" SortExpression="ExternalWidth" UniqueName="ExternalWidth"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExternalHeight" DataField="ExternalHeight" SortExpression="ExternalHeight" UniqueName="ExternalHeight"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExternalVol" DataField="ExternalVol" SortExpression="ExternalVol" UniqueName="ExternalVol"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExternalWt" DataField="ExternalWt" SortExpression="ExternalWt" UniqueName="ExternalWt"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ExternalNetWt" DataField="ExternalNetWt" SortExpression="ExternalNetWt" UniqueName="ExternalNetWt"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="MinSellingPrice" DataField="MinSellingPrice" SortExpression="MinSellingPrice" UniqueName="MinSellingPrice"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Notes" DataField="Notes" SortExpression="Notes" UniqueName="Notes"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="FabricationOrderNo" DataField="FabricationOrderNo" SortExpression="FabricationOrderNo" UniqueName="FabricationOrderNo"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn HeaderText="LaminationFlexPrice" DataField="LaminationFlexPrice" SortExpression="LaminationFlexPrice" UniqueName="LaminationFlexPrice"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="FabricationOrderStatus" DataField="FabricationOrderStatus" SortExpression="FabricationOrderStatus" UniqueName="FabricationOrderStatus"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                     <telerik:GridBoundColumn HeaderText="CollectionStatus" DataField="SalesOrderCollectedStatus" SortExpression="SalesOrderCollectedStatus" UniqueName="SalesOrderCollectedStatus"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="SalesOrderStatus" DataField="SalesOrderStatusDescr" SortExpression="SalesOrderStatusDescr" UniqueName="SalesOrderStatusDescr"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="ExpectedCollectionDate" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ExpectedCollectionDate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="FabricationId" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="ModifiedOn" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ModifiedOn")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="IsSystemGenerated" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SalesOrderItemId" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="IsCollectionItem" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="SubItemRadPageView">
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="AllocatedLotRadPageView">
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="CollectedRadPageView">
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="FumigationDocumentRadPageView">
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="InvoiceRadPageView">
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="90%" ID="ItemAttcRadPageView">
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
