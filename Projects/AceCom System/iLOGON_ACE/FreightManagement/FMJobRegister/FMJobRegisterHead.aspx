<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobRegisterHead.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobRegisterHead" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Search Results @ Freight Job Register</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css"/>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
     <script type="text/javascript" src="../../js/checkbox.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <td>
                                <asp:Button ID="EditBtn" runat="server" Text="Edit" OnClick="EditBtn_Click"
                                    CssClass="white" ToolTip="Edit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click"
                                    CssClass="white" ToolTip="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="CloseBtn" runat="server" CssClass="white" Text="Close"
                                    OnClick="CloseBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="ReopenBtn" runat="server" CssClass="white" Text="Reopen"
                                    OnClick="ReopenBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp; &nbsp;
                                <asp:Label ID="RowCountLbl" Font-Bold="true" Font-Size="Medium" runat="server"></asp:Label>
                            </td>
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td>
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" PagerStyle-AlwaysVisible="true"
                                AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
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
                                                &nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="CopyBtnButton1"
                                        ImageUrl="../../image/copy.png" Width="15" Height="15" AlternateText="Edit" OnClick="CopyBtn_Click"
                                        BackColor="Transparent" BorderWidth="0"></asp:ImageButton>&nbsp;
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="Type" UniqueName="Type" HeaderText="Type"
                                           AllowFiltering="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TransportModeDescr" UniqueName="TransportModeDescr" HeaderText="TransportMode"
                                            AllowFiltering="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo"
                                            HeaderText="Number">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="HouseBill" UniqueName="HouseBill" HeaderText="HouseBill">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ContainerModeDescr" UniqueName="ContainerModeDescr" SortExpression="ContainerModeDescr" HeaderText="ContainerMode">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ShipperRef" UniqueName="ShipperRef" HeaderText="ShipperRef" AllowFiltering="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="shippername" UniqueName="shippername" HeaderText="ShipperName" AllowFiltering="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ConsigneeName" UniqueName="ConsigneeName" HeaderText="ConsigneeName" AllowFiltering="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="LocalClientName" UniqueName="LocalClientName" HeaderText="LocalClientName" AllowFiltering="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="POLDescr" UniqueName="POL" SortExpression="POLDescr" AllowFiltering="false"
                                            HeaderText="LoadPort">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ETD" UniqueName="ETD" SortExpression="ETD"
                                            HeaderText="ETD" DataFormatString="{0:dd/MMM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PODDescr" UniqueName="POD" SortExpression="PODDescr" AllowFiltering="false"
                                            HeaderText="DischargePort">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ETA" UniqueName="ETA" SortExpression="ETA"
                                            HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="InspectionbyDescr" UniqueName="InspectionbyDescr" SortExpression="Inspectionby" AllowFiltering="false"
                                            HeaderText="Inspectionby">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ScreeningbyDescr" UniqueName="ScreeningbyDescr" SortExpression="Screeningby" AllowFiltering="false"
                                            HeaderText="Screeningby">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" AllowFiltering="false"
                                            HeaderText="Status">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn HeaderText="Last Transaction" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("LastTransDate")) %>
                                                <%# DataBinder.Eval(Container.DataItem, "LastTransUser")%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="ModifiedOn" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("EditDate")) %>
                                                <%# DataBinder.Eval(Container.DataItem, "EditUser")%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="AcCode" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="AcId" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="fmcslid" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TransportMode" UniqueName="TransportMode" Display="false"></telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmApproveBtn" Text="" Style="display: none;" OnClick="ConfirmApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
                <td>
                    <asp:Button ID="ConfirmNoneApproveBtn" Text="" Style="display: none;" OnClick="ConfirmNoneApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmApproveCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmApproveBtn.UniqueID %>", "");
                }
            }
            function ConfirmNoneBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmNoneApproveBtn.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>
