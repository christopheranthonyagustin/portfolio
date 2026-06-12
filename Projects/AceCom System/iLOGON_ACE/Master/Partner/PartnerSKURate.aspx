<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartnerSKURate.aspx.cs" Inherits="iWMS.Web.Master.Partner.PartnerSKURate" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>PartnerSKURate</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td>
                    <br />
                    <asp:Button ID="SaveBtn" class="white" runat="server" OnClick="SaveBtn_Click" Text="Save"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                <br />
                    <br />
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <%-- <tr>
            <td>
                <br /><asp:Label ID="AccountLbl" runat="server" Text="Account" /><br />
                <telerik:RadDropDownList ID="AccountDDL" runat="server" Skin="WebBlue" DataTextField="code" DataValueField="acid" OnSelectedIndexChanged="AccountDDL_SelectedIndexChanged" AutoPostBack="true" >
                </telerik:RadDropDownList>
            </td>
        </tr>--%>
        </table>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <br />
        <telerik:RadGrid ID="SKURateDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="false" AllowSorting="false" AllowFilteringByColumn="true"
            Skin="Metro" OnNeedDataSource="SKURateDG_NeedDataSource" OnItemDataBound="SKURateDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <Columns>
                    <telerik:GridTemplateColumn Display="false">
                        <ItemTemplate>
                            <asp:Label ID="ACIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "acid") %>'></asp:Label>
                            <asp:Label ID="PNIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "partnerid") %>'></asp:Label>
                            <asp:Label ID="SKUIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skuid") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="SKU Code" HeaderStyle-HorizontalAlign="Center" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label ID="SKUCodeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skucode") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="SKU Description" HeaderStyle-HorizontalAlign="Center" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label ID="SKUDescrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skudescr") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="rateperunit" SortExpression="rateperunit" UniqueName="rateperunit"
                        HeaderText="Unit Rate" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "rateperunit")%>
                        </ItemTemplate>
                        <ItemTemplate>
                            <telerik:RadTextBox ID="UnitRateTxt" runat="server" Width="110px" Text='<%# DataBinder.Eval(Container.DataItem, "rateperunit") %>'
                                Skin="WebBlue">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="UnitRateTxtCompVal" runat="server" ControlToValidate="UnitRateTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "currcode")%>
                        </ItemTemplate>
                        <ItemTemplate>
                            <telerik:RadDropDownList ID="CurrList" runat="server" Skin="WebBlue" Width="110px" DropDownHeight="150px" DataSource='<%# CurrListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CurrListDS,DataBinder.Eval(Container.DataItem, "currcode").ToString())%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="contractno" SortExpression="contractno" UniqueName="contractno"
                        HeaderText="Contract No" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "contractno")%>
                        </ItemTemplate>
                        <ItemTemplate>
                            <telerik:RadTextBox ID="ContractNoTxt" runat="server" Width="120px" Text='<%# DataBinder.Eval(Container.DataItem, "contractno") %>'
                                Skin="WebBlue">
                            </telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn SortExpression="ValidityDate" UniqueName="ValidityDate"
                        HeaderText="Validity Date" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <telerik:RadDatePicker ID="ValidFrTxt" runat="server" Width="155"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "validfrdate") %>'>
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>

                            <telerik:RadDatePicker ID="ValidToTxt" runat="server" Width="155"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "validtodate") %>'>
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>

                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn SortExpression="MOQ" UniqueName="MOQ"
                        HeaderText="MOQ" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="MinOrderQtyTxt" runat="server" Width="130px" Text='<%# DataBinder.Eval(Container.DataItem, "MinOrderQty") %>'
                                Skin="WebBlue">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="MinOrderQtyTxtCompVal" runat="server" ControlToValidate="MinOrderQtyTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                            <br />
                            <telerik:RadDropDownList ID="MOQUOMList" runat="server" Skin="WebBlue" Width="130px" DropDownHeight="150px" DataSource='<%# MOQUOMListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(MOQUOMListDS,DataBinder.Eval(Container.DataItem, "MinOrderQtyUOM").ToString())%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn SortExpression="MaxQty" UniqueName="MaxQty"
                        HeaderText="Max Qty" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="MaxOrderQtyTxt" runat="server" Width="130px" Text='<%# DataBinder.Eval(Container.DataItem, "MaxOrderQty") %>'
                                Skin="WebBlue">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="MaxOrderQtyTxtCompVal" runat="server" ControlToValidate="MaxOrderQtyTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" />
                            <br />
                            <telerik:RadDropDownList ID="MaxUOMList" runat="server" Width="130px" Skin="WebBlue" DropDownHeight="150px" DataSource='<%# MaxUOMListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(MaxUOMListDS,DataBinder.Eval(Container.DataItem, "MaxOrderQtyUOM").ToString())%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="MaxQtyPeriod" HeaderStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "MaxOrderQtyPeriod")%>
                        </ItemTemplate>
                        <ItemTemplate>
                            <telerik:RadDropDownList ID="MaxQtyPeriodList" runat="server" Width="130px" Skin="WebBlue" DropDownHeight="150px" DataSource='<%# MaxQtyPeriodListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(MaxQtyPeriodListDS,DataBinder.Eval(Container.DataItem, "MaxOrderQtyPeriod").ToString())%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
