<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PickInProgress.aspx.cs" Inherits="iWMS.Web.Outbound.PickTicket.PickInProgress" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PickInProgress</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script src="../../js/checkbox.js" type="text/javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
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
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <asp:Label ID="MessageLbl" runat="server" Visible="false" CssClass="errorLabel"></asp:Label>
        <table style="width: 100%; height: 30px">
            <tr>
                <td>
                    <asp:Button ID="CancelBtn" runat="server" Text="CancelPick" OnClick="CancelPickBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="CancelPickBtn" UseSubmitBehavior="false" CssClass="white" Visible="true" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
            AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Scrolling UseStaticHeaders="true" />
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
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
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="startdate" SortExpression="startdate" HeaderText="Start"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pickercode" SortExpression="pickercode" HeaderText="Picker"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="AcCode"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="isno" SortExpression="isno" HeaderText="GINo"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TTPTDT" SortExpression="TTPTDT" HeaderText="PickLines" AllowFiltering="false"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="PTNo" Display="false" AllowFiltering="false"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OPNo" AllowFiltering="false" Display="false"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="type" Display="False"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="False"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="StatusColourCode">
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
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="white" Width="420" Style="display: none; border: 2px solid #780606;"
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
                                    <asp:Button ID="btnOk" runat="server" Text="Okay" class="white" />&nbsp;
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
