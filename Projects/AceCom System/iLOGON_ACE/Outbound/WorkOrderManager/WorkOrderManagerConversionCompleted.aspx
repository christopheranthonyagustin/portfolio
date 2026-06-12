<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkOrderManagerConversionCompleted.aspx.cs" Inherits="iWMS.Web.Outbound.WorkOrderManager.WorkOrderManagerConversionCompleted" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Conversion Completed @ Work Order Manager</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
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

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="SubmitBtn" class="white" runat="server" OnClick="SubmitBtn_Click"
                        OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" Text="Submit" />
                    &nbsp;
                    <asp:Button ID="AddLotBtn" CssClass="white" runat="server" OnClick="AddLotBtn_Click" CausesValidation="false"
                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Text="Add Lot" />
                    &nbsp;
                    <asp:Button ID="CloseWindowBtn" class="LongLabelWhite" runat="server" OnClick="CloseWindowBtn_Click"
                        OnClientClick="disableBtn(this.id)" CausesValidation="false" UseSubmitBehavior="false" Text="Close Window" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
            AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbSelectAll" runat="server" CausesValidation="false" OnClick="CheckAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="WorkOrderBOMId" SortExpression="WorkOrderBOMId" HeaderText="WorkOrderBOMId" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" Display="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="CandidateId" SortExpression="CandidateId" HeaderText="CandidateId" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" Display="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="SKUID" SortExpression="SKUID" HeaderText="SKUID" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" Display="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="SKU" SortExpression="SKU" HeaderText="SKU" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="true" HeaderStyle-Width="140px" ReadOnly="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn DataField="CompletedQty" SortExpression="CompletedQty" HeaderText="CompletedQty" HeaderStyle-Width="90px">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="CompleteQtyTxtBox" runat="server" Width="120" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "CompletedQty") %>'>
                            </telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="BOMLineNo" SortExpression="BOMLineNo" HeaderText="BOMLineNo" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                        ItemStyle-Wrap="false" HeaderStyle-Width="90px" ReadOnly="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn DataField="TUNO1" SortExpression="TUNO1" HeaderText="TUNO1" HeaderStyle-Width="90px">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Tuno1TxtBox" runat="server" Width="120" TextMode="SingleLine">
                            </telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot1Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot1">
                        <ItemTemplate>
                            <telerik:RadDatePicker runat="server" ID="Lot1DatePicker" Skin="Office2007" Width="155"
                                DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-DateFormat="dd/MMM/yyyy">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                            <asp:RequiredFieldValidator ID="Lot1Require" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot1DatePicker" Enabled="false"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot2Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot2">
                        <ItemTemplate>
                            <telerik:RadDatePicker runat="server" ID="Lot2DatePicker" Skin="Office2007" Width="155"
                                DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-DateFormat="dd/MMM/yyyy">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                            <asp:RequiredFieldValidator ID="Lot2Require" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot2DatePicker" Enabled="false"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot3Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot3">
                        <ItemTemplate>
                            <telerik:RadDatePicker runat="server" ID="Lot3DatePicker" Skin="Office2007" Width="155"
                                DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-DateFormat="dd/MMM/yyyy">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                            <asp:RequiredFieldValidator ID="Lot3Require" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot3DatePicker" Enabled="false"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot4Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot4">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Lot4TxtBox" runat="server" Width="155" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "Lot4") %>'>
                            </telerik:RadTextBox>
                            <telerik:RadDropDownList ID="Lot4DDL" runat="server" Width="155" Skin="WebBlue" DataValueField="Item" DataTextField="Descr">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="Lot4RequireTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot4TxtBox" Enabled="false"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="Lot4RequireDDL" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot4DDL" Enabled="false"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot5Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot5">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Lot5TxtBox" runat="server" Width="155" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "Lot5") %>'>
                            </telerik:RadTextBox>
                            <telerik:RadDropDownList ID="Lot5DDL" runat="server" Width="155" Skin="WebBlue" DataValueField="Item" DataTextField="Descr">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="Lot5RequireTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot5TxtBox" Enabled="false"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="Lot5RequireDDL" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot5DDL" Enabled="false"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot6Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot6">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Lot6TxtBox" runat="server" Width="155" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "Lot6") %>'>
                            </telerik:RadTextBox>
                            <telerik:RadDropDownList ID="Lot6DDL" runat="server" Width="155" Skin="WebBlue" DataValueField="Item" DataTextField="Descr">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="Lot6RequireTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot6TxtBox" Enabled="false"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="Lot6RequireDDL" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot6DDL" Enabled="false"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot7Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot7">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Lot7TxtBox" runat="server" Width="155" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "Lot7") %>'>
                            </telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="Lot7Require" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot7TxtBox" Enabled="false"></asp:RequiredFieldValidator>
                            <asp:CompareValidator runat="server" ControlToValidate="Lot7TxtBox"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" Font-Bold="true" ForeColor="Red" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot8Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot8">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Lot8TxtBox" runat="server" Width="155" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "Lot8") %>'>
                            </telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="Lot8Require" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot8TxtBox" Enabled="false"></asp:RequiredFieldValidator>
                            <asp:CompareValidator runat="server" ControlToValidate="Lot8TxtBox"
                                EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" Font-Bold="true" ForeColor="Red" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot9Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot9">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Lot9TxtBox" runat="server" Width="155" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "Lot9") %>'>
                            </telerik:RadTextBox>
                            <telerik:RadDropDownList ID="Lot9DDL" runat="server" Width="155" Skin="WebBlue" DataValueField="Item" DataTextField="Descr">
                            </telerik:RadDropDownList>

                            <asp:RequiredFieldValidator ID="Lot9RequireTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot9TxtBox" Enabled="false"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="Lot9RequireDDL" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot9DDL" Enabled="false"></asp:RequiredFieldValidator>

                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot10Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot10">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Lot10TxtBox" runat="server" Width="155" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "Lot10") %>'>
                            </telerik:RadTextBox>
                            <telerik:RadDropDownList ID="Lot10DDL" runat="server" Width="155" Skin="WebBlue" DataValueField="Item" DataTextField="Descr">
                            </telerik:RadDropDownList>

                            <asp:RequiredFieldValidator ID="Lot10RequireTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot10TxtBox" Enabled="false"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="Lot10RequireDDL" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot10DDL" Enabled="false"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot11Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot11">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Lot11TxtBox" runat="server" Width="155" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "Lot11") %>'>
                            </telerik:RadTextBox>
                            <telerik:RadDropDownList ID="Lot11DDL" runat="server" Width="155" Skin="WebBlue" DataValueField="Item" DataTextField="Descr">
                            </telerik:RadDropDownList>

                            <asp:RequiredFieldValidator ID="Lot11RequireTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot11TxtBox" Enabled="false"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="Lot11RequireDDL" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot11DDL" Enabled="false"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot12Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot12">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Lot12TxtBox" runat="server" Width="155" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "Lot12") %>'>
                            </telerik:RadTextBox>
                            <telerik:RadDropDownList ID="Lot12DDL" runat="server" Width="155" Skin="WebBlue" DataValueField="Item" DataTextField="Descr">
                            </telerik:RadDropDownList>

                            <asp:RequiredFieldValidator ID="Lot12RequireTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot12TxtBox" Enabled="false"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="Lot12RequireDDL" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot12DDL" Enabled="false"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot13Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot13">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Lot13TxtBox" runat="server" Width="155" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "Lot13") %>'>
                            </telerik:RadTextBox>
                            <telerik:RadDropDownList ID="Lot13DDL" runat="server" Width="155" Skin="WebBlue" DataValueField="Item" DataTextField="Descr">
                            </telerik:RadDropDownList>

                            <asp:RequiredFieldValidator ID="Lot13RequireTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot13TxtBox" Enabled="false"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="Lot13RequireDDL" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot13DDL" Enabled="false"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot14Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot11">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Lot14TxtBox" runat="server" Width="155" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "Lot14") %>'>
                            </telerik:RadTextBox>
                            <telerik:RadDropDownList ID="Lot14DDL" runat="server" Width="155" Skin="WebBlue" DataValueField="Item" DataTextField="Descr">
                            </telerik:RadDropDownList>

                            <asp:RequiredFieldValidator ID="Lot14RequireTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot14TxtBox" Enabled="false"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="Lot14RequireDDL" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot14DDL" Enabled="false"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Lot15Val" ItemStyle-Width="155px" HeaderStyle-Width="180px"
                        SortExpression="Lot15">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="Lot15TxtBox" runat="server" Width="155" TextMode="SingleLine" Text='<%# DataBinder.Eval(Container.DataItem, "Lot15") %>'>
                            </telerik:RadTextBox>
                            <telerik:RadDropDownList ID="Lot15DDL" runat="server" Width="155" Skin="WebBlue" DataValueField="Item" DataTextField="Descr">
                            </telerik:RadDropDownList>

                            <asp:RequiredFieldValidator ID="Lot15RequireTxt" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot15TxtBox" Enabled="false"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="Lot15RequireDDL" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Lot15DDL" Enabled="false"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>


                    <telerik:GridBoundColumn DataField="Lot1Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot2Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot3Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot4Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot5Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot6Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot7Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot8Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot9Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot10Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot11Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot12Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot13Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot14Label" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot15Label" Display="false"></telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Lot1" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot2" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot3" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot4" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot5" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot6" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot7" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot8" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot9" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot10" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot11" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot12" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot13" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot14" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot15" Display="false"></telerik:GridBoundColumn>

                     <telerik:GridBoundColumn DataField="Lot1LDCode" Display="false"></telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="Lot2LDCode" Display="false"></telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="Lot3LDCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot4LDCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot5LDCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot6LDCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot7LDCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot8LDCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot9LDCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot10LDCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot11LDCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot12LDCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot13LDCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot14LDCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot15LDCode" Display="false"></telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Lot1Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot2Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot3Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot4Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot5Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot6Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot7Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot8Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot9Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot10Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot11Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot12Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot13Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot14Property" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot15Property" Display="false"></telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Lot1DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot2DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot3DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot4DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot5DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot6DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot7DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot8DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot9DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot10DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot11DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot12DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot13DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot14DataType" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lot15DataType" Display="false"></telerik:GridBoundColumn>

                     <telerik:GridBoundColumn DataField="SKU" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SKUCode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Description" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CompletedQty" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GRDate" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
