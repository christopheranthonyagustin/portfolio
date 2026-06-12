<%@ Page Language="c#" CodeBehind="InvoiceStorage.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.Invoice.InvoiceStorage" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceStorage</title>
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
                <asp:Button ID="AddBtn" runat="server" CssClass="detailButton" Text="+ Rate" Visible="False"
                    OnClick="AddBtn_Click"></asp:Button>&nbsp;
                <asp:Button Style="z-index: 0" ID="GenerateBtn" runat="server" Text="Default" CssClass="detailButton"
                    OnClick="GenerateBtn_Click"></asp:Button>&nbsp;
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
                <asp:BoundColumn DataField="skucode" SortExpression="skucode" ReadOnly="True" HeaderText="SKU" />
                <asp:BoundColumn DataField="lotno" SortExpression="lotno" ReadOnly="True" HeaderText="LOT" />
                <asp:BoundColumn DataField="skugroupcode" SortExpression="skugroupcode" ReadOnly="True"
                    HeaderText="SKU Grp" />
                <asp:BoundColumn DataField="rcdate" SortExpression="rcdate" ReadOnly="True" HeaderText="Rcv. Date"
                    DataFormatString="{0:dd/MMM/yyyy}" />
                <asp:BoundColumn DataField="isdate" SortExpression="isdate" ReadOnly="True" HeaderText="Issue Date"
                    DataFormatString="{0:dd/MMM/yyyy}" />
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
                <asp:BoundColumn DataField="totstoragedays" SortExpression="totstoragedays" ReadOnly="True"
                    HeaderText="Storage Days" />
                <asp:BoundColumn DataField="freedays" SortExpression="freedays" ReadOnly="True" HeaderText="Free Days" />
                <asp:BoundColumn DataField="daysperperiod" SortExpression="daysperperiod" ReadOnly="True"
                    HeaderText="Days/Period" Visible="false" />
                <asp:BoundColumn DataField="totperiod" SortExpression="totperiod" ReadOnly="True"
                    HeaderText="Tot.Period" Visible="false" />
                <asp:BoundColumn DataField="adddate" SortExpression="adddate" ReadOnly="True" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adduser" SortExpression="adduser" ReadOnly="True" HeaderText="Add User"
                    Visible="false">
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
