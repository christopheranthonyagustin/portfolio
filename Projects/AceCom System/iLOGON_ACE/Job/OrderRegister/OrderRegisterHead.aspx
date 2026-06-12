<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderRegisterHead.aspx.cs" Inherits="iWMS.Web.Job.OrderRegister.OrderRegisterHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>OrderRegisterHead</title>
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
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1">

                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
                    <telerik:RadPageView runat="server" Height="0px" ID="MainInfoRadPageView"><br />
                        <table id="report" runat="server" style="width: 100%; height: 30px">
                            <tr>
                                <td align="left" class="style1">
                                    <asp:Button ID="SubmitBtn" runat="server" CssClass="green" Text="Submit" OnClick="SubmitBtn_Click"
                                        CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    &nbsp;&nbsp;
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel" OnClick="CancelBtn_Click"
                                CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                        <br /> 
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" AllowPaging="true" Skin="Metro">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="ORId">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="checkbox" AllowFiltering="false">
                                        <HeaderTemplate>
                                            <label id="completelbl">
                                            </label>
                                            &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" Exportable="false">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="omHeadEdit" ImageUrl="..\..\image\pencil.gif" Width="15" Height="15" AlternateText="Edit Order Register"
                                                BorderWidth="0" BackColor="Transparent" OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="AcCode" SortExpression="AcCode" HeaderText="Account">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ORNO" SortExpression="ORNO" HeaderText="OrderNo">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="OrderDate" SortExpression="OrderDate" HeaderText="OrderDate" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TPRShipmentType" SortExpression="TPRShipmentType" HeaderText="Type">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CustomerReference" SortExpression="CustomerReference" HeaderText="CustomerReference">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="OrderBy" SortExpression="OrderBy" HeaderText="OrderBy">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="Status">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FRIJobNo" SortExpression="FRIJobNo" HeaderText="FRIJobNo">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FREJobNo" SortExpression="FREJobNo" HeaderText="FREJobNo">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TPRJobNo" SortExpression="TPRJobNo" HeaderText="TPRJobNo">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="GRNO" SortExpression="GRNO" HeaderText="GRNO">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="GINO" SortExpression="GINO" HeaderText="GINO">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Remarks1" SortExpression="Remarks1" HeaderText="Remarks1">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Remarks2" SortExpression="Remarks2" HeaderText="Remarks2">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ORId" UniqueName="ORId" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Status" UniqueName="Status" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
