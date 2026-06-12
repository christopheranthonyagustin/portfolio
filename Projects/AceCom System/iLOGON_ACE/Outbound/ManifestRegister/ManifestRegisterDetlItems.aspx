<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManifestRegisterDetlItems.aspx.cs" Inherits="iWMS.Web.Outbound.ManifestRegister.ManifestRegisterDetlItems" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ManifestRegisterDetlItems</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>

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
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="1" cellpadding="1" width="100%">
        <tr>
            <td>
                <asp:Label ID="mrNoLbl" runat="server" CssClass="pagetitle"></asp:Label>&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Button ID="DeleteBtn" class="white" runat="server" OnClick="DeleteBtn_Click" Text="Delete"  
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
            </td>
        </tr>  
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowMultiRowSelection="true"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" 
        OnNeedDataSource="ResultDG_NeedDataSource" OnItemCommand="ResultDG_ItemCommand"
        OnItemDataBound="ResultDG_ItemDataBound" OnDetailTableDataBind="ResultDG_DetailTableDataBind">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Scrolling AllowScroll="true" ScrollHeight="300px" SaveScrollPosition="true" />
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                    HeaderStyle-Width="70px" ItemStyle-Width="70px">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="AddBtn" ImageUrl="..\..\image\add.png" BorderWidth="0"
                            BackColor="Transparent" Width="15" Height="15" AlternateText="Add" CommandArgument="AddMRSDet"
                            CommandName="AddMRSDet"></asp:ImageButton>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="BoxNo" DataField="BoxNo" AllowFiltering="true"
                    ColumnGroupName="BoxNo" SortExpression="BoxNo" UniqueName="BoxNo" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Length" DataField="length" AllowFiltering="true" DataFormatString="{0:0.###}"
                    ColumnGroupName="length" SortExpression="length" UniqueName="length" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Width" DataField="width" AllowFiltering="true" DataFormatString="{0:0.###}"
                    ColumnGroupName="width" SortExpression="width" UniqueName="width" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Height" DataField="height" AllowFiltering="true" DataFormatString="{0:0.###}"
                    ColumnGroupName="height" SortExpression="height" UniqueName="height" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="WT" DataField="wt" AllowFiltering="true" DataFormatString="{0:0.###}"
                    ColumnGroupName="wt" SortExpression="wt" UniqueName="wt" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Vol" DataField="vol" AllowFiltering="true" DataFormatString="{0:0.###}"
                    ColumnGroupName="vol" SortExpression="vol" UniqueName="vol" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Content" DataField="Content" AllowFiltering="true"
                    ColumnGroupName="Content" SortExpression="Content" UniqueName="Content" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="PKId" SortExpression="PKId" HeaderText="PKId" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="PKCtnId" SortExpression="PKCtnId" HeaderText="PKCtnId" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="mrdpkctnid" DataField="mrdpkctnid" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status" Display="false">
                </telerik:GridBoundColumn>
            </Columns>
            <DetailTables>
                <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                    Width="100%" InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true" AllowAutomaticInserts="true">
                    <HeaderStyle Wrap="false" />
                    <ItemStyle Wrap="false" />
                    <AlternatingItemStyle Wrap="false" />
                    <Columns>
                        <telerik:GridClientSelectColumn UniqueName="ChildClientSelectColumn"></telerik:GridClientSelectColumn>
                        <telerik:GridBoundColumn HeaderText="id" DataField="id" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="MaterialNumber" DataField="MaterialNumber" AllowFiltering="true"
                            ColumnGroupName="MaterialNumber" SortExpression="MaterialNumber" UniqueName="MaterialNumber" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="MaterialDescr" DataField="MaterialDescr" AllowFiltering="true"
                            ColumnGroupName="MaterialDescr" SortExpression="MaterialDescr" UniqueName="MaterialDescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Uom" DataField="Uom" AllowFiltering="true"
                            ColumnGroupName="Uom" SortExpression="Uom" UniqueName="Uom" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Qty" DataField="Qty" AllowFiltering="true" DataFormatString="{0:0.###}"
                            ColumnGroupName="Qty" SortExpression="Qty" UniqueName="Qty" Reorderable="true">
                        </telerik:GridBoundColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
        </MasterTableView>
    </telerik:RadGrid>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
        DefaultButton="btnOk">
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
                        <td style="width: 2%;"></td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:Button ID="btnOk" runat="server" Text="OK" />
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
