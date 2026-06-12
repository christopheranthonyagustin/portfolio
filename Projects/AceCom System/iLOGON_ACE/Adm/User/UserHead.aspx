<%@ Page Language="c#" CodeBehind="UserHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.User.UserHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
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
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>

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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptMgr" runat="server" EnablePageMethods="true" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Data Permission" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                &nbsp;
                <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click" Text="Refresh"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                    OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="InactiveBtn" class="longlabelwhite" runat="server" OnClick="InactiveBtn_Click" Text="Set as Inactive"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br />
                <br />
                <div id="div-datagrid" style="height: 92%">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowFilteringByColumn="true"
                        AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro"
                        OnNeedDataSource="ResultDG_NeedDataSource"  OnItemDataBound="ResultDG_ItemDataBound">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="userid">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <HeaderTemplate>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemTemplate>
                                        <%--<asp:Label ID="DetailLbl" runat="server"></asp:Label>--%>
                                        <asp:ImageButton runat="server" Visible="true" ID="UserEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" OnClick="UserEdit_Click" CausesValidation="False"></asp:ImageButton>
                                        <asp:ImageButton runat="server" Visible="True" ID="CopyLbl" ImageUrl="../../image/copy.png"
                                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                            OnClick="ImgCopy_Click" CausesValidation="False"></asp:ImageButton>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="userid" SortExpression="userid" HeaderText="User ID"
                                    ItemStyle-Wrap="False">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="username" SortExpression="username" HeaderText="Name"
                                    ItemStyle-Wrap="False">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Type" SortExpression="Type" HeaderText="User Type"
                                    ItemStyle-Wrap="False">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="declarantcode" SortExpression="declarantcode"
                                    HeaderText="Declarant Code" ItemStyle-Wrap="False">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="profile" SortExpression="profile" HeaderText="Profile"
                                    ItemStyle-Wrap="False">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ActiveDescr" SortExpression="ActiveDescr" HeaderText="Active" AllowFiltering="false"
                                    ItemStyle-Wrap="False">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lastlogin" SortExpression="lastlogin" HeaderText="Last Login"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                                    ItemStyle-Wrap="False">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                                    ItemStyle-Wrap="False">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Active" SortExpression="Active" HeaderText="Active" AllowFiltering="false"
                                    Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
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
                                            <asp:Button ID="btnOk" runat="server" Text="OK" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:Panel>
                <%--Message popup area end--%>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="DataPermisionRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
