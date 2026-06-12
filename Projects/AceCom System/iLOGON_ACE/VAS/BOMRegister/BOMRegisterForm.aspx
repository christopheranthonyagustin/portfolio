<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BOMRegisterForm.aspx.cs"
    Inherits="iWMS.Web.VAS.BOMRegister.BOMRegisterForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>BOMRegisterForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
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

    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <br />
                    &nbsp;
                     <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <%--<tr>
            <td>
                &nbsp;<telerik:RadButton ID="GenDetailBtn" runat="server" OnClick="GenDetailBtn_Click"
                    Text=" GenDetail " Skin="WebBlue">
                </telerik:RadButton>
                &nbsp;<telerik:RadButton ID="VoidDetailBtn" runat="server" OnClick="VoidDetailBtn_Click"
                    Text="VoidDetail" Skin="WebBlue">
                </telerik:RadButton>
                <br />
                <br />
            </td>
        </tr>--%>
        </table>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Structure" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="LotAllocated" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="StructureRadPageView">
                <br />
                <asp:Panel ID="BtnPanel" runat="server">                   
                    <asp:Button ID="LoanBtn" class="white" runat="server" OnClick="LoanBtn_Click" Text="Loan" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;  
                    <asp:Button ID="ReturnBtn" class="white" runat="server" OnClick="ReturnBtn_Click" Text="Return" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
                    <br />
                    <br />
                </asp:Panel>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                    AllowPaging="false" AllowSorting="true" Skin="Office2007" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                    OnItemCommand="ResultDG_ItemCommand" AllowAutomaticInserts="True">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                        <Selecting AllowRowSelect="true"></Selecting>
                        <Scrolling UseStaticHeaders="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid"
                        EditMode="InPlace" HierarchyLoadMode="Client">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="Detailicon" AllowFiltering="false"
                                HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="BOMDetlEdit"
                                        ImageUrl="..\..\image\pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" ID="AddBtn" ImageUrl="..\..\image\add.png" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Add" CommandArgument="AddBOMSDET"
                                        CommandName="AddBOMSDET"></asp:ImageButton>                                
                                    <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="BOMDetlLot" ImageUrl="..\..\image\detail.gif"
                                        Width="15" Height="15" AlternateText="BOMLot" BackColor="Transparent" BorderWidth="0"
                                        OnClick="BOMDetlLot_Click" Visible="false"></asp:ImageButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="BOMDetlUpdate" ImageUrl="..\..\image\floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="BOMDetlUpdate" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="BOMDetlCancel" ImageUrl="..\..\image\arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="BOMDetlCancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" UniqueName="id"
                                Visible="false" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="bhid" DataField="bhid" AllowFiltering="true"
                                UniqueName="bhid" Visible="false" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="skuid" DataField="skuid" AllowFiltering="true"
                                UniqueName="skuid" Visible="false" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="acid" DataField="acid" AllowFiltering="true"
                                UniqueName="acid" Visible="false" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"
                                UniqueName="skucode"  ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description"
                                UniqueName="skudescr"  ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="SetNo"
                                UniqueName="number"  ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Masterqty" SortExpression="Masterqty" HeaderText="MasterQty"
                                UniqueName="Masterqty"  DataFormatString="{0:#.##}" ReadOnly="True">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="Qty" UniqueName="qty"
                                 DataFormatString="{0:#.##}" ReadOnly="True">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="Qty" AllowFiltering="true" 
                                Display="false">
                                <ItemTemplate>
                                    <asp:Label ID="qtyDetlLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qty") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="OutQty" DataField="outqty" AllowFiltering="true"
                                ItemStyle-CssClass="break-word" ColumnGroupName="outqty" SortExpression="outqty"
                                UniqueName="outqty"  HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "outqty")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="outqtyDetlTxt" Text='<%# DataBinder.Eval(Container.DataItem, "outqty") %>'
                                        TextMode="MultiLine" Enabled="true" style="text-align:center">
                                    </telerik:RadTextBox>
                                    <asp:CompareValidator ID="QtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                        ControlToValidate="outqtyDetlTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:CompareValidator ID="QtyValueVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                        ControlToValidate="outqtyDetlTxt" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="QtyReq" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="*"
                                        ControlToValidate="outqtyDetlTxt"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="InQty" DataField="inqty" AllowFiltering="true"
                                ItemStyle-CssClass="break-word" ColumnGroupName="inqty" SortExpression="inqty"
                                UniqueName="inqty"  HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "inqty")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="inqtyDetlTxt" Text='<%# DataBinder.Eval(Container.DataItem, "inqty") %>'
                                        TextMode="MultiLine" Enabled="true" style="text-align:center">
                                    </telerik:RadTextBox>
                                    <asp:CompareValidator ID="InQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                        ControlToValidate="inqtyDetlTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:CompareValidator ID="InQtyValueVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                        ControlToValidate="inqtyDetlTxt" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="InQtyReq" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="*"
                                        ControlToValidate="inqtyDetlTxt"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="UOM" UniqueName="uom"
                                 ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EarliestExpiryDate" SortExpression="EarliestExpiryDate"
                                HeaderText="EarliestExpiry" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="true">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="vdname" SortExpression="vdname" HeaderText="VdName"
                                UniqueName="vdname"  ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                                UniqueName="statusdescr"  ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="status" DataField="status" AllowFiltering="true"
                                UniqueName="status" Display="false" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" AllowFiltering="true"
                                UniqueName="statuscolor" Display="false" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="parent" DataField="parent" AllowFiltering="true"
                                UniqueName="parent" Display="false" ReadOnly="true">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <DetailTables>
                            <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                                Width="100%" RetainExpandStateOnRebind="true">
                                <HeaderStyle Wrap="false" />
                                <ItemStyle Wrap="false" />
                                <AlternatingItemStyle Wrap="false" />
                                <ParentTableRelation>
                                    <telerik:GridRelationFields DetailKeyField="bhdtid" MasterKeyField="id" />
                                </ParentTableRelation>
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="Detailicon" AllowFiltering="false"
                                        HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="BOMSDetEdit"
                                                ImageUrl="..\..\image\pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="BOMSDetLot"
                                                ImageUrl="..\..\image\detail.gif" Width="15" Height="15" AlternateText="BOMLot"
                                                BackColor="Transparent" BorderWidth="0" OnClick="BOMSDetLot_Click"></asp:ImageButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="BOMSDetUpdate" ImageUrl="..\..\image\floppy.gif"
                                                Width="15" Height="15" AlternateText="Update" CommandName="BOMSDetUpdate" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ID="BOMSDetCancel" ImageUrl="..\..\image\arrow6.gif"
                                                Width="15" Height="15" AlternateText="Cancel" CommandName="BOMSDetCancel" BackColor="Transparent"
                                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                        </EditItemTemplate>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" UniqueName="id"
                                        Visible="false" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="bhid" DataField="bhid" AllowFiltering="true"
                                        UniqueName="bhid" Visible="false" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="skuid" DataField="skuid" AllowFiltering="true"
                                        UniqueName="skuid" Visible="false" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="acid" DataField="acid" AllowFiltering="true"
                                        UniqueName="acid" Visible="false" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"
                                        UniqueName="skucode"  ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description"
                                        UniqueName="skudescr"  ReadOnly="true">
                                    </telerik:GridBoundColumn> 
                                    <telerik:GridBoundColumn DataField="MasterQty" SortExpression="MasterQty" HeaderText="MasterQty" UniqueName="MasterQty"
                                         DataFormatString="{0:#.##}" ReadOnly="True">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="Qty" UniqueName="qty"
                                         DataFormatString="{0:#.##}" ReadOnly="True">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="Qty" AllowFiltering="true" 
                                        Display="false">
                                        <ItemTemplate>
                                            <asp:Label ID="qtySDetLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qty") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="outqty" SortExpression="outqty" HeaderText="OutQty"
                                    UniqueName="outqty"  DataFormatString="{0:#.##}" ReadOnly="True">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridBoundColumn> 
                                    <telerik:GridTemplateColumn HeaderText="InQty" DataField="inqty" AllowFiltering="true"
                                        ItemStyle-CssClass="break-word" ColumnGroupName="inqty" SortExpression="inqty"
                                        UniqueName="inqty"  HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "inqty","{0:#.##}")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CompareValidator ID="RecInQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                                                ErrorMessage="#" ControlToValidate="inqtySDetTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br>
                                            <telerik:RadTextBox runat="server" ID="inqtySDetTxt" Text='<%# DataBinder.Eval(Container.DataItem, "inqty") %>'
                                                TextMode="MultiLine" Enabled="true"  style="text-align:center" >
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="UOM" UniqueName="uom"
                                         ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="ExpiryDate" UniqueName="lot1"
                                         ReadOnly="true" DataFormatString="{0:dd/MMM/yyyy}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                                        UniqueName="statusdescr"  Visible="false" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="status" DataField="status" AllowFiltering="true"
                                        UniqueName="status" Visible="false" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" AllowFiltering="true"
                                        UniqueName="statuscolor" Visible="false" ReadOnly="true">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </telerik:GridTableView>
                        </DetailTables>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="340px" ID="LotRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
        </telerik:RadWindowManager>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
    </form>
</body>
</html>
