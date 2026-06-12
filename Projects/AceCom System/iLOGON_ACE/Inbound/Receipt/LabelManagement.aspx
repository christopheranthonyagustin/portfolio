<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabelManagement.aspx.cs" Inherits="iWMS.Web.Inbound.Receipt.LabelManagement" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>GoodsReceiveLabelManagement</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

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
                    <asp:Button ID="SendBtn" class="white" runat="server" OnClick="SendBtn_Click" Text="Send"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Style="z-index: 0" ID="Label1" runat="server" 
                        Visible="TRUE">NOTE: Selected receipts must have generated bag ID file to be successfully deposited. </asp:Label>
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
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="rcid" HeaderText="ID" Display="false" />
                    <telerik:GridBoundColumn DataField="acid" HeaderText="ACID" Display="false" />
                    <telerik:GridBoundColumn DataField="rcnumber" SortExpression="rcnumber" HeaderText="ReceiptNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GRLabelEDIStatus" SortExpression="GRLabelEDIStatus" HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sitecode" SortExpression="sitecode" HeaderText="Site">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rctype" SortExpression="rctype" HeaderText="ReceiptType">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKUCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="SKUDescription">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TotalSerialNo" DataField="totalserialno" SortExpression="totalserialno" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="gateindate" SortExpression="gateindate" HeaderText="ReceivedDate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="LotNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="totalwt" SortExpression="totalwt" HeaderText="KG" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,0.00}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="totalexpqty" SortExpression="totalexpqty" HeaderText="QTY" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>

