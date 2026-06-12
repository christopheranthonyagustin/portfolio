<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackingOrderForm.aspx.cs" Inherits="iWMS.Web.FreightManagement.PackingOrder.PackingOrderForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PackingOrderForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    <style type="text/css">
        .TotalHU {
            white-space: nowrap;
            line-break: unset;
        }

        .PKOHURadPageView {
            height: auto !important;
        }

        .BigCheckBox input {
            width: 30px;
            height: 20px;
            float: left;
            margin-top: 3px;
            margin-left: 3px;
        }

        .RadGridTable {
            width: 30% !important;
            height: 30% !important;
            border: thin;
            background-color: #cce6ff;
            border-radius: 7px;
            margin-right: 10px;
            float: left;
            padding-top: 10px;
            box-shadow: 3px 3px 3px #666666;
            margin-top: 10px;
            overflow: auto;
        }

        .RadWindow {
            z-index: 8010 !important;
        }

        html .RadMenu .rmGroup .rmItem a.rmLink {
            text-decoration: none;
        }

            html .RadMenu .rmGroup .rmItem a.rmLink:hover {
                background-color: #ebebe0 !important;
                font-weight: bold;
            }
    </style>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
        function ShowItem(menu, args) {
            var label = document.getElementById("RadMenuLbl");
            if (args.get_item().get_text() != "Excel") {
                label.innerText = args.get_item().get_text();
                label.innerText = label.innerText.concat(" ", "excel file is printing..");
            }
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle" Visible="true"></asp:Label>
                    <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" Enable="false" Visible="true" />
                    <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black" Visible="true"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="HeaderRadPageView">
                <br />
                <asp:Panel ID="PKOMainPanel" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="true"
                                    Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                &nbsp;
                                <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update" Enable="false"
                                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Visible="true" />
                                &nbsp;
                                <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="true"
                                    Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                                    <ContentTemplate><br />
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                        <iWMS:iForm ID="formCtl_ML_TB" runat="server"></iWMS:iForm>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="PKOHUPanel" runat="server">
                    <telerik:RadTabStrip runat="server" ID="RadTabStrip2" CausesValidation="false" MultiPageID="RadMultiPageSKULine"
                        AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
                        <Tabs>
                            <telerik:RadTab Text="Box" Value="0" runat="server">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTabStrip>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage">
                        <telerik:RadPageView runat="server" ID="HU_RadPageView" CssClass="PKOHURadPageView">
                            <table>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="NewBoxBtn" CssClass="white" runat="server" Text="New Box" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" OnClick="NewBoxBtn_Click" />

                                                </td>
                                                <td>
                                                    <asp:Button ID="EditBoxBtn" CssClass="white" runat="server" Text="Edit Box" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" OnClick="EditBoxBtn_Click" />

                                                </td>
                                                <td>
                                                    <asp:Button ID="RemoveBoxBtn" CssClass="white" runat="server" Text="Remove Box" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" OnClick="RemoveBoxBtn_Click" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="MarkingsBtn" CssClass="blue" runat="server" Text="Markings" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" OnClick="MarkingsBtn_Click" />
                                                </td>
                                                <td>
                                                    <telerik:RadMenu ID="PrintExcel_RadMenu" runat="server"  RenderMode="Lightweight" EnableEmbeddedSkins="false"
                                                        OnItemClick="PrintExcel_RadMenu_ItemClick" OnClientItemClicked="RadMenuClientOnClick" CssClass="RadMenu_CUSTOM_Green" 
                                                        OnClientItemClicking="ShowItem">
                                                        <Items>
                                                            <telerik:RadMenuItem runat="server" Text="Excel" PostBack="false" Value="Print" Font-Bold="true">
                                                                <GroupSettings ExpandDirection="Right" />
                                                                <Items>
                                                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="PackingList" Text="Packing List" ForeColor="Black"
                                                                        Visible="true" BackColor="White" />
                                                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="FumigationCert" Text="Fumigation Cert" ForeColor="Black"
                                                                        Visible="true" BackColor="White" />
                                                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="Markings" Text="Markings" ForeColor="Black"
                                                                        Visible="true" BackColor="White" />
                                                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="TPNMarkings" Text="TPN Markings" ForeColor="Black"
                                                                        Visible="true" BackColor="White" />
                                                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="GatePass" Text="Gate Pass" ForeColor="Black"
                                                                        Visible="true" BackColor="White" />
                                                                </Items>
                                                            </telerik:RadMenuItem>
                                                        </Items>
                                                    </telerik:RadMenu>
                                                    <asp:Label ID="RadMenuLbl" runat="server" Font-Bold="true" ForeColor="OrangeRed" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="LblTotalHU" Font-Bold="true" Font-Size="Large" CssClass="TotalHU"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </asp:Panel>
                <asp:Panel ID="PKOItemPanel" runat="server">
                    <telerik:RadTabStrip runat="server" ID="RadTabStripPKOItem" CausesValidation="false" MultiPageID="RadMultiPageSKULine"
                        AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
                        <Tabs>
                            <telerik:RadTab Text="Items not Packed" Value="0" runat="server">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTabStrip>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPagePKOItem" SelectedIndex="0" CssClass="outerMultiPage">
                        <telerik:RadPageView runat="server" ID="LineRadPageView">
                            <table cellspacing="10" cellpadding="0" border="0" width="100%">
                                <tr>
                                    <td valign="middle">
                                        <div style="float: left">
                                            <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New"
                                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                                                CausesValidation="false" />
                                            <asp:Button ID="EditBtn" CssClass="white" runat="server" OnClick="EditBtn_Click" Text="Edit"
                                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                                                CausesValidation="false" />
                                            <asp:Button ID="DeleteBtn" CssClass="white" runat="server" OnClick="DeleteBtn_Click" Text="Delete"
                                                UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)"
                                                CausesValidation="false" />
                                            <asp:Button ID="CopyBtn" CssClass="white" runat="server" OnClick="CopyBtn_Click" Text="Copy"
                                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                                                CausesValidation="false" />
                                             <asp:Button ID="ExplodeBtn" CssClass="white" runat="server" OnClick="ExplodeBtn_Click" Text="Explode"
                                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"
                                                CausesValidation="false" />
                                            <asp:Button ID="ButtonExcel" CssClass="green" runat="server" OnClick="ButtonExcel_Click"
                                                Text="Excel" ToolTip="Export To Excel" CausesValidation="false" />
                                        </div>
                                    </td>
                                </tr>
                            </table>

                            <telerik:RadGrid ID="ResultDGPKOItem" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                                AllowMultiRowSelection="true" OnNeedDataSource="ResultDGPKOItem_NeedDataSource" AllowFilteringByColumn="false"
                                OnItemDataBound="ResultDGPKOItem_ItemDataBound" OnBatchEditCommand="ResultDGPKOItem_BatchEditCommand" AllowPaging="true"
                                ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True">
                                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                                <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                                    <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" AllowFilteringByColumn="false" EditMode="Batch" CommandItemDisplay="TopAndBottom">
                                    <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Wrap="false" HeaderStyle-Width="40px" ItemStyle-Wrap="false" ItemStyle-Width="30px">
                                            <HeaderTemplate>
                                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkObjective" runat="server" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon1" AllowFiltering="false" HeaderStyle-Wrap="false" HeaderStyle-Width="40px" ItemStyle-Wrap="false" ItemStyle-Width="40px">
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0" CausesValidation="false"
                                                    BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>

                                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                    onclick="return confirm('Confirm delete Issue Detail?')" onserverclick="lnkDelete_ServerClick"
                                                    runat="server"></a>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="number" AllowFiltering="false" HeaderStyle-Width="80px" ItemStyle-Width="80px">
                                            <HeaderTemplate>
                                                No
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%#Container.ItemIndex+1%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="PartNo" HeaderText="PartNo" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="PartNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "partno")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="PartNoTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="PartDescr" HeaderText="PartDescr" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="PartDescrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "partdescription")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="PartDescrTxt" TextMode="SingleLine" Width="140px"></telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Qty" HeaderText="Qty" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="QtyLbl" Text='<%# DataBinder.Eval(Container.DataItem, "qty")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="QtyTxt" TextMode="SingleLine" Width="130px"></telerik:RadTextBox>
                                                <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Length" HeaderText="Length" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="LengthLbl" Text='<%# string.Format("{0:0.#}",Eval("length")) %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="LengthTxt" TextMode="SingleLine" Width="130px"></telerik:RadTextBox>
                                                <asp:CompareValidator ID="LengthTxtCompVal" runat="server" ControlToValidate="LengthTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />

                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Width" HeaderText="Width" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="WidthLbl" Text='<%# string.Format("{0:0.#}",Eval("width")) %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="WidthTxt" TextMode="SingleLine" Width="130px"></telerik:RadTextBox>
                                                <asp:CompareValidator ID="WidthTxtCompVal" runat="server" ControlToValidate="WidthTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Height" HeaderText="Height" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="HeightLbl" Text='<%# string.Format("{0:0.#}",Eval("height")) %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="HeightTxt" TextMode="SingleLine" Width="130px"></telerik:RadTextBox>
                                                <asp:CompareValidator ID="HeightTxtCompVal" runat="server" ControlToValidate="HeightTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Volume" HeaderText="Volume" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="VolumeLbl" Text='<%# string.Format("{0:0.#}",Eval("volume")) %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="VolumeTxt" TextMode="SingleLine" Width="130px"></telerik:RadTextBox>
                                                <asp:CompareValidator ID="VolumeTxtCompVal" runat="server" ControlToValidate="VolumeTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Weight" HeaderText="Weight" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="WeightLbl" Text='<%# string.Format("{0:0.#}",Eval("weight")) %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="WeightTxt" TextMode="SingleLine" Width="130px"></telerik:RadTextBox>
                                                <asp:CompareValidator ID="WeightTxtCompVal" runat="server" ControlToValidate="WeightTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="WorkOrderNo" HeaderText="WorkOrderNo" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="WorkOrderNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "WorkOrderNo")%>'></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="StatusDescr" HeaderText="Status" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="StatusLbl" Text='<%# DataBinder.Eval(Container.DataItem, "statusdescr")%>'></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="ModifiedOn" HeaderText="ModifiedOn" AllowFiltering="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="ModifiedOnLbl" Text='<%# Eval("ModifiedOn", "{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" AllowFiltering="false"
                                            SortExpression="statuscolor" UniqueName="statuscolor" Reorderable="true" Display="false">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn Display="False" DataField="PKOId" SortExpression="PKOId" />
                                        <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                                        <telerik:GridBoundColumn Display="False" DataField="PKOHUId" SortExpression="PKOHUId" />
                                        <telerik:GridBoundColumn Display="False" DataField="SKUId" SortExpression="SKUId" />
                                        <telerik:GridBoundColumn Display="False" DataField="status" SortExpression="status" />
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </asp:Panel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1000px" Height="600px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
