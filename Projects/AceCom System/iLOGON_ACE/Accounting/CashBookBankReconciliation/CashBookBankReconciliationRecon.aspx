<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookBankReconciliationRecon.aspx.cs" Inherits="iWMS.Web.Accounting.CashBookBankReconciliation.CashBookBankReconciliationRecon" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CashBookBankReconciliationRecon</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        .PrevNext {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .PrevNext:hover {
                background: #6885ca;
            }
    </style>
    <style type="text/css">
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }

        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .btn1:hover {
                background: #6885ca;
            }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="MainInfoRadPageView" Height="0px">
                <table border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <td>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="FromDateLbl" runat="server" Text="FromDate"> </asp:Label>
                            <br />
                            <asp:Button ID="FromDatePrevBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="-" OnClick="FromDatePrevBtn_Click" UseSubmitBehavior="false" />
                            <telerik:RadDatePicker ID="FromDatePicker" runat="server" Width="155"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                OnSelectedDateChanged="FromDatePicker_SelectedDateChanged" AutoPostBack="true">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                            <asp:Button ID="FromDateNextBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="+" OnClick="FromDateNextBtn_Click" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="ToDateLbl" runat="server" Text="ToDate"> </asp:Label>
                            <br />
                            <asp:Button ID="ToDatePrevBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="-" OnClick="ToDatePrevBtn_Click" UseSubmitBehavior="false" />
                            <telerik:RadDatePicker ID="ToDatePicker" runat="server" Width="155" Height="25"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                OnSelectedDateChanged="ToDatePicker_SelectedDateChanged" AutoPostBack="true">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                            <asp:Button ID="ToDateNextBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="+" OnClick="ToDateNextBtn_Click" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Opening Balance"> 
                            </asp:Label>
                            <br />
                            <telerik:RadTextBox runat="server" ID="RadTextBox1" Text=""
                                TextMode="SingleLine" Enabled="true">
                            </telerik:RadTextBox>
                            &nbsp; &nbsp;&nbsp; &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Closing Balance"> 
                            </asp:Label>
                            <br />
                            <telerik:RadTextBox runat="server" ID="RadTextBox2" Text=""
                                TextMode="SingleLine" Enabled="true">
                            </telerik:RadTextBox>
                            &nbsp; &nbsp;&nbsp; &nbsp;
                        </td>
                        <td>
                            <br />
                            <asp:Panel ID="Panel1" runat="server">
                                <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                     <br />
                                    <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click"
                                        Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    &nbsp; &nbsp; &nbsp; &nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="BalanceLbl" runat="server" Text="Balance"> 
                                    </asp:Label>
                                    <br />
                                    <telerik:RadTextBox runat="server" ID="Balance" Text=""
                                        TextMode="SingleLine" Enabled="false">
                                    </telerik:RadTextBox>
                                    &nbsp; &nbsp;&nbsp; &nbsp;
                                </td>
                                <td>
                                    <br />
                                    <asp:Button ID="CalcBalBtn" class="white" runat="server" OnClick="CalcBalBtn_Click"
                                        Text="CalcBalance" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                                <td>
                                    <br />
                                    <asp:Button ID="MassUpdateDateBtn" class="LongLabelWhite" runat="server" OnClick="MassUpdateDateBtn_Click"
                                        Text="MassUpdate Date" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                            </asp:Panel>
                        </td>
                        <td>
                            <br />
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnItemDataBound="ResultDG_ItemDataBound"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <ClientSettings>
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                <HeaderStyle Wrap="false" />
                                <AlternatingItemStyle Wrap="true" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Date" HeaderText="Date" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("CHDate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="CHNumber" HeaderText="CHNumber" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Number")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Type" HeaderText="Type" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Type")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ChequeNo" HeaderText="ChequeNo" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("ChequeNo")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Amount" HeaderText="Amount" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("Amount")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ReconStatus1" HeaderText="ReconStatus" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ReconStatusChkBox" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ClearanceDate" HeaderText="ClearanceDate" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <br />
                                            <telerik:RadDatePicker ID="ClearanceDate" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "ReconClearanceDate") %>'
                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight" ValidateRequestMode="Enabled">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="Id" HeaderText="Id" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ReconClearanceDate" UniqueName="ReconClearanceDate" Display="False" />
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ReconStatus" UniqueName="ReconStatus" Display="false">
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
