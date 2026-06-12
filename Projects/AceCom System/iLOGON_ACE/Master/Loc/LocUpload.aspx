<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocUpload.aspx.cs" Inherits="iWMS.Web.Master.Loc.LocUpload" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<html>
<head id="Head1" runat="server">
    <title>UploadLocation</title>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
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
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="3600" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Upload" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
                <br />
                <br />
                <asp:UpdatePanel ID="UpdButton" runat="server">
                    <ContentTemplate>
                        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                            <tr>
                                <td style="width: 20px;">
                                    <asp:Label ID="excelLbl" runat="server">File Location:</asp:Label>
                                </td>
                                <td>
                                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50px;"></td>
                                <td style="width: 50px;">
                                    <asp:Label ID="lblnote" Text="Note : Only Microsoft Excel files can be Uploaded."
                                        runat="server"></asp:Label><br />
                                    <br />
                                    <asp:Label ID="summaryLbl" runat="server" ForeColor="#ff0000"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="excelssDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="excelssDDL_SelectedIndexChanged"
                                        Visible="false" />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <asp:Label ID="lblErrRetrieve" CssClass="BlackText" runat="server" Visible="False"
                                        ForeColor="#ff0000"></asp:Label><br>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="uploadBtn" CssClass="white" runat="server" OnClick="uploadBtn_Click" Text="Upload" />
                                    <br />
                                    <%--Message popup area start--%>
                                    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
                                    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
                                        TargetControlID="btnMessagePopupTargetButton"
                                        BackgroundCssClass="MessageBoxPopupBackground">
                                    </ajaxToolkit:ModalPopupExtender>
                                    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
                                        DefaultButton="btnOk">
                                        <div class="popupHeader" style="width: 420px;">
                                            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
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
                                                                <asp:Button ID="btnOk" runat="server" Style="text-decoration: none;" Text="Okay" OnClick="OkayBtn_Click" CssClass="white" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <%--Message popup area end--%>
                                    <%--Message popup 2 area start For Confirm Message Box--%>
                                    <asp:Button runat="server" ID="PopupTargetButton" Style="display: none;" />
                                    <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup" runat="server" PopupControlID="ConfrimMessagePanel"
                                        TargetControlID="PopupTargetButton" BackgroundCssClass="MessageBoxPopupBackground">
                                    </ajaxToolkit:ModalPopupExtender>
                                    <asp:Panel runat="server" ID="ConfrimMessagePanel" BackColor="White" Width="420"
                                        Style="display: none; border: 2px solid #780606;" DefaultButton="btnOk">
                                        <div class="popupHeader" style="width: 420px;">
                                            <asp:Label ID="ConfrimMsg" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                                        </div>
                                        <div id="Div1" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                                            <div style="float: left; width: 380px; margin: 20px;">
                                                <table id="ConfirmTb" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                                                    <tr>
                                                        <td style="text-align: left; vertical-align: top; width: 11%;">
                                                            <asp:Literal ID="ltrConfirmImge" runat="server"></asp:Literal>
                                                        </td>
                                                        <td style="width: 2%;"></td>
                                                        <td style="text-align: left; vertical-align: top; width: 87%;">
                                                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                                                <asp:Label ID="popupConfrimMsgType" runat="server" Text=""></asp:Label>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; vertical-align: top;" colspan="3">
                                                            <div style="margin-right: 0px; float: right; width: auto;">
                                                                &nbsp;&nbsp;&nbsp;<asp:Button ID="ConfirmYesBtn" runat="server" Text="Okay" OnClick="ConfirmYesBtn_Click" CssClass="white" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <%--Message popup 2 area end--%>
                                    <asp:Label ID="lblErrUpload" CssClass="BlackText" runat="server" Visible="False"
                                        ForeColor="#FF0000">Please fill in all information before clicking upload.</asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div id="div-datagrid" style="height: 92%">
                            <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                                OnNeedDataSource="ResultDG_NeedDataSource"
                                ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top"
                                AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
                                GridLines="Both">
                                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                                <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                                <ClientSettings>
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                                <MasterTableView AllowMultiColumnSorting="true">
                                    <Columns>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <asp:UpdateProgress ID="updateProgress" runat="server">
                    <ProgressTemplate>
                        <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                        </div>
                        <div id="LoaderPopup">
                            <a id="loader"></a>
                            <a id="text">We are processing your request ...</a>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
