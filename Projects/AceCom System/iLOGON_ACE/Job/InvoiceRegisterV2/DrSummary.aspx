<%@ Page Language="c#" CodeBehind="DrSummary.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.InvoiceRegisterV2.DrSummary" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceSummary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td><br />&nbsp;
                    <asp:Button ID="RefreshBtn" runat="server" CssClass="detailButton"
                        Text="Refresh" OnClick="RefreshBtn_Click"></asp:Button>
                    <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="NewCharge" OnClick="AddBtn_Click"></asp:Button>
                    <asp:Button ID="QuBtn" runat="server" CssClass="white" OnClick="QuBtnBtn_Click" Width="130px"
                        Text="Add From Quotation" />
                </td>
                <td align="right">
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                &nbsp; &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <div id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False"
                OnCancelCommand="ResultDG_Cancel" GridLines="None" OnNeedDataSource="ResultDG_NeedDataSource"
                Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit"
                CellPadding="2" DataKeyField="id" UseAccessibleHeader="True" AllowSorting="True">

                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>

                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <PagerStyle Mode="NextPrevAndNumeric" />

                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                                    Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="ResultDG_Delete" runat="server">
                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                        runat="server"></a>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                    Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="billingtype" SortExpression="billingtype" ReadOnly="True"
                            HeaderText="BillingType">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="Charge">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ChargeList" Enabled="True" DataTextField="Descr" DataValueField="id" ItemStyle-Width="100px"
                                    runat="server" DataSource='<%# chargeListDS%>' OnSelectedIndexChanged="ChargeList_SelectedIndexChanged"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(chargeListDS,DataBinder.Eval(Container.DataItem, "chargeid").ToString())%>'
                                    AutoPostBack="True" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "chargedescr2") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="Description" SortExpression="chargedescr" ItemStyle-Width="200px"
                            ItemStyle-Wrap="false">
                            <EditItemTemplate>
                                <asp:TextBox ID="Charge1Txt" runat="server" Height="50px" Width="200px" TextMode="MultiLine"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "chargedescr")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="BillQty" SortExpression="BillQty" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Wrap="false">
                            <EditItemTemplate>
                                <asp:TextBox ID="Qty1Txt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "billingqty") %>'
                                    AutoPostBack="true" OnTextChanged="Qty1Txt_TextChanged" />
                                <asp:RequiredFieldValidator ID="Qty1TxtReqVal" runat="server" ControlToValidate="Qty1Txt"
                                    ErrorMessage="*" /><asp:CompareValidator ID="Qty1TxtCompVal" runat="server" ControlToValidate="Qty1Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                <asp:Label ID="Qty1Lbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "billingqty") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "billingqty", "{0:#,0.0000}")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="UnitRate" SortExpression="UnitRate" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Wrap="false">
                            <EditItemTemplate>
                                <asp:TextBox ID="Rate1Txt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>'
                                    AutoPostBack="true" OnTextChanged="Rate1Txt_TextChanged" />
                                <asp:RequiredFieldValidator ID="Rate1TxttReqVal" runat="server" ControlToValidate="Rate1Txt"
                                    ErrorMessage="*" /><asp:CompareValidator ID="Rate1TxtCompVal" runat="server" ControlToValidate="Rate1Txt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator
                                            ID="Rate1TxtZeroVal" runat="server" ControlToValidate="Rate1Txt" EnableClientScript="True"
                                            ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                <asp:Label ID="Rate1Lbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="unitrateuom" SortExpression="unitrateuom" HeaderText="UOM"
                            ReadOnly="True">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="discount1" SortExpression="discount1" HeaderText="OrigDiscount1"
                            DataFormatString="{0:#,0.00}" Visible="false" ReadOnly="True">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="origbillingamt" SortExpression="origbillingamt" HeaderText="Amt"
                            DataFormatString="{0:#,0.00}" ReadOnly="True">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="Discount" SortExpression="discount1" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Wrap="false">
                            <EditItemTemplate>
                                <asp:TextBox ID="Discount1Txt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "discount1") %>'
                                    AutoPostBack="true" OnTextChanged="Discount1Txt_TextChanged" />
                                <asp:RequiredFieldValidator ID="Discount1TxttReqVal" runat="server" ControlToValidate="Discount1Txt"
                                    ErrorMessage="*" /><asp:CompareValidator ID="Discount1TxtCompVal" runat="server"
                                        ControlToValidate="Discount1Txt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck"
                                        Type="Currency" /><asp:CompareValidator ID="Discount1TxtZeroVal" runat="server" ControlToValidate="Discount1Txt"
                                            EnableClientScript="True" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                <asp:Label ID="discount1Lbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "discount1", "{0:#,0.00}")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Billingamt" SortExpression="Billingamt" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Wrap="false">
                            <EditItemTemplate>
                                <asp:TextBox ID="BillingamtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "Billingamt") %>' />
                                <asp:RequiredFieldValidator ID="BillingamtTxttReqVal" runat="server" ControlToValidate="BillingamtTxt"
                                    ErrorMessage="*" /><asp:CompareValidator ID="BillingamtTxtCompVal" runat="server"
                                        ControlToValidate="BillingamtTxt" EnableClientScript="True" ErrorMessage="#"
                                        Operator="DataTypeCheck" Type="double" />
                                <asp:Label ID="BillingamtLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "Billingamt", "{0:#,0.00}")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="minimumcharge" SortExpression="minimumcharge" HeaderText="MinAmt"
                            DataFormatString="{0:#,0.00}" Visible="false" ReadOnly="True">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="Tax Type" SortExpression="taxtypedescr" ItemStyle-Wrap="false">
                            <EditItemTemplate>
                                <asp:DropDownList ID="TaxTypeList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                                    runat="server" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeListDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                                    DataSource='<%# taxTypeListDS%>' />
                                <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxTypeList"
                                    ErrorMessage="*" />
                                <asp:Label ID="TaxTypeLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>' />
                                <asp:Label ID="TaxTypeDescrLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "taxtypedescr") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "taxtypedescr") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Remarks" SortExpression="remarks" ItemStyle-Width="200px"
                            ItemStyle-Wrap="false">
                            <EditItemTemplate>
                                <asp:TextBox ID="Rem1Txt" runat="server" Height="50px" Width="200px" TextMode="MultiLine"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "remarks")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="ArGlCode" SortExpression="arglcodedescr" ItemStyle-Width="200px"
                            ItemStyle-Wrap="false">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ArGlCodeList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                                    runat="server" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ArGlCodeListDS,DataBinder.Eval(Container.DataItem, "ArGlCode").ToString())%>'
                                    DataSource='<%# ArGlCodeListDS%>' />
                                <asp:RequiredFieldValidator ID="ArGlCodeReqVal" runat="server" ControlToValidate="ArGlCodeList"
                                    ErrorMessage="*" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "arglcodedescr")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            ReadOnly="True" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                            ReadOnly="True">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                            ReadOnly="True" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                            ReadOnly="True">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                    </Columns>
                    <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
