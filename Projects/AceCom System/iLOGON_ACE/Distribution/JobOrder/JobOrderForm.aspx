<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobOrderForm.aspx.cs" Inherits="iWMS.Web.Distribution.JobOrder.JobOrderForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Form @ Job Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <script type="text/javascript">
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" CausesValidation="false" Skin="Windows7">

            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="CustInfoTab" Text="CustInfo" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ItemTab" Text="Item" Value="75" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="SurveyTab" Text="Survey" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attachment" Value="125" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
                <br />
<%--                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>--%>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh" OnClick="RefreshBtn_Click"
                                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                        OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="ViewingConfirmBtn" runat="server" CssClass="LongLabelWhite" Text="Viewing Confirm" OnClick="ViewingConfirmBtn_Click"
                                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="JobOrderConfirmBtn" runat="server" CssClass="LongLabelWhite" Text="Job Order Confirm" OnClick="JobOrderConfirmBtn_Click"
                                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="ReopenBtn" runat="server" CssClass="LongLabelWhite" Text="Reopen" OnClick="ReopenBtn_Click"
                                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                    
                                    <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>                                
                            </tr>
                        </table>

<%--                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="UpdateBtn" />
                    </Triggers>
                </asp:UpdatePanel>--%>


            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="CustInfoRadPageView">
                <br />
                <asp:Button ID="UpdateBtn2" CssClass="white" runat="server" OnClick="UpdateBtn2_Click" Visible="true"
                    Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Update" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="ItemRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="SurveyRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="AttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
