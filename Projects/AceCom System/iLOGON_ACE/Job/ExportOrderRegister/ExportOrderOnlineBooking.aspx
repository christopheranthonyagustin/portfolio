<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportOrderOnlineBooking.aspx.cs" Inherits="iWMS.Web.Job.ExportOrderRegister.ExportOrderOnlineBooking" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ExportOrderOnlineBooking</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />

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
        <table>
            <tr>
                <td align="right">
                     &nbsp;<asp:Button ID="ConfirmBtn" runat="server" CssClass="white" OnClick="ConfirmBtn_Click" Text="Confirm" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                      &nbsp;<asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click" Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        
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
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDg_NeedDataSource" Height="1000px" OnItemDataBound="ResultDg_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting EnableDragToSelectRows="false" AllowRowSelect="true" />
                        <Scrolling UseStaticHeaders="true" AllowScroll="true" />
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
                            <telerik:GridBoundColumn DataField="accode" UniqueName="accode" SortExpression="accode"
                                HeaderText="Mobile Number">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="number" UniqueName="number" SortExpression="number"
                                HeaderText="Booking Number">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="transhipmentdate" UniqueName="transhipmentdate" SortExpression="transhipmentdate"
                                HeaderText="Empty Box Delivery" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="expdate" UniqueName="expdate" SortExpression="expdate"
                                HeaderText="Box Collection Date" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="vessel" UniqueName="vessel" SortExpression="vessel"
                                HeaderText="Vessel Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="orderby" UniqueName="orderby" SortExpression="orderby"
                                HeaderText="Last Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="smancode" UniqueName="smancode" SortExpression="smancode"
                                HeaderText="First Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="orderbyphone" UniqueName="orderbyphone" SortExpression="orderbyphone"
                                HeaderText="HandPhone">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="orderdate" UniqueName="orderdate" SortExpression="orderdate"
                                HeaderText="Booking Date" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" UniqueName="statusdescr" SortExpression="statusdescr"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="pod" UniqueName="pod" SortExpression="pod"
                                HeaderText="Destination">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="fraddr" UniqueName="fraddr" SortExpression="fraddr"
                                HeaderText="Address">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="fraddrpostalcode" UniqueName="fraddrpostalcode" SortExpression="fraddrpostalcode"
                                HeaderText="PostalCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="remarks" UniqueName="remarks" SortExpression="remarks"
                                HeaderText="Remarks">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="outvoyage" UniqueName="outvoyage" SortExpression="outvoyage"
                                HeaderText="Voyage Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="outetd" UniqueName="outetd" SortExpression="outetd" HeaderText="Departure Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acid" UniqueName="acid" HeaderText="Acid" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" UniqueName="status" HeaderText="Status" Display="false">
                            </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
