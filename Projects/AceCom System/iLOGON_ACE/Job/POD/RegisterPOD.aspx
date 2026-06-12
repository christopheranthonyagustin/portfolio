<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPOD.aspx.cs" Inherits="iWMS.Web.Job.POD.RegisterPOD" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="title1" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td class="style1">
                <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;">
                </a>
            </td>
            <td class="ModuleTitle" align="right">
                <div class="rounded-box1" style="background-color: #336600; width: 30%">
                    <div class="top-right-corner1">
                        <div class="top-right-inside1" style="background-color: #ffffff; color: #336600">
                            •</div>
                    </div>
                    <div class="top-left-corner1">
                        <div class="top-left-inside1" style="background-color: #ffffff; color: #336600">
                            •</div>
                    </div>
                    <div class="box-contents1" style="padding-bottom: 5px; padding-left: 3px; padding-right: 5px;
                        font-size: 10pt; font-weight: bold; padding-top: 3px; left: -37px; top: 0px;
                        width: 316px;">
                        <asp:Label ID="MenuLbl" runat="server">Register POD</asp:Label>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <div id="div1">
        <table>
            <tr>
                <td valign="top">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>        
                    <asp:Label ID="regLbl" runat="server" Visible="false" ForeColor="Blue"/><br />
                    <asp:Button ID="reassignBtn" runat="server" Text="Re-Assign" Visible="false" OnClick="reassignBtn_Clicked"/>
                </td>
                <td valign="top">
                    <table>
                        <tr>
                            <td valign="top" align="left">
                                <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <telerik:RadPivotGrid AllowPaging="true" PageSize="10" ID="RadPivotGrid2" runat="server"
                                    ColumnHeaderZoneText="ColumnHeaderZone" ShowColumnHeaderZone="false" ShowDataHeaderZone="false"
                                    ShowRowHeaderZone="true" ShowFilterHeaderZone="false" AllowSorting="true" AllowFiltering="false"
                                    Skin="Windows7" OnCellDataBound="RadPivotGrid2_CellDataBound" Width="50%">
                                    <ClientSettings EnableFieldsDragDrop="false">
                                        <Scrolling AllowVerticalScroll="false" SaveScrollPosition="true" />
                                    </ClientSettings>
                                    <Fields>
                                        <telerik:PivotGridRowField DataField="Date" ZoneIndex="0" CellStyle-Font-Bold="true"
                                            CellStyle-Width="100px">
                                        </telerik:PivotGridRowField>
                                        <telerik:PivotGridAggregateField DataField="Total" CalculationDataFields="ospodNull,ospodNotNull" CalculationExpression="{0}+{1}">
                                            <ColumnGrandTotalHeaderCellTemplate>
                                                <asp:Label ID="totalTripLbl" Text="Total" runat="server" />
                                            </ColumnGrandTotalHeaderCellTemplate>
                                        </telerik:PivotGridAggregateField>
                                    </Fields>
                                </telerik:RadPivotGrid>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
