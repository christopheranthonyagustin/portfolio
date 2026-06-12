<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataTransformationServiceProcess.aspx.cs" Inherits="iWMS.Web.Interface.DataTransformationService.DataTransformationServiceProcess" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/checkbox.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="UnprocessedTab" Text="Unprocessed" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ErrorTab" Text="Error" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="IgnoredTab" Text="Ignored" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />

                <table>
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh"
                                OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="ProcessBtn" runat="server" CssClass="white" Text="Process"
                                OnClick="ProcessBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />

                <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="None" AutoGenerateColumns="false"
                    GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="true" FilterType="Classic"
                    AllowSorting="false" BorderStyle="Solid" OnItemCreated="ResultRadGrid_ItemCreated" OnNeedDataSource="ResultRadGrid_NeedDataSource"
                    OnItemCommand="ResultRadGrid_ItemCommand"
                    Skin="Office2007"
                    OnItemDataBound="ResultRadGrid_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false"
                        Resizing-AllowColumnResize="true">
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True" />
                    </ClientSettings>
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <FooterStyle Font-Bold="true" Wrap="true"></FooterStyle>
                    <MasterTableView AllowMultiColumnSorting="false" TableLayout="Fixed" Name="Master"
                        Width="100%">
                        <Columns>

                            <telerik:GridTemplateColumn HeaderStyle-Width="40px" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="SelectChkBox" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderStyle-Width="70px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:LinkButton ID="browseLnkBtn" runat="server" Text="Preview" OnClick="browseLnkBtn_Click" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridDateTimeColumn DataField="receivedon" HeaderText="Received On" UniqueName="ReceivedOn"
                                FilterControlWidth="100px" HeaderStyle-Width="100px" ItemStyle-Width="100px" SortExpression="receivedon" PickerType="DatePicker"
                                EnableTimeIndependentFiltering="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridDateTimeColumn>

                            <telerik:GridBoundColumn HeaderText="Filename" DataField="filename" AllowFiltering="true"
                                FilterControlWidth="100px" HeaderStyle-Width="100px" ItemStyle-Width="100px" ColumnGroupName="filename" SortExpression="filename"
                                UniqueName="FileName" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                                ShowFilterIcon="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="FilePath" DataField="filepath" AllowFiltering="false"
                                ColumnGroupName="filepath" SortExpression="filepath" UniqueName="FilePath" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>

            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ErrorRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="IgnoredRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
