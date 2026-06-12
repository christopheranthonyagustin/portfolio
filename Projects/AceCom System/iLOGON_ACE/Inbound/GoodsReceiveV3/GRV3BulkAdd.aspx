<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3BulkAdd.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3BulkAdd" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>BulkAdd @ Goods Reveive V3</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
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
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Panel ID="GeneralInfo" runat="server">
            <table>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                    <td>
                        <asp:Button ID="RunBtn" runat="server" Text="Run" OnClick="RunBtn_Click"
                            OnClientClick="disableBtn(this.id,true)" CssClass="white" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:UpdatePanel ID="SKUInfoUpdatePanel" runat="server" UpdateMode="Conditional" Visible="false">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click"
                                OnClientClick="disableBtn(this.id, true)" CssClass="white" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="false" AllowPaging="true"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Width="100%">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="DeleteIcon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left"
                                ItemStyle-Width="10px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="Delete" ImageUrl="../../image/bin.gif" CausesValidation="false"
                                        Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteSKULine_Click"
                                        BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="SKUCode" HeaderText="SKUCode">
                                <ItemTemplate>
                                    <asp:RequiredFieldValidator ControlToValidate="SKUCodeTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <telerik:RadTextBox ID="SKUCodeTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SKUCode") %>'
                                        Skin="Sunset" BackColor="#ded7c6">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="SKUDescription" HeaderText="SKUDescription">
                                <ItemTemplate>
                                    <asp:RequiredFieldValidator ControlToValidate="SKUDescriptionTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <telerik:RadTextBox ID="SKUDescriptionTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SKUDescription") %>' Skin="Sunset" BackColor="#ded7c6">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Quantity" HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:RequiredFieldValidator ControlToValidate="QuantityTxt" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator runat="server" ControlToValidate="QuantityTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                    <telerik:RadTextBox ID="QuantityTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Quantity") %>' Skin="Sunset" BackColor="#ded7c6">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="UOM" HeaderText="UOM">
                                <ItemTemplate>
                                    <asp:RequiredFieldValidator ControlToValidate="UOMDDL" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <telerik:RadDropDownList ID="UOMDDL" runat="server" RenderMode="Lightweight" Skin="Sunset" BackColor="#ded7c6" DataTextField="Descr" DataValueField="Item"
                                        DataSource='<%# UOMDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(UOMDS, DataBinder.Eval(Container.DataItem, "UOM").ToString())%>'>
                                    </telerik:RadDropDownList>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Location" HeaderText="Location">
                                <ItemTemplate>
                                    <asp:RequiredFieldValidator ControlToValidate="LocationCombo" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <telerik:RadComboBox ID="LocationCombo" runat="server" RenderMode="Lightweight" Skin="Sunset" BackColor="#ded7c6" DataTextField="Code" DataValueField="Code" Filter="Contains"
                                        EnableAutomaticLoadOnDemand="true" ItemsPerRequest="20" AutoPostBack="true" CausesValidation="false" DropDownAutoWidth="Enabled" EnableVirtualScrolling="true" ShowMoreResultsBox="true"
                                        OnLoad="LocationCombo_Load">
                                    </telerik:RadComboBox>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="RemarksTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Remarks") %>' TextMode="MultiLine" Height="50px">
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot1" HeaderText="Lot1">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadDatePicker ID="Lot1DatePicker" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "Lot1") %>' DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Office2007">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot2" HeaderText="Lot2">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadDatePicker ID="Lot2DatePicker" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "Lot2") %>' DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Office2007">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot3" HeaderText="Lot3">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadDatePicker ID="Lot3DatePicker" runat="server" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "Lot3") %>' DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Office2007">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="#45b6fe" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot4" HeaderText="Lot4">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="Lot4Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot4") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot5" HeaderText="Lot5">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="Lot5Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot5") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot6" HeaderText="Lot6">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="Lot6Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot6") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot7" HeaderText="Lot7">
                                <ItemTemplate>
                                    <asp:CompareValidator runat="server" ControlToValidate="VolumeTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                    <telerik:RadTextBox ID="Lot7Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot7") %>'>
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot8" HeaderText="Lot8">
                                <ItemTemplate>
                                    <asp:CompareValidator runat="server" ControlToValidate="VolumeTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                    <telerik:RadTextBox ID="Lot8Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot8") %>'>
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot9" HeaderText="Lot9">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="Lot9Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot9") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot10" HeaderText="Lot10">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="Lot10Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot10") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot11" HeaderText="Lot11">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="Lot11Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot11") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot12" HeaderText="Lot12">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="Lot12Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot12") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot13" HeaderText="Lot13">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="Lot13Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot13") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot14" HeaderText="Lot14">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="Lot14Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot14") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Lot15" HeaderText="Lot15">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="Lot15Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Lot15") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TUNO1" HeaderText="TUNO1">
                                <ItemTemplate>
                                    <br />
                                    <telerik:RadTextBox ID="TUNO1Txt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TUNO1") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Length" HeaderText="Length(CM)">
                                <ItemTemplate>
                                    <asp:CompareValidator runat="server" ControlToValidate="LengthTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                    <telerik:RadTextBox ID="LengthTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Length") %>' OnTextChanged="LengthTxt_TextChanged" AutoPostBack="true" CausesValidation="false">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Width" HeaderText="Width(CM)">
                                <ItemTemplate>
                                    <asp:CompareValidator runat="server" ControlToValidate="WidthTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                    <telerik:RadTextBox ID="WidthTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Width") %>' OnTextChanged="WidthTxt_TextChanged" AutoPostBack="true" CausesValidation="false">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Height" HeaderText="Height(CM)">
                                <ItemTemplate>
                                    <asp:CompareValidator runat="server" ControlToValidate="HeightTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                    <telerik:RadTextBox ID="HeightTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Height") %>' OnTextChanged="HeightTxt_TextChanged" AutoPostBack="true" CausesValidation="false">
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Volume" HeaderText="Volume(M3)">
                                <ItemTemplate>
                                    <asp:CompareValidator runat="server" ControlToValidate="VolumeTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                    <telerik:RadTextBox ID="VolumeTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Volume") %>'>
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Weight" HeaderText="Weight">
                                <ItemTemplate>
                                    <asp:CompareValidator runat="server" ControlToValidate="WeightTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" Font-Bold="true" Font-Size="Large" />
                                    <telerik:RadTextBox ID="WeightTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Weight") %>'>
                                    </telerik:RadTextBox>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="SaveBtn" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
