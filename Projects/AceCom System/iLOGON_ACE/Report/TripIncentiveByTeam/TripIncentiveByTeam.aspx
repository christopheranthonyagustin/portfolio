<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripIncentiveByTeam.aspx.cs" Inherits="iWMS.Web.Report.TripIncentiveByTeam.TripIncentiveByTeam" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transhipment Incentive by team</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1 {
            width: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager" />
        <table>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                   <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>        
        <br />
        <br />
         &nbsp;&nbsp;<asp:Button ID="Compilebtn" CssClass="white" runat="server" OnClick="Compilebtn_Click" Text="Compile"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>
        <br />
        <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
         Visible="False"></asp:Label>
        <div>
        </div>
    </form>
</body>
</html>