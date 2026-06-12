<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookDetlUpload.aspx.cs" Inherits="iWMS.Web.Job.CashBookPV2.CashBookDetlUpload" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cash Book Detail Upload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
     <style type="text/css"> 
        .DropZone1{
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
    <form id="Form1" method="post" runat="server" style="z-index: 0">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server" style="float:left">            
            <tr>
                <td>
                    <iWMS:iform ID="formCtl" runat="server"></iWMS:iform>
                </td>
            </tr>
             <tr>
                <td>                                  
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2">
                        <Localization Select="Select a File" />
                    </telerik:RadAsyncUpload>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="DropZone1" style="margin-left: 15px; margin-top: 5px;">
                        <p>Drop Files Here</p>
                    </div>
                </td>
            </tr>
             <tr>
                <td class="style1">&nbsp;
                <asp:DropDownList ID="excelssDDL" runat="server" Visible="false" />
                </td>
            </tr>
             <tr>
                <td>
                    <br />
                    <br />
                    &nbsp;&nbsp;   
                    <asp:Button ID="UploadBtn" runat="server" Text="Upload" CssClass="white" OnClick="UploadBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
                </td>
            </tr>
        </table>
        <table style="float:left; margin-left:-75%">
            <tr>
                 <td>
                    <asp:ImageButton runat="server" ID="DownloadExcelImgBtn" ImageUrl="../../image/Excel_file.png"
                        BorderWidth="0" BackColor="Transparent" Width="50" Height="50" AlternateText="DownLoad Excel"
                        OnClick="DownloadExcelImgBtn_Click" CausesValidation="False" ToolTip="DownLoad Excel"></asp:ImageButton>
                </td>
            </tr>
        </table>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
