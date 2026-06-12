<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="PerAbsentForm.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.PerAbsent.PerAbsentForm" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PerAbsent</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
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
    <style type="text/css">
        .style1 {
            width: 1050px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table id="table1" width="100%" border="0" runat="server">
                    <tr>
                        <td colspan="2" class="style1"><br />&nbsp;
                            <telerik:RadLabel ID="IdLbl" runat="server" CssClass="pagetitle"></telerik:RadLabel>
                            <br />
                            <br />
                            &nbsp
                  <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Visible="true"
                      Text="Update" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" ToolTip="Update" />

                            &nbsp
                            <telerik:RadLabel Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                                Visible="False">
                            </telerik:RadLabel>
                            <br />
                            <br />
                            <table>
                                <tr>
                                    <td valign="top">
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </td>
                                    <td valign="top" align="center">
                                        <asp:Image ID="Personnelimg" runat="server" ImageAlign="Top" Width="130px" Height="180" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <%--Message popup area start--%>
                <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
                <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
                    TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
                    BackgroundCssClass="MessageBoxPopupBackground">
                </ajaxToolkit:ModalPopupExtender>
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
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
