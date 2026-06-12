<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipmentCheckList.aspx.cs" Inherits="iWMS.Web.Outbound.ShipmentCheckList.ShipmentCheckList" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ShipmentCheckList</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                    <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="expdate">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="pickcheckstatus" SortExpression="pickcheckstatus" HeaderText="PostPickCheck">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="loadcheckstatus" SortExpression="loadcheckstatus" HeaderText="PreLoadCheck">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="ExpectedDate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="ContainerNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PO/No">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vslvoy" SortExpression="vslvoy" HeaderText="Vessel">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustomerRef">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="totalqty" SortExpression="totalqty" HeaderText="TotalQty" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="goodswt" SortExpression="goodswt" HeaderText="TotalWeight(KG)" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
