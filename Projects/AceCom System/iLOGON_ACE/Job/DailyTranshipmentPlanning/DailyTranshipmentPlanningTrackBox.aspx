<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTranshipmentPlanningTrackBox.aspx.cs" Inherits="iWMS.Web.Job.DailyTranshipmentPlanning.DailyTranshipmentPlanningTrackBox" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DailyTranshipmentPlanning Track Box </title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <base target="_self" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>
    <script type="text/javascript">
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
    </script>

</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>&nbsp;
                             <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>

        <table width="100%">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:UpdatePanel runat="server" ID="UpdatePanel">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                    <ContentTemplate>
                                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false"
                                            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" Width="900px">

                                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                                                <Selecting AllowRowSelect="true" />
                                                <Scrolling AllowScroll="true" />
                                            </ClientSettings>

                                            <SortingSettings EnableSkinSortStyles="true" />
                                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                            <ItemStyle Wrap="false"></ItemStyle>
                                            <HeaderStyle Wrap="false"></HeaderStyle>

                                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Width="900px">
                                                <CommandItemSettings ShowRefreshButton="false" />
                                                <Columns>

                                                    <telerik:GridBoundColumn HeaderText="From" DataField="frexpdate" AllowFiltering="true" HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"
                                                        ColumnGroupName="From" SortExpression="From" UniqueName="From" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn HeaderText="To" DataField="toactdate" AllowFiltering="true" HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"
                                                        ColumnGroupName="To" SortExpression="To" UniqueName="To" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn HeaderText="Pick-up" DataField="FrServicePt" AllowFiltering="true" HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"
                                                        ColumnGroupName="Pick-up" SortExpression="Pick-up" UniqueName="Pick-up" Reorderable="true">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn HeaderText="Drop-Off" DataField="ToServicePt" AllowFiltering="true" HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"
                                                        ColumnGroupName="Drop-Off" SortExpression="Drop-Off" UniqueName="Drop-Off" Reorderable="true">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn HeaderText="DriverName" DataField="name" AllowFiltering="true" HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"
                                                        ColumnGroupName="DriverName" SortExpression="DriverName" UniqueName="DriverName" Reorderable="true">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehnodescr" AllowFiltering="true" HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"
                                                        ColumnGroupName="VehNo" SortExpression="VehNo" UniqueName="VehNo" Reorderable="true">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn HeaderText="TrailerNo" DataField="trailernodescr" AllowFiltering="true" HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"
                                                        ColumnGroupName="TrailerNo" SortExpression="TrailerNo" UniqueName="TrailerNo" Reorderable="true">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn HeaderText="TripType" DataField="type" AllowFiltering="true" HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"
                                                        ColumnGroupName="TripType" SortExpression="TripType" UniqueName="TripType" Reorderable="true">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn Display="false" DataField="statuscolourcode" />

                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>

                </td>
            </tr>
            <tr align="right" style="padding-top: 24%">
                <td style="padding-top: 24%"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

