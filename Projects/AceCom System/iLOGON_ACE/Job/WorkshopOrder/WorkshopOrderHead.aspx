<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkshopOrderHead.aspx.cs" Inherits="iWMS.Web.Job.WorkshopOrder.WorkshopOrderHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result Search @ WorkshopOrder</title>
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
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
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
                            <asp:Button ID="ServiceOrderBtn" runat="server" CssClass="LongLabelBlue" Text="Service Order"
                                OnClick="ServiceOrderBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                                OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />&nbsp; 
                            <br />
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="ConfirmBtn" Text="" Style="display: none;" OnClick="ConfirmBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                        </td>
                    </tr>
                </table>
                <br />
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
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="WorkshopOrderId" Name="MainGrid" TableLayout="Fixed">
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
                                    <asp:ImageButton runat="server" Visible="True" ID="ImgCopy" ImageUrl="../../image/copy.png"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Copy WorkshopOrder"
                                        OnClick="ImgCopy_Click" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="WorkshopOrderNo" UniqueName="WorkshopOrderNo" SortExpression="WorkshopOrderNo" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                HeaderText="WorkshopOrderNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                HeaderText="Account">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EntityCode" UniqueName="EntityCode" SortExpression="EntityCode" HeaderStyle-Width="180px" ItemStyle-Width="180px"
                                HeaderText="Entity">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BranchCode" UniqueName="BranchCode" SortExpression="BranchCode" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                HeaderText="Branch">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DepartmentCode" UniqueName="DepartmentCode" SortExpression="DepartmentCode" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                HeaderText="Department">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="VehNo" UniqueName="VehNo" SortExpression="VehNo" HeaderStyle-Width="220px" ItemStyle-Width="220px"
                                HeaderText="Vehicle">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Mileage" UniqueName="Mileage" SortExpression="Mileage" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                HeaderText="Mileage">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NextServicingMileage" UniqueName="NextServicingMileage" HeaderText="NextServicingMileage" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ServiceTypeDescr" UniqueName="ServiceTypeDescr" HeaderText="ServiceType" HeaderStyle-Width="300px" ItemStyle-Width="300px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustomerReference" UniqueName="CustomerReference" HeaderText="CustomerReference" AllowFiltering="false" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SpecialInstructions" UniqueName="SpecialInstructions" HeaderText="SpecialInstructions" AllowFiltering="false" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Notes" UniqueName="Notes" SortExpression="Notes" AllowFiltering="false" HeaderStyle-Width="220px" ItemStyle-Width="220px"
                                HeaderText="Notes">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SalesMan" UniqueName="SalesMan" HeaderText="SalesMan" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DriverInName" UniqueName="DriverInName" HeaderText="DriverIn" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DateTimeIn" UniqueName="DateTimeIn" SortExpression="DateTimeIn" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="DateTimeIn" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DriverOutName" UniqueName="DriverOutName" HeaderText="DriverOut" HeaderStyle-Width="220px" ItemStyle-Width="220px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DateTimeOut" UniqueName="DateTimeOut" SortExpression="DateTimeOut" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="DateTimeOut" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="WorkshopOrderNo" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Status" Display="false">
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
