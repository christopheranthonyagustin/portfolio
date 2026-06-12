<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrailerMonitorVehicleOff.aspx.cs" Inherits="iWMS.Web.Job.TrailerMonitor.TrailerMonitorVehicleOff" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>VehicleOff @ TrailerMonitor</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" ID="DateLbl" Text="Date"></asp:Label><br />
                    <telerik:RadDatePicker ID="DateDP" runat="server" Width="155" SkinID="Office2007"
                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                </td>
                <td>
                    <asp:Label runat="server" ID="VehNoLbl" Text="VehicleNo"></asp:Label><br />
                    <telerik:RadComboBox ID="VehNoCBB" runat="server" Skin="Office2007" RenderMode="Lightweight"
                        DataValueField="Item" DataTextField="Descr" Filter="Contains" DropDownAutoWidth="Enabled">
                    </telerik:RadComboBox>
                </td>
                <td>
                    <br />
                    &nbsp;
                    <asp:Button ID="SearchBtn" CssClass="white" runat="server" OnClick="SearchBtn_Click" CausesValidation="false"
                        Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="AddBtn" CssClass="white" runat="server" OnClick="AddBtn_Click"
                        Text="Add" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="ReleaseBtn" CssClass="white" runat="server" OnClick="ReleaseBtn_Click"
                        Text="Release" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="PendingInspectionBtn" CssClass="LongLabelWhite" runat="server" OnClick="PendingInspectionBtn_Click"
                        Text="Pending Inspection" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="InspectionCompletedBtn" CssClass="LongLabelWhite" runat="server" OnClick="InspectionCompletedBtn_Click"
                        Text="Inspection Completed" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Panel ID="AddPanel" runat="server">
            <asp:Button ID="ConfirmBtn" CssClass="white" runat="server" OnClick="ConfirmBtn_Click" CausesValidation="false"
                Text="Confirm" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
            &nbsp;
            <asp:Button ID="HideBtn" CssClass="white" runat="server" OnClick="HideBtn_Click" CausesValidation="false"
                Text="Hide" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            <br />
            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                <ContentTemplate>
                    <iWMS:iForm ID="formCtl" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
        </asp:Panel>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False" AllowPaging="True"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="None" AllowFilteringByColumn="true">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="650px" />
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="VehNo" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Driver"
                        HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vofftypedescr" SortExpression="vofftypedescr"
                        HeaderText="Type" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="frdate" SortExpression="frdate" HeaderText="FrDate"
                        DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="todate" SortExpression="todate" HeaderText="ToDate"
                        DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="InspectionExpiryDate" SortExpression="InspectionExpiryDate" HeaderText="InspectionExpiryDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm}" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="voffdeploydescr" SortExpression="voffdeploydescr"
                        HeaderText="CanDeploy" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="voffsatusdescr" SortExpression="voffsatusdescr"
                        HeaderText="Status" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="InspectionStatusDescr" SortExpression="InspectionStatusDescr"
                        HeaderText="InspectionStatus" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks"
                        HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="300px" Height="300px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
