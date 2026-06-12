<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportOrderHead.aspx.cs" Inherits="iWMS.Web.Job.ImportOrderRegister.ImportOrderHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ImportOrderHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Panel ID="LblPanel" runat="server" Visible="false">
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                Visible="False"></asp:Label>
        </asp:Panel>      
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="ResultsGrid" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <telerik:RadGrid ID="ResultDg" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDg_NeedDataSource">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="accode" UniqueName="accode" SortExpression="accode"
                                HeaderText="Customer Code">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="number" UniqueName="number" SortExpression="number"
                                HeaderText="Booking Number">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="orderdate" UniqueName="orderdate" SortExpression="orderdate"
                                HeaderText="Booking Date" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="transhipmentdate" UniqueName="transhipmentdate" SortExpression="transhipmentdate"
                                HeaderText="Empty Box Delivery" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="expdate" UniqueName="expdate" SortExpression="expdate"
                                HeaderText="Box Collection Date" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="orderby" UniqueName="orderby" SortExpression="orderby"
                                HeaderText="First Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="smancode" UniqueName="smancode" SortExpression="smancode"
                                HeaderText="Last Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="orderbyphone" UniqueName="orderbyphone" SortExpression="orderbyphone"
                                HeaderText="HandPhone">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" UniqueName="statusdescr" SortExpression="statusdescr"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="fraddr" UniqueName="fraddr" SortExpression="fraddr"
                                HeaderText="Address">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="fraddrpostal" UniqueName="fraddrpostal" SortExpression="fraddrpostal"
                                HeaderText="PostalCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="rem" UniqueName="rem" SortExpression="rem"
                                HeaderText="Remarks">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="vessel" UniqueName="vessel" SortExpression="vessel"
                                HeaderText="Vessel Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="outvoyage" UniqueName="outvoyage" SortExpression="outvoyage"
                                HeaderText="Voyage Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ineta" UniqueName="ineta" SortExpression="ineta" HeaderText="Departer Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acid" UniqueName="acid" HeaderText="Acid" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" UniqueName="status" HeaderText="Status" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
