<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingOrderContainerDetail.aspx.cs" Inherits="iWMS.Web.Job.BookingOrder.BookingOrderContainerDetail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Booking Order Container Detail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <base target="_self">
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

        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td class="pagetitle">
                    <asp:Label ID="CtnrLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="DetourBtn" CssClass="white" runat="server" OnClick="DetourBtn_Click" Text="Detour"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                    <asp:Button ID="InternalShifting" CssClass="LongLabelWhite" runat="server" OnClick="InternalShiftingBtn_Click" Text="Internal Shifting"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                    <asp:Button ID="CloseBtn" CssClass="white" runat="server" OnClick="CloseBtn_Click" Text="Close"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel runat="server" ID="UpdatePanel">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound" AllowSorting="true" Skin="Metro">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true" CssClass="DGAlternateItem"></AlternatingItemStyle>
                    <ItemStyle Wrap="true" CssClass="DGItem"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid">
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="20px" ItemStyle-Width="20px"
                                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="TripType" DataField="type" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="TripType" SortExpression="TripType" UniqueName="TripType" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Pick-up" DataField="FrAddr" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="Pick-up" SortExpression="Pick-up" UniqueName="Pick-up" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Drop-Off" DataField="ToAddr" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="Drop-Off" SortExpression="Drop-Off" UniqueName="Drop-Off" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ExecutionDate" DataField="bookingtime" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="ExecutionDate" SortExpression="ExecutionDate" UniqueName="ExecutionDate" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehnodescr" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="VehNo" SortExpression="VehNo" UniqueName="VehNo" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Driver" DataField="name" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="DriverName" SortExpression="DriverName" UniqueName="DriverName" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TrailerNo" DataField="trailernodescr" AllowFiltering="true"
                                HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                ColumnGroupName="TrailerNo" SortExpression="TrailerNo" UniqueName="TrailerNo" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="false" DataField="statuscolourcode" />
                            <telerik:GridBoundColumn Display="false" DataField="JbId" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
