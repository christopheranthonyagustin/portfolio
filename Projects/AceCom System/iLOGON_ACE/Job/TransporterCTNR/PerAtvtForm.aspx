<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerAtvtForm.aspx.cs" Inherits="iWMS.Web.Job.TransporterCTNR.PerAtvtForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PerAtvtForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />

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
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td style="height: 20px">
                <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                <br />
                <asp:Button Style="z-index: 0" ID="AddBtn" runat="server" CssClass="detailButton"
                    Visible="True" Text="Add" OnClick="AddBtn_Click"></asp:Button>
                <asp:Button Style="z-index: 0" ID="UpdateBtn" runat="server" CssClass="detailButton"
                    Visible="false" Text="Update" OnClick="UpdateBtn_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowPaging="true" AllowSorting="true" Skin="Office2007" AllowFilteringByColumn="true"
        OnNeedDataSource="ResultDG_NeedDataSource">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" />
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="10">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="id" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="perid" SortExpression="perid" HeaderText="perid"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="jbperhid" SortExpression="jbperhid" HeaderText="jbperhid"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Personnel"
                    ItemStyle-Wrap="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type"
                    ItemStyle-Wrap="False" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type"
                    ItemStyle-Wrap="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="jbperatvtid" SortExpression="jbperatvtid" HeaderText="jbperatvtid"
                    ItemStyle-Wrap="False" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="peratvtcode" SortExpression="peratvtcode" HeaderText="peratvtcode"
                    ItemStyle-Wrap="False" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="fracttime" SortExpression="fracttime" HeaderText="fracttime"
                    ItemStyle-Wrap="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="toacttime" SortExpression="toacttime" HeaderText="toacttime"
                    ItemStyle-Wrap="False">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
