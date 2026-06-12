<%@ Page Language="c#" CodeBehind="ShipPlanHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.ShipPlan.ShipPlanHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ShipPlanHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Cage ready to ship" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Cage not closed" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Carton ready for Cage" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Empty Carton" Value="400" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="ResultRadPageView">
                <table style="width: 100%; height: 30px">
                    <tr>
                        <td>
                            <asp:Button ID="ShipBtn" runat="server" Text="Ship" OnClick="ShipBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="white" ToolTip="Ship?" />
                            &nbsp;
                            <asp:Button ID="ShipEDIBtn" runat="server" Text="Ship EDI"
                                OnClick="ShipEDIBtn_Click" CssClass="green" ToolTip="ShipEDI?" />
                            &nbsp;
                            <asp:Button ID="ManifestBtn" runat="server" Text="Manifest" OnClick="ManifestBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="blue" ToolTip="Manifest Print?" />
                            &nbsp;
                            <asp:Button ID="ManifestExcelBtn" runat="server" Text="Manifest Excel" OnClick="ManifestExcelBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="longlabelgreen" ToolTip="Manifest Excel" />
                            &nbsp;
                            <asp:Button ID="PrintDOBtn" runat="server" Text="DO" OnClick="PrintDOBtn_Click"
                                OnClientClick="disableBtn(this.id,false)"
                                UseSubmitBehavior="false" CssClass="blue" ToolTip="Print DO" />
                            &nbsp;                  
                            <asp:Button ID="CSLPackBtn" runat="server" Text="Consolidated Pack List" OnClick="CSLPackBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="longlabelblue" ToolTip="CSLPACK Print?" />
                            <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" OnClick="RefreshBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                        <td align="right">
                            <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <div style="height: 5px"></div>
                <div id="div-datagrid" style="height: 92%">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                        AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                        OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
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
                                        <label id="completelbl">
                                        </label>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                        <asp:ImageButton runat="server" Visible="True" ID="GoodsIssueEdit" ImageUrl="../../image/pencil.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Goods Issue"
                                            OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                        <asp:ImageButton runat="server" Visible="false" ID="AddCandidates" ImageUrl="../../image/add.png"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Goods Issue"
                                            OnClick="AddCandidates_Click" CausesValidation="False"></asp:ImageButton>
                                        <asp:ImageButton runat="server" Visible="true" ID="PrintBtn" ImageUrl="../../image/print.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Print Goods Issue"
                                            OnClick="PrintBtn_Click" OnClientClick="return confirm('Confirm print?')" CausesValidation="False"></asp:ImageButton>
                                        <asp:ImageButton runat="server" Visible="false" ID="DeleteBtn" ImageUrl="../../image/bin.gif"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Delete Goods Issue"
                                            OnClick="DeleteBtn_Click" OnClientClick="return confirm('Confirm delete?')" CausesValidation="False"></asp:ImageButton>
                                        <asp:Label ID="ShipEDILbl" runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="Ship Plan No" AllowFiltering="true" CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="accode" HeaderText="Account" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ShipToCode" HeaderText="ShipToCode" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ShipToName" HeaderText="ShipToName" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DockCode" HeaderText="Assigned To Dock" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vslvoy" SortExpression="vslvoy" HeaderText="Vessel Voyage" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="Vehicle No" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" AllowFiltering="true" ItemStyle-Wrap="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>

                                <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="mode" Display="False" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="type" Display="False" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ref1" SortExpression="ref1" HeaderText="Ref.1" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ref2" SortExpression="ref2" HeaderText="Ref.2" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="route" SortExpression="route" HeaderText="Route" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="delvdate" SortExpression="delvdate" HeaderText="Delivery Date" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="shdate" SortExpression="shdate" HeaderText="Ship Date" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TotalPkg" SortExpression="" HeaderText="Total Packages" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false" DataFormatString="{0:#}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TotalPlt" SortExpression="" HeaderText="Total Pallet" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="False" DataFormatString="{0:#}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark 1" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark 2" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="dono" SortExpression="dono" HeaderText="DO No" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="issueno" SortExpression="issueno" HeaderText="Issue No" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="custref" SortExpression="custref" HeaderText="CustRef" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                    HeaderText="EditUser">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="acid" HeaderText="ACID" AllowFiltering="false" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ShipEDIDone" HeaderText="ShipEDIDone" AllowFiltering="false" Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="900px" ID="HuNotShippedRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="900px" ID="HuNotClosedRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="900px" ID="CartonReadyForCageRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="900px" ID="CartonNotClosedRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>

        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="white" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Text="Okay" class="white" />&nbsp;

                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
