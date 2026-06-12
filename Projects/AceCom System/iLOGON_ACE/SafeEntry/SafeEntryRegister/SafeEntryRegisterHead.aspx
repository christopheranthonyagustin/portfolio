<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SafeEntryRegisterHead.aspx.cs" Inherits="iWMS.Web.SafeEntry.SafeEntryRegister.SafeEntryRegisterHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Head @ Safe Entry Register</title>
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExcelBtn_Click"
            UseSubmitBehavior="false" />
        <br />
        <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="ResultRadPageView">
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" OnNeedDataSource="ResultDG_NeedDataSource"
                    AllowPaging="True" AllowFilteringByColumn="True" Skin="Metro" OnItemCommand="ResultDG_ItemCommand" OnColumnCreated="ResultDG_ColumnCreated">
                    <ClientSettings AllowColumnsReorder="true">
                        <Selecting AllowRowSelect="true"></Selecting>
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="570px" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true" HorizontalAlign="Left"></AlternatingItemStyle>
                    <ItemStyle Wrap="true" HorizontalAlign="Left"></ItemStyle>
                    <HeaderStyle Wrap="false" HorizontalAlign="Left" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridButtonColumn ButtonType="LinkButton" CommandName="CheckOut" FilterControlAltText="CheckOut" Text="Check Out" UniqueName="CheckOut" ConfirmDialogType="RadWindow" HeaderStyle-Width="80px" ItemStyle-Width="80px" Resizable="False" ConfirmText="Confirm Check Out?">
                            </telerik:GridButtonColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="5%">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="SECopy" ImageUrl="../../Image/Copy.png"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Copy Safe Entry"
                                        OnClick="SECopy_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="SEDelete" ImageUrl="../../image/bin.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Delete SafeEntry"
                                        OnClick="SECancel_Click" OnClientClick="return confirm('Confirm Delete?')" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<telerik:GridButtonColumn ButtonType="LinkButton" CommandName="CheckIn" FilterControlAltText="CheckIn" Text="Check In" UniqueName="CheckIn" ConfirmDialogType="RadWindow" HeaderStyle-Width="80px" ItemStyle-Width="80px" Resizable="False" ConfirmText="Confirm Check In?">
                            </telerik:GridButtonColumn>--%>
                            <telerik:GridBoundColumn UniqueName="ICNo" HeaderText="Identification Number" DataField="ICNo" SortExpression="ICNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="VisitorName" HeaderText="Visitor Name" DataField="VisitorName" SortExpression="VisitorName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="CompanyName" HeaderText="Company Name" DataField="CompanyName" SortExpression="CompanyName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="ContainerIn" HeaderText="Container In" DataField="ContainerIn" SortExpression="ContainerIn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="ContainerOut" HeaderText="Container Out" DataField="ContainerOut" SortExpression="ContainerOut">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="CarPlateNo" HeaderText="Vehicle Number" DataField="CarPlateNo" SortExpression="CarPlateNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="ContactNo" HeaderText="Contact Number" DataField="ContactNo" SortExpression="ContactNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="DateOfVisit" HeaderText="Date Of Visit" DataField="DateOfVisit" SortExpression="DateOfVisit" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="OutTiming" HeaderText="OutTiming" DataField="CheckOutDate" SortExpression="OutTiming" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Temperature" HeaderText="Temperature" DataField="Temperature" SortExpression="Temperature" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="VaccinationStatus" HeaderText="Vaccination Status" DataField="VaccinationStatus" SortExpression="VaccinationStatus">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="PurposeOfVisiting" HeaderText="Purpose of Visiting" DataField="PurposeOfVisiting" SortExpression="PurposeOfVisiting">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Comments" HeaderText="Comments Box" DataField="Comments" SortExpression="Comments">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Status" HeaderText="Status" DataField="Status" SortExpression="Status" Visible="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
