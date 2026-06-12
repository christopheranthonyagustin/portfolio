<%@ Page Language="c#" CodeBehind="AccountHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Account.AccountHead" %>

<%@ Register TagPrefix="iWMSF" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>AccountHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href=".paif./../css/iWMSTelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
        function confirmation(msg) {
            var answer = confirm(msg)
            if (answer) {
                return true;
            } else {
                return false;
            }
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <table>
            <tr>

                <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
                    CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
                    <Tabs>
                        <telerik:RadTab ID="ResultTap" Text="Search Results" Value="0" readonly="readonly" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>

            </tr>
        </table>
        <table style="width: 100%; height: 30px">
            <tr>
                <br />
                <td class="style1">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                    <asp:Button ID="CopyBtn" class="white" runat="server" OnClick="CopyBtn_Click" Text="Copy"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                    &nbsp;    
                    <asp:Button ID="StatusBtn" CssClass="LongLabelWhite" runat="server" OnClick="StatusBtn_Click"
                        Text="Change &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="ChangeCodeBtn" CssClass="LongLabelWhite" runat="server" OnClick="ChangeCodeBtn_Click"
                        Text="Change &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                   <asp:Button ID="PurgeBtn" CssClass="white" runat="server" OnClick="PurgeBtn_Click" Text="Purge"
                       OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="DrCfmImgBtn" runat="server" Text="Post " OnClick="DrCfmImgBtn_Click"
                        OnClientClick="return confirmation('Confirm Mass Post Account?');" UseSubmitBehavior="true" CssClass="green" ToolTip="PostAccount" />
                </td>
                <td>
                    <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                </td>
                <td align="right">
                    <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <br />

        <asp:Label Style="z-index: 0" ID="Label2" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
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
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <asp:ImageButton runat="server" Visible="True" ID="AccCancel" ImageUrl="../../image/bin.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Cancel Account"
                                OnClick="AccCancel_Click" OnClientClick="return confirm('Confirm Cancel?')" CausesValidation="False"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="code" ItemStyle-Wrap="false" SortExpression="Code"
                        HeaderText="Account">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="code2" ItemStyle-Wrap="false" SortExpression="Code2"
                        HeaderText="Code2">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="name" SortExpression="name" HeaderText="Name"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="actypedescr" ItemStyle-Wrap="false" SortExpression="actypedescr"
                        HeaderText="Type">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" ItemStyle-Wrap="false" SortExpression="statusdescr"
                        HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="addr1" ItemStyle-Wrap="false" SortExpression="addr1"
                        HeaderText="Address#1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="addr2" SortExpression="addr2" HeaderText="Address#2"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="addr3" ItemStyle-Wrap="false" SortExpression="addr3"
                        HeaderText="Address#3">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="addr4" ItemStyle-Wrap="false" SortExpression="addr4"
                        HeaderText="Address#4">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="zipcode" ItemStyle-Wrap="false" SortExpression="zipcode"
                        HeaderText="Zip Code">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="citycode" ItemStyle-Wrap="false" SortExpression="citycode"
                        HeaderText="City">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="country" ItemStyle-Wrap="false" SortExpression="country"
                        HeaderText="Country">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="biztypedescr" SortExpression="biztypedescr" HeaderText="Business Type"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="smancodedescr" SortExpression="smancodedescr"
                        HeaderText="Sales Man" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="entityname" SortExpression="entityname" HeaderText="Entity"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="crblockstatusdescr" SortExpression="crblockstatusdescr"
                        HeaderText="CrBlockStatus" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="inshelflife" SortExpression="inshelflife" HeaderText="Shelf Life(In)"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="outshelflife" SortExpression="outshelflife" HeaderText="Shelf Life(Out)"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderby1" SortExpression="orderby1" HeaderText="OrderBy1"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyemail1" SortExpression="orderbyemail1"
                        HeaderText="Email" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyphone1" SortExpression="orderbyphone1"
                        HeaderText="Phone" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyremarks1" SortExpression="orderbyremarks1"
                        HeaderText="Remarks" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderby2" SortExpression="orderby2" HeaderText="OrderBy2"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyemail2" SortExpression="orderbyemail2"
                        HeaderText="Email" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyphone2" SortExpression="orderbyphone2"
                        HeaderText="Phone" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyremarks2" SortExpression="orderbyremarks2"
                        HeaderText="Remarks" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderby3" SortExpression="orderby3" HeaderText="OrderBy3"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyemail3" SortExpression="orderbyemail3"
                        HeaderText="Email" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyphone3" SortExpression="orderbyphone3"
                        HeaderText="Phone" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyremarks3" SortExpression="orderbyremarks3"
                        HeaderText="Remarks" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderby4" SortExpression="orderby4" HeaderText="OrderBy4"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyemail4" SortExpression="orderbyemail4"
                        HeaderText="Email" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyphone4" SortExpression="orderbyphone4"
                        HeaderText="Phone" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyremarks4" SortExpression="orderbyremarks4"
                        HeaderText="Remarks" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderby5" SortExpression="orderby5" HeaderText="OrderBy5"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyemail5" SortExpression="orderbyemail5"
                        HeaderText="Email" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyphone5" SortExpression="orderbyphone5"
                        HeaderText="Phone" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="orderbyremarks5" SortExpression="orderbyremarks5"
                        HeaderText="Remarks" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="entid" Display="False">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
        <%--Status popup area start--%>
        <%--<asp:Button runat="server" ID="btnStatusButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeStatusPopup" runat="server" PopupControlID="pnlStstusBox"
            TargetControlID="btnStatusButton" CancelControlID="btnStatusCancel" BackgroundCssClass="StatusBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlStstusBox" BackColor="LAVENDER" Width="285px" Style="display: none; border: 2px solid #859DD4;">
            <div class="popupHeader" style="width: 285px;">
                <asp:Label ID="Label1" Text="Change Account Status" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnStatusCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="height: 350px; width: 285px;">
                <table style="margin-top: 10px; margin-left: 7px;" cellpadding="7px">
                    <tr>
                        <td colspan="2">Account<br />
                            <telerik:RadTextBox ID="Accounttxt" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Name<br />
                            <telerik:RadTextBox ID="Nametxt" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Status
                        <asp:Label ID="lblddlReq" runat="server" Text="*" Visible="false"></asp:Label><br />
                            <telerik:RadDropDownList ID="Statusddl" ZIndex="15000" runat="server" Width="155px" Skin="Sunset">
                            </telerik:RadDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Reason<asp:Label ID="lbltxtReq" runat="server" Text="*" Visible="false"></asp:Label>
                            <br />
                            <telerik:RadTextBox ID="Reasontxt" runat="server" Height="90px" Width="249px"
                                TextMode="MultiLine">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="OkayImg" class="white" runat="server" OnClick="OkayImg_Click"
                                Text="Okay" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" ToolTip="Okay" />

                        </td>
                        <td>
                            <asp:Button ID="CancelImg" class="white" runat="server" OnClick="CancelImg_Click" Text="Cancel"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Style="float: right;" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>--%>
        <%--Status popup area end--%>
        <%--Change Code popup area --%>
       <%-- <ajaxToolkit:ModalPopupExtender ID="mpeChangeCodeFunctionPopup" runat="server" PopupControlID="pnlFunctionBox"
            TargetControlID="btnStatusButton" CancelControlID="btnFunctionCancel" BackgroundCssClass="StatusBackground" Y="60">
        </ajaxToolkit:ModalPopupExtender>--%>
       <%-- <asp:Panel runat="server" ID="pnlFunctionBox" BackColor="LAVENDER" Width="285px" Style="display: none; border: 2px solid #859DD4;">
            <div class="popupHeader" style="width: 285px;">
                <asp:Label ID="Label3" Text="Close Job" runat="server" Style="size: 15px">Change Account Code</asp:Label>
                <asp:LinkButton ID="btnFunctionCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="height: 280px; width: 285px;">
                <table style="margin-top: 10px; margin-left: 22px;" cellpadding="7px">
                    <tr>
                        <td>Original Account Code
                            <br />
                            <telerik:RadTextBox ID="OriginalAccountCodetxt" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>New Account Code
                            <asp:Label ID="lblNewAccountCode" runat="server" Text="*"></asp:Label>
                            <br />
                            <telerik:RadTextBox ID="NewAccountCodetxt" runat="server" Width="155px">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Reason<asp:Label ID="lblChangeCodeReason" runat="server" Text="*" Visible="false"></asp:Label>
                            <br />
                            <telerik:RadTextBox ID="ChangeCodeReasontxt" runat="server" Height="90px" Width="220px" Skin="Sunset" BackColor="#ded7c6"
                                TextMode="MultiLine">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="ChangeCodeOkayBtn" CssClass="white" runat="server" OnClick="ChangeCodeOkayBtn_Click" Text="Build"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>--%>
        <%--Change Code popup area end--%>
    </form>
</body>
</html>
