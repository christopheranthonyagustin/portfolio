<%@ Page Language="c#" CodeBehind="DrDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.InvoiceRegisterV2.DrDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceDetail</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        html, body {
            width: 99.9999%;
            margin: 0%;
            padding: 0%;
            overflow: auto;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" >
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td align="right">
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                &nbsp; &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="SearchPanel" runat="server" DefaultButton="Searchbtn">&nbsp;&nbsp;
                    <telerik:RadTextBox ID="SrcNoTxt" runat="server" Width="150px">
                    </telerik:RadTextBox>&nbsp;
                         <asp:Button ID="Searchbtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Search" UseSubmitBehavior="false" CssClass="white" />&nbsp;&nbsp;
                        <asp:Button ID="ExportExcelLnk" CssClass="green" runat="server" OnClick="ExportExcel" 
                        Text="Excel" /> 
                </asp:Panel>
                <asp:Panel ID="Pnl1" runat="server" Visible="false">
                <table width="100%">
                <tr class="graytitle">
                    <td class="graytitle"" colspan="3">
                        <asp:Label ID="LicenseNameLbl" runat="server" CssClass="Graytitle"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>     
                <tr>                
                    <td class="graytitle"> 
                        <asp:Label ID="Label1" runat="server"></asp:Label>                   
                        <asp:Label ID="Invoicedate" runat="server"></asp:Label>
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        <asp:Label ID="FrDate" runat="server"></asp:Label>
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                        <asp:Label ID="ToDate" runat="server"></asp:Label>                 
                    </td>             
            </tr>  
            <tr class="graytitle">
                <td>
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                    <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                </td>                            
            </tr>
        </table>
        </asp:Panel>
            </td>
        </tr>
    </table>
    <br />
    <div>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"  
        AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
        OnGridExporting="ResultDG_GridExporting" OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit">
        <ClientSettings>
            <Scrolling AllowScroll="True" EnableVirtualScrollPaging="False" UseStaticHeaders="True"
      SaveScrollPosition="True" />
      <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" EditMode="InPlace" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="ResultDG_Delete" runat="server">
                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                title="Delete" runat="server" /></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="seqno" SortExpression="seqno"
                    HeaderText="S/N" AllowFiltering="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "seqno", "{0:#,0}")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="SeqNo1Txt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "seqno") %>' />
                        <asp:CompareValidator ID="SeqNo1TxtCompVal" runat="server" ControlToValidate="SeqNo1Txt"
                            EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" /><asp:CompareValidator
                                ID="SeqNo1TxtZeroVal" runat="server" ControlToValidate="SeqNo1Txt" EnableClientScript="True"
                                ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" Type="Integer" />
                        <asp:Label ID="SeqNo1Lbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "seqno") %>' />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="Src" DataField="src" ColumnGroupName="src" SortExpression="src"
                    UniqueName="src" Reorderable="true" ReadOnly="true" AllowFiltering="false"/>
                <telerik:GridBoundColumn HeaderText="Id" DataField="srcid" ColumnGroupName="srcid"
                    SortExpression="srcid" UniqueName="srcid" Reorderable="true" ReadOnly="true"/>
                <telerik:GridBoundColumn HeaderText="JobNo" DataField="srcno" ColumnGroupName="srcno"
                    SortExpression="srcno" UniqueName="srcno" Reorderable="true" ReadOnly="true" />
                <telerik:GridBoundColumn HeaderText="Date" DataField="srcdate" ColumnGroupName="srcdate"
                    SortExpression="srcdate" UniqueName="srcdate" ReadOnly="true" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="false"/>
                <telerik:GridBoundColumn HeaderText="Min(FrDate)" DataField="frdate" ColumnGroupName="frdate"
                    SortExpression="frdate" UniqueName="frdate" ReadOnly="true" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="false"/>
                <telerik:GridBoundColumn HeaderText="Max(ToDate)" DataField="todate" ColumnGroupName="todate"
                    SortExpression="todate" UniqueName="todate" ReadOnly="true" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="false"/>                
                <telerik:GridTemplateColumn Reorderable="true" UniqueName="chargedescr" HeaderText="Charge"
                    SortExpression="chargedescr">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "chargedescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="Charge1Txt" runat="server" Height="75px" Width="400px" TextMode="MultiLine"
                            Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>' />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>               
                <telerik:GridTemplateColumn UniqueName="skucode" HeaderText="SKU <br/> Description"  AllowFiltering="false">
                    <ItemTemplate>
                        <%# string.Format("{0:} <br/> {1:}", Eval("skucode"), Eval("skudescr")) %>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="true" UniqueName="billingqty" SortExpression="billingqty"
                    HeaderText="BillQty" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "billingqty", "{0:#,0.0000}")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="Qty1Txt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "billingqty") %>' />
                        <asp:RequiredFieldValidator ID="Qty1TxtReqVal" runat="server" ControlToValidate="Qty1Txt"
                            ErrorMessage="*" /><asp:CompareValidator ID="Qty1TxtCompVal" runat="server" ControlToValidate="Qty1Txt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        <asp:Label ID="Qty1Lbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "billingqty") %>' />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="true" UniqueName="unitrate" SortExpression="unitrate"
                    HeaderText="UnitRate" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.0000}")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="Rate1Txt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>' />
                        <asp:RequiredFieldValidator ID="Rate1TxttReqVal" runat="server" ControlToValidate="Rate1Txt"
                            ErrorMessage="*" /><asp:CompareValidator ID="Rate1TxtCompVal" runat="server" ControlToValidate="Rate1Txt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator
                                    ID="Rate1TxtZeroVal" runat="server" ControlToValidate="Rate1Txt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0.00" />
                        <asp:Label ID="Rate1Lbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>' />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="UOM" DataField="unitrateuom" ColumnGroupName="unitrateuom"
                    SortExpression="unitrateuom" UniqueName="unitrateuom" Reorderable="true" ReadOnly="true" AllowFiltering="false"/>
                <telerik:GridBoundColumn HeaderText="TotAmt" DataField="totamt" ColumnGroupName="totamt"
                    SortExpression="totamt" UniqueName="totamt" ReadOnly="true" Reorderable="true"
                    DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right" AllowFiltering="false"/>
                <telerik:GridBoundColumn HeaderText="MinAmt" DataField="minimumcharge" ColumnGroupName="minimumcharge"
                    SortExpression="minimumcharge" UniqueName="minimumcharge" ReadOnly="true" Reorderable="true" Visible="false"
                    DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right" AllowFiltering="false"/>
                <telerik:GridBoundColumn HeaderText="BillAmt" DataField="billingamt" ColumnGroupName="billingamt"
                    SortExpression="billingamt" UniqueName="billingamt" ReadOnly="true" Reorderable="true" Visible="false"
                    DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right" AllowFiltering="false"/>
                <telerik:GridTemplateColumn Reorderable="true" UniqueName="taxtypedescr" SortExpression="taxtypedescr"
                    HeaderText="Tax Type">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "taxtypedescr") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="TaxTypeList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                            runat="server" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeListDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                            DataSource='<%# taxTypeListDS%>' />
                        <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxTypeList"
                            ErrorMessage="*" />
                        <asp:Label ID="TaxTypeLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>' />
                        <asp:Label ID="TaxTypeDescrLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "taxtypedescr") %>' />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="LotId" DataField="lotid" ColumnGroupName="lotid"
                    SortExpression="lotid" UniqueName="lotid" Reorderable="true" ReadOnly="true" Visible="false"/>
                <telerik:GridBoundColumn HeaderText="Lot 1" DataField="lot1" ColumnGroupName="lot1" DataFormatString="{0:dd/MMM/yyyy}"
                    SortExpression="lot1" UniqueName="lot1" Reorderable="true" ReadOnly="true" Visible="false"/>
                <telerik:GridBoundColumn HeaderText="Lot 2" DataField="lot2" ColumnGroupName="lot2" DataFormatString="{0:dd/MMM/yyyy}"
                    SortExpression="lot2" UniqueName="lot2" Reorderable="true" ReadOnly="true" Visible="false"/>
                <telerik:GridBoundColumn HeaderText="Lot 3" DataField="lot3" ColumnGroupName="lot3" DataFormatString="{0:dd/MMM/yyyy}"
                    SortExpression="lot3" UniqueName="lot3" Reorderable="true" ReadOnly="true" Visible="false"/>
                <telerik:GridBoundColumn HeaderText="Lot 4" DataField="lot4" ColumnGroupName="lot4"
                    SortExpression="lot4" UniqueName="lot4" Reorderable="true" ReadOnly="true" Visible="false"/>
                <telerik:GridBoundColumn HeaderText="Lot 5" DataField="lot5" ColumnGroupName="lot5"
                    SortExpression="lot5" UniqueName="lot5" Reorderable="true" ReadOnly="true" Visible="false"/>
                <telerik:GridBoundColumn HeaderText="Lot 6" DataField="lot6" ColumnGroupName="lot6"
                    SortExpression="lot6" UniqueName="lot6" Reorderable="true" ReadOnly="true" Visible="false"/>
                <telerik:GridBoundColumn HeaderText="Lot 7" DataField="lot7" ColumnGroupName="lot7"
                    SortExpression="lot7" UniqueName="lot7" Reorderable="true" ReadOnly="true" Visible="false"/>
                <telerik:GridBoundColumn HeaderText="Lot 8" DataField="lot8" ColumnGroupName="lot8"
                    SortExpression="lot8" UniqueName="lot8" Reorderable="true" ReadOnly="true" Visible="false"/>
                <telerik:GridTemplateColumn Reorderable="true" UniqueName="remarks" SortExpression="remarks"
                    HeaderText="Remarks">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "remarks")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="Rem1Txt" runat="server" Height="75px" Width="400px" TextMode="MultiLine"
                            Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>' />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="true" UniqueName="arglcodedescr" SortExpression="arglcodedescr"
                    HeaderText="ArGlCode">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "arglcodedescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ArGlCodeList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                            runat="server" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ArGlCodeListDS,DataBinder.Eval(Container.DataItem, "ArGlCode").ToString())%>'
                            DataSource='<%# ArGlCodeListDS%>' />
                        <asp:RequiredFieldValidator ID="ArGlCodeReqVal" runat="server" ControlToValidate="ArGlCodeList"
                            ErrorMessage="*" />
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
