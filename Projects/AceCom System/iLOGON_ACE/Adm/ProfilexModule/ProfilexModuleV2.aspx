<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfilexModuleV2.aspx.cs"
    Inherits="iWMS.Web.Adm.ProfilexModule.ProfilexModuleV2" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>ProfilexModule</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <asp:UpdatePanel ID="UpdBody" runat="server">
            <ContentTemplate>
                <table cellspacing="1" cellpadding="1" border="0" width="100%">
                    <tr>
                        <td>
                            <div class="pagetitle">
                                Module for Profile
                                <asp:Label ID="ProfileLbl" runat="server"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdButton" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="AllBtn1" runat="server" Text="Grant" OnClick="AllBtn_Click"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />&nbsp;
                                     <asp:Button ID="NoneBtn" runat="server" Text="Revoke" OnClick="NoneBtn_Click"
                                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />&nbsp;
                                     <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click"
                                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />&nbsp;
                                     <asp:Button ID="ShowHideBtn" runat="server" Text="Show/Hide" OnClick="ShowHideBtn_Click"
                                         OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />&nbsp;
                                      <asp:Button ID="excelImg" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
                                          UseSubmitBehavior="false" />&nbsp;
                                      <asp:CheckBox ID="chkObjective" ToolTip="Revoke for all profiles" runat="server" />
                                    <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="150px" Font-Size="Small" Text="Revoke for all profiles" ForeColor="Black" OnClientClick="disableBtn(this.id,true)"></asp:Label>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="excelImg" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <asp:UpdateProgress ID="updateProgress" runat="server">
                    <ProgressTemplate>
                        <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                        </div>
                        <div id="LoaderPopup">
                            <a id="loader"></a>
                            <a id="text">We are processing your request ...</a>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <br />
                <telerik:RadTreeList ID="RadTreeList1" runat="server" OnNeedDataSource="RadTreeList1_NeedDataSource"
                    AllowMultiItemSelection="true" ParentDataKeyNames="parentId" DataKeyNames="midx" Height="540px"
                    AllowPaging="false" AutoGenerateColumns="false" AllowSorting="false" Skin="Office2007" HeaderStyle-CssClass="RGridHeader_CUSTOM">
                    <ClientSettings>
                        <Scrolling UseStaticHeaders="true" SaveScrollPosition="true" ScrollHeight="400px" AllowScroll="true" />
                        <Selecting AllowItemSelection="true" AllowToggleSelection="true" />
                    </ClientSettings>
                    <Columns>
                        <telerik:TreeListBoundColumn DataField="idx" UniqueName="idx" Display="false">
                        </telerik:TreeListBoundColumn>
                        <telerik:TreeListBoundColumn DataField="midx" UniqueName="midx" Display="false">
                        </telerik:TreeListBoundColumn>
                        <telerik:TreeListBoundColumn DataField="descr" UniqueName="descr" HeaderText="Name">
                        </telerik:TreeListBoundColumn>
                        <telerik:TreeListTemplateColumn UniqueName="v" HeaderText="View">
                            <ItemTemplate>
                                <asp:CheckBox ID="v_cbox" runat="server" Checked='<%# Boolean.Parse((Eval("v").ToString())) %>' />
                            </ItemTemplate>
                        </telerik:TreeListTemplateColumn>
                        <telerik:TreeListTemplateColumn UniqueName="i" HeaderText="Insert">
                            <ItemTemplate>
                                <asp:CheckBox ID="i_cbox" runat="server" Checked='<%# Boolean.Parse((Eval("i").ToString())) %>' />
                            </ItemTemplate>
                        </telerik:TreeListTemplateColumn>
                        <telerik:TreeListTemplateColumn UniqueName="u" HeaderText="Update">
                            <ItemTemplate>
                                <asp:CheckBox ID="u_cbox" runat="server" Checked='<%# Boolean.Parse((Eval("u").ToString())) %>' />
                            </ItemTemplate>
                        </telerik:TreeListTemplateColumn>
                        <telerik:TreeListTemplateColumn UniqueName="d" HeaderText="Delete">
                            <ItemTemplate>
                                <asp:CheckBox ID="d_cbox" runat="server" Checked='<%# Boolean.Parse((Eval("d").ToString())) %>' />
                            </ItemTemplate>
                        </telerik:TreeListTemplateColumn>
                    </Columns>
                </telerik:RadTreeList>
            </ContentTemplate>
        </asp:UpdatePanel>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmAllBtn" Text="" Style="display: none;" OnClick="ConfirmAllBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
                <td>
                    <asp:Button ID="ConfirmNoneBtn" Text="" Style="display: none;" OnClick="ConfirmNoneBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
            </tr>
        </table>
    </form>

    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmAllBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmAllBtn.UniqueID %>", "");
                }
            }
            function ConfirmNoneBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmNoneBtn.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>
