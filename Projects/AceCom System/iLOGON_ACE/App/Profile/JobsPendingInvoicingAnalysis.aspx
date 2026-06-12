<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobsPendingInvoicingAnalysis.aspx.cs"
    Inherits="iWMS.Web.App.Profile.JobsPendingInvoicingAnalysis" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AccountStorageStats</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Jobs Pending Invoicing Analysis</asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="Label1" runat="server">Last refresh</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="LastRefreshLbl" runat="server" CssClass="Graytitle"></asp:Label>                
                <asp:Label ID="lblProcessID" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table><br /><br />
    <asp:label runat="server" Text="Job Completed, Charge Sheet not printed" Font-Bold="true" Font-Size="20px"></asp:label>
    <br />
    <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="None" AutoGenerateColumns="false"
        BorderStyle="Solid" Skin="Office2007" ShowFooter="True" OnItemDataBound="ResultRadGrid_ItemDataBound" >
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <AlternatingItemStyle Wrap="true" Font-Size="20px" Font-Bold="true" HorizontalAlign="Right"></AlternatingItemStyle>
        <ItemStyle Wrap="true" Font-Size="20px" Font-Bold="true" HorizontalAlign="Right"></ItemStyle>
        <FooterStyle Wrap="true" Font-Size="20px" Font-Bold="true" HorizontalAlign="Right"></FooterStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" TableLayout="Fixed" Name="Master">
            <Columns>                
                <telerik:GridBoundColumn HeaderText="Source" DataField="type" FooterText="Total" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TotalJob" DataField="totaljob" Aggregate="Sum" FooterText=" " DataFormatString="{0:N0}" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="0-7" DataField="0-7" Aggregate="Sum" FooterText=" " DataFormatString="{0:N0}" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="8-14" DataField="8-14" Aggregate="Sum" FooterText=" " DataFormatString="{0:N0}" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="15-30" DataField="15-30" Aggregate="Sum" FooterText=" " DataFormatString="{0:N0}" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText=">30" DataField=">30" Aggregate="Sum" FooterText=" " DataFormatString="{0:N0}" >
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <br />
    <asp:label runat="server" Text="Charge Sheet printed, not invoiced" Font-Bold="true" Font-Size="20px"></asp:label>
    <br />
    <telerik:RadGrid ID="RadGrid1" runat="server" GridLines="None" AutoGenerateColumns="false"
        BorderStyle="Solid" Skin="Office2007" ShowFooter="True" >
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <AlternatingItemStyle Wrap="true" Font-Size="20px" Font-Bold="true" HorizontalAlign="Right"></AlternatingItemStyle>
        <ItemStyle Wrap="true" Font-Size="20px" Font-Bold="true" HorizontalAlign="Right"></ItemStyle>
        <FooterStyle Wrap="true" Font-Size="20px" Font-Bold="true" HorizontalAlign="Right"></FooterStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" TableLayout="Fixed" Name="Master">
            <Columns>
                <telerik:GridBoundColumn HeaderText="Source" DataField="type" FooterText="Total" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TotalJob" DataField="totaljob" Aggregate="Sum" FooterText=" "  DataFormatString="{0:N0}" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="0-7" DataField="0-7" Aggregate="Sum" FooterText=" "  DataFormatString="{0:N0}" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="8-14" DataField="8-14" Aggregate="Sum" FooterText=" "  DataFormatString="{0:N0}" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="15-30" DataField="15-30" Aggregate="Sum" FooterText=" "  DataFormatString="{0:N0}" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText=">30" DataField=">30" Aggregate="Sum" FooterText=" "  DataFormatString="{0:N0}" >
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
