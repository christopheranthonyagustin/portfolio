<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerVoidSvcChitForm.aspx.cs"
    Inherits="iWMS.Web.Master.PerVoidSvcChit.PerVoidSvcChitForm" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>PerVoidServiceChit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        &nbsp;
        <asp:Label ID="IdLbl"
            runat="server" CssClass="pagetitle" />
        <br />
        <br />
        &nbsp<telerik:RadButton ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailButton" Skin="WebBlue"
            Style="z-index: 0" OnClick="UpdateBtn_Click">
        </telerik:RadButton>
        <br />
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td><br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    <table id="table2" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                        <tr>
                            <td colspan="2">
                                <telerik:RadLabel ID="ImageLbl" runat="server"></telerik:RadLabel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadLabel ID="ImageDescrLbl" runat="server"></telerik:RadLabel>
                            </td>
                        </tr>
                    </table>
                    <telerik:RadLabel ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</telerik:RadLabel>
                    <br>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadLabel ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></telerik:RadLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="FileUploadPanel" runat="server">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%">
                            <tr>
                                <td width="150px">
                                    <asp:CheckBox ID="ReAttachedChkBox" runat="server" Checked="False" Style="z-index: 0"
                                        Text="Re-Attach" AutoPostBack="true" OnCheckedChanged="ReAttachedChkBox_CheckedChanged" />
                                </td>
                                <td>
                                    <telerik:RadLabel ID="FileLbl" runat="server" Text="File" Visible="false"></telerik:RadLabel>
                                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic" Visible="false" />
                                    <%--<input id="ImageFile" type="file" name="ImageFile" visible="false" runat="server" />--%>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
