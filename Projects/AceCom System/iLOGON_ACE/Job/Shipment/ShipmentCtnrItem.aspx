<%@ Page Language="c#" CodeBehind="ShipmentCtnrItem.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.Shipment.ShipmentCtnrItem" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%--<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DeclarationCtnrItem</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .style1 {
            height: 20px;
            width: 637px;
        }

        .style2 {
            width: 335px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td class="style1" colspan="2">
                    <br />
                    &nbsp;
                    <asp:Button ID="calculateImgBtn" CssClass="LongLabelWhite" runat="server" OnClick="calculateImgBtn_Click" Text="Calculate Duty & Tax" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="SaveNextBtn" CssClass="white" runat="server" OnClick="SaveNextBtn_Click" Visible="false" Enabled="false" Text="Save &amp; Next" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click" Visible="false" Text="Save" Enabled="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Visible="false" Text="Update" Enabled="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="GenLotNoBtn" CssClass="white" runat="server" OnClick="GenLotNoBtn_Click" Visible="false" CausesValidation="false" Enabled="false" Text="GenNewLot" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="BackButton" CssClass="LongLabelWhite" runat="server" OnClick="BackButton_Click" Visible="True" Text="Close Window" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    &nbsp;
                    &nbsp;
                <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" CssClass="Pagetitle"></asp:Label>
                    &nbsp;
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;&nbsp; &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style2"></td>
                <td>
                    <asp:Label ID="CtnrNoLbl" runat="server" Font-Bold="True">
                    Container No</asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <telerik:RadDropDownList Style="z-index: 0" ID="CtnrNoList" runat="server" Width="150px" Skin="WebBlue">
                </telerik:RadDropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <telerik:RadLabel ID="InvNoLbl" runat="server" Font-Bold="True">
                    Invoice No
                </telerik:RadLabel>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <telerik:RadDropDownList ID="InvNoList" runat="server" Width="150px" Skin="WebBlue">
                </telerik:RadDropDownList>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" HeaderText="The following field(s) need to be entered correctly:"
            DisplayMode="BulletList" EnableClientScript="true"></asp:ValidationSummary>
    </form>
</body>
</html>
