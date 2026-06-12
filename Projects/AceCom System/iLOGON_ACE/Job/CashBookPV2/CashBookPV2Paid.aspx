<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookPV2Paid.aspx.cs" Inherits="iWMS.Web.Job.CashBookPV2.CashBookPV2Paid" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
  <title>CashBookPV2Paid</title>
  <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href=".paif./../css/iWMSTelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
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
  <form id="Form1" method="post" runat="server">
      <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
  <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm> 
  <br /> 
          <asp:Button ID="ConfirmBtn" runat="server" Text="Confirm" OnClick="ConfirmBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
  <br />
  </form> 
</body>
</html>
