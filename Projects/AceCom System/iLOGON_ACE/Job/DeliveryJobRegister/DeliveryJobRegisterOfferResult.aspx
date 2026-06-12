<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryJobRegisterOfferResult.aspx.cs" Inherits="iWMS.Web.Job.DeliveryJobRegister.DeliveryJobRegisterOfferResult" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Offer Result</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <base target="_self" />
</head>
<body>
    <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;              
            }
    </script>
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:PlaceHolder ID="QRCodePlaceHolder" runat="server" />
                </td>
            </tr>
        </table>
        <asp:Button ID="ExcelBtn" runat="server" CssClass="green" OnClick="ExcelBtn_Click" ToolTip="Export To Excel"
                        Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

        <div style="height:1rem;"></div>
        <telerik:radgrid id="ResultDG" runat="server" autogeneratecolumns="true" gridlines="None"
            allowsorting="true" allowfilteringbycolumn="false" enablelinqexpressions="false"
            allowpaging="false" skin="Office2007" onneeddatasource="ResultDG_NeedDataSource"
            onitemdatabound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="tripId">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        </MasterTableView>
                    </telerik:radgrid>
        <div>
        </div>
    </form>
</body>
</html>
