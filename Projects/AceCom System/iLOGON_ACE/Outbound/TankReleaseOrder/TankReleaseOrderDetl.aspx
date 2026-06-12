<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankReleaseOrderDetl.aspx.cs"
    Inherits="iWMS.Web.Outbound.TankReleaseOrder.TankReleaseOrderDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>TankReleaseOrderDetail</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
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
       <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
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
                    <asp:Button ID="AddDetailBtn" CssClass="white" runat="server" OnClick="AddDetailBtn_Click" Visible="true"  
                        Text="New" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;                  
                    <asp:Button ID="MassDeleteBtn" CssClass="white" runat="server" OnClick="MassDeleteBtn_Click" Visible="false"  
                        Text="Delete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Delete Container(s)" />
                    &nbsp;                    
                    <asp:Button ID="MassConfirmBtn" CssClass="white" runat="server" OnClick="MassConfirmBtn_Click" Visible="false"  
                        Text="Confirm" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Release Container(s)" />
                    &nbsp;                   
                    <asp:Button ID="MassReOpenBtn" CssClass="white" runat="server" OnClick="MassReopenBtn_Click" Visible="false"  
                        Text="Reopen" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Re-Open Container(s)" />
                    &nbsp;                  
                    <asp:Button ID="CancelShipmentBtn" CssClass="white" runat="server" OnClick="CancelShipmentBtn_Click" Visible="false"  
                        Text="Cancel" />
                    &nbsp;
                    <asp:Button ID="ExportExcelLnk" CssClass="green" runat="server" OnClick="ExcelBtn_Click" Visible="true"  
                        Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export to Excel" />
                    <br />
                    <br />
                </asp:Panel>
            </td>
            <td align="right">
                <asp:Label ID="ROIdLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>
                <%--<a id="ExportExcelLnk" runat="server" onserverclick="ExcelBtn_Click">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>--%>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="AddPanel" runat="server" Visible="False">
                    <table border="0" cellspacing="1" cellpadding="1" width="100%">
                        <tr>
                            <td>
                                &nbsp;                               
                                <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click"
                                    Text="Save" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                &nbsp;                               
                                <asp:Button ID="SaveNextBtn" CssClass="white" runat="server" OnClick="SaveNextBtn_Click"
                                    Text="Save &amp; Next" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                &nbsp;                               
                                <asp:Button ID="ClosePanelBtn" CssClass="white" runat="server" OnClick="ClosePanelBtn_Click"
                                    Text="Hide" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                                &nbsp;&nbsp;
                                <asp:Label ID="GridLineLbl" runat="server" CssClass="pagetitle"></asp:Label>
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
        OnNeedDataSource="ResultDG_NeedDataSource" BorderStyle="Solid" Skin="Office2007"
        OnGridExporting="ResultDG_GridExporting" AllowSorting="true" AllowFilteringByColumn="true"
        OnItemDataBound="ResultDG_ItemDataBound">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Scrolling ScrollHeight="400px" AllowScroll="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
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
                            <img id="editImg" border="0" alt="Edit" title="Edit" src="../../image/pencil.gif"
                                width="15" height="15" runat="server" /></a> <a id="lnkDelete" onclick="return confirm('Confirm delete?')"
                                    href='<%#DataBinder.Eval(Container,"DataItem.id")%>' runat="server" onserverclick="ISDetail_Delete">
                                    <img id="delImg" border="0" alt="Delete Receipt Detail" src="../../image/bin.gif"
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
                <telerik:GridBoundColumn HeaderText="EstReleaseDate" DataField="lot16" AllowFiltering="true"
                    SortExpression="lot16" UniqueName="lot16" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ActualReleaseDate" DataField="lot1" AllowFiltering="true"
                    SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Commodity" DataField="commodity" AllowFiltering="true"
                    SortExpression="commodity" UniqueName="commodity" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TankCondition" DataField="iCMSTankCondition" AllowFiltering="true"
                    SortExpression="iCMSTankCondition" UniqueName="iCMSTankCondition" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TankStatus" DataField="iCMSTankStatus" AllowFiltering="true"
                    SortExpression="iCMSTankStatus" UniqueName="iCMSTankStatus" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ETD@POL" DataField="lot2" AllowFiltering="true"
                    SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="POLFreeDays" DataField="lot12" AllowFiltering="true"
                    SortExpression="lot12" UniqueName="lot12" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TotalPOLDemurrageDays" DataField="lot13" AllowFiltering="true"
                    SortExpression="lot13" UniqueName="lot13" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SOBDate" DataField="iCMSSOBDate" AllowFiltering="true"
                    SortExpression="iCMSSOBDate" UniqueName="iCMSSOBDate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SOBTankCondition" DataField="iCMSSOBTankCondition" AllowFiltering="true"
                    SortExpression="iCMSSOBTankCondition" UniqueName="iCMSSOBTankCondition" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SOBTankStatus" DataField="iCMSSOBTankStatus" AllowFiltering="true"
                    SortExpression="iCMSSOBTankStatus" UniqueName="iCMSSOBTankStatus" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Depot@POD" DataField="iCMSPODDepot" AllowFiltering="true"
                    SortExpression="iCMSPODDepot" UniqueName="iCMSPODDepot" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ETA@POD" DataField="lot3" AllowFiltering="true"
                    SortExpression="lot3" UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="PODFreeDays" DataField="lot11" AllowFiltering="true"
                    SortExpression="lot11" UniqueName="lot11" Reorderable="true">
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
                <telerik:GridBoundColumn Display="False" DataField="skucode" />
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground" Y="200">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;" DefaultButton="btnOk">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="max-height: 500px; width: 420px; overflow: hidden;">
            <div style="float: left; width: 380px; margin: 20px;">
                <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%;">
                            <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                        </td>
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </br>
                                <asp:Label runat="server" ID="lblMessagePopupText2"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:Button ID="btnOk" runat="server" Style="text-decoration: none;" Text="OK" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>
