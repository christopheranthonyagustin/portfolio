<%@ Page Language="c#" CodeBehind="ChargeListHead.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.Charge.ChargeListHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ChargeCode</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
     <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
                <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
         <table style="width: 100%; height: 15px">
            <tr>
                <td class="style1">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
        </table>
                <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                    OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" Selecting-AllowRowSelect="true">
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="CopyBtn" ImageUrl="../../image/copy.png"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                        OnClick="CopyBtn_Click" CausesValidation="False"></asp:ImageButton>

                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="Charge_Delete" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                            runat="server"></a>
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn HeaderText="ID" DataField="id" Display="false" AllowFiltering="true"
                                SortExpression="id" UniqueName="id" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Code" DataField="code" AllowFiltering="true"
                                SortExpression="code" UniqueName="code" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Group" DataField="grpdescr" AllowFiltering="true"
                                SortExpression="grpdescr" UniqueName="grpdescr" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Description" DataField="descr" AllowFiltering="true"
                                SortExpression="descr" UniqueName="descr" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Type" DataField="typedescr" AllowFiltering="true"
                                SortExpression="typedescr" UniqueName="typedescr" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Basis" DataField="basis" AllowFiltering="true"
                                SortExpression="basis" UniqueName="basis" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="AR GL Code" DataField="glcode" AllowFiltering="true"
                                SortExpression="glcode" UniqueName="glcode" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="AR GL Type" DataField="argltype" AllowFiltering="true"
                                SortExpression="argltype" UniqueName="argltype" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="AR GL Category" DataField="arglcat" AllowFiltering="true"
                                SortExpression="arglcat" UniqueName="arglcat" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="AP GL Code" DataField="apglcode" AllowFiltering="true"
                                SortExpression="apglcode" UniqueName="apglcode" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="AP GL Type" DataField="apgltype" AllowFiltering="true"
                                SortExpression="apgltype" UniqueName="apgltype" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="AP GL Category" DataField="apglcat" AllowFiltering="true"
                                SortExpression="apglcat" UniqueName="apglcat" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Tax Type" DataField="taxtypedescr" AllowFiltering="true"
                                SortExpression="taxtypedescr" UniqueName="taxtypedescr" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true"
                                SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true"
                                SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true"
                                SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true"
                                SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="False" DataField="statuscolor" />

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="800px" Height="400px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
        <telerik:RadCodeBlock runat="server">
            <script type="text/javascript">
                function OnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    masterTable.rebind();
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
