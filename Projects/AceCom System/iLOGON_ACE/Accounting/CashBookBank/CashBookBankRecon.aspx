<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookBankRecon.aspx.cs" Inherits="iWMS.Web.Accounting.CashBookBank.CashBookBankRecon" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CashBookBankRecon</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }

            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="MainInfoRadPageView" Height="0px">
                <table>
                    <tr>
                        <td style="padding-top: 10px">
                            <asp:Label ID="frdatelbl" runat="server" Text="AsAtCHDate"> 
                            </asp:Label>
                            <br />
                            <telerik:RadDatePicker ID="AsAtCHDate" runat="server" Width="155" DateInput-BackColor="Yellow"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                OnSelectedDateChanged="FromDateTxt_SelectedDateChanged" AutoPostBack="true">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="padding-top: 10px">
                                        <br />
                                        <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click"
                                            Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    </td>
                                    <td>&nbsp;
                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
                                                <table>
                                                    <tr>
                                                        <td>&nbsp;
                                                            <asp:Label runat="server" Text="Balance"> 
                                                            </asp:Label>
                                                            <br />
                                                            &nbsp;
                                                            <telerik:RadTextBox runat="server" ID="BalanceTxtBox" TextMode="SingleLine" Enabled="false">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                        <td>&nbsp;
                                                            <asp:Label runat="server" Text="Selected Balance"> 
                                                            </asp:Label>
                                                            <br />
                                                            &nbsp;
                                                            <telerik:RadTextBox runat="server" ID="SelectedBalanceTxtBox" TextMode="SingleLine" Enabled="false">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td style="padding-top: 10px">
                                        <br />
                                        <asp:Button ID="CalcBalBtn" class="white" runat="server" OnClick="CalcBalBtn_Click"
                                            Text="CalcBalance" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    </td>
                                    <td style="padding-top: 10px">
                                        <br />
                                        &nbsp;
                                         <asp:Button ID="MassUpdateDateBtn" class="LongLabelWhite" runat="server" OnClick="MassUpdateDateBtn_Click"
                                             Text="MassUpdate Date" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <br />
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="OpeningClosingBalResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight" Width="50%"
                            OnNeedDataSource="OpeningClosingBalResultDG_NeedDataSource" AllowMultiRowSelection="true" ExportSettings-UseItemStyles="true" AutoGenerateColumns="true">
                            <AlternatingItemStyle Wrap="false" HorizontalAlign="Center"></AlternatingItemStyle>
                            <ItemStyle Wrap="false" HorizontalAlign="Center"></ItemStyle>
                            <HeaderStyle Wrap="false" />
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <MasterTableView AllowMultiColumnSorting="true" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            </MasterTableView>
                        </telerik:RadGrid>
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnItemDataBound="ResultDG_ItemDataBound"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                            <AlternatingItemStyle Wrap="false" HorizontalAlign="Center"></AlternatingItemStyle>
                            <ItemStyle Wrap="false" HorizontalAlign="Center"></ItemStyle>
                            <HeaderStyle Wrap="false" />
                            <ClientSettings>
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="430px" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="true" OnCheckedChanged="cbSelectAll_CheckedChanged" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" AutoPostBack="true" CausesValidation="false" OnCheckedChanged="chkObjective_CheckedChanged" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Date" HeaderText="Date" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("CHDate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CHNumber" HeaderText="CHNumber" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Number")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn UniqueName="Type" HeaderText="Type" DataField="Type" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="ChequeNo" HeaderText="ChequeNo" HeaderStyle-Width="160px" ItemStyle-Width="160px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("ChequeNo")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn UniqueName="Amount" HeaderText="Amount" DataField="Amount" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="ReconStatus1" HeaderText="ReconStatus" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ReconStatusChkBox" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ClearanceDate" HeaderText="ClearanceDate" HeaderStyle-Width="180px" ItemStyle-Width="180px">
                                        <ItemTemplate>
                                            <br />
                                            <telerik:RadDatePicker ID="ClearanceDate" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "ReconClearanceDate") %>'
                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Office2007" ValidateRequestMode="Enabled" Width="155">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="Id" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ReconClearanceDate" Display="False" />
                                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ReconStatus" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ReconClearanceDate" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
