<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliveryServiceQuotationDetl.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveryService.DailyDeliveryServiceQuotationDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QuotationDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>Quotation No<br />
                    <telerik:RadTextBox ID="QuotationNotxt" runat="server" Width="155px" ReadOnly="true">
                    </telerik:RadTextBox>
                </td>
                <td>Charge Description<br />
                    <telerik:RadTextBox ID="ChargeDescrtxt" runat="server" Width="155px">
                    </telerik:RadTextBox>
                </td>
                <td align="left">Charge Description
                    <br />
                    <telerik:RadComboBox ID="Chargedescrddl" ZIndex="15000" runat="server" Width="155px" Skin="WebBlue" AllowCustomText="false" RenderMode="Lightweight" Filter="Contains" OnSelectedIndexChanged="Chargedescrddl_SelectedIndexChanged" AutoPostBack="true">
                    </telerik:RadComboBox>
                </td>
            </tr>
        </table>
        <br />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="serachBtn_Click"
                        ToolTip="Search" CssClass="white" />&nbsp;
                    <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Add" UseSubmitBehavior="false" CssClass="white" />
                    &nbsp;
                <asp:Button ID="CloseBtn" runat="server" Text="Close" OnClick="CloseBtn_Click"
                    CssClass="white" ToolTip="Close" />&nbsp;
                  &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
                <td></td>
            </tr>
        </table>
        <br />
        <div id="div-datagrid">
            <telerik:RadGrid ID="JBChargeDG" runat="server" AutoGenerateColumns="false" GridLines="None" Skin="Office2007" >
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <PagerStyle Mode="NextPrevAndNumeric" />
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace" Height="100px">
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="SeqNo" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' Visible="false"></asp:Label>
                                <asp:Label ID="QuDtTaxTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>' Visible="false" />
                                <asp:Label ID="SeqNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "seqno") %>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="True"
                            UniqueName="ChargeDescription" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="chargecodeLbl" runat="server"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                                </br>
                            <asp:Label ID="chargeLbl" runat="server"
                                Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <asp:TextBox ID="QtyTxt" runat="server" Width="60"></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="UOM" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrateuom") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <asp:TextBox ID="UnitRateTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.0000}") %>'></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:TextBox ID="RemarksTxt" runat="server" Width="300" TextMode="MultiLine"></asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="EstQty" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="estqtyLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estqty") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="EstUnitCostUOM" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="estunitcostuomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcostuom") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="estunitcost" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="estunitcostLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcost") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="MinCharge" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="minchargeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="MinChargeUOM" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="minchargeuomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumchargeuom") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="MinChargeType" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="minchargetypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumchargetype") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="MinCharge2" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="mincharge2Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge2") %>'></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AutoGen" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:DropDownList ID="AutoGen_ddl" runat="server" DataSource='<%# autoGenDS%>' DataTextField="Descr" Width="110px"
                                    DataValueField="Item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(autoGenDS,DataBinder.Eval(Container.DataItem, "AutoGen").ToString())%>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                    <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>

