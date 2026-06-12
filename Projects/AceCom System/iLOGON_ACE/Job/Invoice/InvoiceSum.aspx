<%@ Page Language="c#" CodeBehind="InvoiceSum.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.Invoice.InvoiceSum" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceSum</title>
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
                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <asp:Button CssClass="detailButton" ID="lockbtn" runat="server" Text="Lock" Enabled="false"
                    OnClick="lockbtn_Click" />
                &nbsp;
                <asp:Button CssClass="detailButton" ID="unlockbtn" runat="server" Text="Unlock" Enabled="false"
                    OnClick="unlockbtn_Click" />
                &nbsp;
                <asp:Button CssClass="detailButton" ID="printbtn" runat="server" Text="Print Invoice"
                    Enabled="false" OnClick="printbtn_Click" />
                &nbsp;
                <asp:Button CssClass="detailButton" ID="printbtn2" runat="server" Text="Print Charges"
                    Enabled="false" OnClick="printbtn2_Click" />
                &nbsp;
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnCancelCommand="ResultDG_Cancel"
            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" GridLines="Both"
            CellPadding="2" DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
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
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Charge" ItemStyle-HorizontalAlign="Left">
                    <EditItemTemplate>
                        <asp:TextBox ID="chargedescrTxt" runat="server" Width="200" Value='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>' /><asp:RequiredFieldValidator
                            ID="chargedescrTxtReqVal" runat="server" ControlToValidate="chargedescrTxt" ErrorMessage="*" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "chargedescr")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Qty" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="Qty1Txt" runat="server" Width="40" Value='<%# DataBinder.Eval(Container.DataItem, "qty") %>' /><asp:RequiredFieldValidator
                            ID="Qty1TxtReqVal" runat="server" ControlToValidate="Qty1Txt" ErrorMessage="*" /><asp:CompareValidator
                                ID="Qty1TxtCompVal" runat="server" ControlToValidate="Qty1Txt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Currency" /><asp:CompareValidator
                                    ID="Qty1TxtZeroVal" runat="server" ControlToValidate="Qty1Txt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.##}") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Rate($)" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="Type1Txt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "rateperuom") %>' /><asp:RequiredFieldValidator
                            ID="Type1TxtReqVal" runat="server" ControlToValidate="Type1Txt" ErrorMessage="*" /><asp:CompareValidator
                                ID="Type1TxtCompVal" runat="server" ControlToValidate="Type1Txt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Currency" /><asp:CompareValidator
                                    ID="Type1TxtZeroVal" runat="server" ControlToValidate="Type1Txt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "rateperuom", "{0:#,0.00}") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Total($)" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="InvAmtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "invamt") %>' /><asp:RequiredFieldValidator
                            ID="InvAmtTxtReqVal" runat="server" ControlToValidate="InvAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                ID="InvAmtTxtCompVal" runat="server" ControlToValidate="InvAmtTxt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Currency" /><asp:CompareValidator
                                    ID="InvAmtTxtZeroVal" runat="server" ControlToValidate="InvAmtTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "invamt", "{0:#,0.00}") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Minimum($)" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="MinimumAmtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "minimumamt") %>' /><asp:RequiredFieldValidator
                            ID="MinimumAmtTxtReqVal" runat="server" ControlToValidate="MinimumAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                ID="MinimumAmtTxtCompVal" runat="server" ControlToValidate="MinimumAmtTxt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Currency" /><asp:CompareValidator
                                    ID="MinimumAmtTxtZeroVal" runat="server" ControlToValidate="MinimumAmtTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "minimumamt", "{0:#,0.00}") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Discount($)" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="discountAmtTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "discountamt") %>' /><asp:RequiredFieldValidator
                            ID="discountAmtTxtReqVal" runat="server" ControlToValidate="discountAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                ID="discountAmtTxtCompVal" runat="server" ControlToValidate="discountAmtTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Currency" /><asp:CompareValidator
                                    ID="discountAmtTxtZeroVal" runat="server" ControlToValidate="discountAmtTxt"
                                    EnableClientScript="True" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "discountamt", "{0:#,0.00}") %>
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
                <asp:TemplateColumn HeaderText="Remarks" ItemStyle-Width="200px">
                    <EditItemTemplate>
                        <asp:TextBox ID="Rem1Txt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "remarks") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "remarks") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
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
