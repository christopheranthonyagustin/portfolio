<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightImportEqpDetlUpload.aspx.cs" Inherits="iWMS.Web.Job.FreightImport.FreightImportEqpDetlUpload" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iForm" TagPrefix="iWMS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FreightImportEqpDetlUpload</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Pragma" content="no-cache">
    <style type="text/css">
        .style1 {
            height: 19px;
        }

        .DropZone1 {
            width: 200px;
            height: 90px;
            background-color: #F2F2F2;
            border-color: #CCCCCC;
            color: #767676;
            text-align: center;
            font-size: 16px;
            color: black;
            left: 5px;
            position: relative;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">        
            <tr>
                <td>                
                    <%--<telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />               
                    <asp:Label ID="lblnote" Text="Note : Only Excel files can be uploaded." runat="server"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />--%>
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2" AllowedFileExtensions=".xls,.xlsx">
                        <Localization Select="Select a File" />
                    </telerik:RadAsyncUpload>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="excelssDDL" runat="server" Visible="false" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>                                
                    &nbsp;&nbsp;
                    <asp:Button ID="uploadBtn" CssClass="white" runat="server" OnClick="UploadBtn_Click" Visible="true"  
                        Text="Upload" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"  />
                    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>

        <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td colspan="2">
                <div class="DropZone1">
                    <p>Drop Files Here</p>
                </div>
            </td>
        </tr>
    </table>

        <br />
        <div id="div-datagrid" style="height: 92%">
            <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" AutoGenerateColumns="true" BorderStyle="None" UseAccessibleHeader="True">
                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem"></ItemStyle>
                <HeaderStyle Wrap="False"></HeaderStyle>
            </asp:DataGrid>
        </div>
    </form>
</body>
</html>

