<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderCombineChargeView.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderCombineChargeView" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TMSBO CombinedChargeView</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
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
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="CombinedChargeViewTabRadPageView">
                <table border="0" cellspacing="0" cellpadding="0" width="100%" height="40">
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text="Save"
                                OnClick="SaveBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="PrintInv2Btn" runat="server" Text="Print Invoice 2" OnClick="PrintInv2Btn_Click"
                                CssClass="LongLabelBlue" ToolTip="MassInvoice2Print" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    EnableLinqExpressions="false" AllowPaging="false" Skin="Metro" AllowSorting="true" AllowFilteringByColumn="false"
                    OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100" EditMode="InPlace">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>

                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn AllowFiltering="false">
                                <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                <HeaderTemplate>
                                    No
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Invoice No">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "InvoiceNo")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Combined Code">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CombinedCode")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Combined Notes" UniqueName="CombinedNote" ItemStyle-Width="70px">
                                <ItemTemplate>
                                    <telerik:RadTextBox ID="CombinedNotesTxt" runat="server" Width="400" Height="75" Resize="Both" TextMode="MultiLine"
                                        Skin="WebBlue" Text='<%# Eval("CombinedNotes") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Combined Qty">
                                <ItemTemplate>
                                    <telerik:RadTextBox ID="CombinedQtyTxt" runat="server" Skin="WebBlue" Text='<%# Eval("CombinedQty") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Combined UOM">
                                <ItemTemplate>
                                    <telerik:RadDropDownList ID="CombinedUOM_DDL" runat="server" DataSource='<%# CombinedUOMDS%>' DataTextField="Descr" DataValueField="Item"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CombinedUOMDS,DataBinder.Eval(Container.DataItem, "CombinedUOM").ToString())%>'>
                                    </telerik:RadDropDownList>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Combined Amt">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CombinedAmt")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="TaxType">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TaxType")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Combined Lines">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CombinedLines")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn Display="false" DataField="jbId">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="false" DataField="InvoiceNo">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="false" DataField="CombinedCode">
                            </telerik:GridBoundColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
