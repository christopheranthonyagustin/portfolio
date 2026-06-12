<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyForklift.aspx.cs" Inherits="iWMS.Web.Distribution.JobOrder.SurveyForklift" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey Moving @ Job Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
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
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />        
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="ForkliftRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add" OnClick="AddBtn_Click"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit" OnClick="EditBtn_Click"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="SurveyForkliftId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Height="30px" ItemStyle-Width="30px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Height="50px" ItemStyle-Width="50px">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="ForkliftEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="Edit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="ForkliftDelete"
                                                ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                                OnClick="Delete_Click" OnClientClick="return confirm('Confirm Delete?')" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:Label ID="SurveyForkliftAttcImage" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridBoundColumn DataField="GroupNo" UniqueName="GroupNo" SortExpression="GroupNo" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Group No"> 
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ForkLift" UniqueName="ForkLift" SortExpression="ForkLift" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ForkLift"> 
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="BatteryForklift" UniqueName="BatteryForklift" SortExpression="BatteryForklift" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Battery Forklift">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Mast" UniqueName="Mast" SortExpression="Mast" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Mast">
                            </telerik:GridBoundColumn>
                            
                            <telerik:GridBoundColumn DataField="LongFork" UniqueName="LongFork" SortExpression="LongFork" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="LongFork">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ScissorLift" UniqueName="ScissorLift" SortExpression="ScissorLift" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ScissorLift">
                            </telerik:GridBoundColumn>                            

                            <telerik:GridBoundColumn DataField="BoomLift" UniqueName="BoomLift" SortExpression="BoomLift" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="BoomLift">
                            </telerik:GridBoundColumn>
                            
                            <telerik:GridBoundColumn DataField="Remarks" UniqueName="Remarks" SortExpression="Remarks" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Remarks">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="SurveyForkliftId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderSurveyScopeId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderSurveyId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ImageAttch" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="500px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
