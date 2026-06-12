<%@ Page Language="c#" CodeBehind="AccountRateFinance.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.AccountRate.AccountRateFinance" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>AccountRateFinance</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    <asp:Label ID="DescrLbl" runat="server"></asp:Label></div>
            </td>
            <td align="right">
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                <asp:Button ID="AddBtn" runat="server" CssClass="detailButton" Text="+ Rate" OnClick="AddBtn_Click">
                </asp:Button>&nbsp; &nbsp;
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <asp:DataGrid ID="RateDG" runat="server" AutoGenerateColumns="False" OnCancelCommand="RateDG_Cancel"
            OnUpdateCommand="RateDG_Update" OnEditCommand="RateDG_Edit" GridLines="Both"
            CellPadding="2" DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="RateEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="RateDelete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                runat="server"></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="RateUpdate" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="RateCancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Charge">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ChargeList" Enabled="True" DataTextField="Descr" DataValueField="id"
                            runat="server" DataSource='<%# chargeListDS%>' OnSelectedIndexChanged="ChargeList_SelectedIndexChanged"
                            AutoPostBack="True" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "chargedescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Rate($)" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="RatePerUOMTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "rateperuom") %>' /><asp:RequiredFieldValidator
                            ID="RatePerUOMTxtReqVal" runat="server" ControlToValidate="RatePerUOMTxt" ErrorMessage="*" /><asp:CompareValidator
                                ID="RatePerUOMTxtCompVal" runat="server" ControlToValidate="RatePerUOMTxt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Currency" /><asp:CompareValidator
                                    ID="RatePerUOMTxtZeroVal" runat="server" ControlToValidate="RatePerUOMTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "rateperuom", "{0:#,0.##}") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Min Charge($)" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="MinChargeAmtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "minchargeamt") %>' /><asp:RequiredFieldValidator
                            ID="MinChargeAmtTxtReqVal" runat="server" ControlToValidate="MinChargeAmtTxt"
                            ErrorMessage="*" /><asp:CompareValidator ID="MinChargeAmtTxtCompVal" runat="server"
                                ControlToValidate="MinChargeAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                Operator="DataTypeCheck" Type="Currency" /><asp:CompareValidator ID="MinChargeAmtTxtZeroVal"
                                    runat="server" ControlToValidate="MinChargeAmtTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "minchargeamt", "{0:#,0.##}") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Calc">
                    <EditItemTemplate>
                        <asp:DropDownList ID="CalcList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                            runat="server" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(calcListDS,DataBinder.Eval(Container.DataItem, "calc").ToString())%>'
                            DataSource='<%# calcListDS%>' />
                        <asp:RequiredFieldValidator ID="CalcReqVal" runat="server" ControlToValidate="CalcList"
                            ErrorMessage="*" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "calcdescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Tax Type">
                    <EditItemTemplate>
                        <asp:DropDownList ID="TaxTypeList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                            runat="server" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeListDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                            DataSource='<%# taxTypeListDS%>' />
                        <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxTypeList"
                            ErrorMessage="*" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "taxtypedescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Std" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:CheckBox ID="StdCB" runat="server"></asp:CheckBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="StdItemCB" runat="server" Enabled="false"></asp:CheckBox>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Remarks">
                    <EditItemTemplate>
                        <asp:TextBox ID="Rem1Txt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "rem1") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "rem1") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="adddate" SortExpression="adddate" ReadOnly="True" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adduser" SortExpression="adduser" ReadOnly="True" HeaderText="Add User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="editdate" SortExpression="editdate" ReadOnly="True" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="edituser" SortExpression="edituser" ReadOnly="True" HeaderText="Edit User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
        </asp:DataGrid></div>
    </form>
</body>
</html>
