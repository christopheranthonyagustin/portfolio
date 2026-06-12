<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeclarationItems.aspx.cs" Inherits="iWMS.Web.Job.Declaration.DeclarationItems" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>DeclarationItems</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
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
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="0px" ID="MainInfoRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="NewBtn" class="white" runat="server" OnClick="NewBtn_Click" Text="New"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="NewPanel" runat="server" Visible="false">
                                <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add"
                                    UseSubmitBehavior="false" OnClientClick="disableBtn(this.id,true)" />
                                &nbsp;
                                <asp:Button ID="HideBtn" class="white" runat="server" OnClick="HideBtn_Click" Text="Hide"
                                    UseSubmitBehavior="false" OnClientClick="disableBtn(this.id,false)" CausesValidation="false" />
                                <br />
                                <asp:UpdatePanel runat="server" ID="UpdatePanel">
                                    <ContentTemplate><br />
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" AllowPaging="true" Skin="Metro">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="ID">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="checkbox" AllowFiltering="false">
                                <HeaderTemplate>
                                    <label id="completelbl">
                                    </label>
                                    &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" Exportable="false">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="omHeadEdit" ImageUrl="..\..\image\pencil.gif" Width="15" Height="15" AlternateText="Edit Order Register"
                                        OnClick="ldEdit_Click" BorderWidth="0" BackColor="Transparent" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" Exportable="false">
                                <ItemTemplate>
                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="lnkDelete_ServerClick" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Bank"
                                            runat="server"></a>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="Line" SortExpression="Line" HeaderText="Line">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AcCode" SortExpression="AcCode" HeaderText="AcCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SkuCode" SortExpression="SkuCode" HeaderText="SkuCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SkuDescr" SortExpression="SkuDescr" HeaderText="SkuDescription">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="HSCode" SortExpression="HSCode" HeaderText="HSCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CurrLotNo" SortExpression="CurrLotNo" HeaderText="BondMarkNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="COO" SortExpression="COO" HeaderText="COO">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Preference" SortExpression="Preference" HeaderText="Preference">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="MarksAndNo" UniqueName="MarksAndNo" HeaderText="MarksAndNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PrevDeclarationNo" SortExpression="PrevDeclarationNo" HeaderText="PrevDeclarationNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DutyQty" SortExpression="DutyQty" HeaderText="DutyQty">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DutyUOM" SortExpression="DutyUOM" HeaderText="DutyUOM">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TotDutyQty" SortExpression="TotDutyQty" HeaderText="TotDutyQty">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TotDutyUOM" SortExpression="TotDutyUOM" HeaderText="TotDutyUOM">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Qty" SortExpression="Qty" HeaderText="Qty">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="UOM" SortExpression="UOM" HeaderText="UOM">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GrossWt" SortExpression="GrossWt" HeaderText="GrossWt">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NetWt" UniqueName="NetWt" HeaderText="NetWt">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InvoiceAmt" SortExpression="InvoiceAmt" HeaderText="InvoiceAmt">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CurrCode" SortExpression="CurrCode" HeaderText="CurrCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustomValue" SortExpression="CustomValue" HeaderText="CustomValue">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustomDutyRate" SortExpression="CustomDutyRate" HeaderText="CustomDutyRate">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DutyAmt" SortExpression="DutyAmt" HeaderText="DutyAmt">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SpecificTaxRate" SortExpression="SpecificTaxRate" HeaderText="SpecificTaxRate">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SpecificTaxAmt" SortExpression="SpecificTaxAmt" HeaderText="SpecificTaxAmt">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TaxRate" SortExpression="TaxRate" HeaderText="TaxRate">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TaxAmt" UniqueName="TaxAmt" HeaderText="TaxAmt">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <table>
            <tr>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
