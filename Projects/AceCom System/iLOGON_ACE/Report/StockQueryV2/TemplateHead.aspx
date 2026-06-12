<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateHead.aspx.cs" Inherits="iWMS.Web.Report.StockQueryV2.TemplateHead" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Template @ (013) Stock Balance Now - Internal</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
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
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" /> 
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="My Template" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="My Scheduler" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="MyTemplateRadPageView">
                <br />
                <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
                <br />
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                        </td>
                        <td>
                            <asp:Button ID="DeleteBtn" CssClass="white" runat="server" OnClick="DeleteBtn_Click" Text="Delete"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" OnNeedDataSource="ResultDG_NeedDataSource"
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true" UseAccessibleHeader="true" AllowFilteringByColumn="true">
                    <ClientSettings Selecting-AllowRowSelect="true">
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="checkbox" AllowFiltering="false" HeaderStyle-Width="30px"
                                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="60px">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TemplateEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit" CausesValidation="false"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    &nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="delImg"
                                        ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                        OnClick="TemplateDelete_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="TemplateName" SortExpression="TemplateName" HeaderText="TemplateName" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Remarks" SortExpression="Remarks" HeaderText="Remarks" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate"
                                HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate"
                                HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" HeaderText="EditUser" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="600px"
                    Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
                </telerik:RadWindow>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="MyScheulerRadPageView" Height="550px" />
        </telerik:RadMultiPage>       
    </form>
</body>
</html>
