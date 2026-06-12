<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobTripRegisterV3AddJBCtnr.aspx.cs" Inherits="iWMS.Web.Job.JobTripRegisterV3.JobTripRegisterV3AddJBCtnr" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JobTripRegisterV3</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Trip" Value="10" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Equipment" Value="50" runat="server" Visible="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0">
            <telerik:RadPageView runat="server" ID="TripRadPageView">
                <br />
                <table id="JobTrip" runat="server">
                    <tr>
                        <td>&nbsp;
                        <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddTripBtn_Click"
                            Text="Add" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="EquipmentRadPageView">
                <br />
                <table id="Table1" runat="server">
                    <tr>
                        <td>&nbsp;
                        <asp:Button ID="AddEqpBtn" class="white" runat="server" OnClick="AddEqpBtn_Click"
                            Text="Add" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
