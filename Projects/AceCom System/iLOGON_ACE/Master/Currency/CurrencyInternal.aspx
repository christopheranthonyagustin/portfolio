<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrencyInternal.aspx.cs"
    Inherits="iWMS.Web.Master.Currency.CurrencyInternal" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CurrencyInternal</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script>
        location.href = "#AddDetailBtn";
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="SiteLbl" runat="server" Visible="False" CssClass="pagetitle"> Internal Rate</asp:Label>&nbsp;
                     <asp:Label ID="AccodeLbl" runat="server" CssClass="pagetitle"></asp:Label>

                </td>
            </tr>
            <tr>
                <br />
                <td>
                    <br />

                    <asp:Button ID="AddDetailBtn" runat="server" class="white" Text="NewLine" OnClick="AddDetailBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="False" />

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="AddPanel" runat="server" Visible="False">
                        <a name="#AddDetailBtn"></a>
                        <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                            <tr>
                                <td align="left" style="padding-bottom: 15px">
                                    <%-- <telerik:RadButton Style="z-index: 0" Skin="WebBlue" ID="SaveNextBtn" runat="server" Text="Save &amp; Next"
                                        CausesValidation="False" OnClick="SaveNextBtn_Click"> </telerik:RadButton>--%>
                                    <%--   <telerik:RadButton Style="z-index: 0" Skin="WebBlue" ID="SaveBtn" runat="server" Text=" Save "
                                        CausesValidation="False" OnClick="SaveBtn_Click">
                                    </telerik:RadButton>
                                    <telerik:RadButton Style="z-index: 0" Skin="WebBlue" ID="ClosePanelBtn" runat="server" Text="- Hide"
                                        CausesValidation="False" OnClick="ClosePanelBtn_Click">
                                    </telerik:RadButton>--%>
                                    <asp:Button ID="SaveNextBtn" runat="server" class="white" Text="Save+Next" OnClick="SaveNextBtn_Click"
                                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="False" />&nbsp;
                                     <asp:Button ID="SaveBtn" runat="server" class="white" Text="Save" OnClick="SaveBtn_Click"
                                         OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="False" />&nbsp;
                                     <asp:Button ID="ClosePanelBtn" runat="server" class="white" Text="Hide" OnClick="ClosePanelBtn_Click"
                                         OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="False" />&nbsp;
                                </td>
                                <td>&nbsp;
                                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td nowrap>
                                    <asp:Label ID="Label1" runat="server">Effective Date</asp:Label><br>
                                    <telerik:RadDatePicker ID="effectivedateTxt" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007">
                                        <Calendar>
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                    <%--<asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="effectivedateTxt"
                                    DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy" Format="dd/MMM/yyyy">
                                </asp:CalendarExtender>--%>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="Label2" runat="server">Rate</asp:Label><br>
                                    <telerik:RadTextBox ID="rateTxt" runat="server" BackColor="Yellow"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="Label6" runat="server">RatePayable</asp:Label><br>
                                    <telerik:RadTextBox ID="RatePayableTxt" runat="server" BackColor="Yellow"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="Label3" runat="server">Remarks</asp:Label><br>
                                    <telerik:RadTextBox ID="remarksTxt" runat="server" BackColor="Yellow"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="Label5" runat="server">Entity</asp:Label><br>
                                    <telerik:RadDropDownList ID="EntityList" runat="server" Skin="WebBlue">
                                    </telerik:RadDropDownList>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="Label4" runat="server">Status</asp:Label><br>
                                    <telerik:RadDropDownList ID="StatusList" runat="server" Skin="WebBlue">
                                    </telerik:RadDropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap>
                                    <br>
                                    <telerik:RadTextBox ID="CurrancyCodeTxt" runat="server"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <br>
                                    <telerik:RadTextBox ID="idTxt" runat="server" Enabled="false"></telerik:RadTextBox>
                                <td nowrap>&nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br>
        <div style="height: 50%" id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnItemDataBound="ResultDG_ItemDataBound" DataKeyField="currcode">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn AllowFiltering="false">
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Display="True" ID="CurRateEdit" ImageUrl="..\..\image\pencil.gif" DescriptionUrl='<%#DataBinder.Eval(Container,"DataItem.currcode")%>'
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Currency"
                                    OnClick="CurRate_Edit" CausesValidation="False"></asp:ImageButton>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete Currency?')"
                                    onserverclick="CurRate_Delete" runat="server">
                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Site Setup"
                                        runat="server"></a>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="id" Display="false">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Currency Code"
                            Display="false">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="effectivedate" SortExpression="effectivedate" HeaderText="Effective Date"
                            DataFormatString="{0:dd/MMM/yyyy }">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rate" SortExpression="rate" HeaderText="Rate">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="EntityName" SortExpression="EntityName" HeaderText="Entity">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" Display="False"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
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
                    </Columns>
                </MasterTableView>
                <%--<PagerStyle HorizontalAlign="Left" ForeColor="Black" Position="TopAndBottom" Mode="NumericPages">
            </PagerStyle>--%>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
