<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceQueryHead.aspx.cs" Inherits="iWMS.Web.Job.InvoiceQuery.InvoiceQueryHead" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>InvoiceQueryHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
    <script language="javascript" type="text/javascript">
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="InvoiceBtn" runat="server" Text="Invoice" OnClick="InvoiceBtn_Click"
                        CssClass="blue" ToolTip="MassInvoicePrint" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="RejectBtn" runat="server" Text="Dispute" OnClick="RejectBtn_Click"
                        CssClass="white" ToolTip="Reject" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="InvoiceTab" Text="Invoice" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attc" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="SelectCB" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                        SortExpression="accode" UniqueName="accode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Billing Name" DataField="billname" AllowFiltering="true"
                        SortExpression="billname" UniqueName="billname" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="InvoiceNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="InvDate" DataField="invdate" AllowFiltering="true"
                        SortExpression="invdate" UniqueName="invdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Source" DataField="srcdescr" AllowFiltering="false"
                        SortExpression="srcdescr" UniqueName="srcdescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TotalAmt" DataField="totinvamt" AllowFiltering="true"
                        SortExpression="totinvamt" UniqueName="totinvamt" Reorderable="true" DataFormatString="{0:#,0.00}"
                        ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Currency" DataField="currcode" AllowFiltering="false"
                        SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="PaymentTerm" DataField="paytermsdescr" AllowFiltering="false"
                        SortExpression="paytermsdescr" UniqueName="paytermsdescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PaymentDueDate" DataField="duedate" AllowFiltering="true"
                        SortExpression="duedate" UniqueName="duedate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PaymentStatus" DataField="InvStatusdescr" AllowFiltering="true"
                        SortExpression="InvStatusdescr" UniqueName="InvStatusdescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn DataField="statuscolor" UniqueName="statuscolor" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="acid" UniqueName="acid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
                </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="350" Height="300"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
