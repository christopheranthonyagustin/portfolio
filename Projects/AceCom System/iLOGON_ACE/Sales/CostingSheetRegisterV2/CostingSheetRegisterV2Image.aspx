<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetRegisterV2Image.aspx.cs" Inherits="iWMS.Web.Sales.CostingSheetRegisterV2.CostingSheetRegisterV2Image" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CostingSheetImage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <meta http-equiv="Pragma" content="no-cache">
    <style type="text/css">
        .style1 {
            width: 294px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td>
                    <br />
                    <asp:Button ID="ImageSubmit" runat="server" Text="Add" OnClick="ImageSubmit_ServerClick" Visible="True"
                        CssClass="white" />
                    &nbsp;
                    <asp:Button ID="BackButton" runat="server" Text="ShowAll" OnClick="BackButton_Click" Visible="True"
                        CssClass="white" CausesValidation="false" />
                    <br>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label><br>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="FileUploadPanel" runat="server">
                        <table border="0" cellspacing="2" cellpadding="2" width="100%">
                            <tr>
                                <td class="style1">Type<br />
                                    <telerik:RadDropDownList ID="Type" runat="server" Enabled="True" DataTextField="Descr" AutoPostBack="true"
                                        DataValueField="item" Width="138px" Skin="WebBlue">
                                    </telerik:RadDropDownList>

                                </td>
                                <td>Status<br />
                                    <telerik:RadDropDownList ID="ImageStatus" runat="server" Enabled="true" DataTextField="Descr" AutoPostBack="true"
                                        DataValueField="item" Width="138px" Skin="WebBlue">
                                    </telerik:RadDropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">AttachmentName<br />
                                    <telerik:RadTextBox ID="ImageName" runat="server">
                                    </telerik:RadTextBox>
                                    &nbsp;
                                <telerik:RadLabel ID="MessageLbl" runat="server" CssClass="errorLabel">
                                </telerik:RadLabel>
                                </td>
                                <td>
                                    <telerik:RadLabel ID="FileLbl" runat="server" Text="File">
                                    </telerik:RadLabel>
                                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic" />
                                </td>
                            </tr>
                            <input id="ImageNameNA" runat="server" name="ImageName" visible="false" />
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
