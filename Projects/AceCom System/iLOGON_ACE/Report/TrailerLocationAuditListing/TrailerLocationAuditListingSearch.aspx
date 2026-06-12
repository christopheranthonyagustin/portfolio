<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Page Language="c#" CodeBehind="TrailerLocationAuditListingSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Report.TrailerLocationAuditListing.TrailerLocationAuditListingSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">    
    <title>TrailerLocationAuditListing</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            height: 21px;
        }
        .style4
        {
        }
        .style5
        {
        }
        .RadButton_WebBlue.rbSkinnedButton{background-image:url('mvwres://Telerik.Web.UI.Skins, Version=2014.3.1209.35, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.WebBlue.Common.radFormSprite.png');_background-image:url('mvwres://Telerik.Web.UI.Skins, Version=2014.3.1209.35, Culture=neutral, PublicKeyToken=121fae78165ba3d4/Telerik.Web.UI.Skins.WebBlue.Common.radFormSpriteIE6.png');color:#0d202b}.RadButton_WebBlue{font-family:"Segoe UI",Arial,Helvetica,sans-serif;font-size:12px}.RadButton{cursor:pointer}.rbSkinnedButton{vertical-align:top}.rbSkinnedButton{display:inline-block;position:relative;background-color:transparent;background-repeat:no-repeat;border:0 none;height:22px;text-align:center;text-decoration:none;white-space:nowrap;background-position:left -525px;padding-left:4px;vertical-align:top}.RadButton{font-size:12px;font-family:"Segoe UI",Arial,Helvetica,sans-serif}.RadButton{box-sizing:content-box;-moz-box-sizing:content-box}
        .style6
        {
            width: 8%;
        }
        .style7
        {
            width: 1%;
        }
        .style9
        {
            width: 32px;
        }
        </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

  
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td class="style5" colspan="3">
                            VehPark<br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            <telerik:RadListBox runat="server" ID="AvailVehList" Height="200px" Width="250px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedVehList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="AvailVehList_Transferred">
                            </telerik:RadListBox>
                            
                        </td>
                        <td valign="top" class="style9">
                            <telerik:RadListBox runat="server" ID="SelectedVehList" Height="200px" Width="200px"
                                Skin="WebBlue" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                AllowDelete="false">
                            </telerik:RadListBox>
                        </td>
                        <td width="67%">
                            &nbsp;
                        </td>
                    </tr>
                    </table>
            </td>
        </tr>
    <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td class="style4">
                            <br />
                            TrailerType                         
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td class="style4">
                            <telerik:RadListBox runat="server" ID="AvailTrailList" Height="120px" Width="250px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedOpsList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="AvailTrailList_Transferred">
                            </telerik:RadListBox>
                            <td class="style7">
                            &nbsp;&nbsp;&nbsp;
                            </td>
                        </td>
                        <td style="width: 300" valign="top">
                            <telerik:RadListBox runat="server" ID="SelectedOpsList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                Skin="WebBlue" AllowDelete="false">
                            </telerik:RadListBox>
                            </td>
                        <td width="67%">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>                
                 &nbsp;
                 <asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="Conditional">
                      <ContentTemplate>
                           <asp:Button ID="CompileBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" Visible="true"
                                OnClick="CompileBtn_Click" CssClass="white" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                      </ContentTemplate>
                 </asp:UpdatePanel>                   
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" width="70%" class="style1" colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
            <td>
                &nbsp;<br />
            </td>
        </tr>
    </table> 
         <asp:UpdateProgress ID="updateProgress" runat="server">
            <ProgressTemplate>
                <div class="busybiz">
                </div>
                <div>
                    <a class="loader"></a>
                    <a id="text">Processing</a>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>    
     <%--<iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>--%>
    
</body>
</html>
