<%@ Page Language="c#" CodeBehind="Transfer.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.Transfer.Transfer" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvMove</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="StepLbl" runat="server" CssClass="pagetitle">Inventory Transfer (Step 3 of 3)</asp:Label>
                </td>
                <td align="right">&nbsp;
                <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text=" Save " OnClick="SaveBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid">
            <asp:DataGrid ID="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False"
                BorderStyle="None" GridLines="Both" CellPadding="2" PageSize="8" UseAccessibleHeader="True">
                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem"></ItemStyle>
                <Columns>
                    <asp:TemplateColumn HeaderText="No" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label ID="FromLb" runat="server">From :</asp:Label>
                                </tr>
                                <tr>
                                    <asp:Label ID="ToLb" runat="server">To :</asp:Label>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="sitecode" Visible="false"></asp:BoundColumn>
                    <asp:BoundColumn DataField="acid" Visible="false"></asp:BoundColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Account" SortExpression="accode">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "accode") %>'
                                            ID="FromAcCodeLbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ToAccountList" DataSource='<%# CurrentUser.AccountDS %>'
                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CurrentUser.AccountDS,DataBinder.Eval(Container.DataItem, "accode").ToString())%>'
                                            OnSelectedIndexChanged="ToAccountList_OnSelectedIndexChanged" AutoPostBack="true"
                                            DataTextField="code" DataValueField="acid" Enabled="false">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Site" SortExpression="site">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "sitedescr") %>'
                                        ID="FromSiteLbl" />
                                </tr>
                                <br />
                                <tr>
                                    <asp:DropDownList runat="server" ID="ToSiteList" DataSource='<%# siteDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(siteDS,DataBinder.Eval(Container.DataItem, "sitecode").ToString())%>'
                                        OnSelectedIndexChanged="ToSiteList_OnSelectedIndexChanged" AutoPostBack="true"
                                        DataTextField="descr" DataValueField="item">
                                    </asp:DropDownList>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="SKU" SortExpression="skucode">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skucode") %>'
                                        ID="FromSkuCodeLbl" />
                                </tr>
                                <br />
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToSkuCodeTxt" Enabled="false" Text='<%# DataBinder.Eval(Container.DataItem, "skucode") %>'>
                                    </asp:TextBox>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Qty" SortExpression="qty">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "availqty") %>'
                                        ID="AvailQtyLabel" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="60px" ID="QtyTxt" BackColor="Yellow" Text='<%# DataBinder.Eval(Container.DataItem, "availqty") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QtyReq" runat="server" ErrorMessage="*" ControlToValidate="QtyTxt"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="QtyCompVal" runat="server" ErrorMessage="#" ControlToValidate="QtyTxt"
                                        Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" SortExpression="loccode" HeaderStyle-Width="100px">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Location" ID="LocCodeLbl" /><br />
                            <a id="lnkmassLocCode" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "loccode") %>'
                                        ID="FromLocCodeLbl" />
                                </tr>
                                <br />
                                <tr>
                                    <asp:TextBox runat="server" ID="ToLocCodeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "loccode") %>'>
                                    </asp:TextBox>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" SortExpression="tuno1">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="TU#1" ID="Tu1Lbl" /><br />
                            <a id="lnkmassTu1" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tuno1") %>'
                                        ID="FromTu1Lbl" Width="100px" />
                                </tr>
                                <br />
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToTu1Txt" Text='<%# DataBinder.Eval(Container.DataItem, "tuno1") %>'>
                                    </asp:TextBox>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" SortExpression="tuno2">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="TU#2" ID="Tu2Lbl" /><br />
                            <a id="lnkmassTu2" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tuno2") %>'
                                        ID="FromTu2Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToTu2Txt" Text='<%# DataBinder.Eval(Container.DataItem, "tuno2") %>'>
                                    </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Receive Date" SortExpression="rcdate">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Receive Date" ID="rcdateLbl" /><br />
                            <a id="lnkmassRcDate" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rcdate", "{0:dd/MMM/yyyy}") %>'
                                        ID="FromRcDateLbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <div style="position: relative">
                                        <asp:TextBox runat="server" Width="100px" ID="ToRcDateTxt" BackColor="Yellow" Text='<%# DataBinder.Eval(Container.DataItem, "rcdate", "{0:dd/MMM/yyyy}") %>'>
                                        </asp:TextBox>
                                        <asp:CalendarExtender ID="ToRcDateTxt_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="ToRcDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                            Format="dd/MMM/yyyy"></asp:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="ToRcDateReq" runat="server" ErrorMessage="*" ControlToValidate="ToRcDateTxt"></asp:RequiredFieldValidator>
                                    </div>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot4" SortExpression="lot4">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot4" ID="Lot4Lbl" /><br />
                            <a id="lnkmassLot4" onserverclick="Control_Fill_Lot4" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot4") %>'
                                        ID="FromLot4Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:DropDownList runat="server" ID="ToLot4List" AutoPostBack="true" Visible="false">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="ToLot4ReqList" runat="server" ErrorMessage="*" ControlToValidate="ToLot4List"
                                        Enabled="false"></asp:RequiredFieldValidator>

                                    <asp:TextBox runat="server" Width="100px" ID="ToLot4Txt" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "lot4") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot4Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot4Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot1" SortExpression="lot1">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot1" ID="Lot1Lbl" /><br />
                            <a id="lnkmassLot1" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot1", "{0:dd/MMM/yyyy}") %>'
                                        ID="FromLot1Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CalendarExtender ID="ToLot1Txt_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="ToLot1Txt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                            Format="dd/MMM/yyyy"></asp:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="ToLot1Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot1Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                        <div style="position: relative">
                                            <asp:TextBox runat="server" Width="100px" ID="ToLot1Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot1", "{0:dd/MMM/yyyy}") %>'>
                                            </asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot5" SortExpression="lot5">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot5" ID="Lot5Lbl" /><br />
                            <a id="lnkmassLot5" onserverclick="Control_Fill_Lot5" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot5") %>'
                                        ID="FromLot5Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:DropDownList runat="server" ID="ToLot5List" AutoPostBack="true" Visible="false">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="ToLot5ReqList" runat="server" ErrorMessage="*" ControlToValidate="ToLot5List"
                                        Enabled="false"></asp:RequiredFieldValidator>

                                    <asp:TextBox runat="server" Width="100px" ID="ToLot5Txt" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "lot5") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot5Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot5Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot6" SortExpression="lot6">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot6" ID="Lot6Lbl" /><br />

                            <%--<a id="lnkdefaultvalue" onserverclick="Control_Fill_Lot6" runat="server" >
                                 <asp:Label runat="server" Text='DefaultValue' ID="lblDefaultValue" Visible="false" />
                            </a>--%>

                            <a id="lnkcopyvalue" onserverclick="Control_Fill_Lot6" runat="server">
                                <asp:Label runat="server" Text='CopyValue' ID="lblCopyValue" Visible="false" />
                            </a>

                            <a id="lnkmassLot6" onserverclick="Control_Fill_Lot6" runat="server">
                                <asp:Label runat="server" Text='AutoFill' ID="lblAutoFill" Visible="true" />
                            </a>

                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot6") %>'
                                        ID="FromLot6Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:DropDownList runat="server" ID="ToLot6List" OnSelectedIndexChanged="ToLot6List_OnSelectedIndexChanged" AutoPostBack="true" Visible="false">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="ToLot6ReqList" runat="server" ErrorMessage="*" ControlToValidate="ToLot6List"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    <%-- Added by SR On 10/Feb/2023 Requested by Perry for All user to show data on lot6 textbox--%>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot6Txt" Visible="false" OnTextChanged="ToLot6Txt_TextChanged" AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem, "lot6") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot6Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot6Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot7" SortExpression="lot7">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot7" ID="Lot7Lbl" /><br />
                            <a id="lnkmassLot7" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot7") %>'
                                        ID="FromLot7Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot7Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot7") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="lot7CompVal" runat="server" ErrorMessage="#" ControlToValidate="ToLot7Txt"
                                        Type="Double" Operator="DataTypeCheck">
                                        <asp:RequiredFieldValidator ID="ToLot7Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot7Txt"
                                            Enabled="false"></asp:RequiredFieldValidator>
                                    </asp:CompareValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot2" SortExpression="lot2">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot2" ID="Lot2Lbl" /><br />
                            <a id="lnkmassLot2" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot2", "{0:dd/MMM/yyyy}") %>'
                                        ID="FromLot2Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <div style="position: relative">
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot2Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot2", "{0:dd/MMM/yyyy}") %>'
                                            OnTextChanged="ToLot2Txt_OnTextChanged" AutoPostBack="true">
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
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot3" SortExpression="lot3">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot3" ID="Lot3Lbl" /><br />
                            <a id="lnkmassLot3" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot3", "{0:dd/MMM/yyyy}") %>'
                                        ID="FromLot3Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <div style="position: relative">
                                        <asp:TextBox runat="server" Width="100px" ID="ToLot3Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot3", "{0:dd/MMM/yyyy}") %>'>
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
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot8" SortExpression="lot8">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot8" ID="Lot8Lbl" /><br />
                            <a id="lnkmassLot8" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot8") %>'
                                        ID="FromLot8Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot8Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot8") %>'>
                                    </asp:TextBox><asp:CompareValidator ID="lot8CompVal" runat="server" ErrorMessage="#"
                                        ControlToValidate="ToLot8Txt" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="ToLot8Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot8Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot9" SortExpression="lot9">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot9" ID="Lot9Lbl" /><br />
                            <a id="lnkmassLot9" onserverclick="Control_Fill_Lot9" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot9") %>'
                                        ID="FromLot9Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:DropDownList runat="server" ID="ToLot9List" AutoPostBack="true" Visible="false">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="ToLot9ReqList" runat="server" ErrorMessage="*" ControlToValidate="ToLot9List"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot9Txt" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "lot9") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot9Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot9Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot10" SortExpression="lot10">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot10" ID="Lot10Lbl" /><br />
                            <a id="lnkmassLot10" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot10") %>'
                                        ID="FromLot10Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot10Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot10") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot10Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot10Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot11" SortExpression="lot11">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot11" ID="Lot11Lbl" /><br />
                            <a id="lnkmassLot11" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot11") %>'
                                        ID="FromLot11Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot11Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot11") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot11Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot11Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot12" SortExpression="lot12">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot12" ID="Lot12Lbl" /><br />
                            <a id="lnkmassLot12" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot12") %>'
                                        ID="FromLot12Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot12Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot12") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot12Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot12Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot13" SortExpression="lot13">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot13" ID="Lot13Lbl" /><br />
                            <a id="lnkmassLot13" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot13") %>'
                                        ID="FromLot13Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot13Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot13") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot13Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot13Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot14" SortExpression="lot14">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot14" ID="Lot14Lbl" /><br />
                            <a id="lnkmassLot14" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot14") %>'
                                        ID="FromLot14Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot14Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot14") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot14Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot14Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot15" SortExpression="lot15">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot15" ID="Lot15Lbl" /><br />
                            <a id="lnkmassLot15" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot15") %>'
                                        ID="FromLot15Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot15Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot15") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot15Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot15Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot16" SortExpression="lot16">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot16" ID="Lot16Lbl" /><br />
                            <a id="lnkmassLot16" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot16") %>'
                                        ID="FromLot16Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot16Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot16") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot16Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot16Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot17" SortExpression="lot17">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot17" ID="Lot17Lbl" /><br />
                            <a id="lnkmassLot17" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot17") %>'
                                        ID="FromLot17Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot17Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot17") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot17Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot17Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot18" SortExpression="lot18">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot18" ID="Lot18Lbl" /><br />
                            <a id="lnkmassLot18" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot18") %>'
                                        ID="FromLot18Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot18Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot18") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot18Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot18Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot19" SortExpression="lot19">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot19" ID="Lot19Lbl" /><br />
                            <a id="lnkmassLot19" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot19") %>'
                                        ID="FromLot19Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot19Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot19") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot19Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot19Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot20" SortExpression="lot20">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot20" ID="Lot20Lbl" /><br />
                            <a id="lnkmassLot20" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot20") %>'
                                        ID="FromLot20Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot20Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot20") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot20Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot20Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot21" SortExpression="lot21">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot21" ID="Lot21Lbl" /><br />
                            <a id="lnkmassLot21" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot21") %>'
                                        ID="FromLot21Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot21Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot21") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot21Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot21Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot22" SortExpression="lot22">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot22" ID="Lot22Lbl" /><br />
                            <a id="lnkmassLot22" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot22") %>'
                                        ID="FromLot22Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot22Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot22") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot22Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot22Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot23" SortExpression="lot23">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot23" ID="Lot23Lbl" /><br />
                            <a id="lnkmassLot23" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot23") %>'
                                        ID="FromLot23Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot23Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot23") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot23Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot23Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot24" SortExpression="lot24">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot24" ID="Lot24Lbl" /><br />
                            <a id="lnkmassLot24" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot24") %>'
                                        ID="FromLot24Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot24Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot24") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot24Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot24Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot25" SortExpression="lot25">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot25" ID="Lot25Lbl" /><br />
                            <a id="lnkmassLot25" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot25") %>'
                                        ID="FromLot25Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot25Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot25") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot25Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot25Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot26" SortExpression="lot26">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot26" ID="Lot26Lbl" /><br />
                            <a id="lnkmassLot26" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot26") %>'
                                        ID="FromLot26Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot26Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot26") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot26Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot26Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot27" SortExpression="lot27">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot27" ID="Lot27Lbl" /><br />
                            <a id="lnkmassLot27" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot27") %>'
                                        ID="FromLot27Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot27Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot27") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot27Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot27Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot28" SortExpression="lot28">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot28" ID="Lot28Lbl" /><br />
                            <a id="lnkmassLot28" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot28") %>'
                                        ID="FromLot28Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot28Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot28") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot28Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot28Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot29" SortExpression="lot29">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot29" ID="Lot29Lbl" /><br />
                            <a id="lnkmassLot29" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot29") %>'
                                        ID="FromLot29Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot29Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot29") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot29Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot29Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot30" SortExpression="lot30">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot30" ID="Lot30Lbl" /><br />
                            <a id="lnkmassLot30" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot30") %>'
                                        ID="FromLot30Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot30Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot30") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot30Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot30Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot31" SortExpression="lot31">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot31" ID="Lot31Lbl" /><br />
                            <a id="lnkmassLot31" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot31") %>'
                                        ID="FromLot31Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot31Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot31") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot31Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot31Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot32" SortExpression="lot32">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot32" ID="Lot32Lbl" /><br />
                            <a id="lnkmassLot32" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot32") %>'
                                        ID="FromLot32Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot32Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot32") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot32Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot32Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot33" SortExpression="lot33">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot33" ID="Lot33Lbl" /><br />
                            <a id="lnkmassLot33" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot33") %>'
                                        ID="FromLot33Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot33Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot33") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot33Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot33Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot34" SortExpression="lot34">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot34" ID="Lot34Lbl" /><br />
                            <a id="lnkmassLot34" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot34") %>'
                                        ID="FromLot34Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot34Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot34") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot34Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot34Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot35" SortExpression="lot35">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot35" ID="Lot35Lbl" /><br />
                            <a id="lnkmassLot35" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot35") %>'
                                        ID="FromLot35Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot35Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot35") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot35Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot35Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot36" SortExpression="lot36">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot36" ID="Lot36Lbl" /><br />
                            <a id="lnkmassLot36" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot36") %>'
                                        ID="FromLot36Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot36Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot36") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot36Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot36Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot37" SortExpression="lot37">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot37" ID="Lot37Lbl" /><br />
                            <a id="lnkmassLot37" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot37") %>'
                                        ID="FromLot37Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot37Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot37") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot37Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot37Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot38" SortExpression="lot38">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot38" ID="Lot38Lbl" /><br />
                            <a id="lnkmassLot38" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot38") %>'
                                        ID="FromLot38Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot38Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot38") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot38Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot38Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot39" SortExpression="lot39">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot39" ID="Lot39Lbl" /><br />
                            <a id="lnkmassLot39" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot39") %>'
                                        ID="FromLot39Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot39Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot39") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot39Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot39Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot40" SortExpression="lot40">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot40" ID="Lot40Lbl" /><br />
                            <a id="lnkmassLot40" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot40") %>'
                                        ID="FromLot40Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot40Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot40") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot40Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot40Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot41" SortExpression="lot41">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot41" ID="Lot41Lbl" /><br />
                            <a id="lnkmassLot41" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot41") %>'
                                        ID="FromLot41Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot41Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot41") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot41Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot41Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot42" SortExpression="lot42">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot42" ID="Lot42Lbl" /><br />
                            <a id="lnkmassLot42" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot42") %>'
                                        ID="FromLot42Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot42Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot42") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot42Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot42Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot43" SortExpression="lot43">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot43" ID="Lot43Lbl" /><br />
                            <a id="lnkmassLot43" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot43") %>'
                                        ID="FromLot43Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot43Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot43") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot43Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot43Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot44" SortExpression="lot44">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot44" ID="Lot44Lbl" /><br />
                            <a id="lnkmassLot44" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot44") %>'
                                        ID="FromLot44Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot44Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot44") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot44Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot44Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot45" SortExpression="lot45">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot45" ID="Lot45Lbl" /><br />
                            <a id="lnkmassLot45" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot45") %>'
                                        ID="FromLot45Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot45Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot45") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot45Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot45Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot46" SortExpression="lot46">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot46" ID="Lot46Lbl" /><br />
                            <a id="lnkmassLot46" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot46") %>'
                                        ID="FromLot46Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot46Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot46") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot46Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot46Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot47" SortExpression="lot47">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot47" ID="Lot47Lbl" /><br />
                            <a id="lnkmassLot47" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot47") %>'
                                        ID="FromLot47Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot47Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot47") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot47Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot47Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot48" SortExpression="lot48">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot48" ID="Lot48Lbl" /><br />
                            <a id="lnkmassLot48" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot48") %>'
                                        ID="FromLot48Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot48Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot48") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot48Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot48Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot49" SortExpression="lot49">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot49" ID="Lot49Lbl" /><br />
                            <a id="lnkmassLot49" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot49") %>'
                                        ID="FromLot49Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot49Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot49") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot49Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot49Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot50" SortExpression="lot50">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot50" ID="Lot50Lbl" /><br />
                            <a id="lnkmassLot50" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot50") %>'
                                        ID="FromLot50Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot50Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot50") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot50Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot50Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot51" SortExpression="lot51">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot51" ID="Lot51Lbl" /><br />
                            <a id="lnkmassLot51" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot51") %>'
                                        ID="FromLot51Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot51Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot51") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot51Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot51Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot52" SortExpression="lot52">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot52" ID="Lot52Lbl" /><br />
                            <a id="lnkmassLot52" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot52") %>'
                                        ID="FromLot52Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot52Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot52") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot52Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot52Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot53" SortExpression="lot53">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot53" ID="Lot53Lbl" /><br />
                            <a id="lnkmassLot53" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot53") %>'
                                        ID="FromLot53Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot53Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot53") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot53Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot53Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot54" SortExpression="lot54">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot54" ID="Lot54Lbl" /><br />
                            <a id="lnkmassLot54" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot54") %>'
                                        ID="FromLot54Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot54Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot54") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot54Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot54Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot55" SortExpression="lot55">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot55" ID="Lot55Lbl" /><br />
                            <a id="lnkmassLot55" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot55") %>'
                                        ID="FromLot55Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot55Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot55") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot55Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot55Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot56" SortExpression="lot56">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot56" ID="Lot56Lbl" /><br />
                            <a id="lnkmassLot56" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot56") %>'
                                        ID="FromLot56Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot56Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot56") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot56Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot56Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot57" SortExpression="lot57">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot57" ID="Lot57Lbl" /><br />
                            <a id="lnkmassLot57" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot57") %>'
                                        ID="FromLot57Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot57Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot57") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot57Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot57Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot58" SortExpression="lot58">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot58" ID="Lot58Lbl" /><br />
                            <a id="lnkmassLot58" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot58") %>'
                                        ID="FromLot58Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot58Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot58") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot58Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot58Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot59" SortExpression="lot59">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot59" ID="Lot59Lbl" /><br />
                            <a id="lnkmassLot59" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot59") %>'
                                        ID="FromLot59Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot59Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot59") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot59Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot59Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot60" SortExpression="lot60">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Lot60" ID="Lot60Lbl" /><br />
                            <a id="lnkmassLot60" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot60") %>'
                                        ID="FromLot60Lbl" />
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLot60Txt" Text='<%# DataBinder.Eval(Container.DataItem, "lot60") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLot60Req" runat="server" ErrorMessage="*" ControlToValidate="ToLot60Txt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="LotUom" SortExpression="lotuom">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lotuom") %>'
                                        ID="FromLotUomLbl" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLotUomTxt" Text='<%# DataBinder.Eval(Container.DataItem, "lotuom") %>'
                                        ReadOnly="True">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ToLotUomReq" runat="server" ErrorMessage="*" ControlToValidate="ToLotUomTxt"
                                        Enabled="false"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="LotId" SortExpression="lotid">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lotid") %>'
                                        ID="FromLotIdLbl" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="50px" ID="ToLotIdTxt" Text="" ReadOnly="True">
                                    </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Length" SortExpression="length">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Length" ID="LengthLbl" /><br />
                            <a id="lnkmassLength" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "length") %>'
                                        ID="FromLengthLbl" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToLengthTxt" Text='<%# DataBinder.Eval(Container.DataItem, "length") %>'>
                                    </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Width" SortExpression="width">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Width" ID="WidthLbl" /><br />
                            <a id="lnkmassWidth" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "width") %>'
                                        ID="FromWidthLbl" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToWidthTxt" Text='<%# DataBinder.Eval(Container.DataItem, "width") %>'>
                                    </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Height" SortExpression="height">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Height" ID="HeightLbl" /><br />
                            <a id="lnkmassHeight" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "height") %>'
                                        ID="FromHeightLbl" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToHeightTxt" Text='<%# DataBinder.Eval(Container.DataItem, "height") %>'>
                                    </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Vol" SortExpression="vol">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Vol" ID="VolLbl" /><br />
                            <a id="lnkmassVol" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "vol") %>'
                                        ID="FromVolLbl" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToVolTxt" Text='<%# DataBinder.Eval(Container.DataItem, "vol") %>'>
                                    </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Wt" SortExpression="wt">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Wt" ID="WtLbl" /><br />
                            <a id="lnkmassWt" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "wt") %>'
                                        ID="FromWtLbl" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToWtTxt" Text='<%# DataBinder.Eval(Container.DataItem, "wt") %>'>
                                    </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Net Wt" SortExpression="netwt">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Net Wt" ID="NetWtLbl" /><br />
                            <a id="lnkmassNetWt" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "netwt") %>'
                                        ID="FromNetWtLbl" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="100px" ID="ToNetWtTxt" Text='<%# DataBinder.Eval(Container.DataItem, "netwt") %>'>
                                    </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False" SortExpression="lotskudescr">
                        <HeaderTemplate>
                            <asp:Label runat="server" Text="Sku Description" ID="SkuDescrLbl" /><br />
                            <a id="lnkmassSkuDescr" onserverclick="Control_Fill" runat="server">AutoFill</a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lotskudescr") %>'
                                        ID="FromSkuDescrLbl" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <asp:TextBox runat="server" Width="150px" ID="ToSkuDescrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "lotskudescr") %>'>
                                    </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="skuid" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="id" Visible="false"></asp:BoundColumn>
                    <asp:BoundColumn DataField="skugrpid" Visible="False"></asp:BoundColumn>
                </Columns>
            </asp:DataGrid>
        </div>
    </form>
</body>
</html>
