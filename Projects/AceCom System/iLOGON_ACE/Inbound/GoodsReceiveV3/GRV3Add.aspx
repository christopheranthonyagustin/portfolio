<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3Add.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3Add" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Add @ GoodsReceiveV3</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/style.css" type="text/css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    </telerik:RadScriptBlock>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
            CausesValidation="true" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="AddBtn" CssClass="white" runat="server" OnClick="AddBtn_Click" Text="Add" OnClientClick="disableBtn(this.id,true)" CausesValidation="false" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr><br />
                        <iWMS:iForm ID="formCtl" runat="server" />
                    </tr>
                </table>
                <asp:UpdatePanel runat="server" ID="RCCtnrPanel">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG_Ctnr" runat="server" AutoGenerateColumns="false" GridLines="None"
                            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" Width="80%"
                            AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG_Ctnr_NeedDataSource">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="RCCtnrGrid">
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
                                    <telerik:GridTemplateColumn HeaderText="Size" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                        <ItemTemplate>
                                            <telerik:RadDropDownList ID="SizeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue"
                                                DataValueField="item" DataTextField="descr" DataSource='<%# SizeDS%>' Width="140px" DropDownWidth="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(SizeDS,DataBinder.Eval(Container.DataItem, "CtnrType").ToString())%>'>
                                            </telerik:RadDropDownList>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="ContainerNo" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                        <ItemTemplate>
                                            <telerik:RadTextBox ID="ContainerNoTxt" runat="server" Width="140px" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "CtnrNo") %>'
                                                Style="text-transform: uppercase"
                                                ClientEvents-OnValueChanging='ConvertToUpperCaseOnValueChanging'
                                                ClientEvents-OnValueChanged='<%# "function (s,a){CheckCtnrNoDigit(s,a," + Container.ItemIndex + ");}" %>'>
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="SealNo" AllowFiltering="false" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                        <ItemTemplate>
                                            <telerik:RadTextBox ID="SealNoTxt" runat="server" Width="140px" Skin="WebBlue"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "CtnrSealNo") %>'>
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="CargoPackType" AllowFiltering="false" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                        <ItemTemplate>
                                            <telerik:RadDropDownList ID="CargoPackTypeDDL" runat="server" ExpandDirection="Up" Skin="WebBlue"
                                                DataValueField="item" DataTextField="descr" DataSource='<%# CargoPackTypeDS%>' Width="140px" DropDownWidth="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CargoPackTypeDS,DataBinder.Eval(Container.DataItem, "CargoPackingType").ToString())%>'>
                                            </telerik:RadDropDownList>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="ContainerWt" AllowFiltering="false" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                        <ItemTemplate>
                                            <telerik:RadTextBox ID="ContainerWtTxt" runat="server" Width="140px" Skin="WebBlue"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "CtnrWt") %>'>
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="ContainerVol" AllowFiltering="false" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                        <ItemTemplate>
                                            <telerik:RadTextBox ID="ContainerVolTxt" runat="server" Width="140px" Skin="WebBlue"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "CtnrVol") %>'>
                                            </telerik:RadTextBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="GateInDate" AllowFiltering="false" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                        <ItemTemplate>
                                            <telerik:RadDatePicker ID="GateInDatePicker" runat="server" Width="140px" Skin="Office2007" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "ExpGateInDate") %>'
                                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy">
                                            </telerik:RadDatePicker>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="AddCtnr" ValidationGroup="NA"
                                                ImageUrl="../../image/add.png" Width="15" Height="15" AlternateText="Edit"
                                                OnClick="AddCtnr_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DeleteIcon" AllowFiltering="false" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="Delete" ImageUrl="../../image/deleted.png" ValidationGroup="NA"
                                                Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteCtnr_Click"
                                                BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
            <script type="text/javascript">
                function CheckCtnrNoDigit(sender, eventArgs, index) {
                    var grid = $find("<%=ResultDG_Ctnr.ClientID %>");
                    var MasterTable = grid.get_masterTableView();
                    var dataItems = MasterTable.get_dataItems();
                    var ctnrno = dataItems[index].findControl("ContainerNoTxt").get_textBoxValue();

                    if (ctnrno != "") {
                        var returnstr = ContainerNoCheckDigit(ctnrno);
                        if (returnstr != "Valid") {
                            alert(returnstr + " - [ " + ctnrno + " ]");
                            dataItems[index].findControl("ContainerNoTxt").focus();
                        }
                    }
                }

                function ConvertToUpperCaseOnValueChanging(sender, args) {
                    args.set_newValue(args.get_newValue().toUpperCase());
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
        </telerik:RadScriptBlock>
    </form>
</body>
</html>
