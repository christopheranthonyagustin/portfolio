<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResourceUtiliseSummary.aspx.cs"
    Inherits="iWMS.Web.Graphlet.General.ResourceUtiliseSummary" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="title1" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
        <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    </meta>
    <style type="text/css">
        .style2
        {
            width: 125px;
        }
    </style>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <script type="text/javascript">
        function popupDetail(id) {
            if (id.toString().trim() != "0")
                window.showModalDialog("TripDetail2.aspx?id=" + id, "myWindow", "dialogWidth:1400px;dialogHeight:800px;status:no;dialogHide:true;help:no;scroll:yes;resizable=yes;")
        }

        $(document).ready(function() {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function() {
                $(".show_hide_Detail").slideToggle();
            });
        });
    </script>

</head>
<body id="bdy" bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" runat="server">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td class="style1">
                <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs
                    ID="MenuTabs" runat="server"></iWMS:Tabs>
                </a>
            </td>
            <td class="NewModuleTitle" align="right">
                        <asp:Label ID="MenuLbl" runat="server">Resource Utilization Summary</asp:Label>
            </td>
        </tr>
    </table>
    <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header" align="center">
        <asp:Label ID="lblText" Text=" Hide / Show Search Filters" runat="server" />
        <asp:Label ID="lblProcessID" runat="server" Visible="False"></asp:Label>
    </asp:Panel>
    <div id="div1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td class="style2"><br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="30%">
                                <asp:Button Style="z-index: 0" ID="refreshBtn" runat="server" CssClass="white"
                                    Text="Refresh" OnClick="refreshBtn_Click"></asp:Button>
                                &nbsp;&nbsp;&nbsp;
                                <asp:Label ID="LastLbl" runat="server">Last refresh</asp:Label>:
                                <asp:Label ID="LastRefreshLbl" runat="server"></asp:Label>
                                <br />
                                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                                    Visible="False"></asp:Label>
                            </td>
                            <%--<td width="40%">
                              <asp:Button ID="ExcelBtn" runat="server" Text="Excel" Visible="false" CssClass="detailButton" OnClick="ExcelBtn_Click"></asp:Button>
                            </td>--%>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <table id="resultTable" runat="server" cellspacing="0" cellpadding="0" width="100%"
        border="0">
        <tr>
            <td>
                <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle" Text="Vehicle Utilization Summary"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DataGrid ID="ResultVehDG" runat="server" GridLines="Both" CellPadding="2" AutoGenerateColumns="false"
                    AllowSorting="False" UseAccessibleHeader="True" OnItemDataBound="ResultVehDG_ItemDataBound">
                    <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem"></ItemStyle>
                    <Columns>
                        <asp:BoundColumn DataField="item" HeaderText="item" Visible="false"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Opsunit" HeaderText="Opsunit"></asp:BoundColumn>
                        <asp:BoundColumn DataField="WithJob" HeaderText="WithJob"></asp:BoundColumn>
                        <asp:BoundColumn DataField="WithoutJob" HeaderText="WithoutJob"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Total" HeaderText="Total"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Off" HeaderText="Off"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Utilisation%" HeaderText="Utilisation%"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:Label ID="Label1" runat="server" CssClass="pagetitle" Text="Personnel Utilization Summary"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DataGrid ID="ResultPerDG" runat="server" GridLines="Both" CellPadding="2" AutoGenerateColumns="false"
                    AllowSorting="False" UseAccessibleHeader="True" OnItemDataBound="ResultPerDG_ItemDataBound">
                    <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem"></ItemStyle>
                    <Columns>
                        <asp:BoundColumn DataField="item" HeaderText="item" Visible="false"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Dept" HeaderText="Dept"></asp:BoundColumn>
                        <asp:BoundColumn DataField="WithJob" HeaderText="WithJob"></asp:BoundColumn>
                        <asp:BoundColumn DataField="WithoutJob" HeaderText="WithoutJob"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Total" HeaderText="Total"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Absent" HeaderText="Absent"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Utilisation%" HeaderText="Utilisation%"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
