<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FabricationUsageHead.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionFabricationUsage.FabricationUsageHead" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Distribution Fabrication Usage Head</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/NewBusyBox.js" language="javascript" type="text/javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" type="text/javascript">
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
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
                &nbsp;
               <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh"
                    OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                    OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
               &nbsp;   
                <asp:Button ID="ConfirmButton" runat="server" CssClass="white" Text="Confirm"
                    OnClick="ConfirmButton_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;   

                <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                    OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;   
                <asp:Button ID="FabricationUsageBtn" runat="server" CssClass="LongLabelBlue" Text="Fabrication Usage"
                     OnClick="FabricationUsageBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                 <table>
                    <tr>
                        <td>
                            <asp:Button ID="ConfirmBtn" Text="" Style="display: none;" OnClick="ConfirmBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="FabricationUsageId">
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
                            <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntName" HeaderText="Entity" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationUsageNo" UniqueName="FabricationUsageNo" SortExpression="FabricationUsageNo" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="FabricationUsageNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationUsageDate" UniqueName="FabricationUsageDate" SortExpression="FabricationUsageDate"
                                HeaderText="FabricationUsageDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ReferenceNo" UniqueName="ReferenceNo" SortExpression="ReferenceNo" AllowFiltering="false"
                                HeaderText="ReferenceNo" ShowFilterIcon="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="FabricationUsageTypeDescr" UniqueName="FabricationUsageTypeDescr" SortExpression="FabricationUsageTypeDescr" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationUsageReasonDescr" UniqueName="FabricationUsageReasonDescr" SortExpression="FabricationUsageReasonDescr" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Reason">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Remarks" UniqueName="Remarks" SortExpression="Remarks" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Remarks">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationUsageStatusDescr" UniqueName="FabricationUsageStatusDescr" SortExpression="FabricationUsageStatusDescr" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EntityId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationUsageStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationUsageId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="500px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script type="text/javascript">
        // Instantiate our BusyBox object        
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../NewBusyBox.html");
    </script>

</body>
</html>
