<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankReleaseOrderHead.aspx.cs"
    Inherits="iWMS.Web.Outbound.TankReleaseOrder.TankReleaseOrderHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>TankReleaseOrderHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

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
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td>
                <asp:ImageButton ID="cancelImgBtn" runat="server" OnClick="cancelImgBtn_Clicked"
                    Visible="false" ToolTip="Cancel" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle"
                    ImageUrl="../../Image/CancelImage.png" />&nbsp; &nbsp;
                <%--<a id="A1" runat="server" onserverclick="ExportExcel">
                    <img id="Img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.png"
                        width="87" height="27" runat="server"></a> --%>
            </td>
        </tr>
    </table>
    <p>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
    </p>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
        OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"
            FileName="ReleaseOrder">
            <Excel Format="Html" />
        </ExportSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                    <HeaderTemplate>
                        <label id="completelbl">
                        </label>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                        <iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Depot">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReleaseOrderNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="totalqty" SortExpression="totalqty" HeaderText="Total "
                    AllowFiltering="false" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:G2}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ReleasedQty " SortExpression="ReleasedQty " HeaderText="Released"
                    AllowFiltering="false" ItemStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="OSQty" SortExpression="OSQty" HeaderText="O/S"
                    AllowFiltering="false" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:G2}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="poldescr" SortExpression="poldescr" HeaderText="POL">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="poddescr" SortExpression="poddescr" HeaderText="POD">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="acid">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="id">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="status">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="type">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;">
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
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
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
