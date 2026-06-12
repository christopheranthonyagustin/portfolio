<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackingOrderHead.aspx.cs" Inherits="iWMS.Web.FreightManagement.PackingOrder.PackingOrderHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>PackingOrderHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>

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

    function OnClientClose(sender, args) {
        document.location.href = document.location.href;
    }
</script>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="SearchResultsTab" Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                        </td>
                          <td>
                            <asp:Button ID="PackingList" runat="server" CssClass="LongLabelBlue" Text="Packing List"
                                OnClick="PackingList_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="GatePassBtn" runat="server" CssClass="blue" Text="Gate Pass"
                                OnClick="GatePassBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="MarkingsBtn" runat="server" CssClass="blue" Text="Markings"
                                OnClick="MarkingsBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="FumigationRequestBtn" runat="server" Text="Fumigation Request" OnClick="FumigationRequestBtn_Click"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                        </td>
                         <td>
                            <asp:Button ID="OpenBtn" runat="server" Text="Open" OnClick="OpenBtn_Click"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                         <td>
                            <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                        <td>
                            <asp:Button ID="WIPBtn" runat="server" Text="WIP" OnClick="WIPBtn_Click"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                         <td>
                            <asp:Button ID="CompletedBtn" runat="server" Text="Completed" OnClick="CompletedBtn_Click"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                       <td>
                            <asp:Button ID="ShippedBtn" runat="server" Text="Shipped" OnClick="ShippedBtn_Click"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                           <td>
                            <asp:Button ID="ReleasetoOpsBtn" runat="server" Text="Release to Ops" OnClick="ReleasetoOpsBtn_Click"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                        </td>
                    </tr>
                </table>
                <asp:Panel runat="server">
                    <asp:HiddenField ID="HiddenField" runat="server" />
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <telerik:RadWindow ID="FumigationRequestRadWindow" runat="server" VisibleOnPageLoad="true" Title="Fumigation Request @ Packing Order" Width="900px" Height="400px"
                        Modal="true" Left="100px" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
                    </telerik:RadWindow>
                </asp:Panel>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false" />
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" AllowFilteringByColumn="false">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
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
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PackingOrderEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="PackingOrderEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="AcName" SortExpression="AcName" HeaderText="Account">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Number" SortExpression="Number" HeaderText="Number">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustReference" SortExpression="CustReference" HeaderText="CustReference">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PKOTypeDescr" SortExpression="PKOTypeDescr" HeaderText="Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PKOPriorityDescr" SortExpression="PKOPriorityDescr" HeaderText="Priority">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RequiredDate" SortExpression="RequiredDate" HeaderText="RequiredDate"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GRNO" SortExpression="GRNO" HeaderText="GRNO">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StorageDate" SortExpression="StorageDate" HeaderText="StorageDate"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>                 
                            <telerik:GridBoundColumn DataField="GINO" SortExpression="GINO" HeaderText="GINO">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShippedDate" SortExpression="ShippedDate" HeaderText="ShippedDate"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderBy" SortExpression="OrderBy" HeaderText="OrderBy">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderByEmail" SortExpression="OrderByEmail" HeaderText="OrderByEmail">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderByPhone" SortExpression="OrderByPhone" HeaderText="OrderByPhone">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SpecialInstruction" SortExpression="SpecialInstruction" HeaderText="SpecialInstruction">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Notes" SortExpression="Notes" HeaderText="Notes">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="PackerStatusDescr" SortExpression="PackerStatusDescr" HeaderText="PackerStatus">
                            </telerik:GridBoundColumn>                      
                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PKOType" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acid" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="accode" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PKOPriority" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
