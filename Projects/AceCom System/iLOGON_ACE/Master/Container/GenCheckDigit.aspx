<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenCheckDigit.aspx.cs"
    Inherits="iWMS.Web.Master.Container.GenCheckDigit" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GenCheckDigit</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="GenCheckDigit" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
                <table width="100%">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            <br />
                            <br />
                            &nbsp;
                <asp:Button ID="generateBtn" CssClass="white" runat="server" OnClick="generateBtn_Click"
                    Text="Generate" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">&nbsp;Check-Digit
                <br />
                            &nbsp;<telerik:RadTextBox ID="txtdigit" runat="server" Skin="Sunset">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;Base-No + Check-Digit
                <br />
                            &nbsp;<telerik:RadTextBox ID="txtbaseAnddigit" runat="server" Skin="Sunset">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
