<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookCtnrAdd.aspx.cs"
    Inherits="iWMS.Web.Job.CashBookPV.CashBookCtnrAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>CashBook Container Form</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <base target="_self" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>

    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server" method="post">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <table cellspacing="2" cellpadding="2" width="100%" border="0">
        <tr>
            <td>
                <telerik:RadButton ID="addBtn" runat="server" OnClick="addBtn_Click" Text="Add" Skin="WebBlue"
                    SingleClick="true" SingleClickText="Processing...">
                </telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
                    AllowFilteringByColumn="false" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                    OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ID" CommandItemDisplay="Top" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                        EditMode="InPlace">
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="icon">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="ResultDG_Delete" runat="server">
                                        <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                            title="Delete" runat="server" /></a>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                    <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="chargecode" HeaderText="Charge">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "chargecode")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="ChargeList" runat="server" DefaultMessage="Select a Charge"
                                        DropDownHeight="150px" Skin="WebBlue" DataSource='<%# chargeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(chargeListDS,DataBinder.Eval(Container.DataItem, "chargeid").ToString())%>'
                                        DataTextField="descr" DataValueField="id" OnSelectedIndexChanged="ChargeList_SelectedIndexChanged"
                                        AutoPostBack="true">
                                    </telerik:RadDropDownList>
                                    <asp:TextBox ID="ChargeCodeTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>' />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="chargedescr" HeaderText="Description">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "chargedescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="ChargeDescrTxt" Skin="Office2007" TextMode="MultiLine"
                                        Rows="2" Width="150px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="qty" HeaderText="Qty">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.##}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="QtyTxt" Skin="Office2007" Width="100px" AutoPostBack="true"
                                        OnTextChanged="QtyRate_TextChanged">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="QtyTxtReqVal" runat="server" ControlToValidate="QtyTxt"
                                        ErrorMessage="*" />
                                    <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    <asp:CompareValidator ID="QtyTxtZeroVal" runat="server" ControlToValidate="QtyTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="unitrate" HeaderText="Rate($)">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="RateTxt" Skin="Office2007" Width="100px" AutoPostBack="true"
                                        OnTextChanged="QtyRate_TextChanged">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RateTxtReqVal" runat="server" ControlToValidate="RateTxt"
                                        ErrorMessage="*" />
                                    <asp:CompareValidator ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    <asp:CompareValidator ID="RateTxtZeroVal" runat="server" ControlToValidate="RateTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="fcamt" HeaderText="Amount">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "fcamt", "{0:#,0.00}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="FcAmtTxt" Skin="Office2007" Width="100px"
                                        AutoPostBack="true" OnTextChanged="FCAmt_TextChanged">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="FcAmtTxtReqVal" runat="server" ControlToValidate="FcAmtTxt"
                                        ErrorMessage="*" />
                                    <asp:CompareValidator ID="FcAmtTxtCompVal" runat="server" ControlToValidate="FcAmtTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    <asp:CompareValidator ID="FcAmtTxtZeroVal" runat="server" ControlToValidate="FcAmtTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="lcamt" HeaderText="LcAmt" Display="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "lcamt", "{0:#,0.00}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="LcAmtTxt" Skin="Office2007" Width="100px">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="LcAmtTxtReqVal" runat="server" ControlToValidate="LcAmtTxt"
                                        ErrorMessage="*" />
                                    <asp:CompareValidator ID="LcAmtTxtCompVal" runat="server" ControlToValidate="LcAmtTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    <asp:CompareValidator ID="LcAmtTxtZeroVal" runat="server" ControlToValidate="LcAmtTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="taxtypedescr" HeaderText="TaxType">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# RetTaxTypeDescr(Eval("taxtype").ToString())%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="TaxTypeList" runat="server" DefaultMessage="Select a TaxType"
                                        Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeListDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                                        DataSource='<%# taxTypeListDS%>' DataTextField="descr" DataValueField="item"
                                        OnSelectedIndexChanged="TaxType_SelectedIndexChanged" AutoPostBack="true">
                                    </telerik:RadDropDownList>
                                    <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxTypeList"
                                        ErrorMessage="*" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="taxfcamt" HeaderText="TaxFcAmt" Display="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "taxfcamt", "{0:#,0.00}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TaxFcAmtTxt" Skin="Office2007" Width="100px">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="TaxFcAmtTxtReqVal" runat="server" ControlToValidate="TaxFcAmtTxt"
                                        ErrorMessage="*" />
                                    <asp:CompareValidator ID="TaxFcAmtTxtCompVal" runat="server" ControlToValidate="TaxFcAmtTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    <asp:CompareValidator ID="TaxFcAmtTxtZeroVal" runat="server" ControlToValidate="TaxFcAmtTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="taxlcamt" HeaderText="TaxLcAmt" Display="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "taxlcamt", "{0:#,0.00}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TaxLcAmtTxt" Skin="Office2007" Width="100px">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="TaxLcAmtTxtReqVal" runat="server" ControlToValidate="TaxLcAmtTxt"
                                        ErrorMessage="*" />
                                    <asp:CompareValidator ID="TaxLcAmtTxtCompVal" runat="server" ControlToValidate="TaxLcAmtTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    <asp:CompareValidator ID="TaxLcAmtTxtZeroVal" runat="server" ControlToValidate="TaxLcAmtTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn HeaderText="Remarks1">
                               <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "rem1")  %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox runat="server" ID="Rem1Txt" Text='<%# DataBinder.Eval(Container.DataItem, "rem1") %>'></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn HeaderText="Remarks2">
                           <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "rem2")  %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox runat="server" ID="Rem2Txt" Text='<%# DataBinder.Eval(Container.DataItem, "rem2") %>'></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
