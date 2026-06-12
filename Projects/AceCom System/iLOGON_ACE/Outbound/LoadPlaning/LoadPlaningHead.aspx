<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadPlaningHead.aspx.cs" Inherits="iWMS.Web.Outbound.LoadPlaning.LoadPlaningHead" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TransportHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
    <script language="javascript" type="text/javascript">
        function disableBtn(id) {
            var btn = document.getElementById(id);
            btn.disabled = true;
        }
    </script>
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        
       <%-- <div id="div-datagrid" >--%>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
            EnableLinqExpressions="false" AllowPaging="true" Height="92%"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50"
                DataKeyNames="ldid">
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
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="DetailLbl" runat="server" />
                        </ItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="acid" Display="false"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="ldid" SortExpression="ldid" Display="false"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="AcName" SortExpression="AcName" HeaderText="AcName"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="exref" SortExpression="exref" HeaderText="ExRef"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="shipmentNo" SortExpression="shipmentNo" HeaderText="ShipmentNo"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="ContainerNo"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="ctnrtypedescr" SortExpression="ctnrtypedescr" HeaderText="CtnrType"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="ctnrsize" SortExpression="ctnrsize" HeaderText="CtnrSize"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="imdg" SortExpression="imdg" HeaderText="IMDG"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="remarks1" SortExpression="remarks1" HeaderText="Remarks1"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="remarks2" SortExpression="remarks2" HeaderText="Remarks2"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="ctnrtype" Display="False"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>                  
                    <telerik:GridBoundColumn DataField="status" Display="False"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <%--</div>--%>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;">
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
                                    <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
        </asp:Panel>
        <%--Message popup area end--%>
    </form>
</body>
</html>