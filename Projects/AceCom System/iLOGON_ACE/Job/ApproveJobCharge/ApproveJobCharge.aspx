<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApproveJobCharge.aspx.cs" Inherits="iWMS.Web.Job.ApproveJobCharge.ApproveJobCharge" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title>ApproveJobCharge</title>

  <script src="../../js/CastleBusyBox.js" language="javascript"></script>
  
  <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
  <meta name="CODE_LANGUAGE" content="C#">
  <meta name="vs_defaultClientScript" content="JavaScript">
  <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
  <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

  <base target="_self"/>
    
    
    
    
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
  <form id="form1"  method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td class="style1">
                <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;">
                </a>
            </td>
            <%--Modified by JL, 29th April 2016--%>
            <td class="ModuleTitle" align="right">
               <%--<div class="rounded-box1" style="background-color: #336600; width: 30%">
                    <div class="top-right-corner1">
                        <div class="top-right-inside1" style="background-color: #ffffff; color: #336600">
                            •</div>
                    </div>
                    <div class="top-left-corner1">
                        <div class="top-left-inside1" style="background-color: #ffffff; color: #336600">
                            •</div>
                    </div>
                    <div class="box-contents1" style="padding-bottom: 5px; padding-left: 3px; padding-right: 5px;
                        font-size: 10pt; font-weight: bold; padding-top: 3px; left: -5px; top: 0px;
                        width: 300px;">
                        <asp:Label ID="MenuLbl" runat="server">Approve Job Generate Invoice</asp:Label>
                    </div>
                </div>--%>
                
                  <%--Modified by JL, 29th April 2016--%>
                <div class="NewModuleTitle">
                    <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server">Approve Job Charge</asp:Label>
                </div>
            </td>
                
            </td>
        </tr>
    </table>
  <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
    width="100%">
    <tr>
      <td>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
      </td>
    </tr>
    <tr>
      <td>
        <table style="z-index: 0" id="Table2" border="0" cellspacing="2" cellpadding="2"
          width="100%">
          <tr>
            <td>
              &nbsp;            
              <%--<asp:Button ID="generateBtn" runat="server" OnClick="generateBtn_Click" OnClientClick="busyBox.Show();" Text="Generate Invoice" Visible="true" />--%>&nbsp;
              <asp:Button ID="Resetbtn" runat="server" Text="Reset" Visible="true" OnClick="resetBtn_Click" CssClass="white" />
              <br />
              <asp:Label ID="errorLbl" runat="server" CssClass="errorLabel" />
              <asp:Label ID="lblProcessID" runat="server" CssClass="errorLabel" Visible="false" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  
  
  
  <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
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
  
  
  
  
  </form>
  
  
  <%--Modified by JL, 29th April 2016--%>
  <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>
        
  <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>
  
</body>
</html>
