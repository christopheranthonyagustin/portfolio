<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CopyOneSKUV2.aspx.cs" Inherits="iWMS.Web.Master.SKUV2.CopyOneSku" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Copy SKU</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta content="no-cache" http-equiv="Pragma">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <base target="_self">
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="FormTable" class="TABLE" runat="server" width="90%">
            <tr>
                <td style="width: 50px" colspan="1">
                    <asp:Label ID="frmLbl" runat="server" CssClass="pagetitle">From</asp:Label>
                </td>
                <td style="width: 110px"></td>
                <td>&nbsp;                 
                </td>
                <td style="width: 140px" bgcolor="yellow">
                    <asp:Label ID="toLbl" runat="server" CssClass="pagetitle">To</asp:Label>
                </td>
                <td style="width: 200px"></td>
            </tr>
            <tr>
                <td style="width: 50px" colspan="1">
                    <asp:Label ID="frmAccountLbl" runat="server">Account</asp:Label><br />
                    <telerik:RadComboBox ID="frmAccountDDL" runat="server" Skin="WebBlue" Filter="Contains" Width="160px" RenderMode="Lightweight"
                        OnSelectedIndexChanged="frmAccountDDL_SelectedIndexChanged" AutoPostBack="True">
                    </telerik:RadComboBox>
                </td>
                <td style="width: 140px"></td>
                <td>&nbsp;                 
                </td>
                <td style="width: 140px">
                    <asp:Label ID="toAccountLbl" runat="server">Account</asp:Label><br />
                    <telerik:RadComboBox ID="toAccountDDL" runat="server" Skin="WebBlue" Filter="Contains" Width="160px" RenderMode="Lightweight"
                        OnSelectedIndexChanged="toAccountDDL_SelectedIndexChanged" AutoPostBack="True">
                    </telerik:RadComboBox>
                </td>
                <td style="width: 140px"></td>
            </tr>
            <tr>
                <td style="width: 50px" colspan="1">
                    <asp:Label ID="frmSkuLbl" runat="server">SKU</asp:Label><br />
                    <telerik:RadTextBox runat="server" ID="frmSkuTxt" Width="160px" Skin="Office2007" TabIndex="2" AutoPostBack="True" MaxLength="50"
                        Font-Bold="True" OnTextChanged="frmSkuTxt_TextChanged">
                    </telerik:RadTextBox>
                    <asp:Label ID="frmVerifyLbl" runat="server" ForeColor="Red" Visible="False">* Code not Found *</asp:Label>
                </td>
                <td style="width: 110px">
                    <asp:Label ID="frmSku2Lbl" runat="server">SKU code 2</asp:Label><br />
                    <telerik:RadTextBox runat="server" ID="frmSku2Txt" Skin="Office2007" TabIndex="7" MaxLength="20" Width="160px" Font-Bold="True">
                    </telerik:RadTextBox>
                </td>
                <td>&nbsp;                 
                </td>
                <td style="width: 140px">
                    <asp:Label ID="toSkuLbl" runat="server">SKU</asp:Label><br />
                    <asp:Label ID="toVerifyLbl" runat="server"></asp:Label>
                    <telerik:RadTextBox runat="server" ID="toSkuTxt" Skin="Office2007" TabIndex="6" AutoPostBack="True" MaxLength="50"
                        OnTextChanged="toSkuTxt_TextChanged">
                    </telerik:RadTextBox>
                </td>
                <td style="width: 200px">
                    <asp:Label ID="toSku2Lbl" runat="server">SKU code 2</asp:Label><br />
                    <telerik:RadTextBox runat="server" ID="toSku2Txt" Skin="Office2007" TabIndex="7" MaxLength="20">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 50px" colspan="1">
                    <asp:Label ID="frmDescrLbl" runat="server">Description</asp:Label><br />
                    <telerik:RadTextBox ID="frmDescrTxt" TabIndex="3" runat="server" MaxLength="60" TextMode="MultiLine"
                        Width="160px" ReadOnly="True" Font-Bold="True" Height="100px">
                    </telerik:RadTextBox>
                </td>
                <td style="width: 140px"></td>
                <td>&nbsp;                 
                </td>
                <td style="width: 140px">
                    <asp:Label ID="toDescrLbl" runat="server">Description</asp:Label><br />
                    <telerik:RadTextBox ID="toDescrTxt" TabIndex="8" runat="server" MaxLength="60" TextMode="MultiLine" Width="160px" Height="100px">
                    </telerik:RadTextBox>
                </td>
                <td style="width: 140px"></td>
            </tr>
            <tr>
                <td style="width: 50px" colspan="1">
                    <asp:Label ID="frmPackingLbl" runat="server">Packing</asp:Label><br />
                    <telerik:RadTextBox ID="frmPackingTxt" TabIndex="4" runat="server" ReadOnly="True"
                        Font-Bold="True">
                    </telerik:RadTextBox>
                </td>
                <td style="width: 140px">
                    <asp:Label ID="frmAbvLbl" runat="server">Alcohol By Vol</asp:Label><br />
                    <telerik:RadTextBox ID="frmAbvTxt" TabIndex="4" runat="server" ReadOnly="True"
                        Font-Bold="True">
                    </telerik:RadTextBox>
                </td>
                <td>&nbsp;                 
                </td>
                <td style="width: 140px">
                    <asp:Label ID="toPackingLbl" runat="server">Packing</asp:Label><br />
                    <telerik:RadTextBox ID="toPackingTxt" TabIndex="9" runat="server">
                    </telerik:RadTextBox>
                    <telerik:RadComboBox ID="toPackingDDL" runat="server" Skin="WebBlue" Filter="Contains"
                        Width="160px" RenderMode="Lightweight">
                    </telerik:RadComboBox>
                </td>
                <td style="width: 140px">
                    <asp:Label ID="toAbvLbl" runat="server">Alcohol By Vol</asp:Label><br />
                    <telerik:RadTextBox ID="toAbvTxt" TabIndex="11" runat="server"></telerik:RadTextBox>
                    <asp:CompareValidator ID="toAbvTxtVal" runat="server" ControlToValidate="toAbvTxt" EnableClientScript="True"
                        ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 50px" colspan="1">
                    <asp:Label ID="frmLiterageLbl" runat="server">Literage</asp:Label><br />
                    <telerik:RadTextBox ID="frmLiterageTxt" TabIndex="4" runat="server" ReadOnly="True"
                        Font-Bold="True">
                    </telerik:RadTextBox>
                </td>
                <td style="width: 140px">
                    <asp:Label ID="frmCooLbl" runat="server">Country of Origin</asp:Label><br />
                    <telerik:RadTextBox ID="frmCooTxt" TabIndex="4" runat="server" BackColor="White" ReadOnly="True"
                        Font-Bold="True">
                    </telerik:RadTextBox>
                </td>
                <td>&nbsp;                 
                </td>
                <td style="width: 140px">
                    <asp:Label ID="toLiterageLbl" runat="server">Literage</asp:Label><br />
                    <telerik:RadTextBox ID="toLiterageTxt" TabIndex="10" runat="server">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="toLiterageTxtVal" runat="server" ControlToValidate="toLiterageTxt" EnableClientScript="True"
                        ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                </td>
                <td style="width: 140px">
                    <asp:Label ID="toCooLbl" runat="server">Country of Origin</asp:Label><br />
                    <telerik:RadDropDownList ID="toCooDDL" runat="server" Skin="WebBlue" Filter="Contains" Width="160px" RenderMode="Lightweight"
                        OnSelectedIndexChanged="toCooDDL_SelectedIndexChanged" AutoPostBack="True">
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 140px"></td>
                <td style="width: 140px"></td>
                <td style="width: 140px"></td>
                <td style="width: 140px">
                    <asp:Label ID="BrandLbl" runat="server" Visible="true">Brand</asp:Label><br />
                    <telerik:RadTextBox ID="BrandTxt" TabIndex="4" runat="server" BackColor="White" Visible="true"
                        Font-Bold="True">
                    </telerik:RadTextBox>
                </td>
                <td style="width: 140px">
                    <asp:Label ID="CascCodeLbl" runat="server" Visible="true">CascCode1</asp:Label><br />
                    <telerik:RadDropDownList ID="CascCodeDDL" TabIndex="12" runat="server" Skin="WebBlue" Visible="true">
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 140px"></td>
                <td style="width: 140px"></td>
                <td style="width: 140px"></td>
                <td style="width: 140px">
                    <asp:Label ID="Label1" runat="server">Copy Sku Image</asp:Label><br />
                    <asp:CheckBox ID="imgChk" TabIndex="12" runat="server" Checked="true"></asp:CheckBox>
                </td>
            </tr>
            <tr>
                <td style="width: 140px">
                    <asp:Label ID="frmSKUGrpCodeLbl" runat="server" Visible="false" />
                    <asp:Label ID="frmPutCodeLbl" runat="server" Visible="false" />
                    <asp:Label ID="frmAllCodeLbl" runat="server" Visible="false" />
                    <asp:Label ID="frmBillGrpCodeLbl" runat="server" Visible="false" />
                </td>
                <td style="width: 140px"></td>
                <td style="width: 140px"></td>
                <td style="width: 140px">
                    <asp:Button ID="CopyBtn" runat="server" Visible="false" CssClass="white" Text="Copy"
                        OnClick="CopyBtn_Click"></asp:Button><br>
                    <br>
                    <br>
                    <asp:Button ID="ResetBtn" runat="server" Visible="false" CssClass="white"
                        Text="Next Copy" OnClick="ResetBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
                </td>
            </tr>
        </table>
        <br>
        <iframe style="width: 100%; height: 45%" id="skuPackFrame" marginheight="0" frameborder="no" scrolling="no"
            marginwidth="0" runat="server"></iframe>
    </form>
</body>
</html>
