<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WHSRackingLocationListHead.aspx.cs" Inherits="iWMS.Web.Master.WarehouseRackingLocation.WarehouseRackingLocationListHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>WarehouseRackingLocationListHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
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
<body>
    <form id="Form1" method="post" runat="server" defaultbutton="MassChangeBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <p>
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                Visible="False"></asp:Label>
        </p>
        <table>
            <tr>
                <td style="width: 800px;">
                    <asp:Button ID="MassChangeBtn" CssClass="white" runat="server" OnClick="MassChangeBtn_Click" Text="SpeedUp" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                    <asp:Button ID="InventoryBtn" CssClass="white" runat="server" OnClick="InventoryBtn_Click" Text="Inventory" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                    <asp:Label ID="lblProcessID" runat="server" Visible="False" />
                    <asp:Button ID="DeleteBtn" class="white" runat="server" OnClick="DeleteBtn_Click" Text="Delete"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td align="right" style="width: 928px;">
                    <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <table id="ResultTB">
            <tr>
                <td>
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="true"
                        AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="code">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <HeaderTemplate>
                                        <label id="completelbl">
                                        </label>
                                        &nbsp;<input id="SelectALLCB" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="MassChangeChkbx" runat="server"></asp:CheckBox>
                                        <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                            BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Location_Edit"></asp:ImageButton>&nbsp;
                                        <a id="InkAssign" href='<%#DataBinder.Eval(Container,"DataItem.code")%>' onserverclick="AssignedSKU"
                                            runat="server">
                                            <img id="Img1" src="../../image/detail.gif" width="15" height="15" border="0" alt="Assign SKU"
                                                runat="server"></a>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="code" SortExpression="code" HeaderText="Location" Reorderable="true" ColumnGroupName="code" UniqueName="code"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Code2" SortExpression="Code2" HeaderText="Code2" Reorderable="true" ColumnGroupName="Code2" UniqueName="Code2"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CheckDigit" SortExpression="CheckDigit" HeaderText="CheckDigit" Reorderable="true" ColumnGroupName="CheckDigit" UniqueName="CheckDigit"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TUNo1" SortExpression="TUNo1" HeaderText="TUNo1" Reorderable="true" ColumnGroupName="TUNo1" UniqueName="TUNo1"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="maxvol" SortExpression="maxvol" HeaderText="MaxVol" Reorderable="true" ColumnGroupName="maxvol" UniqueName="maxvol"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="maxwt" SortExpression="maxwt" HeaderText="MaxWt" Reorderable="true" ColumnGroupName="maxwt" UniqueName="maxwt"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="maxtuno1" SortExpression="maxtuno1" HeaderText="MaxTuno1" Reorderable="true" ColumnGroupName="maxtuno1" UniqueName="maxtuno1"
                                    ItemStyle-Wrap="false" AllowFiltering="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="maxtuno2" SortExpression="maxtuno1" HeaderText="MaxTuno2" Reorderable="true" ColumnGroupName="maxtuno2" UniqueName="maxtuno2"
                                    ItemStyle-Wrap="false" AllowFiltering="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="length" SortExpression="length" HeaderText="Length" Reorderable="true" ColumnGroupName="length" UniqueName="length"
                                    ItemStyle-Wrap="false" AllowFiltering="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="width" SortExpression="width" HeaderText="Width" Reorderable="true" ColumnGroupName="width" UniqueName="width"
                                    ItemStyle-Wrap="false" AllowFiltering="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="height" SortExpression="height" HeaderText="Height" Reorderable="true" ColumnGroupName="height" UniqueName="height"
                                    ItemStyle-Wrap="false" AllowFiltering="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="empty" SortExpression="empty" HeaderText="Empty" Reorderable="true" ColumnGroupName="empty" UniqueName="empty"
                                    ItemStyle-Wrap="false" AllowFiltering="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site" Reorderable="true" ColumnGroupName="sitedescr" UniqueName="sitedescr"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="catdescr" SortExpression="catdescr" HeaderText="Category" Reorderable="true" ColumnGroupName="catdescr" UniqueName="catdescr"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" Reorderable="true" ColumnGroupName="typedescr" UniqueName="typedescr"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="flagdescr" SortExpression="flagdescr" HeaderText="Flag" Reorderable="true" ColumnGroupName="flagdescr" UniqueName="flagdescr"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="zonedescr" SortExpression="zonedescr" HeaderText="Zone" Reorderable="true" ColumnGroupName="zonedescr" UniqueName="zonedescr"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" Reorderable="true" ColumnGroupName="statusdescr" UniqueName="statusdescr"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="abc" SortExpression="abc" HeaderText="ABC" Reorderable="true" ColumnGroupName="abc" UniqueName="abc" ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="mixsku" SortExpression="mixsku" HeaderText="Mix SKU" Reorderable="true" ColumnGroupName="mixsku" UniqueName="mixsku"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="mixlot" SortExpression="mixlot" HeaderText="Mix Lot" Reorderable="true" ColumnGroupName="mixlot" UniqueName="mixlot"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="mixtuno1" SortExpression="mixtuno1" HeaderText="Mix Tuno1" Reorderable="true" ColumnGroupName="mixtuno1" UniqueName="mixtuno1"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="mixtuno2" SortExpression="mixtuno2" HeaderText="Mix Tuno2" Reorderable="true" ColumnGroupName="mixtuno2" UniqueName="mixtuno2"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="enableput" HeaderText="EnablePUTA" SortExpression="enableput" Reorderable="true" ColumnGroupName="enableput" UniqueName="enableput"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="enableallc" HeaderText="EnableALLC" SortExpression="enableallc" Reorderable="true" ColumnGroupName="enableallc" UniqueName="enableallc"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="enablemove" HeaderText="EnableMove" SortExpression="enablemove" Reorderable="true" ColumnGroupName="enablemove" UniqueName="enablemove"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="countroute" SortExpression="countroute" HeaderText="Count Route" Reorderable="true" ColumnGroupName="countroute" UniqueName="countroute"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="aislefrchar" SortExpression="aisletochar" HeaderText="Aisle Fr.Char" Reorderable="true" ColumnGroupName="aislefrchar" UniqueName="aislefrchar"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="aisletochar" SortExpression="aisletochar" HeaderText="Aisle To.Char" Reorderable="true" ColumnGroupName="aisletochar" UniqueName="aisletochar"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="aisle" SortExpression="aisle" HeaderText="Aisle" Reorderable="true" ColumnGroupName="aisle" UniqueName="aisle"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="levelfrchar" SortExpression="leveltochar" HeaderText="Level Fr.Char" Reorderable="true" ColumnGroupName="levelfrchar" UniqueName="levelfrchar"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="leveltochar" SortExpression="leveltochar" HeaderText="Level To.Char" Reorderable="true" ColumnGroupName="leveltochar" UniqueName="leveltochar"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="level" SortExpression="level" HeaderText="Level" Reorderable="true" ColumnGroupName="level" UniqueName="level"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bayfrchar" SortExpression="bayfrchar" HeaderText="Bay Fr.Char" Reorderable="true" ColumnGroupName="bayfrchar" UniqueName="bayfrchar"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="baytochar" SortExpression="baytochar" HeaderText="Bay To.Char" Reorderable="true" ColumnGroupName="baytochar" UniqueName="baytochar"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bay" SortExpression="bay" HeaderText="Bay" Reorderable="true" ColumnGroupName="bay" UniqueName="bay" ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="binfrchar" SortExpression="bintochar" HeaderText="Bin Fr.Char" Reorderable="true" ColumnGroupName="binfrchar" UniqueName="binfrchar"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bintochar" SortExpression="bintochar" HeaderText="Bin To.Char" Reorderable="true" ColumnGroupName="bintochar" UniqueName="bintochar"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bin" SortExpression="bin" HeaderText="Bin" Reorderable="true" ColumnGroupName="bin" UniqueName="bin" ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="putpri" SortExpression="putpri" HeaderText="Put Pri" Reorderable="true" ColumnGroupName="putpri" UniqueName="putpri"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pickpri" SortExpression="pickpri" HeaderText="Pick Pri" Reorderable="true" ColumnGroupName="pickpri" UniqueName="pickpri"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" Reorderable="true" ColumnGroupName="adddate" UniqueName="adddate"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" Reorderable="true" ColumnGroupName="adduser" UniqueName="adduser"
                                    ItemStyle-Wrap="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" Reorderable="true" ColumnGroupName="editdate" UniqueName="editdate"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false" Reorderable="true" ColumnGroupName="edituser" UniqueName="edituser"
                                    HeaderText="EditUser">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sitecode" Display="false"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>
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
                                    <asp:Button ID="btnOk" runat="server" Style="text-decoration: none;" Text="Okay" CssClass="white" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
        <%--Message popup 2 area start For Confirm Message Box--%>
        <asp:Button runat="server" ID="PopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup" runat="server" PopupControlID="ConfrimMessagePanel"
            TargetControlID="PopupTargetButton" BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="ConfrimMessagePanel" BackColor="White" Width="420"
            Style="display: none; border: 2px solid #780606;" DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="ConfrimMsg" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="ConfirmCancelBtn" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div id="Div1" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table id="ConfirmTb" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal ID="ltrConfirmImge" runat="server"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label ID="popupConfrimMsgType" runat="server" Text=""></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="ConfirmCancel" runat="server" Text="Cancel" OnClick="ConfirmCancelBtn_Click" CssClass="white" />
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="ConfirmYesBtn" runat="server" Text="Okay" OnClick="ConfirmYesBtn_Click" CssClass="white" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup 2 area end--%>
    </form>
</body>
</html>
