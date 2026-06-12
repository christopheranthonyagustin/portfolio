<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportQuotationPricingHead.aspx.cs" Inherits="iWMS.Web.Sales.TransportQuotationPricing.TransportQuotationPricingHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ContainerHaulageRatesHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked
                }
            }
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="TAndCBtn" runat="server" Text="T&C" OnClick="TAndCBtn_Click" OnClientClick="disableBtn(this.id)"
                                UseSubmitBehavior="false" CssClass="blue" />
                            &nbsp;
                            <asp:Button ID="QuotationBtn" runat="server" Text="Quotation" OnClick="QuotationBtn_Click" OnClientClick="disableBtn(this.id)"
                                UseSubmitBehavior="false" CssClass="blue" />
                        </td>
                        <td align="right">
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                            &nbsp;
                            <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
                    AllowPaging="True" AllowFilteringByColumn="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                    AllowSorting="true" EnableLinqExpressions="false" Width="150%">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true"></Selecting>
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="80px" ItemStyle-Width="80px"> 
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" ID="EditImgBtn" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Quotation Register"
                                        OnClick="EditImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:ImageButton runat="server" ID="DeleteImgBtn" ImageUrl="../../image/bin.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Delete Quotation Register"
                                        OnClick="DeleteImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="Account" DataField="AcName" SortExpression="AcName" UniqueName="AcName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="QuotationNo" DataField="Code" SortExpression="Code" UniqueName="Code">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="TypeDescr" SortExpression="TypeDescr" UniqueName="Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SalesMan" DataField="SalesManDescr" SortExpression="SalesManDescr" UniqueName="SalesMan">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ValidFrom" DataField="ValidFrom" SortExpression="ValidFrom" UniqueName="ValidFrom" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ValidTill" DataField="ValidTill" SortExpression="ValidTill" UniqueName="ValidTill" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Currency" DataField="Currency" AllowFiltering="false" SortExpression="Currency" UniqueName="Currency">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="AddDate" DataField="AddDate" SortExpression="AddDate" UniqueName="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="AddUser" DataField="AddUser" SortExpression="AddUser" UniqueName="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="EditDate" DataField="EditDate" SortExpression="EditDate" UniqueName="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="EditUser" DataField="EditUser" SortExpression="EditUser" UniqueName="EditUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="false" DataField="StatusColourCode" />
                            <telerik:GridBoundColumn Display="false" DataField="AcId" />
                            <telerik:GridBoundColumn Display="false" DataField="Status" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
