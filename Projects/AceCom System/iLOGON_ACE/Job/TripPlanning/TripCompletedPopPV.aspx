<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripCompletedPopPV.aspx.cs"
    Inherits="iWMS.Web.Job.TripPlanning.TripCompletedPopPV" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trip Completed PV Message</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <base target="_self" />
</head>
<body>

    <script type="text/javascript">

        function close() {
            RadWindowManager().closeAll();
        }


    </script>

    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
    </telerik:RadWindowManager>
    <telerik:RadFormDecorator ID="FormDecorator1" runat="server" DecoratedControls="all"
        DecorationZoneID="decorationZone" />
    <telerik:RadFormDecorator ID="FormDecorator2" runat="server" DecoratedControls="all"
        DecorationZoneID="decorationZone2" />
         
         <table border="0" cellspacing="0" cellpadding="0" width="100%">
         <tr>
         <td>
        <asp:Label ID="msglbl" runat="server"></asp:Label>
        </td>
        </tr>
        <tr></tr>
        <tr align="center">
        <td>
    <telerik:RadButton ID="cancelBtn" runat="server" OnClick="cancelBtn_Click" Text="Close"
                            Skin="WebBlue">
                        </telerik:RadButton>
                        </td>
                        </tr>
    </table>
    </form>
</body>
</html>
