<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkOrderManagerBillofMaterial.aspx.cs" Inherits="iWMS.Web.Outbound.WorkOrderManager.WorkOrderManagerBillofMaterial" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>BillofMaterial @ WorkOrder</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }

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
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="BillofMaterialTabRadPageView">
                <table border="0" cellspacing="0" cellpadding="0" width="100%" height="40">
                    <tr>
                        <td>

                            <asp:Button ID="RefreshBtn" runat="server" CssClass="white" Text="Refresh" CausesValidation="false" OnClick="RefreshBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="BOMLabelBtn" runat="server" CssClass="blue" Text="BOMLabel"
                                CausesValidation="false" OnClick="BOMLabelBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" EnableLinqExpressions="false"
                    AllowPaging="false" Skin="Metro" AllowSorting="true" AllowFilteringByColumn="false" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemCommand="ResultDG_ItemCommand" OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>

                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" CommandItemDisplay="Top" DataKeyNames="WorkOrderBOMId" EditMode="InPlace">
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>

                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="BillofMaterialEdit" ImageUrl="../../image/pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="BillofMaterialDelete"
                                        ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                        OnClick="Delete_Click" OnClientClick="return confirm('Confirm Delete?')" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                <HeaderTemplate>
                                    No
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="SKUCode" HeaderText="SKUCode">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "SKUCode") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="SKUCodeTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SKUCode") %>'
                                        Skin="Sunset" BackColor="#ded7c6" OnTextChanged="SKUCodeTxt_TextChanged" AutoPostBack="true">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="SKUCodeTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />
                                    <asp:TextBox Text='<%# DataBinder.Eval(Container.DataItem, "SKUId") %>' ID="SKUIdTxtBox" runat="server" Visible="false"></asp:TextBox>
                                    <asp:TextBox Text='<%# DataBinder.Eval(Container.DataItem, "SKUGrpId") %>' ID="SKUGrpIdTxtBox" runat="server" Visible="false"></asp:TextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="SKUDescription" HeaderText="SKUDescription">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "SKUDescr") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="SKUDescriptionTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SKUDescr") %>' Skin="Sunset" BackColor="#ded7c6">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="SKUDescriptionTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="BOMQuantity" UniqueName="BOMQuantity">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "BOMQuantity") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="BOMQuantityTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BOMQuantity") %>' Skin="Sunset" BackColor="#ded7c6">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="BOMQuantityTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />
                                    <asp:CompareValidator runat="server" ControlToValidate="BOMQuantityTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="BOMUOM" HeaderText="BOMUOM">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "BOMUOM") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <br />
                                    <telerik:RadDropDownList ID="BOMUOMDDL" runat="server" RenderMode="Lightweight" Skin="Sunset" BackColor="#ded7c6" DataTextField="Descr" DataValueField="Item"
                                        DataSource='<%# BOMUOMDS%>' Text='<%# DataBinder.Eval(Container.DataItem, "BOMUOM") %>'>
                                    </telerik:RadDropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="BOMUOMDDL" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />
                                    <asp:TextBox Text='<%# DataBinder.Eval(Container.DataItem, "BOMUOM") %>' ID="UOMTxtBox" runat="server" Visible="false"></asp:TextBox>

                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn HeaderText="Lot1" DataField="Lot1" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot1" UniqueName="Lot1" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot2" DataField="Lot2" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot2" UniqueName="Lot2" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot3" DataField="Lot3" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot3" UniqueName="Lot3" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot4" DataField="Lot4" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot4" UniqueName="Lot4" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot5" DataField="Lot5" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot5" UniqueName="Lot5" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot6" DataField="Lot6" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot6" UniqueName="Lot6" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot7" DataField="Lot7" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot7" UniqueName="Lot7" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot8" DataField="Lot8" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot8" UniqueName="Lot8" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot9" DataField="Lot9" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot9" UniqueName="Lot9" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot10" DataField="Lot10" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot10" UniqueName="Lot10" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot11" DataField="Lot11" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot11" UniqueName="Lot11" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot12" DataField="Lot12" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot12" UniqueName="Lot12" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot13" DataField="Lot13" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot13" UniqueName="Lot13" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot14" DataField="Lot14" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot14" UniqueName="Lot14" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Lot15" DataField="Lot15" AllowFiltering="true" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                SortExpression="Lot15" UniqueName="Lot15" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn HeaderText="Notes">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Notes") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="NotesTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Notes") %>' TextMode="MultiLine" Width="180px" Rows="3">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot1" HeaderText="Lot1" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot1") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDatePicker ID="Lot1DatePicker" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "Lot1") %>' DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Office2007">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot2" HeaderText="Lot2" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot2") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDatePicker ID="Lot2DatePicker" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "Lot2") %>' DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Office2007">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot3" HeaderText="Lot3" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot3") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDatePicker ID="Lot3DatePicker" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "Lot3") %>' DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Office2007">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot4" HeaderText="Lot4" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot4") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Lot4Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot4") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot5" HeaderText="Lot5" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot5") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Lot5Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot5") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot6" HeaderText="Lot6" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot6") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Lot6Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot6") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot7" HeaderText="Lot7" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot7") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Lot7Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot7") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot8" HeaderText="Lot8" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot8") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Lot8Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot8") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot9" HeaderText="Lot9" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot9") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Lot9Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot9") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot10" HeaderText="Lot10" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot10") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Lot10Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot10") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot11" HeaderText="Lot11" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot11") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Lot11Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot11") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot12" HeaderText="Lot12" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot12") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Lot12Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot12") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot13" HeaderText="Lot13" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot13") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Lot13Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot13") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot14" HeaderText="Lot14" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot14") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Lot14Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot14") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Lot15" HeaderText="Lot15" Display="false">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Lot15") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Lot15Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot15") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="CreatedOn">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CreatedOn")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="ModifiedOn">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ModifiedOn")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
