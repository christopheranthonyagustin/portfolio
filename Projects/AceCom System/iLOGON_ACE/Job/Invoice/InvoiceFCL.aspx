<%@ Page Language="c#" CodeBehind="InvoiceFCL.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.Invoice.InvoiceFCL" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceFCL</title>
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
                </asp:Button>&nbsp;
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
                <asp:TemplateColumn HeaderText="20FT Qty" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="Qty1Txt" runat="server" Width="40" Value='<%# DataBinder.Eval(Container.DataItem, "fcl20qty") %>' /><asp:RequiredFieldValidator
                            ID="Qty1TxtReqVal" runat="server" ControlToValidate="Qty1Txt" ErrorMessage="*" /><asp:CompareValidator
                                ID="Qty1TxtCompVal" runat="server" ControlToValidate="Qty1Txt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" /><asp:CompareValidator
                                    ID="Qty1TxtZeroVal" runat="server" ControlToValidate="Qty1Txt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "fcl20qty", "{0:#,0.##}") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="20FT($)" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="Type1Txt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "fcl20rate") %>' /><asp:RequiredFieldValidator
                            ID="Type1TxtReqVal" runat="server" ControlToValidate="Type1Txt" ErrorMessage="*" /><asp:CompareValidator
                                ID="Type1TxtCompVal" runat="server" ControlToValidate="Type1Txt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Currency" /><asp:CompareValidator
                                    ID="Type1TxtZeroVal" runat="server" ControlToValidate="Type1Txt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "fcl20rate", "{0:#,0.00}") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="40FT Qty" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="Qty2Txt" runat="server" Width="40" Value='<%# DataBinder.Eval(Container.DataItem, "fcl40qty") %>' /><asp:RequiredFieldValidator
                            ID="Qty2TxtReqVal" runat="server" ControlToValidate="Qty2Txt" ErrorMessage="*" /><asp:CompareValidator
                                ID="Qty2TxtCompVal" runat="server" ControlToValidate="Qty2Txt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" /><asp:CompareValidator
                                    ID="Qty2TxtZeroVal" runat="server" ControlToValidate="Qty2Txt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "fcl40qty", "{0:#,0.##}") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="40FT($)" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="Type2Txt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "fcl40rate") %>' /><asp:RequiredFieldValidator
                            ID="Type2TxtReqVal" runat="server" ControlToValidate="Type2Txt" ErrorMessage="*" /><asp:CompareValidator
                                ID="Type2TxtCompVal" runat="server" ControlToValidate="Type2Txt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Currency" /><asp:CompareValidator
                                    ID="Type2TxtZeroVal" runat="server" ControlToValidate="Type2Txt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "fcl40rate", "{0:#,0.00}") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="40TFT Qty" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="Qty3Txt" runat="server" Width="40" Value='<%# DataBinder.Eval(Container.DataItem, "fcl40tqty") %>' /><asp:RequiredFieldValidator
                            ID="Qty3TxtReqVal" runat="server" ControlToValidate="Qty3Txt" ErrorMessage="*" /><asp:CompareValidator
                                ID="Qty3TxtCompVal" runat="server" ControlToValidate="Qty3Txt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" /><asp:CompareValidator
                                    ID="Qty3TxtZeroVal" runat="server" ControlToValidate="Qty3Txt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "fcl40tqty", "{0:#,0.##}") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="40TFT($)" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="Type3Txt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "fcl40trate") %>' /><asp:RequiredFieldValidator
                            ID="Type3TxtReqVal" runat="server" ControlToValidate="Type3Txt" ErrorMessage="*" /><asp:CompareValidator
                                ID="Type3TxtCompVal" runat="server" ControlToValidate="Type3Txt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Currency" /><asp:CompareValidator
                                    ID="Type3TxtZeroVal" runat="server" ControlToValidate="Type3Txt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "fcl40trate", "{0:#,0.00}") %>
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
                <asp:TemplateColumn HeaderText="Std" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:CheckBox ID="StdCB" runat="server"></asp:CheckBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="StdItemCB" runat="server" Enabled="false"></asp:CheckBox>
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
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
