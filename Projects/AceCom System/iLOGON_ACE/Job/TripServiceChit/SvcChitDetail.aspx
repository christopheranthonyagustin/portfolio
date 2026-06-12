<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SvcChitDetail.aspx.cs"
    Inherits="iWMS.Web.Job.TripServiceChit.ServiceChitDetail" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>RegisterServiceChit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <base target="_self" />
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
    <style type="text/css">
        .DropZone1 {
            width: 120px;
            height: 90px;
            background-color: #F2F2F2;
            border-color: #CCCCCC;
            color: #767676;
            text-align: center;
            font-size: 16px;
            color: black;
            left: 50px;
            position: relative;
        }
    </style>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body onload="javascript:window.focus();" bottommargin="0" leftmargin="0" topmargin="0"
    rightmargin="0">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellpadding="2" cellspacing="2" width="100%">
            <tr>
                <td valign="top">
                    <p>
                        <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="true" CssClass="detailButton"
                            OnClick="UpdateBtn_Click" OnClientClick="if (!Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Processing...';"
                            UseSubmitBehavior="False"></asp:Button>
                        <br />
                        <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label><br>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </p>
                </td>
                <td valign="top">
                    <table border="0" cellpadding="2" cellspacing="2" width="100%">
                        <tr>
                            <td valign="top">
                                <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" BorderStyle="None" AutoGenerateColumns="false"
                                    UseAccessibleHeader="True" ShowHeader="false" Visible="true" Font-Size="Medium">
                                    <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                    <ItemStyle CssClass="DGItem"></ItemStyle>
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <Columns>
                                        <asp:BoundColumn DataField="value"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="empty" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                    </Columns>
                                </asp:DataGrid>
                            </td>
                        </tr>
                        <tr>
                            <td valign="middle" align="left">
                                <asp:Label ID="incentiveLbl" runat="server" Font-Bold="true" Font-Size="60pt"></asp:Label>
                                <!-- Store the OT details here -->
                                <asp:Label ID="FirstTripAmtLbl" runat="server" Visible="false" />
                                <asp:Label ID="OTAmtLbl" runat="server" Visible="false" />
                                <asp:Label ID="ExtraChargeLbl" runat="server" Visible="false" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="middle" align="center">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:Panel ID="FileUploadPanel" runat="server">
                                                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                                                    <tr>
                                                        <td width="20%">Image Name
                                                        </td>
                                                        <td>
                                                            <input id="ImageName" name="ImageName" runat="server" />&nbsp;
                                                        <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>File
                                                        </td>
                                                        <td>
                                                            <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic"
                                                                DropZones=".DropZone1,#DropZone2" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>
                                                            <input id="ImageSubmit" class="detailbutton" value="Upload" type="submit" runat="server"
                                                                onserverclick="ImageSubmit_ServerClick" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="middle" align="left">
                                <div class="DropZone1">
                                    <p>
                                        Drop Files Here
                                    </p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataList ID="ImageDataList" runat="server" RepeatColumns="0" DataKeyField="id"
                                    BorderColor="#999999" BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical"
                                    BorderWidth="1px" RepeatDirection="Vertical">
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
                                                <td align="right">&nbsp;
                                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                        OnClick="JobImageDelete" Style="color: red" ForeColor="Red" Font-Size="Medium" Font-Underline="false" Font-Bold="true">X
                                                  <%--  <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Image"
                                                        runat="server" />--%></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                                    <%--<SeparatorTemplate>
								        |
							        </SeparatorTemplate>--%>
                                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                                </asp:DataList>
                                <br />
                                <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label>
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
