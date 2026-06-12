<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobTripRegisterV3PODInfo.aspx.cs" Inherits="iWMS.Web.Job.JobTripRegisterV3.JobTripRegisterV3PODInfo" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title id="JTListTitle" runat="server">JobTripRegisterV3 PODInfo</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body id="main-content">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="table" width="100%">
            <tr>
                <br />
              <asp:Panel ID="LabelPanel" runat="server">
                <asp:Label ID="StatusLbl" runat="server" CssClass="pagetitle" Text="Current Status - "></asp:Label>
                <asp:Label ID="Status" runat="server" CssClass="pagetitle" ></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                
                <asp:Label ID="FractdateLbl" runat="server" CssClass="pagetitle" Text="Started At - " Visible="false"></asp:Label>
                <asp:Label ID="Fractdate" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Label ID="ToactdateLbl" runat="server" CssClass="pagetitle" Text="Completed At - " Visible="false"></asp:Label>
                <asp:Label ID="Toactdate" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>
               </asp:Panel>
            </tr>
            <br />
            <tr>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </tr>
            <tr>
            <td colspan="2">
                <br /><br />
                 <asp:Label ID="PODattcId" runat="server" CssClass="pagetitle">POD Attc</asp:Label><br><br />
                    <asp:DataList ID="ImageDataList" runat="server" RepeatColumns="0" DataKeyField="id" OnItemDataBound="ImageDataList_ItemDataBound1"
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
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>                      
                        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                    </asp:DataList><br>
                      
                    <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label><br>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
