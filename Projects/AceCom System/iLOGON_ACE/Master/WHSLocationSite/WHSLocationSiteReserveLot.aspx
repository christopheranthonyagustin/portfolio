<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WHSLocationSiteReserveLot.aspx.cs" Inherits="iWMS.Web.Master.WHSLocationSite.WHSLocationSiteReserveLot" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <title>ReserveSiteLotNo</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
		<base target="_self">
		<meta http-equiv="Pragma" content="no-cache" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div>
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td style="width:15%;">Account
            </td>
            <td style="width:5%;">
                &nbsp;
            </td>
            <td style="width:40%;">
                <telerik:RadDropDownList ID="acc_ddl" runat="server" BackColor="Yellow" DropDownHeight="360px" Skin="WebBlue" Width="95%" >
                </telerik:RadDropDownList>
            </td>
            <td style="width:40%;">
                &nbsp;
            </td> 
        </tr>
        <tr>
            <td colspan="4" style="height:5px;">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width:15%;">Lot Type
            </td>
            <td style="width:5%;">
                &nbsp;
            </td>
            <td style="width:40%;">
                <telerik:RadDropDownList ID="lottype_ddl" runat="server" DropDownHeight="360px" Skin="WebBlue" Width="95%" >
                </telerik:RadDropDownList>
            </td>
            <td style="width:40%;">
                &nbsp;
            </td> 
        </tr>
        <tr>
            <td colspan="4" style="height:5px;">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width:15%;">No. of Lots
            </td>
            <td style="width:5%;">
                &nbsp;
            </td>
            <td style="width:40%;">
                <telerik:RadTextBox ID="NoLots_tbox"  runat="server"  Width="95%" />
            </td>
            <td style="width:40%;">
                &nbsp;
            </td> 
        </tr>
        <tr>
            <td colspan="4" style="height:5px;">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width:15%;">Reason
            </td>
            <td style="width:5%;">
                &nbsp;
            </td>
            <td style="width:40%;">
                <telerik:RadTextBox ID="Reason_tbox"  runat="server"  Width="95%" TextMode="MultiLine" Rows="6" />
            </td>
            <td style="width:40%;">
                &nbsp;
            </td> 
        </tr>
        <tr>
            <td colspan="4" style="height:5px;">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center"> 
                <asp:Button ID="ReserveLotBtn" CssClass="white" runat="server" OnClick="ReserveLot_Btn_Click"
                         Text="ReserveLot" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
