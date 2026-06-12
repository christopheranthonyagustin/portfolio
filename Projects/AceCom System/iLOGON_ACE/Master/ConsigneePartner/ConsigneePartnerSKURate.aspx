<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsigneePartnerSKURate.aspx.cs" Inherits="iWMS.Web.Master.ConsigneePartner.ConsigneePartnerSKURate" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head runat="server">
    <title>ConsigneePartnerSKURate</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
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
            <tr>
                <td>
                    <asp:Label ID="AccountLbl" runat="server" Text="Account" /><br />
                    <telerik:RadDropDownList ID="AccountDDL" runat="server" Skin="WebBlue" DataTextField="code" DataValueField="acid" OnSelectedIndexChanged="AccountDDL_SelectedIndexChanged" AutoPostBack="true">
                    </telerik:RadDropDownList>
                </td>
            </tr>
        </table>
        <br />
        <br />

        <telerik:RadGrid ID="SKURateDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="false" AllowSorting="false" AllowFilteringByColumn="false"
            Skin="Metro" OnNeedDataSource="SKURateDG_NeedDataSource">
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
                    <telerik:GridTemplateColumn HeaderText="SKUCode" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="SKUCodeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skucode") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="SKUDescription" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="SKUDescrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "skudescr") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn DataField="rateperunit" SortExpression="rateperunit" UniqueName="rateperunit"
                        HeaderText="UnitRate" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "rateperunit")%>
                        </ItemTemplate>
                        <ItemTemplate>
                            <telerik:RadTextBox ID="UnitRateTxt" runat="server" Width="150px" Text='<%# DataBinder.Eval(Container.DataItem, "rateperunit") %>'
                                Skin="WebBlue">
                            </telerik:RadTextBox>
                            <asp:CompareValidator ID="UnitRateTxtCompVal" runat="server" ControlToValidate="UnitRateTxt"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "currcode")%>
                        </ItemTemplate>
                        <ItemTemplate>
                            <telerik:RadDropDownList ID="CurrList" runat="server" Skin="WebBlue" DropDownHeight="150px" DataSource='<%# CurrListDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CurrListDS,DataBinder.Eval(Container.DataItem, "currcode").ToString())%>'
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
