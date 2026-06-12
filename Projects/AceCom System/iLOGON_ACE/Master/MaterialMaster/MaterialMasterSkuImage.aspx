<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialMasterSkuImage.aspx.cs" Inherits="iWMS.Web.Master.MaterialMaster.MaterialMasterSkuImage" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>MaterialMasterSkuImage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
     <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
     <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <meta http-equiv="Pragma" content="no-cache">
    <style type="text/css">
        .style1
        {
            height: 19px;
        }
        .DropZone1
        {
            width: 200px;
            height: 90px;
            background-color: #F2F2F2;
            color: #767676;
            text-align: center;
            font-size: 16px;
            color: black;
            left: 5px;
            position: relative;
            border: 1px solid LIGHTSTEELBLUE ;
        }
    </style>

    <script language="javascript" type="text/javascript">
// <!CDATA[

function ImageSubmit_onclick() {

}

// ]]>
    </script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td style="padding-top: 10px;">
                <asp:DataList ID="ImageDataList" runat="server" RepeatColumns="0" DataKeyField="id"
                    BorderColor="#999999" BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical"
                    BorderWidth="1px" RepeatDirection="Horizontal">
                    <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
                    <AlternatingItemStyle BackColor="#DCDCDC"></AlternatingItemStyle>
                    <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="ImageLbl" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="ImageDescrLbl" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="ImageTypeSizeLbl" runat="server"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                        OnClick="SkuImageDelete">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Image"
                                            runat="server"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                </asp:DataList>
                <br>&nbsp;
                <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label><br>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="FileUploadPanel" runat="server" Style="padding-left: 10px;">
                    <table border="0" cellspacing="2" cellpadding="2" width="100%">
                        <tr>
                            <td colspan="2">
                                <iwms:iform id="formCtl" runat="server"></iwms:iform>
                            </td>
                            <td valign="top">
                                &nbsp;
                            </td>                            
                            <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </tr>                       
                        <tr>
                            <td>
                                <br />
                                <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                                     HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2">
                                    <Localization Select="Select a File" />
                                </telerik:RadAsyncUpload>
                            </td>
                        </tr>
                        <tr>                         
                            <td>                               
                                <br />
                                <br />
                                &nbsp;&nbsp;                               
                                <asp:Button ID="ImageSubmit" runat="server" Text=" Upload  " OnClick="ImageSubmit_ServerClick" 
                                    CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" >
                </asp:Button>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    </form>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td>
                <div class="DropZone1" style="margin-left: 15px; margin-top: 5px;">
                    <p>
                        Drop Files Here</p>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>

