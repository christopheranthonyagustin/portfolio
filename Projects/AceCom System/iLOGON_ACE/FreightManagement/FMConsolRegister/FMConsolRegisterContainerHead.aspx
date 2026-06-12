<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMConsolRegisterContainerHead.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsolRegister.FMConsolRegisterContainerHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ConsolRegisterContainerHead</title>
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
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Container" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
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
                                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkObjective" runat="server" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                            <ItemStyle Wrap="False"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                                    ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                                    OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                &nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="CopyBtnButton1"
                                        ImageUrl="../../image/copy.png" Width="15" Height="15" AlternateText="Edit" OnClick="CopyBtn_Click"
                                        BackColor="Transparent" BorderWidth="0"></asp:ImageButton>&nbsp;
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="ConsolNo" UniqueName="ConsolNo" SortExpression="ConsolNo" ShowFilterIcon="false" AllowFiltering="false"
                                            HeaderText="Consol">
                                        </telerik:GridBoundColumn>                                       
                                        <telerik:GridBoundColumn DataField="Number" UniqueName="Number" HeaderText="Container"
                                            ShowFilterIcon="true" AllowFiltering="true" ItemStyle-Width="90px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="SealNo1" UniqueName="SealNo1" SortExpression="SealNo1" HeaderText="Seal Number" HeaderStyle-Width="90px"
                                            ItemStyle-Width="90px">
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="POLDescr" UniqueName="POLDescr" SortExpression="POLDescr" ShowFilterIcon="false" AllowFiltering="false"
                                            HeaderText="POL">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PODDescr" UniqueName="PODDescr" SortExpression="PODDescr" ShowFilterIcon="false" AllowFiltering="false"
                                            HeaderText="POD">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ETD" UniqueName="ETD" SortExpression="ETD"
                                            HeaderText="ETD" DataFormatString="{0:dd/MMM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ETA" UniqueName="ETA" SortExpression="ETA"
                                            HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy}">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TransportMode" UniqueName="Mode" HeaderText="Mode" ShowFilterIcon="true" AllowFiltering="true" HeaderStyle-Width="90px"
                                            ItemStyle-Width="90px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Type" UniqueName="Type" HeaderText="Container Type" ShowFilterIcon="true" AllowFiltering="true"
                                            HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DeliveryMode" UniqueName="DeliveryMode" HeaderText="Delivery Mode" ShowFilterIcon="true" AllowFiltering="true"
                                            HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Shipment" UniqueName="Shipment" HeaderText="Shipment" ShowFilterIcon="false" AllowFiltering="false"
                                            ItemStyle-Width="90px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ImportHaulierName" UniqueName="ImportHaulierName" HeaderText="HaulierName" ShowFilterIcon="false" AllowFiltering="false"
                                            ItemStyle-Width="90px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ImportHaulierUenNo" UniqueName="ImportHaulierUenNo" HeaderText="HaulierUenNo" ShowFilterIcon="false" AllowFiltering="false"
                                            ItemStyle-Width="90px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Temperature" UniqueName="Temperature" HeaderText="Temperature" ShowFilterIcon="false" AllowFiltering="false"
                                            ItemStyle-Width="90px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="VentSetting" UniqueName="VentSetting" HeaderText="VentSetting" ShowFilterIcon="false" AllowFiltering="false"
                                            ItemStyle-Width="90px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="GrossWT" UniqueName="GrossWT" SortExpression="GrossWT" ShowFilterIcon="false" AllowFiltering="false"
                                            ItemStyle-Width="90px" HeaderText="Gross Weight">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Quality" UniqueName="Quality" SortExpression="Quality" ShowFilterIcon="true" AllowFiltering="false"
                                            ItemStyle-Width="90px" HeaderText="WQ">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status" ShowFilterIcon="false"
                                            ItemStyle-Width="90px" AllowFiltering="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="status" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="FMCSLId" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ConsolNo" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="TransportMode" Display="false">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
