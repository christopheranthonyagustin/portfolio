<%@ Page Language="c#" CodeBehind="AllocationForm.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Logic.Allocation.AllocationForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>AllocationForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/row.js" type="text/javascript"></script>
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
        .style1 {
            height: 46px;
        }
    </style>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="False" AutoPostBack="True" SelectedIndex="0"
            Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server"
                    Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Steps" Value="100" runat="server">
                </telerik:RadTab>

            </Tabs>
        </telerik:RadTabStrip>
        <table id="table1" width="100%" border="0" runat="server">
            <tr>
                <td class="style1">
                    <asp:Label ID="AllCodeLbl" runat="server" CssClass="pagetitle" />
                </td>
                <td align="right" class="style1">&nbsp;
                <asp:Button ID="BackButton" runat="server" CssClass="detailButton" Visible="false"
                    Text="Search Results" Width="120px" CausesValidation="False" OnClick="BackButton_Click"></asp:Button>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
                    Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Update" />
                &nbsp;
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    CausesValidation="false" SelectedIndex="0" Skin="Windows7">
                    <Tabs>
                        <telerik:RadTab ID="RuleTab" Text="Rule" Value="0" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="700px" ID="RuleRadPageView">
                        <br />
                        <table cellspacing="10" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td>
                                    <asp:Button ID="CreateNewBtn" runat="server" CssClass="white" Text="New"
                                        OnClick="CreateNewBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;
                                    <asp:Button ID="ResequenceBtn" runat="server" CssClass="white" Text="Resequence"
                                OnClick="ResequenceBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                        <br>
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50"
                                DataKeyNames="RuleId" Name="ParentGrid">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <HeaderTemplate>
                                             <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                            &nbsp;&nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ID="PropertyEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Allocation Property"
                                        OnClick="PropertyEdit_Click" CausesValidation="False"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ID="PropertyDelete"
                                                ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                                OnClick="PropertyDelete_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ID="PropertyCopy" ImageUrl="../../image/Copy.png"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Copy"
                                        OnClick="PropertyCopy_Click" CausesValidation="False"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="RuleSequenceNo" SortExpression="RuleSequenceNo" HeaderText="Sequence No"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="RuleName" SortExpression="RuleName" HeaderText="Rule Name"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="RuleNotes" SortExpression="RuleNotes" HeaderText="Notes"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="RuleStatusDescr" SortExpression="RuleStatusDescr" HeaderText="Status"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ModifiedOn" SortExpression="ModifiedOn" HeaderText="Modified On"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="RuleId" SortExpression="RuleId" Display="false" />
                                    <telerik:GridBoundColumn DataField="RuleStatusColourCode" SortExpression="RuleStatusColourCode" Display="false" />
                                    <telerik:GridBoundColumn DataField="PolicyId" SortExpression="PolicyId" Display="false" />

                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="StepsRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
