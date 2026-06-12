<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookaBusAdd.aspx.cs" Inherits="iWMS.Web.BusManagement.BookaBus.BookaBusAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Book-a-BusAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                    OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                <br />
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td valign="top">
                                    <br />
                                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                        AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                        AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" Visible="false">                           
                                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            <Selecting AllowRowSelect="true" />
                                        </ClientSettings>
                                        <SortingSettings EnableSkinSortStyles="false" />
                                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                        <ItemStyle Wrap="true"></ItemStyle>
                                        <HeaderStyle Wrap="false"></HeaderStyle>
                                        <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                            <Columns>
                                                <telerik:GridTemplateColumn HeaderText="BillSizeType">
                                                    <ItemTemplate>
                                                        <asp:Label ID="BillSizeTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "descr") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                  <telerik:GridTemplateColumn HeaderText="BillSizeTypeItem" Display="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="BillSizeTypeItem" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "item") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn HeaderText="BillOption1"  HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <telerik:RadDropDownList ID="BillOption1DDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                        DataValueField="Item" DataSource='<%# BillOption1DS%>' Width="140px"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillOption1DS,DataBinder.Eval(Container.DataItem, "descr").ToString())%>'
                                                        DropDownWidth="140px">
                                                    </telerik:RadDropDownList>
                                                    <asp:RequiredFieldValidator ID="BillOption1DDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BillOption1DDL" ErrorMessage="*" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn HeaderText="Units" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                    <ItemTemplate>
                                                        <telerik:RadTextBox ID="UnitsTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                        <asp:CompareValidator ID="UnitsTxtCompVal" runat="server" ControlToValidate="UnitsTxt"
                                                            EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn HeaderText="From" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                    <ItemTemplate>
                                                        <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="155"
                                                            DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                                             >
                                                            <Calendar runat="server">
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                 <telerik:GridTemplateColumn HeaderText="To" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                    <ItemTemplate>
                                                        <telerik:RadDatePicker ID="ToDateTxt" runat="server" Width="155"
                                                            DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                                             >
                                                            <Calendar runat="server">
                                                                <SpecialDays>
                                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                </SpecialDays>
                                                            </Calendar>
                                                        </telerik:RadDatePicker>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="AddBus"  ValidationGroup="NA"
                                                            ImageUrl="../../image/add.png" Width="15" Height="15" AlternateText="Edit"
                                                            OnClick="AddBus_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="item" Display="false" />
                                                <telerik:GridBoundColumn DataField="descr" Display="false" />
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
