<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationDetl.aspx.cs"
    Inherits="iWMS.Web.Job.FreightImport.QuotationDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QuotationDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
     <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    <asp:Label ID="DescrLbl" runat="server"></asp:Label></div>
            </td>
            <td align="right">
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
            <td>
                <asp:Button ID="serarchBtn" runat="server" CssClass="white" Text="Search"  OnClientClick="disableBtn(this.id,false)"
                    OnClick="serachBtn_Click" UseSubmitBehavior="false" ></asp:Button>
                &nbsp;<asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add" OnClick="AddBtn_Click"  OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" >
                </asp:Button>&nbsp;<asp:Button ID="CloseBtn" runat="server" CssClass="white"  OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" 
                    Text="Close" OnClick="CloseBtn_Click"></asp:Button>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="JBChargeDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="false" AllowFilteringByColumn="false" AllowPaging="false" Skin="Metro">
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
            <Columns>
                <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Center" Display="false">
                    <ItemTemplate>
                        <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>'></asp:Label>
                        <asp:Label ID="QuDtTaxTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>' />
                        <asp:Label ID="SeqNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "seqno") %>' />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="Charge"
                    ItemStyle-Font-Bold="True">
                    <ItemStyle Wrap="true" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="Description" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:TextBox ID="DescrTxt" runat="server" Width="200" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:TextBox>
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
                <telerik:GridTemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="CurrCodeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "currcode") %>' />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:TextBox ID="UnitRateTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>'></asp:TextBox>
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
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
