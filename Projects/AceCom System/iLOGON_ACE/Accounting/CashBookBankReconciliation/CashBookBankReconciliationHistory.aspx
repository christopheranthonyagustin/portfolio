<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookBankReconciliationHistory.aspx.cs" Inherits="iWMS.Web.Accounting.CashBookBankReconciliation.CashBookBankReconciliationHistory" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CashBookBankReconciliationHistory</title>
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
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                    <FilterItemStyle HorizontalAlign="Center" />
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>

                        <ItemStyle Wrap="false"></ItemStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                <HeaderStyle Wrap="false" />
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <AlternatingItemStyle Wrap="true" />
                                <Columns>
                                    <telerik:GridTemplateColumn UniqueName="Date" HeaderText="Date" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("CHDate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="Number" UniqueName="CHNumber" SortExpression="Number" ItemStyle-HorizontalAlign="Center"
                                        HeaderText="CHNumber">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Type" UniqueName="Type" SortExpression="Type" ItemStyle-HorizontalAlign="Center"
                                        HeaderText="Type">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ChequeNo" UniqueName="ChequeNo" SortExpression="ChequeNo" ItemStyle-HorizontalAlign="Center"
                                        HeaderText="ChequeNo">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Amount" UniqueName="Amount" SortExpression="Amount" ItemStyle-HorizontalAlign="Center"
                                        HeaderText="Amount">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="ReconStatus1" HeaderText="ReconStatus" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                        <ItemTemplate>
                                                <asp:CheckBox ID="ReconStatusChkBox" runat="server" />                                         
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ReconClearanceDate" HeaderText="ClearanceDate" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("ReconClearanceDate")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="Id" HeaderText="Id" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ReconClearanceDate" UniqueName="ClearanceDate" Display="False" />
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