<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="UserSite.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.User.UserSite" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html>
<head runat="server">
    <title>UserSite</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>


    <%-- <script>
        location.href = "#AddDetailBtn";
    </script>--%>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <br />&nbsp;
                    <asp:Button ID="AddDetailBtn" runat="server" Text="NewLine" ToolTip="NewLine" OnClick="AddDetailBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" class="white" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="AddPanel" runat="server" Visible="False">
                        <a name="#AddDetailBtn"></a>
                        <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                            <tr>
                                <td>
                                    <asp:Button ID="SaveNextBtn" runat="server" Text="Save+Next" ToolTip="SaveAndNext" OnClick="SaveNextBtn_Click"
                                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" class="white" />
                                    <asp:Button ID="SaveBtn" runat="server" Text="Save" ToolTip="Save" OnClick="SaveBtn_Click"
                                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" class="white" />
                                    <asp:Button ID="ClosePanelBtn" runat="server" Text="Hide" ToolTip="Hide" OnClick="ClosePanelBtn_Click"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" class="white"  CausesValidation="False" />

                                </td>
                                <td>&nbsp;
                                </td>
                                <td align="left">
                                    <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <div id="div-datagrid" style="height: 380px;">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="12" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="UserXBindEdit" ImageUrl="../../image/pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Site Setup"
                                    OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="UserXBind_Delete" runat="server">
                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Site Setup"
                                        runat="server"></a>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn AllowFiltering="false">
                            <HeaderTemplate>
                                No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="refvalue" SortExpression="refvalue" HeaderText="Site"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="usrdef01" SortExpression="usrdef01" HeaderText="DisallowMove"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="usrdef02" SortExpression="usrdef02" HeaderText="DisallowShip"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="usrdef03" SortExpression="usrdef03" HeaderText="User Def.03"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="usrdef04" SortExpression="usrdef04" HeaderText="User Def.04"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="usrdef05" SortExpression="usrdef05" HeaderText="User Def.05"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="usrdef06" SortExpression="usrdef06" HeaderText="User Def.06"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="usrdef07" SortExpression="usrdef07" HeaderText="User Def.07"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="usrdef08" SortExpression="usrdef08" HeaderText="User Def.08"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="usrdef09" SortExpression="usrdef09" HeaderText="User Def.09"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="usrdef10" SortExpression="usrdef10" HeaderText="User Def.10"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="refrem" SortExpression="refrem" HeaderText="Remarks"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        </div>
    </form>
</body>
</html>
