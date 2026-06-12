<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerHaulageRatesTnCUpdate.aspx.cs" Inherits="iWMS.Web.Sales.ContainerHaulageRates.ContainerHaulageRatesTnCUpdate" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Term and Conditions</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="UpdatesBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                            OnClientClick="disableBtn(this.id,false)" CssClass="white" ToolTip="Update" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
            <br />
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </div>
    </form>
</body>
</html>
