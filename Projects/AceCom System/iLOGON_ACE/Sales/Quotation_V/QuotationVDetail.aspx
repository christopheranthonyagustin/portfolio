<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuotationVDetail.aspx.cs"
    Inherits="iWMS.Web.Sales.Quotation_V.QuotationVDetail" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>VendorQuotationDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
            left: 30px;
            position: relative;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <table>
            <tr>
                <td>
             <%--       <telerik:RadButton Skin="WebBlue" Style="z-index: 0" ID="SaveNextBtn" runat="server"
                        CssClass="detailButton" Text="Save &amp; Next" Visible="False" OnClick="SaveNextBtn_Click">
                    </telerik:RadButton>--%>
                          <asp:Button ID="SaveNextBtn" runat="server" Text="SaveNext" OnClick="SaveNextBtn_Click" Visible="False"
                            OnClientClick="disableBtn(this.id,true)" CssClass="white" ToolTip="Save &amp; Next" UseSubmitBehavior="false" />
                    &nbsp;
             <%--   <telerik:RadButton Skin="WebBlue" Style="z-index: 0" ID="SaveBtn" runat="server"
                    CssClass="detailButton" Text="Save" Visible="False" OnClick="SaveBtn_Click">
                </telerik:RadButton>--%>
                          <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click"  Visible="False"
                            OnClientClick="disableBtn(this.id,true)" CssClass="white" ToolTip="Save" UseSubmitBehavior="false" />
                    &nbsp;
        <%--        <telerik:RadButton Skin="WebBlue" Style="z-index: 0" ID="UpdateBtn" runat="server"
                    CssClass="detailButton" Text="Update" Visible="False" OnClick="UpdateBtn_Click">
                </telerik:RadButton>--%>
                          <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" Visible="False"
                            OnClientClick="disableBtn(this.id,true)" CssClass="white" ToolTip="Update" UseSubmitBehavior="false" />    &nbsp;
                    <%--<telerik:RadButton Skin="WebBlue" Style="z-index: 0" ID="BackButton" runat="server"
                        CssClass="detailButton" Text="ShowAllLines" Visible="True" CausesValidation="False"
                        OnClick="BackButton_Click">
                    </telerik:RadButton>--%>
                    <asp:Button ID="BackButton" runat="server" Text="ShowAll" OnClick="BackButton_Click" Visible="true"  CausesValidation="False"
                           CssClass="white" ToolTip="ShowAllLines" /> 
                        &nbsp;
                    &nbsp;
                <br />
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td style="width: 300px;" id="UploadPanel1" runat="server">
                                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                                    <tr>
                                        <td>
                                            <b>Attachment(s)</b>
                                            <br />
                                            <br />
                                            <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic"
                                                DropZones=".DropZone1" Skin="Outlook" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 200px;" valign="middle" align="left" id="UploadPanel2" runat="server">
                                <div class="DropZone1">
                                    <p>
                                        Drop Files Here
                                    </p>
                                </div>
                            </td>
                            <td>
                                <table id="imageTbl" runat="server" width="100%">
                                    <tr>
                                        <td>
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
                                                                    OnClick="VQImageDelete">
                                                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Image"
                                                                        runat="server" />
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
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
