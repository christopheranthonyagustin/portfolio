<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FabricateOrderForm.aspx.cs" Inherits="iWMS.Web.OMS.FabricateOrder.FabricateOrderForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Fabricate Order Form</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
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
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            var startingIndex = 0, gridViewID = '<%= ResultDG.MasterTableView.ClientID %>';
            function selectCheckbox(e, selectedIndex) {
                if (e.shiftKey) {
                    if (startingIndex < selectedIndex) {
                        $(':checkbox', '#' + gridViewID).slice(startingIndex, selectedIndex).prop("checked", true);
                    }
                    else
                        $(':checkbox', '#' + gridViewID).slice(selectedIndex, startingIndex).prop("checked", true);
                }
                startingIndex = selectedIndex;
            }
        </script>
    </telerik:RadCodeBlock>
    <style>
        #FabReportBtn {
            font-size: 9.5px;
        }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attch" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>

                                    <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                        OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                    &nbsp;
                            
                                </td>
                                <td>
                                    <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip2_TabClick">
                    <Tabs>
                        <telerik:RadTab Id="ItemTab" Text="Fabricate Item" Value="10" runat="server">
                        </telerik:RadTab>

                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="90%" ID="FOItemRadPageView">
                        <br />
                        <asp:Panel ID="NewBtnPanel" runat="server">
                            <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New"
                                OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="CompleteBtn" runat="server" CssClass="white" Text="Complete" Width="100"
                                OnClick="CompleteBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            <asp:Button ID="FabReportBtn" runat="server" CssClass="LongLabelBlue" Text="Fabrication Conversion Report" Width="100"
                                OnClick="FabReportBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                            <br />
                        </asp:Panel>
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                            AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="FabricateOrderItemId">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" onclick='<%# string.Format("javascript:selectCheckbox(event,{0});", Container.ItemIndex+1) %>' runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="ItemEdit"
                                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit" CausesValidation="false"
                                                OnClick="ItemEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ID="AttcImgBtn" ImageUrl="..\..\image\attached.jpg" Width="15" Height="15" AlternateText="Show Attachment"
                                                BorderWidth="0" BackColor="Transparent" CausesValidation="False"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ID="CopyBtn" ImageUrl="../../image/copy.png"
                                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Copy FabricateOrderItem"
                                                OnClick="CopyBtn_Click"
                                                CausesValidation="False"></asp:ImageButton>
                                            &nbsp;
                                       <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="ItemDelete"
                                           ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="ItemDelete" CausesValidation="false"
                                           OnClick="ItemDelete_Click" OnClientClick="return confirm('Confirm Delete?')" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn HeaderText="S/No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNo" runat="server" Text='<%# Container.ItemIndex + 1 %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="SeqNo" SortExpression="SeqNo" HeaderText="OMS S/No" HeaderStyle-Width="15px" ItemStyle-Width="15px"
                                        ItemStyle-Wrap="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="LineNo" DataField="LineNo" SortExpression="LineNo" UniqueName="LineNo"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="SKUCode" DataField="SKUCode" SortExpression="SKUCode" UniqueName="SKUCode"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="SKU Description" DataField="SKUDesr" SortExpression="SKUDesr" UniqueName="SKUDesr"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ActualQty" DataField="Qty" SortExpression="Qty" UniqueName="Qty"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Group No" DataField="GroupNo" SortExpression="GroupNo" UniqueName="GroupNo"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ExpectedQty" DataField="ExpectedQty" SortExpression="ExpectedQty" UniqueName="ExpectedQty"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="UOM" DataField="UOM" SortExpression="UOM" UniqueName="UOM"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="Weight" DataField="Weight" SortExpression="Weight" UniqueName="Weight"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemLength" DataField="ItemLength" SortExpression="ItemLength" UniqueName="ItemLength"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemWidth" DataField="ItemWidth" SortExpression="ItemWidth" UniqueName="ItemWidth"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemHeight" DataField="ItemHeight" SortExpression="ItemHeight" UniqueName="ItemHeight"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ItemVol" DataField="ItemVol" SortExpression="ItemVol" UniqueName="ItemVol"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="InternalLength" DataField="InternalLength" SortExpression="InternalLength" UniqueName="InternalLength"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="InternalWidth" DataField="InternalWidth" SortExpression="InternalWidth" UniqueName="InternalWidth"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="InternalHeight" DataField="InternalHeight" SortExpression="InternalHeight" UniqueName="InternalHeight"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="InternalVol" DataField="InternalVol" SortExpression="InternalVol" UniqueName="InternalVol"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ExternalLength" DataField="ExternalLength" SortExpression="ExternalLength" UniqueName="ExternalLength"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ExternalWidth" DataField="ExternalWidth" SortExpression="ExternalWidth" UniqueName="ExternalWidth"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ExternalHeight" DataField="ExternalHeight" SortExpression="ExternalHeight" UniqueName="ExternalHeight"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="ExternalVol" DataField="ExternalVol" SortExpression="ExternalVol" UniqueName="ExternalVol"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" SortExpression="Remarks" UniqueName="Remarks"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn HeaderText="FabricateItemStatus" DataField="FabricateItemStatusDescr" SortExpression="FabricateItemStatusDescr" UniqueName="FabricateItemStatusDescr"
                                        AllowFiltering="true" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="ModifiedOn" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ModifiedOn")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="FabricateOrderItemId" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FabricateOrderId" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
