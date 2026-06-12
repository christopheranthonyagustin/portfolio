<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManpowerPlanningDetail.aspx.cs"
    Inherits="iWMS.Web.Job.ManpowerPlanning.ManpowerPlanningDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<html>
<head id="Head1" runat="server">
    <title>ManpowerPlanningDetail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function() {
                $(".show_hide_Detail").slideToggle();
            });
        });
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header" align="center">
        <asp:Label ID="lblText" Text=" Hide / Show Search Filters" runat="server" />
    </asp:Panel>
    <div class="show_hide_Detail">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td class="style2"><br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td>
                    &nbsp;<asp:Button Style="z-index: 0" ID="refreshBtn" runat="server" CssClass="white"
                        Text="Refresh" OnClick="refreshBtn_Click"></asp:Button>
                    <br />
                    &nbsp;
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </div>
    <div id="div-datagrid" style="height: 95%">
        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" BorderStyle="None"
            GridLines="Both" UseAccessibleHeader="True" HorizontalAlign="Center">
            <AlternatingItemStyle CssClass="DGItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGAlternateItem"></ItemStyle>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
