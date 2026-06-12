<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportDownloadPOD.aspx.cs"
    Inherits="iWMS.Web.Job.Transporter2.TransportDownloadPOD" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>DownloadPOD</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .style1 {
            width: 7%;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="DownloadPOD" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                    <tr>
                        <td>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="60%">
                                <tr>
                                    <td width="12%">JobType
                                    </td>
                                    <td width="25%">
                                        <asp:ListBox ID="AvailJobTypeList" runat="server" Rows="10" SelectionMode="Multiple"
                                            Width="100%" />
                                    </td>
                                    <td width="10%" align="center">
                                        <br />
                                        <br />
                                        <asp:Button ID="SelectBtn" runat="server" CssClass="detailbutton" OnClick="SelectBtn_Click"
                                            Text=" >> " />
                                        <br />
                                        <br />
                                        <asp:Button ID="RemoveBtn" runat="server" CssClass="detailbutton" OnClick="RemoveBtn_Click"
                                            Text=" << " />
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                    <td width="25%">
                                        <asp:ListBox ID="SelectedJobTypeList" runat="server" Rows="10" SelectionMode="Multiple"
                                            Width="90%" Style="background-color: Yellow;" />
                                    </td>
                                    <td width="28%"></td>
                                </tr>
                                <tr>
                                    <td style="height: 5px" colspan="5">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="12%">TransportType
                                    </td>
                                    <td width="25%">
                                        <asp:ListBox ID="AvailTptTypeList" runat="server" Rows="10" SelectionMode="Multiple" Width="100%" />
                                    </td>
                                    <td width="10%" align="center">
                                        <br />
                                        <br />
                                        <asp:Button ID="SelectBtn2" runat="server" CssClass="detailbutton" OnClick="SelectBtn2_Click"
                                            Text=" >> " />
                                        <br />
                                        <br />
                                        <asp:Button ID="RemoveBtn2" runat="server" CssClass="detailbutton" OnClick="RemoveBtn2_Click"
                                            Text=" << " />
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                    <td width="25%">
                                        <asp:ListBox ID="SelectedTptTypeList" runat="server" Rows="10" SelectionMode="Multiple" Width="90%"
                                            Style="background-color: Yellow;" />
                                    </td>
                                    <td width="28%"></td>
                                </tr>
                                <tr>
                                    <td style="height: 5px" colspan="5">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="12%">&nbsp;
                                    </td>
                                    <td colspan="4">
                                        <asp:Button ID="downloadPOD_Btn" Text=" DOWNLOAD POD " runat="server" OnClick="downloadPOD_Click" />
                                        &nbsp;&nbsp;&nbsp;
                            <br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
