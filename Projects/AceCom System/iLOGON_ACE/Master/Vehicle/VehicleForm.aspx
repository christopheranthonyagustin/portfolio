<%@ Page Language="c#" CodeBehind="VehicleForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Vehicle.VehicleForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>VehicleDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .style1 {
            height: 85px;
        }
    </style>
</head>
<body onload='displayRow("table1");' topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Vehicle" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Crane" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="VehDocket" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="PerDocket" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="VehDocketExpired" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="PerDocketExpired" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="ServicePt" Value="350" runat="server">
                </telerik:RadTab>
                <%--//Added by Edho #5848 22/Jul/2019 pt. 8 --%>
                <telerik:RadTab Text="GeoPosition" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="AssignedUser" Value="450" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="400" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td><br />&nbsp<asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="VehicleRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" Visible="False" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id,true)"></asp:Button>
                            <br />
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td valign="top" align="center">
                            <asp:Image ID="Personnelimg" runat="server" ImageAlign="Top" Width="130px" Height="180" />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="CraneRadPageView">
                <br />
                &nbsp;<%--<asp:Button ID="UpdateBtnCrane" runat="server" Text="Update" Visible="False"
                CssClass="detailButton" OnClick="UpdateBtn_Click"></asp:Button>--%>
                <asp:Button ID="UpdateBtnCrane" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" Visible="False" UseSubmitBehavior="true"></asp:Button>
                <br />
                <br />
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="VehDocketRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="PerDocketRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="VehDocketExpiredRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="PerDocketExpiredRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ServicePtRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LongLatRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="420px" ID="AssignedUserRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
