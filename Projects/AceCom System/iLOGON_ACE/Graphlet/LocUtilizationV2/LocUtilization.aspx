<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocUtilization.aspx.cs"
    Inherits="iWMS.Web.Graphlet.LocUtilizationV2.LocUtilization" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <style type="text/css">
        .style2
        {
            width: 114px;
        }
        .style3
        {
            width: 13px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptMgr" runat="server" EnablePageMethods="true" />
    <table width="80%">
        <tr class="graytitle">
            <td>
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td class="style3">
                :
            </td>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Location Utilization</asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="Site" runat="server">Site</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="SiteLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="NowLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style2">
                SelectionCriteria
            </td>
            <td class="style3">
                :
            </td>
            <td>
                <asp:Label ID="SelectionCriteriaLbl" runat="server" CssClass="Graytitle"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <div>
        <telerik:RadHtmlChart runat="server" ID="PieChart1" Width="800" Height="500" Transitions="true"
            Skin="Silk">
            <%-- <ChartTitle Text="Location Utilization">
            </ChartTitle>--%>
            <PlotArea>
                <Series>
                    <telerik:PieSeries DataFieldY="Qty" ColorField="Color" ExplodeField="IsExploded"
                        Name="Label" NameField="Label" StartAngle="90">
                        <LabelsAppearance DataFormatString="{0}">
                            <ClientTemplate>
                               [#=value#]
                               #=Math.round(percentage *100)#% 
                            </ClientTemplate>
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" />
                    </telerik:PieSeries>
                </Series>
            </PlotArea>
            <Legend>
                <Appearance Position="Bottom">
                </Appearance>
            </Legend>
        </telerik:RadHtmlChart>
        <telerik:RadGrid ID="ResultRadGrid" runat="server" Skin="Office2007" OnNeedDataSource="ResultRadGrid_NeedDataSource"
            OnColumnCreated="ResultRadGrid_ColumnCreated" Width="70%">
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
