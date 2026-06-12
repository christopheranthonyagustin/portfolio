<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobTripSummary.aspx.cs" Inherits="iWMS.Web.Job.TripPlanning.JobTripSummary" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JobTripSummary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
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
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <div id="div2" style="height: 92%">
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                Visible="False"></asp:Label>
            <div id="div3" style="height: 80%">
                <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="None" AutoGenerateColumns="false" AllowSorting="True"
                    BorderStyle="Solid" Skin="Office2007"
                    OnItemDataBound="ResultRadGrid_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    </ClientSettings>
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" TableLayout="Fixed" Name="Master">
                        <Columns>
                            <telerik:GridBoundColumn HeaderText="sNo" DataField="sno" AllowFiltering="true"
                                ColumnGroupName="sno">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Date" DataField="Date" AllowFiltering="true"
                                ColumnGroupName="Date" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Time" DataField="time" AllowFiltering="true"
                                ColumnGroupName="Time">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="VehNo" DataField="VehNo" AllowFiltering="true"
                                ColumnGroupName="VehNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Driver" DataField="pername" AllowFiltering="true"
                                ColumnGroupName="Driver">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="Type" AllowFiltering="true"
                                ColumnGroupName="Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TotalWt" DataField="TotalWt" AllowFiltering="true"
                                ColumnGroupName="TotalWt" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N4}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TotalPkg" DataField="TotalPkg" AllowFiltering="true"
                                ColumnGroupName="TotalPkg" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TotalPlt" DataField="TotalPlt" AllowFiltering="true"
                                ColumnGroupName="TotalPlt" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="Status" AllowFiltering="true"
                                ColumnGroupName="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    </form>
</body>
</html>
