<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelTimings.aspx.cs" Inherits="iWMS.Web.Master.Personnel.PersonnelTimings" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PersonnelTimings</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
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
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Panel ID="CtrlPanel" runat="server">
            <br />
            &nbsp;
            <asp:Button ID="NewBtn" class="white" runat="server" OnClick="NewBtn_Click" Text="New"
                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
            <asp:Button ID="DeleteBtn" class="white" runat="server" OnClick="DeleteBtn_Click" Text="Delete"
                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            <br />
            <br />
            <br />
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                    <%--<Scrolling ScrollHeight="400px" AllowScroll="true" />--%>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
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
                                <asp:ImageButton runat="server" Visible="True" ID="ServicePtTimingEdit" ImageUrl="../../image/pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit ServicePointTiming"
                                    OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="delImg" ImageUrl="../../image/bin.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Delete ServicePointTiming"
                                    OnClick="DeleteImg_Click" CausesValidation="False"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="seqno" SortExpression="seqno" HeaderText="SeqNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="cat" SortExpression="cat" HeaderText="Cat">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="fromtime" SortExpression="fromtime" HeaderText="FromTime">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="totime" SortExpression="totime" HeaderText="ToTime">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="date" SortExpression="date" HeaderText="Date">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="mon" SortExpression="mon" HeaderText="Mon">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tue" SortExpression="tue" HeaderText="Tue">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="wed" SortExpression="wed" HeaderText="Wed">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="thu" SortExpression="thu" HeaderText="Thu">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="fri" SortExpression="fri" HeaderText="Fri">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sat" SortExpression="sat" HeaderText="Sat">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sun" SortExpression="sun" HeaderText="Sun">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks1">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remarks2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" Display="false" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </asp:Panel>
        <asp:Panel ID="AddPanel" runat="server">
            <br />&nbsp;
            <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add"
                OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />&nbsp;
            <asp:Button ID="HideBtn" class="white" runat="server" OnClick="HideBtn_Click" Text="Hide"
                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />&nbsp;
            <br />
            <br />
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </asp:Panel>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>

