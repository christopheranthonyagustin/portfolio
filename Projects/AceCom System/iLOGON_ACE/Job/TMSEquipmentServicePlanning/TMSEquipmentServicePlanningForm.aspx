<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSEquipmentServicePlanningForm.aspx.cs" Inherits="iWMS.Web.Job.TMSEquipmentServicePlanning.TMSEquipmentServicePlanningForm" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TMS Equipment Service Planning Update</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <style>
        .DropZone1 {
            width: 180px;
            height: 120px;
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
        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:UpdatePanel runat="server" ID="UpdatePanel">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CloseBtn" class="white" runat="server" OnClick="CloseBtn_Click" Text="Close" CausesValidation="false"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td style="padding-right: 15px"></td>
                        <td>
                            <asp:Panel ID="FileUploadPanel" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" Text="Image Name"></asp:Label>
                                        </td>
                                        <td style="padding-right: 2px"></td>
                                        <td>
                                            <telerik:RadTextBox ID="ImageNameTxtBox" runat="server"></telerik:RadTextBox>
                                            <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" Text="File"></asp:Label>
                                        </td>
                                        <td style="padding-right: 2px"></td>
                                        <td>
                                            <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic"
                                                DropZones=".DropZone1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td style="padding-right: 2px"></td>
                                        <td>
                                            <asp:Button ID="UploadBtn" CssClass="white" runat="server" OnClick="UploadBtn_Click" Text="Upload"
                                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                                <table>
                                    <tr>
                                        <td>
                                            <div class="DropZone1">
                                                <p>
                                                    <br />
                                                    <br />
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
                                                            <td>&nbsp;
                                                                <asp:LinkButton ID="ImageDeleteLinkBtn" runat="server" CausesValidation="false" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                                    OnClick="ImageDeleteLinkBtn_Click" ForeColor="Red" Font-Size="Medium" Font-Underline="false" Font-Bold="true">X
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                                                <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                                            </asp:DataList>
                                            <br />
                                            <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="UpdateBtn" />
                <asp:PostBackTrigger ControlID="CloseBtn" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>

