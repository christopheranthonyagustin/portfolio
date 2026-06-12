<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSOperationsForm.aspx.cs" Inherits="iWMS.Web.Job.TMSOperations.TMSOperationsForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>TMSOperations Form</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style type="text/css">
        #SwapBtn {
            margin-left: 1200px;
        }
    </style>
</head>
<script type="text/javascript">
    function OnClientClose(sender, args) {
        document.location.href = document.location.href;
    }
    function RadMenuClientOnClick(sender, args) {
        if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
            args.set_cancel(true);
        }
    }

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
</script>
<telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
        var startingIndex = 0, gridViewID = '<%= ResultDG.MasterTableView.ClientID %>';
        function selectCheckbox(e, selectedIndex) {
            if (e.shiftKey) {
                if (startingIndex < selectedIndex) {
                    jQuery(':checkbox', '#' + gridViewID).slice(startingIndex, selectedIndex).prop("checked", true);
                } else {
                    jQuery(':checkbox', '#' + gridViewID).slice(selectedIndex, startingIndex).prop("checked", true);
                }
            }
            startingIndex = selectedIndex;
        }
    </script>
</telerik:RadCodeBlock>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="50" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="100" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
                <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" ToolTip="Save"
                    Text="Update" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" ToolTip="RefreshBtn"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" ToolTip="New"
                                Text="New" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="ReopenBtn" CssClass="white" runat="server" OnClick="ReopenBtn_Click" ToolTip="Reopen"
                                Text="Reopen" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="AssignBtn" CssClass="White" runat="server" OnClick="AssignBtn_Click"
                                Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="CompleteBtn" CssClass="White" runat="server" OnClick="CompleteBtn_Click"
                                Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="ConfirmBtn" CssClass="White" runat="server" OnClick="ConfirmBtn_Click"
                                Text="Confirm" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                         <td>
                            <asp:Button ID="CancelBtn" CssClass="White" runat="server" OnClick="CancelBtn_Click"
                                Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="GenerateDoBtn" CssClass="Blue" runat="server" OnClick="GenerateDoBtn_Click"
                                Text="Generate DO" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        
                        <td>
                            <asp:Button ID="PrintDoBtn" CssClass="Blue" runat="server" OnClick="PrintDoBtn_Click"
                                Text="Print DO" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="OperationsPrintoutBtn" CssClass="LongLabelBlue" runat="server" OnClick="OperationsPrintoutBtn_Click"
                                Text="Operations Printout" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="CheckAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" onclick='<%# string.Format("javascript:selectCheckbox(event,{0});", Container.ItemIndex+1) %>' runat="server" AutoPostBack="false" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="EditButton" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                        OnClick="EditButton_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="AttcImgBtn" ImageUrl="..\..\image\attached.jpg" Width="15" Height="15" AlternateText="Show Attachment"
                                        BorderWidth="0" BackColor="Transparent" CausesValidation="False"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="CopyBtn" ImageUrl="../../image/copy.png"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Copy FabricateOrderItem"
                                        OnClick="CopyBtn_Click"
                                        CausesValidation="False"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="JBPerAtvtDelete" ImageUrl="../../image/bin.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                        OnClick="JBPerAtvtDelete_Click" OnClientClick="return confirm('Confirm Delete?')" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="S/No" HeaderStyle-Width="30px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblNo" runat="server" Text='<%# Container.ItemIndex + 1 %>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="SeqNo" SortExpression="SeqNo" HeaderText="OMS S/No" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                                ItemStyle-Wrap="false" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Category" SortExpression="Category" HeaderText="Category"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="peratvtcode" SortExpression="Code" HeaderText="Code"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="atvtdescr" SortExpression="atvtdescr" HeaderText="Description"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="Actual Qty" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="frexpdate" SortExpression="frexpdate" HeaderText="Start Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="toexpdate" SortExpression="toexpdate" HeaderText="End Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="Location"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="atvtremarks" SortExpression="remarks" HeaderText="Remarks"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="DONumber" SortExpression="DONumber" HeaderText="DO No"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="DOStatusdescr" SortExpression="DOStatusdescr" HeaderText="DO Status"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ContactPerson" SortExpression="PIC" HeaderText="PIC"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="TMS Status"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="70%" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="70%" ID="LogRadPageView" />
        </telerik:RadMultiPage>
        <table>
            <tr>
                <td>
                    <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
