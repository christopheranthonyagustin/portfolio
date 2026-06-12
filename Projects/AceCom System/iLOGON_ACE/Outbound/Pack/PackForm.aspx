<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="PackForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Pack.PackForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PackForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }
    </script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" SelectedIndex="0" CausesValidation="False"
            Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server"
                    Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Packing unit" Value="100" runat="server" >
                </telerik:RadTab>
                <telerik:RadTab Text="PackItem" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td><br />
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0"
            CssClass="pagetitle">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                &nbsp<asp:Button ID="UpdateBtn" runat="server" Text="Update" CssClass="white"
                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1">
                <iframe style="width: 100%; height: 100%" id="packUnitFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView2">
                <iframe style="width: 100%; height: 100%" id="packItemFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="700px" ID="RadPageLog"/>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
