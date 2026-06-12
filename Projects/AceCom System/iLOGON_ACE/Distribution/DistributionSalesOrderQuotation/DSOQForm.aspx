<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DSOQForm.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrderQuotation.DSOQForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Form @ Sales Order Quotation</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }

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
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attachment" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update" Enabled="false"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>

                <table>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>

                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    CausesValidation="false" SelectedIndex="0" Skin="Office2007">
                    <Tabs>
                        <telerik:RadTab Id="ItemTab" Text="Item" Value="0" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="90%" ID="ItemHeaderRadPageView">
                        <table>
                            <tr>
                                <td>
                                    <br />
                                    <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New"
                                        OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                        OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="true" AllowSorting="true"
                            AllowFilteringByColumn="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="SalesOrderQuotationItemId">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="SalesOrderQuotationItemEditImgBtn"
                                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" CausesValidation="false"
                                                OnClick="SalesOrderQuotationItemEditImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            &nbsp;
                                            <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="SalesOrderQuotationItemDeleteImgBtn"
                                                ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                                OnClick="SalesOrderQuotationItemDeleteImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="LineNo" DataField="LineNo" SortExpression="LineNo" UniqueName="LineNo" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemCode" DataField="ItemCode" SortExpression="ItemCode" UniqueName="ItemCode" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemDescription" DataField="ItemDescription" SortExpression="ItemDescription" UniqueName="ItemDescription" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemType" DataField="ItemType" SortExpression="ItemType" UniqueName="ItemType" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemQty" DataField="ExpectedUOMQty" SortExpression="ItemQty" UniqueName="ItemQty" HeaderStyle-Width="130px" ItemStyle-Width="130px" DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemUOM" DataField="ItemUOM" SortExpression="ItemUOM" UniqueName="ItemUOM" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="ItemUnitPrice" DataField="ItemUnitPrice" SortExpression="ItemUnitPrice" UniqueName="ItemUnitPrice" HeaderStyle-Width="130px" ItemStyle-Width="130px" DataFormatString="{0:#,0.##}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Notes" DataField="Notes" SortExpression="Notes" UniqueName="Notes" HeaderStyle-Width="250px" ItemStyle-Width="250px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Status" DataField="SalesOrderQuotationItemStatusDescr" SortExpression="SalesOrderQuotationItemStatusDescr" UniqueName="SalesOrderQuotationItemStatusDescr">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate"
                                        HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy hh:mm}" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser"
                                        HeaderText="AddUser" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate"
                                        HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy hh:mm}" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser"
                                        HeaderText="EditUser" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SalesOrderQuotationItemStatusColorCode" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SalesOrderQuotationId" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="87%" ID="AttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="87%" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
