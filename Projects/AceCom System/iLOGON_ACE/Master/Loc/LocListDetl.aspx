<%@ Page Language="c#" CodeBehind="LocListDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Loc.LocListDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>LocListDetl</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Count" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Pick-Face" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView" DefaultButton="UpdateBtn">
                <br />
                <table>
                    <tr>
                        <td>&nbsp;<asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                        </td>

                    </tr>
                </table>
                <br />

                <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Visible="False" Text="Update" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                <asp:Button ID="BackButton" class="white" Width="110" runat="server" OnClick="BackButton_Click" CausesValidation="False" Visible="False" Text="Search Results" OnClientClick="disableBtn(this.id),true" UseSubmitBehavior="false" />
                <table>
                    <tr>
                        <td valign="top">
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="CountPageView" DefaultButton="UpdateBtn2">
                <table>
                    <tr>
                        <td>
                            <br />
                            &nbsp;<asp:Label ID="LocationLbl" runat="server" CssClass="pagetitle"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="UpdateCtImBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Visible="False" Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br>
                <asp:Button ID="UpdateBtn2" class="white" runat="server" OnClick="UpdateBtn_Click" Visible="False" Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

                <table cellspacing="2" cellpadding="2" width="100%" border="0">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%--// added by HW on 3/Apr/2017 for Ticket #483--%>
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowPaging="true"
                                AllowFilteringByColumn="true" Skin="Office2007">
                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <HeaderStyle Wrap="false"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" EditMode="InPlace" PageSize ="100">
                                    <CommandItemSettings ShowRefreshButton="false" />
                                    <Columns>
                                        <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="40px" HeaderStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                No
                                            </HeaderTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="10" />
                                            <ItemTemplate>
                                                <%#Container.ItemIndex+1%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn HeaderText="ScheduleDate" DataField="ScheduleDate" AllowFiltering="true"
                                            ItemStyle-Width="100px" HeaderStyle-Width="100px" DataFormatString="{0:dd/MMM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Number" DataField="InvCountNo" AllowFiltering="true"
                                            ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="SKUCode" DataField="skucode" AllowFiltering="true"
                                            ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Description" DataField="skudescr" AllowFiltering="true"
                                            ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="OnHandQty" DataField="onhandqty" AllowFiltering="true"
                                            ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="CountedQty" DataField="countedqty" AllowFiltering="true"
                                            ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="VarianceQty" DataField="varqty" AllowFiltering="true"
                                            ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                            ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="PickFaceRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
