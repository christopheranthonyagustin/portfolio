<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipmentReserveLot.aspx.cs" Inherits="iWMS.Web.Job.Shipment.ShipmentReserveLot" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ShipmentReserveLot</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta content="no-cache" http-equiv="Pragma">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <base target="_self">
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            sender.setUrl("about:blank");
        }
    </script>
    <style type="text/css">
        .style1 {
            width: 133px;
        }

        .style2 {
            width: 163px;
        }

        .style3 {
            width: 516px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <br>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindow runat="server" ID="ShipmentReserveLotRadWindow" VisibleOnPageLoad="true" Title="Reserve LotNo"
            Width="400" Height="300" VisibleStatusbar="false" OnClientClose="OnClientClose">
            <ContentTemplate>                
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <asp:Button ID="SubmitBtn" class="white" runat="server" OnClick="SubmitBtn_Click" Text=" Submit " OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <asp:Label Style="z-index: 0" ID="MessageLbl" CssClass="errorLabel" runat="server"
                    Visible="False"></asp:Label>
                <br>
            </ContentTemplate>
        </telerik:RadWindow>
    </form>
</body>
</html>
