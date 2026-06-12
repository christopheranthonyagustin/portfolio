<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehUpKeepBudgetList.aspx.cs"
    Inherits="iWMS.Web.Master.VehUpKeepBudget.VehUpKeepBudgetList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<title>VehUpKeepBudget</title>
<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
<meta name="CODE_LANGUAGE" content="C#">
<meta name="vs_defaultClientScript" content="JavaScript">
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
<link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
<script src="../../js/Script.js" type="text/javascript"></script>
<script src="../../js/sub_global.js" type="text/javascript"></script>

<script src="../../js/sub_menu.js" type="text/javascript"></script>

<script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

<html>
<head id="Head1" runat="server">
    <style type="text/css">
        .style1 {
            width: 137px;
        }

        .style2 {
            width: 243px;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function () {
                $(".show_hide_Detail").slideToggle();
            });
        });

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

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <br />
        <table width="100%">
            <tr>
                <td align="left">
                    <%-- <asp:ImageButton ID="NewLineBtn" runat="server" ImageUrl="../../Image/CreateNew.png"
                        Visible="false" BackColor="Transparent" BorderWidth="0" Style="z-index: 0"
                        ImageAlign="AbsMiddle" ToolTip="New Line" OnClick="NewLineBtn_Click" />--%>
                    <asp:Button ID="NewLineBtn" class="white" runat="server" OnClick="NewLineBtn_Click" ToolTip="New Line"
                        Text="New Line" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Panel ID="AddPanel" runat="server" Visible="False">
            <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                <tr>
                    <td class="style1">
                        <%--           	<asp:ImageButton ID="SaveAndNextBtn" runat="server" ImageUrl="../../Image/SaveAndNext.png"
                Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                ImageAlign="AbsMiddle" ToolTip="Save & Next" OnClick="SaveNextBtn_Click" />  
                    &nbsp;
                      <asp:ImageButton ID="SaveBtn" runat="server" ImageUrl="../../Image/Save.png"
                Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                ImageAlign="AbsMiddle" ToolTip="Save" OnClick="SaveBtn_Click" />   &nbsp;
                     <asp:ImageButton ID="ClosePanelBtn" runat="server" ImageUrl="../../Image/Hide.png"
                Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                ImageAlign="AbsMiddle" ToolTip="Search" OnClick="ClosePanelBtn_Click"  /> --%>
                        <asp:Button ID="SaveAndNextBtn" class="white" runat="server" OnClick="SaveNextBtn_Click" ToolTip="Save & Next"
                            Text="Save+Next" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" Visible="true" />
                        &nbsp;
                    <asp:Button ID="SaveBtn" class="white" runat="server" OnClick="SaveBtn_Click" ToolTip="Save"
                        Text="Save" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" Visible="true" CausesValidation="false"/>
                        &nbsp;
                    <asp:Button ID="ClosePanelBtn" class="white" runat="server" OnClick="ClosePanelBtn_Click"
                        Text="Hide"  CausesValidation="false"/>
                        &nbsp;
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <div id="datagrid" runat="server" style="width: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
                OnItemCommand="ResultDG_ItemCommand">
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
                            <HeaderTemplate>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                            <ItemStyle Wrap="false" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                            ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="ldEdit" ImageUrl="..\..\image\pencil.gif" Width="15"
                                    Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                    CommandName="Modify" CausesValidation="False"></asp:ImageButton>
                                <asp:ImageButton runat="server" ID="ldAdd" ImageUrl="..\..\image\add.png" Width="15"
                                    Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Add Detail"
                                    CommandName="ADDDetail" CausesValidation="False"></asp:ImageButton>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="VehUpKeepBudgetDelete" runat="server">
                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Budget"
                                        runat="server"></a>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="typedescr" UniqueName="typedescr" SortExpression="typedescr" HeaderText="VehUpkeepType"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="frdate" UniqueName="frdate" SortExpression="frdate" HeaderText="FromDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-HorizontalAlign="left">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="todate" UniqueName="todate" SortExpression="todate" HeaderText="Todate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-HorizontalAlign="left">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="period" UniqueName="period" SortExpression="period" HeaderText="Period"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="budgetamt" UniqueName="budgetamt" SortExpression="budgetamt" HeaderText="BudgetAmt"
                            DataFormatString="{0:N}" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="right">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" UniqueName="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" UniqueName="adddate" SortExpression="adddate" HeaderText="AddDate"
                            DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" UniqueName="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" UniqueName="editdate" SortExpression="editdate" HeaderText="EditDate"
                            DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" UniqueName="edituser" SortExpression="edituser" HeaderText="EditUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
