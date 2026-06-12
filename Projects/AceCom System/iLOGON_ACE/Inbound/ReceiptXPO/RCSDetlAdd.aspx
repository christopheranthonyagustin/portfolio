<%@ Page Language="c#" CodeBehind="RCSDetlAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.ReceiptXPO.RCSDetlAdd" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>RCSDetlAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="StepLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td align="right">&nbsp;
                <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text=" Save " OnClick="SaveBtn_Click"
                    OnClientClick="this.disabled = true;  this.value = 'Saving...';" UseSubmitBehavior="false"></asp:Button>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <br>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <br />
        <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" OnItemDataBound="ResultDG1_ItemDataBound"
            Skin="Office2007" AllowPaging="true" OnNeedDataSource="ResultDG1_NeedDataSource">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn HeaderText="No" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label ID="FromLb" runat="server">PO :</asp:Label>
                                </tr>
                                <tr>
                                    <asp:Label ID="ToLb" runat="server">RCS:</asp:Label>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Qty" SortExpression="qty" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qty","{0:#,0.##}") %>'
                                            ID="AvailQtyLabel" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="60px" ID="QtyTxt" Text='<%# DataBinder.Eval(Container.DataItem, "RcvQty","{0:#,0.##}") %>'
                                            ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Uom" SortExpression="uom" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'
                                            ID="FromuomLbl" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="TouomTxt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVUOM") %>'
                                            ReadOnly="True">
                                        </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PONo" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="podate" SortExpression="podate" HeaderText="PO Date" AllowFiltering="false"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="suname" SortExpression="suname" HeaderText="Supplier" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="poline" SortExpression="poline" HeaderText="POLineNo" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Sku Description" SortExpression="skudescr" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skudescr") %>'
                                            ID="FromSkuDescrLbl" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="150px" ID="ToSkuDescrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "skudescr") %>'>
                                        </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Location" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="FromLocCodeLbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="80px" ID="ToLocCodeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLoc") %>'>
                                        </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 4" SortExpression="lot4" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot4") %>'
                                            ID="FromLot4Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot4Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot4") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ToLot4Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot4Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 1" SortExpression="lot1" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot1", "{0:dd/MMM/yyyy}") %>'
                                            ID="FromLot1Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="position: relative">
                                            <asp:TextBox runat="server" Width="100px" ID="ToLot1Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot1", "{0:dd/MMM/yyyy}") %>'>
                                            </asp:TextBox>
                                            <asp:CalendarExtender ID="ToLot1Txt_CalendarExtender" runat="server" Enabled="True"
                                                TargetControlID="ToLot1Txt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                                Format="dd/MMM/yyyy"></asp:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="ToLot1Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot1Txt"
                                                Enabled="false"></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 5" SortExpression="lot5" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot5") %>'
                                            ID="FromLot5Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot5Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot5") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ToLot5Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot5Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 6" SortExpression="lot6" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot6") %>'
                                            ID="FromLot6Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot6Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot6") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ToLot6Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot6Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 7" SortExpression="lot7" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot7") %>'
                                            ID="FromLot7Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot7Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot7") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="lot7CompVal" runat="server" ErrorMessage="#" ControlToValidate="ToLot7Txt"
                                            Type="Double" Operator="DataTypeCheck">
                                            <asp:RequiredFieldValidator ID="ToLot7Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot7Txt"
                                                Enabled="false"></asp:RequiredFieldValidator>
                                        </asp:CompareValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 2" SortExpression="lot2" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot2", "{0:dd/MMM/yyyy}") %>'
                                            ID="FromLot2Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="position: relative">
                                            <asp:TextBox runat="server" Width="100px" ID="ToLot2Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot2", "{0:dd/MMM/yyyy}") %>'
                                                AutoPostBack="true">
                                            </asp:TextBox>
                                            <asp:CalendarExtender ID="ToLot2Txt_CalendarExtender" runat="server" Enabled="True"
                                                TargetControlID="ToLot2Txt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                                Format="dd/MMM/yyyy"></asp:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="ToLot2Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot2Txt"
                                                Enabled="false"></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 3" SortExpression="lot3" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot3", "{0:dd/MMM/yyyy}") %>'
                                            ID="FromLot3Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="position: relative">
                                            <asp:TextBox runat="server" Width="100px" ID="ToLot3Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot3", "{0:dd/MMM/yyyy}") %>'>
                                            </asp:TextBox>
                                            <asp:CalendarExtender ID="ToLot3Txt_CalendarExtender" runat="server" Enabled="True"
                                                TargetControlID="ToLot3Txt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                                Format="dd/MMM/yyyy"></asp:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="ToLot3Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot3Txt"
                                                Enabled="false"></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 8" SortExpression="lot8" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot8") %>'
                                            ID="FromLot8Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot8Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot8") %>'>
                                    </asp:TextBox><asp:CompareValidator ID="lot8CompVal" runat="server" ErrorMessage="#"
                                        ControlToValidate="ToLot8Txt" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="ToLot8Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot8Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot9" SortExpression="lot9" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot9") %>'
                                            ID="FromLot9Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot9Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot9") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot9Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot9Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot10" SortExpression="lot10" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot10") %>'
                                            ID="FromLot10Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot10Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot10") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot10Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot10Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot11" SortExpression="lot11" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot11") %>'
                                            ID="FromLot11Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot11Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot11") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot11Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot11Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot12" SortExpression="lot12" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot12") %>'
                                            ID="FromLot12Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot12Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot12") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot12Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot12Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot13" SortExpression="lot13" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot13") %>'
                                            ID="FromLot13Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot13Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot13") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot13Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot13Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot14" SortExpression="lot14" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot14") %>'
                                            ID="FromLot14Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot14Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot14") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot14Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot14Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot15" SortExpression="lot15" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot15") %>'
                                            ID="FromLot15Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot15Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot15") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot15Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot15Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot16" SortExpression="lot16" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot16") %>'
                                            ID="FromLot16Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot16Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot16") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot16Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot16Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot17" SortExpression="lot17" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot17") %>'
                                            ID="FromLot17Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot17Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot17") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot17Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot17Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot18" SortExpression="lot18" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot18") %>'
                                            ID="FromLot18Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot18Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot18") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot18Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot18Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot19" SortExpression="lot19" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot19") %>'
                                            ID="FromLot19Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot19Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot19") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot19Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot19Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot20" SortExpression="lot20" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot20") %>'
                                            ID="FromLot20Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot20Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot20") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot20Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot20Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot21" SortExpression="lot21" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot21") %>'
                                            ID="FromLot21Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot21Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot21") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot21Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot21Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot22" SortExpression="lot22" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot22") %>'
                                            ID="FromLot22Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot22Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot22") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot22Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot22Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot23" SortExpression="lot23" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot23") %>'
                                            ID="FromLot23Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot23Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot23") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot23Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot23Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot24" SortExpression="lot24" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot24") %>'
                                            ID="FromLot24Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot24Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot24") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot24Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot24Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot25" SortExpression="lot25" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot25") %>'
                                            ID="FromLot25Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot25Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot25") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot25Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot25Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot26" SortExpression="lot26" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot26") %>'
                                            ID="FromLot26Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot26Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot26") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot26Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot26Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot27" SortExpression="lot27" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot27") %>'
                                            ID="FromLot27Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot27Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot27") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot27Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot27Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot28" SortExpression="lot28" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot28") %>'
                                            ID="FromLot28Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot28Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot28") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot28Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot28Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot29" SortExpression="lot29" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot29") %>'
                                            ID="FromLot29Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot29Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot29") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot29Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot29Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot30" SortExpression="lot30" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot30") %>'
                                            ID="FromLot30Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot30Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot30") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot30Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot30Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot31" SortExpression="lot31" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot31") %>'
                                            ID="FromLot31Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot31Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot31") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot31Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot31Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot32" SortExpression="lot32" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot32") %>'
                                            ID="FromLot32Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot32Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot32") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot32Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot32Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot33" SortExpression="lot33" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot33") %>'
                                            ID="FromLot33Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot33Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot33") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot33Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot33Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot34" SortExpression="lot34" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot34") %>'
                                            ID="FromLot34Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot34Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot34") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot34Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot34Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot35" SortExpression="lot35" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot35") %>'
                                            ID="FromLot35Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot35Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot35") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot35Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot35Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot36" SortExpression="lot36" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot36") %>'
                                            ID="FromLot36Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot36Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot36") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot36Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot36Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot37" SortExpression="lot37" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot37") %>'
                                            ID="FromLot37Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot37Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot37") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot37Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot37Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot38" SortExpression="lot38" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot38") %>'
                                            ID="FromLot38Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot38Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot38") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot38Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot38Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot39" SortExpression="lot39" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot39") %>'
                                            ID="FromLot39Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot39Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot39") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot39Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot39Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot40" SortExpression="lot40" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot40") %>'
                                            ID="FromLot40Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot40Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot40") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot40Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot40Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot41" SortExpression="lot41" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot41") %>'
                                            ID="FromLot41Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot41Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot41") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot41Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot41Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot42" SortExpression="lot42" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot42") %>'
                                            ID="FromLot42Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot42Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot42") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot42Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot42Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot43" SortExpression="lot43" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot43") %>'
                                            ID="FromLot43Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot43Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot43") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot43Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot43Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot44" SortExpression="lot44" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot44") %>'
                                            ID="FromLot44Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot44Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot44") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot44Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot44Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot45" SortExpression="lot45" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot45") %>'
                                            ID="FromLot45Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot45Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot45") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot45Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot45Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot46" SortExpression="lot46" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot46") %>'
                                            ID="FromLot46Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot46Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot46") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot46Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot46Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot47" SortExpression="lot47" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot47") %>'
                                            ID="FromLot47Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot47Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot47") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot47Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot47Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot48" SortExpression="lot48" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot48") %>'
                                            ID="FromLot48Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot48Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot48") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot48Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot48Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot49" SortExpression="lot49" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot49") %>'
                                            ID="FromLot49Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot49Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot49") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot49Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot49Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot50" SortExpression="lot50" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot50") %>'
                                            ID="FromLot50Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot50Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot50") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot50Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot50Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot51" SortExpression="lot51" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot51") %>'
                                            ID="FromLot51Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot51Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot51") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot51Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot51Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot52" SortExpression="lot52" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot52") %>'
                                            ID="FromLot52Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot52Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot52") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot52Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot52Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot53" SortExpression="lot53" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot53") %>'
                                            ID="FromLot53Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot53Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot53") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot53Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot53Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot54" SortExpression="lot54" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot54") %>'
                                            ID="FromLot54Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot54Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot54") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot54Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot54Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot55" SortExpression="lot55" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot55") %>'
                                            ID="FromLot55Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot55Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot55") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot55Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot55Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot56" SortExpression="lot56" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot56") %>'
                                            ID="FromLot56Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot56Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot56") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot56Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot56Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot57" SortExpression="lot57" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot57") %>'
                                            ID="FromLot57Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot57Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot57") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot57Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot57Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot58" SortExpression="lot58" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot58") %>'
                                            ID="FromLot58Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot58Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot58") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot58Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot58Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot59" SortExpression="lot59" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot59") %>'
                                            ID="FromLot59Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot59Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot59") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot59Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot59Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot60" SortExpression="lot60" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot60") %>'
                                            ID="FromLot60Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot60Txt" Text='<%# DataBinder.Eval(Container.DataItem, "RCVLot60") %>'></asp:TextBox><asp:RequiredFieldValidator
                                            ID="ToLot60Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot60Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="acid" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RCVLine" Display="False"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skuid" Display="False"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skugrpid" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameBorder="0" name="BusyBoxIFrame" scrolling="no"></iframe>
			<script "text/javascript"  language="JavaScript1.2" type="text/javascript">
			    // Instantiate our BusyBox object
			    var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../Image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
			</script>
    </form>
</body>
</html>
