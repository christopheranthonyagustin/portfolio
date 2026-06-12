<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Page Language="c#" CodeBehind="ReceiptForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.ReceiptForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>


<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReceiptForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <script language="javascript" type="text/javascript">      

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>



    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>
    <script language="javascript" type="text/javascript">
        function closepopup() {
            $find('ModalPopupExtender1').hide();
        }

    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
         <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <asp:HiddenField ID="txtconformmessageValue" runat="server" /> 

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
            AutoPostBack="true" SelectedIndex="0" CausesValidation="false" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Shipping" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Parties" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="SKULine" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="TUSumm" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Charge" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Container" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Task" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="InvHistory" Value="450" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attachment" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Notify" Value="550" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="600" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Upload" Value="650" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="UploadSNo" Value="700" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <table>
            <tr>
                <td>
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                &nbsp;&nbsp;
                <td>
                    <telerik:RadMenu ID="RadMenu1" runat="server" ClickToOpen="true" ExpandAnimation-Type="None">
                        <Items>
                            <telerik:RadMenuItem Text="Print">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
            </tr>
        </table>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainRadPageView">
                <br />
                &nbsp;
            <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
                Text="Update" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" ToolTip="Update" />
                &nbsp;
            &nbsp;
            <asp:Button ID="GenIssueBtn" runat="server" Text="Generate GI" CssClass="detailButton"
                Style="z-index: 0" OnClick="GenIssueBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ></asp:Button>

                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ShipmentRadPageView">
                <br />
            <asp:Button ID="UpdateBtn2" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
                Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Update" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="PartiesRadPageView">
                <br />
            <asp:Button ID="UpdateBtn3" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
                Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Update" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="800px" ID="SKULineRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="TUSummRadPageView" />
            <telerik:RadPageView runat="server" Height="600px" ID="ChargesRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="TaskRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="InvHistoryRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="NotifyRadPageView">
                <br />
                &nbsp;
            <asp:Button ID="UpdateBtn5" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
                Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Update" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl5" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="UploadRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="UploadSNoRadPageView" />
        </telerik:RadMultiPage>

         <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajax:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajax:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>

    </form>
</body>
</html>
