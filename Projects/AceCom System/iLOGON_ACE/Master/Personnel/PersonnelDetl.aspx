<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="PersonnelDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.Personnel.PersonnelDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>PersonnelDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 1050px;
        }
        .style2
        {
            width: 1050px;
            height: 26px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server" defaultbutton="UpdateBtn">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
        CausesValidation="False" AutoPostBack="True" SelectedIndex="0" 
        Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server" Selected="True">
            </telerik:RadTab>
            <telerik:RadTab Text="Pass & Certificate" Value="100" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Expired Document" Value="150" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="PerPayRoll" Value="200" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="ServicePoint" Value="250" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Timings" Value="500" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="ManpowerType" Value="300" runat="server">
            </telerik:RadTab>
             <telerik:RadTab Text="GeoPosition" Value="500" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="AccountContact" Value="450" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="AssignedUser" Value="400" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Log" Value="350" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
      <table>
        <tr>
            <td><br />&nbsp;
               <asp:Label ID="Label1" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
        <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
            <table>
                <tr>
                    <td colspan="2" class="style1"><br />&nbsp;
                            <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"  
                                    Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Update" />
                        &nbsp<asp:Label ID="IdLbl"
                                runat="server" CssClass="pagetitle"></asp:Label>
                        <br />
                        <br />
                        <table>
                            <tr>
                                <td valign="top">
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                                <td valign="top" align="center">
                                    <asp:Image ID="Personnelimg" runat="server" ImageAlign="Top" Width="130px" Height="180" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="PerPassRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="PerExpiredPassRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="PerPayRollRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="ServicePtRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="450px" ID="TimingRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="450px" ID="ManpowerTypeRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="400px" ID="GeoPositionRadPageView">            
        </telerik:RadPageView>
         <telerik:RadPageView runat="server" Height="400px" ID="AccountContactRadPageView">            
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="420px" ID="AssignedUserRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
    </form>
</body>
</html>
