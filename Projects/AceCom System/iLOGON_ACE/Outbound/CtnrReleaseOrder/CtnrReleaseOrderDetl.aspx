<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CtnrReleaseOrderDetl.aspx.cs"
    Inherits="iWMS.Web.Outbound.CtnrReleaseOrder.CtnrReleaseOrderDetl" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>ReleaseOrderDetail</title>
        <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

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

    <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <asp:Panel ID="CtrlPanel" runat="server">
                    <asp:Button ID="AddDetailBtn" runat="server" Text="NewLine" OnClick="AddDetailBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="NewLine" UseSubmitBehavior="false" CssClass="white" />
                    &nbsp;
                    <asp:Button ID="MassDeleteBtn" runat="server" Text="Mass Delete" OnClick="MassDeleteBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="MassDelete" UseSubmitBehavior="false" CssClass="white" />
                    &nbsp;
                    <asp:Button ID="MassConfirmBtn" runat="server" Text="Mass Confirm" OnClick="MassConfirmBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="MassConfirm" UseSubmitBehavior="false" CssClass="white" />
                    <asp:Button ID="MassReOpenBtn" runat="server" Text="Mass ReOpen" OnClick="MassReopenBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="MassReOpen" UseSubmitBehavior="false" CssClass="white" />
                    <br />
                    <br />
                </asp:Panel>
            </td>
            <td>
                <asp:Label ID="ROIdLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>
                <asp:Button ID="ExportExcelLnk" runat="server" Text="Export Excel" OnClick="ExcelBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="ExportExcel" UseSubmitBehavior="false" CssClass="white" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="AddPanel" runat="server" Visible="False">
                    <table border="0" cellspacing="1" cellpadding="1" width="100%">
                        <tr>
                            <td>
                                <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Save" UseSubmitBehavior="false" CssClass="white" />
                                &nbsp;
                                <asp:Button ID="SaveNextBtn" runat="server" Text="Save &amp; Next" OnClick="SaveNextBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="SaveNext" UseSubmitBehavior="false" CssClass="white" />
                                &nbsp;
                                <asp:Button ID="ClosePanelBtn" runat="server" Text="- Hide" OnClick="ClosePanelBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Hide" UseSubmitBehavior="false" CssClass="white" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource" BorderStyle="Solid" Skin="Metro"
        OnGridExporting="ResultDG_GridExporting" AllowSorting="true" AllowFilteringByColumn="true"
        OnItemDataBound="ResultDG_ItemDataBound">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Scrolling ScrollHeight="400px" AllowScroll="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" ForeColor="White"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemStyle Wrap="false" />
                    <ItemTemplate>
                        <asp:CheckBox ID="lineChkbx" runat="server" />
                        <a id="lnkEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' runat="server"
                            onserverclick="ISDetail_Edit">
                            <img id="editImg" border="0" alt="Edit" title="Edit" src="..\..\image\pencil.gif"
                                width="15" height="15" runat="server" /></a> <a id="lnkDelete" onclick="return confirm('Confirm delete?')"
                                    href='<%#DataBinder.Eval(Container,"DataItem.id")%>' runat="server" onserverclick="ISDetail_Delete">
                                    <img id="delImg" border="0" alt="Delete Receipt Detail" src="..\..\image\bin.gif"
                                        width="15" height="15" runat="server" /></a>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="skucode" AllowFiltering="true"
                    SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ContainerType" DataField="skusizetype" AllowFiltering="true"
                    SortExpression="skusizetype" UniqueName="skusizetype" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="GoodsDescription" DataField="lot5" AllowFiltering="true"
                    SortExpression="lot5" UniqueName="lot5" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ReleaseDate" DataField="lot1" AllowFiltering="true"
                    SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Condition" DataField="lot6" AllowFiltering="true"
                    SortExpression="lot6" UniqueName="lot6" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Vessel" DataField="lot12" AllowFiltering="true"
                    SortExpression="lot12" UniqueName="lot12" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Voyage" DataField="lot13" AllowFiltering="true"
                    SortExpression="lot13" UniqueName="lot13" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ETD@POL" DataField="lot2" AllowFiltering="true"
                    SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="FreeDays" DataField="lot14" AllowFiltering="true"
                    SortExpression="lot14" UniqueName="lot14" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Rate" DataField="lot7" AllowFiltering="true"
                    SortExpression="lot7" UniqueName="lot7" Reorderable="true" DataFormatString="{0:#,0.00}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Currency" DataField="lot9" AllowFiltering="true"
                    SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TaxType" DataField="lot10" AllowFiltering="true"
                    SortExpression="lot10" UniqueName="lot10" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="BillPeriod" DataField="lot11" AllowFiltering="true"
                    SortExpression="lot11" UniqueName="lot11" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="LeaseFreeDays" DataField="lot15" AllowFiltering="true"
                    SortExpression="lot15" UniqueName="lot15" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                    SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                    SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                    SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                    SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                    SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="False" DataField="id" />
                <telerik:GridBoundColumn Display="False" DataField="status" />
                <telerik:GridBoundColumn Display="False" DataField="isid" />
                <telerik:GridBoundColumn Display="False" DataField="statuscolor" />
                <telerik:GridBoundColumn Display="False" DataField="skuid" />
                <telerik:GridBoundColumn Display="False" DataField="skustatus" />
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
