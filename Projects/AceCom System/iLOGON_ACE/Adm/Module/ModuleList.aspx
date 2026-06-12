<%@ Page Language="c#" CodeBehind="ModuleList.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Module.ModuleList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>AppHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
        <table cellpadding="0" cellspacing="2" border="0" width="100%">
            <tr>
                <td class="pagetitle">
                    <asp:Label runat="server" ID="ModuleLbl"></asp:Label>
                    <br>
                    <asp:Button ID="DeleteBtn" runat="server" CssClass="white" Text="Delete"
                        OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    <br>
                    <asp:Button ID="ConfirmDelete" Text="" Style="display: none;" OnClick="ConfirmDelete_Click" runat="server" />
                </td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid">
            <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro"
                OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnRowDrop="ResultDG_RowDrop">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false">
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="midx" Name="ChildGrid">
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
                        <telerik:GridTemplateColumn UniqueName="icon">
                            <ItemTemplate>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.midx")%>'
                                    onserverclick="Module_Delete" runat="server">
                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Module"
                                        runat="server"></a>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="midx" ItemStyle-Wrap="false" SortExpression="midx"
                            HeaderText="MIDX">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="seq" ItemStyle-Wrap="false" SortExpression="seq"
                            HeaderText="Sequence">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="name" ItemStyle-Wrap="false" SortExpression="name"
                            HeaderText="Name">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="descr" ItemStyle-Wrap="false" SortExpression="descr"
                            HeaderText="Description">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="url" ItemStyle-Wrap="false" SortExpression="url"
                            HeaderText="URL">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="target" ItemStyle-Wrap="false" SortExpression="target"
                            HeaderText="Target">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="parentid" ItemStyle-Wrap="false" SortExpression="parentid"
                            HeaderText="Parent#">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="active" ItemStyle-Wrap="false" SortExpression="active"
                            HeaderText="Active">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="mobile" ItemStyle-Wrap="false" SortExpression="mobile"
                            HeaderText="Mobile">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" ItemStyle-Wrap="false" SortExpression="adddate"
                            HeaderText="Adddate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" ItemStyle-Wrap="false" SortExpression="adduser"
                            HeaderText="AddUser">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" ItemStyle-Wrap="false" SortExpression="editdate"
                            HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" ItemStyle-Wrap="false" SortExpression="edituser"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid><asp:Label ID="NoModuleLbl" runat="server" Visible="False">No Module Available</asp:Label>

            <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="OkayBtn" Text="" Style="display: none;" OnClick="OkayBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                        <%-- //<asp:Button ID="ConfirmDeleteBtn" Text="" Style="display: none;" OnClick="ConfirmDeleteBtn_Click1" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>--%>
                    </td>
                </tr>
            </table>
    </form>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=OkayBtn.UniqueID %>", "");
                }
            }
            function ConfirmDeleteBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmDelete.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>
