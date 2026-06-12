<%@ Page Language="c#" CodeBehind="TransferHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.Transfer.TransferHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TransferHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/checkbox.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }
    </style>
</head>
<body >
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
        AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <br />
    <form id="Form1" method="post" runat="server">
        <asp:Button runat="server" ID="PopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup" runat="server" PopupControlID="ConfrimMessagePanel"
            TargetControlID="PopupTargetButton" BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="ConfrimMessagePanel" BackColor="White" Width="420"
            Style="display: none; border: 2px solid #780606;" DefaultButton="ConfirmYesBtn">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="ConfrimMsg" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="ConfirmCancelBtn" runat="server" Style="float: right; margin-right: 15px;" OnClick="ConfirmCancelBtn_Click">X</asp:LinkButton>
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
                                    <br />
                                    <asp:Label ID="popupConfrimMsgType" runat="server" Text="" Font-Size="Medium"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center; vertical-align: top;" colspan="3">
                                <div>
                                    <asp:Button ID="ConfirmYesBtn" CssClass="white" runat="server" Text="  OK  " OnClick="ConfirmYesBtn_Click" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <table>
            <tr>
                &nbsp;&nbsp;<asp:Button ID="SendConfirmationBtn" runat="server" Text="Send Confirmation" OnClick="SendConfirmationBtn_Click"
                    OnClientClick="disableBtn(this.id,false)"
                    UseSubmitBehavior="false" CssClass="LongLabelGreen" ToolTip="Send Confirmation" />
               
            </tr>
        </table>
        <br />

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowFilteringByColumn="true" EnableLinqExpressions="false" AllowSorting="true"
            Skin="Metro" AllowPaging="true" OnPageIndexChanged="ResultDG_PageIndexChanged"
            OnItemDataBound="ResultDG_ItemDataBound" GroupPanelPosition="Top">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50">
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
                    <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="TransferForm" ImageUrl="../../image/pencil.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Form"
                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>&nbsp;&nbsp;
                        <asp:ImageButton runat="server" Visible="True" ID="TransferFinalize" ImageUrl="../../image/finalize.gif"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Finalize"
                            OnClick="ldFinalize_Click" CausesValidation="False"></asp:ImageButton>&nbsp;&nbsp;
                        <asp:ImageButton runat="server" Visible="True" ID="TransferDelete" ImageUrl="../../image/bin.gif"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Delete"
                            OnClick="ldDelete_Click" CausesValidation="False"></asp:ImageButton>&nbsp;&nbsp;
                        <asp:ImageButton runat="server" Visible="True" ID="TFConfirmationDone" ImageUrl="../../image/Green_Lightning.png"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Confirmation Sent" ToolTip="Confirmation Sent"
                           CausesValidation="False"></asp:ImageButton>&nbsp;&nbsp;
                        <asp:ImageButton runat="server" Visible="True" ID="TransferTicket" ImageUrl="../../image/print.gif"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Transfer Ticket"
                            OnClick="ldTransferTicket_Click" CausesValidation="False"></asp:ImageButton>&nbsp;&nbsp;
                        <iWMS:iSubMenu ID="subMenuCtl" runat="server" Visible="false"></iWMS:iSubMenu>
                        </ItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="acid" SortExpression="acid" Display="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="Transfer#">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="refno" SortExpression="refno" HeaderText="Ref.No">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="reasoncode" Visible="False">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="reasondescr" SortExpression="reasondescr" HeaderText="Reason">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="finalizeddate" SortExpression="finalizeddate"
                        HeaderText="Finalized Date" DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark 1">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark 2">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TFConfirmationDone" Display="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
