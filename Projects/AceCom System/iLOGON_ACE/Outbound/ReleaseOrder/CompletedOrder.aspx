<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubPrintMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompletedOrder.aspx.cs"
    Inherits="iWMS.Web.Outbound.ReleaseOrder.CompletedOrder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CompletedOrder</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }
    </script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
        OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged"
        PageSize="50">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" >
                    <ItemTemplate>
                        <iWMS:iSubMenu ID="subMenuCtl" runat="server" Visible="false"></iWMS:iSubMenu>
                        <iWMS:iSubPrintMenu ID="subMenuPrintCtl" runat="server" ></iWMS:iSubPrintMenu>
                        <asp:Label ID="isSHCfmLbl" runat="server" />
                        <asp:Label ID="aedPKCfmLbl" runat="server" />
                        <asp:Label ID="aedCICfmLbl" runat="server" />
                        <asp:Label ID="aedLOICfmLbl" runat="server" />
                    </ItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn Display="false" DataField="acid">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="sealno">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="sitecode">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="RORef">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="number">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustRef"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OP#"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="permitno" SortExpression="permitno" HeaderText="Permit#"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="status">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rostatusdescr" SortExpression="rostatusdescr"
                    HeaderText="Status" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="prioritydescr" SortExpression="prioritydescr"
                    HeaderText="Pri" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="type2descr" SortExpression="type2descr" HeaderText="Type"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="Expected"
                    DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="shippeddate" SortExpression="shippeddate" HeaderText="Shipped"
                    DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="shaddr1" SortExpression="shaddr1" HeaderText="Addr1"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="shzipcode" SortExpression="shzipcode" HeaderText="Zip"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="shcitycode" SortExpression="shcitycode" HeaderText="City"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="jobno">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
