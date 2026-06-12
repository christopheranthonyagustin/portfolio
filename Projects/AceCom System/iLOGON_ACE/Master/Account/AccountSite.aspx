<%@ Page Language="c#" CodeBehind="AccountSite.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Account.AccountSite" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>AccountSite</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>

    <%--
    <script>

        location.href = "#AddDetailBtn";
    </script>--%>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td><br />&nbsp;
                <asp:Button ID="AddDetailBtn" class="white" runat="server" OnClick="AddDetailBtn_Click" Text="New"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="False" />
                </td>
                <td align="right">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="AddPanel" runat="server" Visible="False">
                        <a name="#AddDetailBtn"></a>
                        <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                            <tr>
                                <td colspan="5" style="padding-bottom: 10px;">
                                <asp:Button ID="SaveNextBtn" class="white" runat="server" OnClick="SaveNextBtn_Click" Text="Save &amp; Next"
                                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                <asp:Button ID="SaveBtn" class="white" runat="server" OnClick="SaveBtn_Click" Text=" Save "
                                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                <asp:Button ID="ClosePanelBtn" class="white" runat="server" OnClick="ClosePanelBtn_Click" Text="Hide"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                                </td>
                                
                                <td align="left" style="width:300px;">
                                    <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td nowrap style="padding-left: 5px;">
                                    <asp:Label ID="NewSiteLbl" runat="server">Site</asp:Label>
                                    <asp:RequiredFieldValidator ID="SiteReq" runat="server" ControlToValidate="SiteList"
                                        ErrorMessage="*" CssClass="errorLabelBig"></asp:RequiredFieldValidator><br>
                                    <telerik:RadDropDownList ID="SiteList" runat="server" Skin="Sunset">
                                    </telerik:RadDropDownList>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="RcvLbl" runat="server">DefaultReceiveLoc</asp:Label>
                                    <asp:RequiredFieldValidator ID="RcLocReq" runat="server" ControlToValidate="RcLocTxt"
                                        ErrorMessage="*" CssClass="errorLabelBig"></asp:RequiredFieldValidator><br>
                                    <telerik:RadTextBox ID="RcLocTxt" runat="server" Skin="Sunset" BackColor="#ded7c6"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="XdLbl" runat="server">DefaultXDockLoc</asp:Label>
                                    <asp:RequiredFieldValidator ID="XdLocReq" runat="server" ControlToValidate="XdLocTxt"
                                        ErrorMessage="*" CssClass="errorLabelBig"></asp:RequiredFieldValidator><br>
                                    <telerik:RadTextBox ID="XdLocTxt" runat="server" Skin="Sunset" BackColor="#ded7c6"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="PostPickStagingLocCodeLbl" runat="server">PostPickStagingLocCode</asp:Label><br />
                                    <telerik:RadTextBox ID="PostPickStagingLocCodeTextbox" runat="server" Skin="Sunset"></telerik:RadTextBox>
                                </td>
                                 <td nowrap>
                                    <asp:Label ID="PostPackStagingLocCodeLbl" runat="server">PostPackStagingLocCode</asp:Label><br />
                                  
                                    <telerik:RadTextBox ID="PostPackStagingLocCodeTextBox" runat="server" Skin="Sunset"></telerik:RadTextBox>
                                </td>
                                 <td nowrap>
                                    <asp:Label ID="PostLoadStagingLocCodeLbl" runat="server">PostLoadStagingLocCode</asp:Label><br>
                                    <telerik:RadTextBox ID="PostLoadStagingLocCodeTextBox" runat="server" Skin="Sunset" ></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="DmgLbl" runat="server">DefaultQCDamageLoc</asp:Label><br>
                                    <telerik:RadTextBox ID="DmgLocTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="ShortageLbl" runat="server">Default Shortage Loc</asp:Label><br>
                                    <telerik:RadTextBox ID="ShortageLocTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="SurplusLbl" runat="server">Default Surplus Loc</asp:Label><br>
                                    <telerik:RadTextBox ID="SurplusLocTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <asp:Label ID="StatusLbl" runat="server">Status</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="StatusDDL"
                                        ErrorMessage="*" CssClass="errorLabelBig"></asp:RequiredFieldValidator>
                                    <br>
                                    <telerik:RadDropDownList ID="StatusDDL" runat="server" Skin="Sunset" Enabled="True"
                                        DataValueField="item" DataTextField="Descr">
                                    </telerik:RadDropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap style="padding-left: 5px;">
                                    <br>
                                    <asp:Label ID="KitDepositLocLbl" runat="server">KitDepositLocation</asp:Label><br>
                                    <telerik:RadTextBox ID="KitDepositLocTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <br>
                                    <asp:Label ID="KitWithdrawalLocLbl" runat="server">KitWithdrawalLocation</asp:Label><br>
                                    <telerik:RadTextBox ID="KitWithdrawalLocTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                </td>
                                <td>
                                    <br />
                                    <asp:Label ID="KitWithdrawalIsTypeLbl" runat="server">KitWithdrawalIsType</asp:Label><br />
                                    <telerik:RadDropDownList ID="KitWithdrawalIsTypeDDL" runat="server" Skin="WebBlue" Enabled="True"
                                        DataValueField="item" DataTextField="Descr">
                                    </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <br />
                                    <asp:Label ID="KitWithdrawlLocTypeLbl" runat="server">KitWithdrawalLocType</asp:Label><br />
                                    <telerik:RadDropDownList ID="KitWithdrawlLocTypeDDL" runat="server" Skin="WebBlue" Enabled="True"
                                        DataValueField="item" DataTextField="Descr">
                                    </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <br />
                                    <asp:Label ID="Label1" runat="server">Zone</asp:Label><br />
                                    <telerik:RadDropDownList ID="ZoneDDL" runat="server" Skin="WebBlue" Enabled="True"
                                        DataValueField="item" DataTextField="Descr">
                                    </telerik:RadDropDownList>
                                </td>
                                <td>
                                    <br />
                                    <asp:Label ID="Label2" runat="server">Team</asp:Label><br />
                                    <telerik:RadDropDownList ID="TeamDDL" runat="server" Skin="WebBlue" Enabled="True"
                                        DataValueField="item" DataTextField="Descr">
                                    </telerik:RadDropDownList>
                                </td>
                                <td nowrap>&nbsp;
                                </td>
                                <td nowrap>&nbsp;
                                </td>
                                <td nowrap>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td nowrap style="padding-left: 5px;">
                                    <br />
                                    <asp:Label ID="LoanLocLbl" runat="server">Default Loan Loc</asp:Label><br>
                                    <telerik:RadTextBox ID="LoanLocTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <br />
                                    <asp:Label ID="MtnLocLbl" runat="server">Default Mtn. Loc</asp:Label><br>
                                    <telerik:RadTextBox ID="MtnLocTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <br />
                                    <asp:Label ID="LoanRejLocLbl" runat="server">Default Loan Reject Loc</asp:Label><br>
                                    <telerik:RadTextBox ID="LoanRejLocTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                </td>
                                <td nowrap>
                                    <br />
                                    <asp:Label ID="MtnRejLocLbl" runat="server">Default Mtn. Reject Loc</asp:Label><br>
                                    <telerik:RadTextBox ID="MtnRejLocTxt" runat="server" Skin="WebBlue"></telerik:RadTextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid" style="height: 380px;">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
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
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="AcSiteEdit" ImageUrl="../../image/pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Site Setup"
                                    OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete Site Setup?')"
                                    onserverclick="AcSite_Delete" runat="server">
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
                        <telerik:GridBoundColumn DataField="sitecode" Display="False" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rcloccode" SortExpression="rcloccode" HeaderText="DefaultReceiveLoc" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="xdloccode" SortExpression="xdloccode" HeaderText="DefaultXDockLoc" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="PostPickStagingLocCode" SortExpression="PostPickStagingLocCode" HeaderText="PostPickStagingLocCode" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PostPackStagingLocCode" SortExpression="PostPackStagingLocCode" HeaderText="PostPackStagingLocCode" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PostLoadStagingLocCode" SortExpression="PostLoadStagingLocCode" HeaderText="PostLoadStagingLocCode" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="dmgloccode" SortExpression="dmgloccode" HeaderText="DefaultQCDamageLoc" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shortageloccode" SortExpression="shortageloccode" AllowFiltering="false"
                            HeaderText="Default Shortage Loc" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="surplusloccode" SortExpression="surplusloccode" AllowFiltering="false"
                            HeaderText="Default Surplus Loc" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ktdploccode" SortExpression="ktdploccode" HeaderText="Kit Deposit Location" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ktwdloccode" SortExpression="ktwdloccode" HeaderText="Kit Withdrawal Location" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="loanloccode" SortExpression="loanloccode" HeaderText="Default Loan Loc" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="maintenanceloccode" SortExpression="maintenanceloccode" HeaderText="Default Mtn. Loc" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="loanrejectloccode" SortExpression="loanrejectloccode" HeaderText="Default Loan Reject Loc" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="maintenancerejectloccode" SortExpression="maintenancerejectloccode" HeaderText="Default Mtn. Reject Loc" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" AllowFiltering="false"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" AllowFiltering="false"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statuscolor" Display="False" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
