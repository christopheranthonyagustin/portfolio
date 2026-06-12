<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobOrderSurveyItem.aspx.cs" Inherits="iWMS.Web.Distribution.JobOrder.JobOrderSurveyItem" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cargo @ Job Order</title>
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="CargoTab" Text="Cargo" Value="0" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab Id="ForkliftTab" Text="Forklift" Value="50" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab Id="LiftingandHoistingTab" Text="Lifting and Hoisting" Value="100" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab Id="ManPowerTab" Text="ManPower" Value="150" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab Id="MovingTab" Text="Moving" Value="200" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab Id="PackingTab" Text="Packing" Value="250" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab Id="SafetyTab" Text="Safety Documents" Value="300" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab Id="StuffingTab" Text="Stuffing" Value="350" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab Id="TransportTab" Text="Transport" Value="400" runat="server" Enabled="false">
                </telerik:RadTab>
                <telerik:RadTab Id="UnStuffingTab" Text="UnStuffing" Value="450" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="JobOrderSurveyItemRadPageView">
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
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JobOrderSurveyItemId">
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
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="JOSItemEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="Edit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="JOSItemDelete"
                                        ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                        OnClick="Delete_Click" OnClientClick="return confirm('Confirm Delete?')" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:Label ID="JobOrderItemAttcImage" runat="server" />  
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            
                            <telerik:GridBoundColumn DataField="SeqNo" UniqueName="SNo" HeaderText="SNo" HeaderStyle-Width="50px" ItemStyle-Width="50px" ShowFilterIcon="true" AllowFiltering="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ItemDescription" UniqueName="ItemDescription" SortExpression="ItemDescription" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Description">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="IsStorageRequired" UniqueName="IsStorageRequired" SortExpression="IsStorageRequired" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Storage">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="CargoDetail" UniqueName="CargoDetail" SortExpression="CargoDetail" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Cargo Detail">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="InternalDimensions" UniqueName="InternalDimensions" SortExpression="InternalDimensions" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Internal Dimensions">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ExternalDimensions" UniqueName="ExternalDimensions" SortExpression="ExternalDimensions" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="External Dimensions">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Qty" DataField="Qty" SortExpression="Qty" UniqueName="Qty"
                                AllowFiltering="true" Reorderable="true" DataType="System.Decimal" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Weight" DataField="Weight" SortExpression="Weight" UniqueName="Weight"
                                AllowFiltering="true" Reorderable="true" DataType="System.Decimal" DataFormatString="{0:0.00}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Remarks" UniqueName="Remarks" SortExpression="Remarks" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Remarks">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="ModifiedOn">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="JobOrderSurveyItemId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderSurveyId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ImageAttch" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="ForkliftRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="LiftingandHoistingRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="ManPowerRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="MovingRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="PackingRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="SafetyDocumentsRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="StuffingRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="TransportRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="UnStuffingRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="600px" Height="500px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
