<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkOrderManagerHead.aspx.cs" Inherits="iWMS.Web.Outbound.WorkOrderManager.WorkOrderManagerHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result Search @ WorkOrderManager</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
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
                    myElement.checked = invoker.UnChecked;
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
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="ConversionEDIBtn" runat="server" CssClass="LongLabelGreen" Text="Conversion EDI"
                                CausesValidation="false" OnClick="ConversionEDIBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="WorkInstructionBtn" runat="server" CssClass="LongLabelBlue" Text="Work Instruction"
                                CausesValidation="false" OnClick="WorkInstructionBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                                CausesValidation="false" OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="WorkOrderId" Name="MainGrid" TableLayout="Auto">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="60px" ItemStyle-Width="60px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="EditImgBtn"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="EditImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>&nbsp;
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="WorkOrderNo" UniqueName="WorkOrderNo" SortExpression="WorkOrderNo" HeaderText="Work Order No">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="WorkOrderType" UniqueName="WorkOrderType" SortExpression="WorkOrderType" HeaderText="Work Order Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="WorkOrderDate" UniqueName="WorkOrderDate" SortExpression="WorkOrderDate" HeaderText="Work Order Date" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderText="Account">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ExtSiteCode" UniqueName="ExtSiteCode" SortExpression="ExtSiteCode" HeaderText="External Site">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderQuantity" UniqueName="OrderQuantity" HeaderText="Order Quantity">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderUOM" UniqueName="OrderUOM" HeaderText="Order UOM">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RequestNo" UniqueName="RequestNo" HeaderText="Requested No">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RequestedBy" UniqueName="RequestedBy" HeaderText="Requested By" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="Status" HeaderText="Status" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColor" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RequestedOn" UniqueName="RequestedOn" HeaderText="Requested On" AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RequiredOn" UniqueName="RequiredOn" HeaderText="Required On" AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Notes" UniqueName="Notes" SortExpression="Notes" AllowFiltering="false" HeaderText="Notes">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AcId" SortExpression="AcId" Display="false">
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
</body>
</html>
