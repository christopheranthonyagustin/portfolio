<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InboundSortingSortGR.aspx.cs" Inherits="iWMS.Web.Inbound.InboundSorting.InboundSortingSortGR" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="~/Control/ModalPopup.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sort GR @ Inbound Sorting</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <telerik:RadCodeBlock runat="server">
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
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Putaway Candidates" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        &nbsp;<asp:Button ID="Back" runat="server" Text="Back" CssClass="LongLabelWhite"
            OnClick="Back_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="100%" ID="HeaderRadPageView">
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Resizing AllowResizeToFit="true" AllowColumnResize="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="SuggestLocationBtn" runat="server" Text="Suggest Location" CssClass="LongLabelWhite"
                                OnClick="SuggestLocation_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="UndoSuggestedBtn" runat="server" Text="Undo Suggested" CssClass="LongLabelWhite"
                                OnClick="UndoSuggestedBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp;
                             <asp:Button ID="ExplodeBtn" runat="server" Text="Explode" CssClass="LongLabelWhite" usesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                 OnClick="ExplodeBtn_Click" />
                            &nbsp;
                            <asp:Button ID="UndoExplodeBtn" runat="server" Text="Undo Explode" CssClass="LongLabelWhite" usesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                OnClick="UndoExplodeBtn_Click" />
                            &nbsp;
                            <asp:Button ID="PrintTULabelBtn" runat="server" Text="Print TU Label" CssClass="LongLabelBlue" usesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                OnClick="PrintTULabelBtn_Click" />
                            &nbsp;
                            <asp:Button ID="HarmonizeTUNO1Btn" runat="server" Text="Harmonize TUNO1" CssClass="LongLabelWhite" usesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                OnClick="HarmonizeTUNO1Btn_Click" />
                            &nbsp;
                             <asp:Button ID="NominateBtn" runat="server" Text="Nominate" CssClass="white" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                 OnClick="NominateBtn_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="SecondResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" Visible="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="SecondResultDG_NeedDataSource">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Resizing AllowResizeToFit="true" AllowColumnResize="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="RCSDTID"
                        Name="ParentGrid">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="CurrentLocation" HeaderText="Current Location" SortExpression="CurrentLocation"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CurrentLocation")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="SKU" HeaderText="SKU" SortExpression="SKU" ReadOnly="true"></telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="Qty" HeaderText="Qty" SortExpression="Qty"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Qty")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="BatchNo" HeaderText="Batch No" SortExpression="BatchNo"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "BatchNo")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="TUNO1" HeaderText="TUNO1" SortExpression="TUNO1"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TUNO1")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="TotalVolume" HeaderText="Outer Pack Volume" SortExpression="TotalVolume"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TotalVolume")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="PutawayLocation" HeaderText="Putaway Location" SortExpression="PutawayLocation"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "PutawayLocation")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="NominateVLM" HeaderText="Nominate VLM" SortExpression="NominateVLM"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "NominateVLM")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status" SortExpression="Status"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Status")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn Display="false" DataField="RCSDTID" />
                            <telerik:GridBoundColumn Display="false" DataField="ComponentSKU" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <table>
                    <tr>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
