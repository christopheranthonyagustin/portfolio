<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerVoidSvcChitAdd.aspx.cs"
    Inherits="iWMS.Web.Master.PerVoidSvcChit.PerVoidSvcChitAdd" %>
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
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
    &nbsp<telerik:RadButton ID="AddBtn" runat="server" CssClass="detailButton" Text="   Add   " Skin ="WebBlue"
        OnClick="AddBtn_Click"></telerik:RadButton><br>
    <br />
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <%--<tr>
            <td>
                <input id="tab1" style="cursor: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
                    value="Main Info" runat="server" />&nbsp;&nbsp;&nbsp;
            </td>
        </tr>--%>
        <tr >
            <td>
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
                 <telerik:RadLabel ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</telerik:RadLabel><br>
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
                            <td>
                                <telerik:RadLabel ID="FileLbl" runat ="server" Text ="File"></telerik:RadLabel>
                              <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic"
                                />
                                <%--<input id="ImageFile" type="file" name="ImageFile" visible="false" runat="server" />--%>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    &nbsp;<br />
    <br />
   <%-- <iframe id="incidentDetlPackFrame" style="width: 95%; height: 45%" marginheight="0"
        frameborder="no" marginwidth="0" runat="server" visible="false"></iframe>--%>
    </form>
</body>
</html>
