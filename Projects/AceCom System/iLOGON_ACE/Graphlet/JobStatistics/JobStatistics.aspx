<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobStatistics.aspx.cs"
    Inherits="iWMS.Web.Graphlet.JobStatistics.JobStatistics" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>JobStatistics.aspx</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
        <tbody>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataGrid ID="StatusDG" runat="server" CssClass="Content" BorderWidth="1px" ShowFooter="True"
                        AutoGenerateColumns="False" Width="300px" CellPadding="4" BorderColor="#3366CC"
                        BorderStyle="None" BackColor="White">
                        <SelectedItemStyle Font-Bold="True" ForeColor="#CCFF99" BackColor="#009999"></SelectedItemStyle>
                        <ItemStyle ForeColor="#003399" BackColor="White"></ItemStyle>
                        <HeaderStyle ForeColor="#CCCCFF" BackColor="#003399"></HeaderStyle>
                        <FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
                        <Columns>
                            <asp:BoundColumn DataField="JobDate" HeaderText="JobDate">
                                <HeaderStyle CssClass="HeaderStyle"></HeaderStyle>
                                <ItemStyle CssClass="ItemStyle"></ItemStyle>
                                <FooterStyle CssClass="FooterStyle"></FooterStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="TotalJob" HeaderText="TotalJob">
                                <HeaderStyle CssClass="HeaderStyleRight"></HeaderStyle>
                                <ItemStyle CssClass="ItemStyleRight"></ItemStyle>
                                <FooterStyle CssClass="FooterStyleRight"></FooterStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="TotalEqp" HeaderText="TotalEqp">
                                <HeaderStyle CssClass="HeaderStyleRight"></HeaderStyle>
                                <ItemStyle CssClass="ItemStyleRight"></ItemStyle>
                                <FooterStyle CssClass="FooterStyleRight"></FooterStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="TotalTrip" HeaderText="TotalTrip">
                                <HeaderStyle CssClass="HeaderStyleRight"></HeaderStyle>
                                <ItemStyle CssClass="ItemStyleRight"></ItemStyle>
                                <FooterStyle CssClass="FooterStyleRight"></FooterStyle>
                            </asp:BoundColumn>
                        </Columns>
                        <PagerStyle HorizontalAlign="Left" ForeColor="#003399" BackColor="#99CCCC" Mode="NumericPages">
                        </PagerStyle>
                    </asp:DataGrid>
                    <asp:Image ID="ChartImage" runat="server" Visible="False" BorderWidth="0"></asp:Image>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="white" OnClick="Submit_Click" />
    </form>
</body>
</html>
