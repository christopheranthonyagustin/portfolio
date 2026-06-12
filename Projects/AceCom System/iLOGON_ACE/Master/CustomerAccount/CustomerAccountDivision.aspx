<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerAccountDivision.aspx.cs" Inherits="iWMS.Web.Master.CustomerAccount.CustomerAccountDivision" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CustomerAccountDivision</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
</head>

<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td><br />&nbsp;
                <asp:Button ID="AddDetailBtn" class="white" runat="server" OnClick="AddDetailBtn_Click" Text="NewLine" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="False" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="AddPanel" runat="server" Visible="False">
                        <a name="#AddDetailBtn"></a>
                        <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                            <tr>
                                <td colspan="3">
                                    <asp:Button ID="SaveNextBtn" class="white" runat="server" OnClick="SaveNextBtn_Click" Text="Save &amp; Next" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />&nbsp;                                
                                <asp:Button ID="SaveBtn" class="white" runat="server" OnClick="SaveBtn_Click" Text=" Save " OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />&nbsp;                               
                                <asp:Button ID="ClosePanelBtn" class="white" runat="server" OnClick="ClosePanelBtn_Click" Text="- Hide" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                </td>
                                <td>&nbsp;
                                </td>
                                <td align="left">
                                    <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td nowrap style="padding-left:4px; padding-top:13px">
                                    <asp:Label ID="DivCodeLbl" runat="server">Div Code</asp:Label>
                                    <asp:RequiredFieldValidator ID="DivCodeReq" runat="server" ControlToValidate="DivCodeTxt"
                                        ErrorMessage="*"></asp:RequiredFieldValidator><br />
                                    <asp:TextBox ID="DivCodeTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                                </td>
                                <td nowrap style="padding-left:4px; padding-top:13px">
                                    <asp:Label ID="DivCode2Lbl" runat="server">Div Code 2</asp:Label>
                                    <br />
                                    <asp:TextBox ID="DivCode2Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap style="padding-left:4px; padding-top:13px">
                                    <asp:Label ID="DivNameLbl" runat="server">Div Name</asp:Label>
                                    <br />
                                    <asp:TextBox ID="DivNameTxt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap style="padding-left:4px; padding-top:13px">
                                    <asp:Label ID="TelLbl" runat="server">Tel</asp:Label>
                                    <br />
                                    <asp:TextBox ID="TelTxt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap style="padding-left:4px; padding-top:13px">
                                    <asp:Label ID="FaxLbl" runat="server">Fax</asp:Label>
                                    <br />
                                    <asp:TextBox ID="FaxTxt" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap style="padding-left:4px; padding-top:13px">
                                    <asp:Label ID="WebLbl" runat="server">Web</asp:Label>
                                    <br />
                                    <asp:TextBox ID="WebTxt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap style="padding-left:4px; padding-top:13px">
                                    <asp:Label ID="ContactLbl" runat="server">Contact</asp:Label>
                                    <br />
                                    <asp:TextBox ID="ContactTxt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap style="padding-left:4px; padding-top:13px">
                                    <asp:Label ID="HpLbl" runat="server">Hp</asp:Label>
                                    <br />
                                    <asp:TextBox ID="HpTxt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap style="padding-left:4px; padding-top:13px">
                                    <asp:Label ID="EmailLbl" runat="server">Email</asp:Label>
                                    <br />
                                    <asp:TextBox ID="EmailTxt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap style="padding-left:4px; padding-top:13px">
                                    <asp:Label ID="StatusLbl" runat="server">Status</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="StatusDDL"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:DropDownList ID="StatusDDL" runat="server" Enabled="True" DataTextField="Descr"
                                        DataValueField="item" BackColor="Yellow" Width="130px">
                                    </asp:DropDownList>
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
                                <asp:ImageButton ID="AcDivisionEdit" runat="server" AlternateText="Edit Division Setup"
                                    BackColor="Transparent" BorderWidth="0" CausesValidation="False" OnClick="ldEdit_Click"
                                    Height="15" ImageUrl="../../image/pencil.gif" Visible="True" Width="15" />
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="lnkDelete" runat="server" href='<%#DataBinder.Eval(Container,"DataItem.acid") + ";" + DataBinder.Eval(Container,"DataItem.divcode")%>'
                                    onclick="return confirm('Confirm delete?')" onserverclick="AcDivision_Delete">
                                    <img id="delImg" runat="server" alt="Delete Division" border="0" height="15" src="../Dock/../../image/bin.gif"
                                        width="15"/></img></a>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="acid" HeaderText="Account" SortExpression="acid" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="divcode" SortExpression="divcode" HeaderText="DivCode"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="divcode2" SortExpression="divcode2" HeaderText="DivCode2"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="divname" SortExpression="divname" HeaderText="DivName"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tel" HeaderText="Tel" SortExpression="tel"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="fax" HeaderText="Fax" SortExpression="fax"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="web" HeaderText="Web" SortExpression="web"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="contact" HeaderText="Contact" SortExpression="contact"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="hp" HeaderText="Hp" SortExpression="hp"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="email" HeaderText="Email" SortExpression="email"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="opsunitdescr" SortExpression="opsunitdescr" HeaderText="OpsUnitCode"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="opsunitdescr" SortExpression="opsunitdescr" HeaderText="OpsUnitCode"
                            ItemStyle-Wrap="false">
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
    </form>
</body>
</html>
