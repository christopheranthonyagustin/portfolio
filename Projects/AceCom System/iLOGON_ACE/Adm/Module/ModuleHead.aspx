<%@ Page Language="c#" CodeBehind="ModuleHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Module.ModuleHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>AppHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">

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
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="SearchResultsTab" Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ProfilesGrantedTab" Text="Profiles Granted" Value="50" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MasterListRadPageView">

                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="DeleteParentNodeBtn" runat="server" Text="Delete Parent Node" OnClick="DeleteParentNodeBtn_Click" OnClientClick="disableBtn(this.id)"
                                UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                            <br />
                        </td>
                    </tr>
                </table>
                <div id="div-datagrid" style="height: 92%">
                    <asp:UpdatePanel ID="UpdButton" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <br />
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true"
                                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                                OnItemDataBound="ResultDG_ItemDataBound">
                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="midx">
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
                                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Module"
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
                            </telerik:RadGrid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="OkayBtn" Text="" Style="display: none;" OnClick="OkayBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                            </td>
                        </tr>
                    </table>
                </div>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="80%" ID="ProfilesGrantedRadpageview">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>

    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=OkayBtn.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>

</body>
</html>
