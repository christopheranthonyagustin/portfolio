<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VLMStockCountAckError.aspx.cs" Inherits="iWMS.Web.VLMTask.VLMStockCount.VLMStockCountAckError" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledge Error @ VLM Stock Count</title>
    <<link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />   
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="stylesheet" href="../../css/style.css" type="text/css" />  
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="AckErrorLbl" Text="" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table width="100%">
            <tr>
                <td style="text-align: center">&nbsp;
                    <asp:Button ID="AckErrorBtn" CssClass="LongLabelWhite" runat="server" OnClick="AckErrorBtn_Click" Text="Retry"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
