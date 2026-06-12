<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRQHead.aspx.cs" Inherits="iWMS.Web.Management.ChangeRequestQuotation.CRQHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Quotation Management Search Results</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/checkbox.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="600px" ID="SearchResultRadPageView">
                <table width="100%" style="margin-top:10px !important">
                    <tr>
                        <td align="right">
                            <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="GridMemoryBtn_Click" Text="M"
                                OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                         <td>
                            <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowPaging="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="520px" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView DataKeyNames="Id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" PageSizes="50" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="CheckBoxIcon" AllowFiltering="false" Reorderable="false">
                                <HeaderTemplate>
                                    <input id="CnkSelectAll" name="CnkSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="ChkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Icon" AllowFiltering="false" Reorderable="false">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="EditImgBtn" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Quotation Management"
                                        OnClick="EditImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn UniqueName="AcCode" HeaderText="Account" DataField="AcCode" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Code" HeaderText="QuotationNo" DataField="Code" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="QuotationDate" HeaderText="QuotationDate" DataField="QuotationDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="ChangeRequestNo" HeaderText="ChangeRequestNo" DataField="ChangeRequestNo" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="InvoiceNo" HeaderText="InvoiceNo" DataField="InvoiceNo" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="InvoiceAmount" HeaderText="InvoiceAmount" DataField="InvoiceAmount" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="QuotationMandays" HeaderText="Mandays" DataField="QuotationMandays" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="DiscountMandays" HeaderText="DiscountMandays" DataField="DiscountMandays" AllowFiltering="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Type" HeaderText="Type" DataField="Type" AllowFiltering="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Currency" HeaderText="Currency" DataField="Currency" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="SalesMan" HeaderText="SalesMan" DataField="SalesMan" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="TermsCondition" HeaderText="Terms&Conditions" DataField="TermsCondition" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="StatusDescr" HeaderText="Status" DataField="StatusDescr" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="AddDate" HeaderText="AddDate" DataField="AddDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="AddUser" HeaderText="AddUser" DataField="AddUser" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="EditDate" HeaderText="EditDate" DataField="EditDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="EditUser" HeaderText="EditUser" DataField="EditUser" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="StatusColourCode" DataField="StatusColourCode" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="AcId" DataField="AcId" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="QuotationStatus" DataField="QuotationStatus" Display="false"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
