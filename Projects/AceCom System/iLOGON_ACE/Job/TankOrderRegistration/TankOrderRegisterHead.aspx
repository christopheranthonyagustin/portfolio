<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderRegisterHead.aspx.cs"
    Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderRegisterHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TankOrderRegisterHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/CastleBusyBox.js" language="javascript" type="text/javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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

    <script language="javascript" type="text/javascript">
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
    <script type="text/javascript">
        function OnClientClose2(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <p>
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                Visible="False"></asp:Label>
        </p>
        <table>
            <tr>
                <%--Cancel Button--%>
                <td align="left">
                    <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="cancelImgBtn_Clicked" Text="Cancel"
                        OnClientClick="return confirm('Confirm to cancel Tank Order? All tank movements for this order will be removed upon confirmation.')" />&nbsp;
                </td>
                <td>
                    <asp:Button ID="CopyBtn" class="white" runat="server" OnClick="CopyBtn_Click" Text="Copy"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                </td>
                <%--Submit Button--%>
                <td align="left">
                    <asp:Button ID="Submit_RadButton" class="white" runat="server" OnClick="Submit_RadButtonClicked" Text="Submit"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="false" />&nbsp;
                </td>
                <td>
                    <asp:Button ID="CloseBtn" class="white" runat="server" OnClick="CloseBtn_Click" Text="Close"
                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="false" />&nbsp;
                </td>
                <%--Approve Button--%>
                <td align="left">
                    <asp:Button ID="Approve_RadButton" class="white" runat="server" OnClick="Approve_RadButtonClicked" Text="Approve"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="false" />&nbsp;
                </td>
                <%--Reject Button--%>
                <td align="left">
                    <asp:Button ID="Reject_RadButton" class="white" runat="server" OnClick="Reject_RadButtonClicked" Text="Reject"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="false" />&nbsp;
                </td>
                <%-- PrintPDF Button--%>
                <td align="left">
                    <asp:Button ID="MSDSBtn" class="white" runat="server" OnClick="MSDSBtn_Click" Text="MSDS"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="false" />
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" Width="8500px"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
            OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged"
            OnDetailTableDataBind="ResultDG_DetailTableDataBind" OnPreRender="ResultDG_PreRender">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="true"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid"
                HierarchyLoadMode="Client">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:CheckBox ID="SelectALLCB" runat="server" onclick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="SelectCB" runat="server"></asp:CheckBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Wrap="true" ItemStyle-Width="80px" HeaderStyle-Wrap="true" HeaderStyle-Width="80px">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="TankOrderEdit" ImageUrl="../../image/pencil.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Tank Order Register"
                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <iWMS:iSubMenu ID="subMenuCtl" runat="server"></iWMS:iSubMenu>
                            <iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="false" DataField="acid">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="JobNo" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" SortExpression="status" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="poldescr" SortExpression="poldescr" HeaderText="POL" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="poddescr" SortExpression="poddescr" HeaderText="POD" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LDCommodityDescr" SortExpression="LDCommodityDescr" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"
                        HeaderText="Commodity">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="totalqty" SortExpression="totalqty" HeaderText="UnitsBooked" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"
                        DataFormatString="{0:N0}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="noofctnr" SortExpression="noofctnr" HeaderText="TotalUnits" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"
                        DataFormatString="{0:N0}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OSUnits" SortExpression="OSUnits" HeaderText="O/sUnits" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"
                        DataFormatString="{0:N0}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="entid" SortExpression="entid" HeaderText="Entity" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"
                        Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="quid" SortExpression="quid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="qucode" SortExpression="qucode" HeaderText="CostingSheetNo" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exportername" SortExpression="exportername" HeaderText="Shipper" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="consigneename" SortExpression="consigneename"
                        HeaderText="Consignee">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShippingTerms" SortExpression="ShippingTerms" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"
                        HeaderText="ShippingTerms">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="CustomerRef" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderby" SortExpression="orderby" HeaderText="OrderBy" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="POLETA" SortExpression="POLETA" HeaderText="POLETA" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="POLCEFreeDays" SortExpression="POLCEFreeDays" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"
                        HeaderText="POLFreeDays">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PODETA" SortExpression="PODETA" HeaderText="PODETA" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PODREFreeDays" SortExpression="PODREFreeDays" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"
                        HeaderText="PODFreeDays">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="delvagentcode" SortExpression="delvagentcode" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"
                        HeaderText="PODAgent">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Vessel" SortExpression="Vessel" HeaderText="Vessel" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Voyage" SortExpression="Voyage" HeaderText="Voyage" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="jobdescr" SortExpression="jobdescr" HeaderText="TankRequirements" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
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
                    <telerik:GridBoundColumn DataField="id" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="carrierId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" Width="100%" SkinID="Telerik"
                        AllowPaging="false" AllowFilteringByColumn="false" AllowSorting="false" TableLayout="Fixed">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle Wrap="false" />
                        <AlternatingItemStyle Wrap="false" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                HeaderStyle-Width="80px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="TankOrderEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Tank Order Register"
                                        OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                    <iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="JobNo" HeaderStyle-Width="160px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="poldescr" SortExpression="poldescr" HeaderText="POL" HeaderStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="poddescr" SortExpression="poddescr" HeaderText="POD" HeaderStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="exportername" SortExpression="exportername" HeaderText="Shipper" HeaderStyle-Width="500px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="consigneename" SortExpression="consigneename"
                                HeaderText="Consignee" HeaderStyle-Width="500px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShippingTerms" SortExpression="ShippingTerms"
                                HeaderText="ShippingTerms" HeaderStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="POLETA" SortExpression="POLETA" HeaderText="POLETA"
                                DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="POLCEFreeDays" SortExpression="POLCEFreeDays"
                                HeaderText="POLFreeDays" HeaderStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PODETA" SortExpression="PODETA" HeaderText="PODETA"
                                DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PODREFreeDays" SortExpression="PODREFreeDays"
                                HeaderText="PODFreeDays" HeaderStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="delvagentcode" SortExpression="delvagentcode"
                                HeaderText="PODAgent" HeaderStyle-Width="200px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Vessel" SortExpression="Vessel" HeaderText="Vessel" HeaderStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Voyage" SortExpression="Voyage" HeaderText="Voyage" HeaderStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="id" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="carrierId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="false" DataField="acid">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="entid" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="quid" Display="false">
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
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1000px" Height="600px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
        <telerik:RadWindow ID="RadWindow1" runat="server" VisibleOnPageLoad="true" Width="430px" Height="300px"
            Modal="true" VisibleStatusbar="false" OnClientClose2="OnClientClose2" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script type="text/javascript">
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
