<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightJobAdd.aspx.cs" Inherits="iWMS.Web.Job.FreightJobRegister.FreightJobAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>Freight Job Register</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <base target="_self" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>

    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server" method="post" defaultbutton="addBtn">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <table cellspacing="2" cellpadding="2" width="100%" border="0">
        <tr>
            <td>
                <asp:Button ID="addBtn" runat="server" Text="Add" OnClick="addBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
            </td>
        </tr>
        <tr>
            <td><br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
