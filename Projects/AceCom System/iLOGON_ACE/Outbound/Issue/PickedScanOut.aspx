<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PickedScanOut.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.PickedScanOut" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PickedScanOut via Issue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

     <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="ScanOutBtn">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td colspan="2">
             <telerik:RadLabel ID="ScanOutLbl" runat="server" CssClass="pagetitle">Pick Ticket Check-Out</telerik:RadLabel>
            </td>
        </tr>
    </table>
    <asp:Panel ID="ScanOutPanel" runat="server">
        <table cellspacing="4" cellpadding="0" width="100%">
            <tr>
                <td >
                    <telerik:RadLabel ID="PickerCodeLbl" runat="server">PickerId</telerik:RadLabel>
                    <br />
                    <telerik:RadTextBox ID="PickerCodeTxt" runat="server" AutoPostBack="True" BackColor ="#ded7c6" Skin ="Sunset"></telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="PickerIdReq" runat="server" ControlToValidate="PickerCodeTxt"
                        ErrorMessage="*" CssClass="errorLabel"></asp:RequiredFieldValidator>&nbsp;
                    <asp:Label ID="Label2" runat="server" CssClass="errorLabel"></asp:Label>
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>  
            <tr>
                <td>
                <br />
                    <telerik:RadLabel ID="AutoPackLbl" runat="server">Auto-Pack</telerik:RadLabel>
                    <br />
                    <asp:CheckBox Style="z-index: 0" ID="AutoPackChkBox" runat="server" 
                        Checked="True"></asp:CheckBox>
                </td>
            </tr>          
            <tr>                
                <td>
                <br />
                    <%--<telerik:RadButton ID="ScanOutBtn" runat="server" Enabled="False" CssClass="detailbutton" Skin ="WebBlue"
                        Text="Picked" OnClick="ScanOutBtn_Click"></telerik:RadButton>--%>

                    <asp:Button ID="ScanOutBtn" class="white" runat="server" OnClick="ScanOutBtn_Click" Text="Picked" 
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enabled ="False" />
                    &nbsp;                    
                </td>
            </tr>
        </table>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxtoolkit:modalpopupextender id="mpeMessagePopup" runat="server" popupcontrolid="pnlMessageBox"
            targetcontrolid="btnMessagePopupTargetButton" okcontrolid="btnOk" cancelcontrolid="btnCancel"
            backgroundcssclass="MessageBoxPopupBackground">
        </ajaxtoolkit:modalpopupextender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
            border: 2px solid #780606;">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;">
                            </td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
    </asp:Panel>
    </form>
</body>
</html>
