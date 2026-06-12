<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanDetlReturn.aspx.cs" Inherits="iWMS.Web.Outbound.Loan.LoanDetlReturn" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head runat="server">
    <title>LoanDetlReturn</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <base target="_self" />
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td align="right">
                <asp:Button ID="ReturnBtn" class="white" runat="server" OnClick="ReturnBtn_Click" Text="Confirm"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true" 
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" AllowFilteringByColumn="false">
                <Columns>
                    <telerik:GridBoundColumn HeaderText="LineNo" DataField="line" ItemStyle-HorizontalAlign="Right" 
                        ColumnGroupName="line" SortExpression="line" UniqueName="line" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="IssueNo" DataField="isnumber" UniqueName="isnumber" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SKU" DataField="skucode" UniqueName="skucode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OutstandingQty" DataField="availreturnqty" UniqueName="availreturnqty" Reorderable="true"
                        ItemStyle-HorizontalAlign="Right" >
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="" DataField="acceptqty" UniqueName="acceptqty" Reorderable="true">
                        <HeaderTemplate>
                        AcceptQty
                        <br />
                        <a id="lnkAcceptQty" onserverclick="Control_Fill" runat="server">SameAcceptQty</a>
                    	</HeaderTemplate>
                        <ItemTemplate>
                            <telerik:RadTextBox runat="server" ID="AcceptQtyTxt" Text='<%# DataBinder.Eval(Container.DataItem, "availreturnqty") %>' 
                                Enabled="true" Skin="WebBlue" Width="100px">
                            </telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="" DataField="rejectqty" UniqueName="rejectqty" Reorderable="true">
                        <HeaderTemplate>
                        RejectQty
                        <br />
                        <a id="lnkRejectQty" onserverclick="Control_Fill" runat="server">SameRejectQty</a>
                    	</HeaderTemplate>
                        <ItemTemplate>
                            <telerik:RadTextBox runat="server" ID="RejectQtyTxt" Text='<%# DataBinder.Eval(Container.DataItem, "rejectqty") %>' 
                                Enabled="true" Skin="WebBlue" Width="100px">
                            </telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="" DataField="rejectreason" UniqueName="rejectreason" Reorderable="true">
                        <HeaderTemplate>
                        RejectReasonCode
                        <br />
                        <a id="lnkRejectReasonCode" onserverclick="Control_Fill" runat="server">SameRejectReasonCode</a>
                    	</HeaderTemplate>
                        <ItemTemplate>
                            <telerik:RadDropDownList ID="RejectReasonDDL" runat="server" DataTextField="descr" Skin="WebBlue"
                                DataValueField="item" DataSource='<%# RejectReasonDS%>' Width="140px" DropDownWidth="140px">
                            </telerik:RadDropDownList>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="" DataField="returnby" UniqueName="returnby" Reorderable="true" >
			            <HeaderTemplate>
                        ReturnBy
                        <br />
                        <a id="lnkReturnBy" onserverclick="Control_Fill" runat="server">SameReturnBy</a>
                    	</HeaderTemplate>
                        <ItemTemplate>
                            <telerik:RadTextBox runat="server" ID="ReturnByTxt" Skin="Sunset" BackColor="#ded7c6" 
                                Enabled="true" Width="100px">
                            </telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="" DataField="returnref" UniqueName="returnref" Reorderable="true" >
                        <HeaderTemplate>
                        ReturnRef
                        <br />
                        <a id="lnkReturnRef" onserverclick="Control_Fill" runat="server">SameReturnRef</a>
                    	</HeaderTemplate>
                        <ItemTemplate>
                            <telerik:RadTextBox runat="server" ID="ReturnRefTxt" Skin="Sunset" BackColor="#ded7c6" 
                                Enabled="true" Width="100px">
                            </telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="LoanReturnDate" DataField="loanreturndate" UniqueName="loanreturndate">
                        <HeaderTemplate>
                        LoanReturnDate
                        <br />
                        <a id="lnkLoanReturnDate" onserverclick="Control_Fill" runat="server">SameLoanReturnDate</a>
                    	</HeaderTemplate>
                        <ItemTemplate>
                            <telerik:RadDatePicker ID="LoanReturnDatePicker" runat="server" Skin="Sunset" BackColor="#ded7c6" 
                                Width="120px" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy">
                            </telerik:RadDatePicker>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
