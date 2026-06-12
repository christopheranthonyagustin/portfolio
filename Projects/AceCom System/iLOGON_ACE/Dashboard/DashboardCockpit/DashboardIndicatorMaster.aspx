<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardIndicatorMaster.aspx.cs" Inherits="iWMS.Web.Dashboard.DashboardCockpit.DashboardIndicatorMaster" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manage Indicator</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <base target="_self" />
    
    <style type="text/css">
        body {
            overflow: hidden;
        }
    </style>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id); saveChangesToGrid()" UseSubmitBehavior="false" />
                    <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="AddBtn_Click" Text="Update"
                        OnClientClick="disableBtn(this.id,true); saveChangesToGrid()" UseSubmitBehavior="false" Visible="false" />
                    <asp:Button ID="Button1" class="LongLabelWhite" runat="server" OnClick="CancelBtn_Click" Text="Close Window" CausesValidation="false"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id); saveChangesToGrid()" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                    &nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" />
                    <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                </td>
                 <td>
                    <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                </td>
            </tr>
        </table>
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
            width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>

                                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" EnableViewState="false"
                                            AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" AllowFilteringByColumn="false"
                                            AllowPaging="true" Skin="Metro" RenderMode="Lightweight" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                                            OnBatchEditCommand="ResultDG_BatchEditCommand">
                                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="200px" />
                                                <Selecting AllowRowSelect="true" />
                                            </ClientSettings>
                                            <SortingSettings EnableSkinSortStyles="false" />
                                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                            <ItemStyle Wrap="false"></ItemStyle>
                                            <HeaderStyle Wrap="false"></HeaderStyle>
                                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="DashboardPropertyId" CommandItemDisplay="TopAndBottom" EditMode="Batch" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                                                HeaderStyle-HorizontalAlign="Left">
                                                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                                <Columns>
                                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="15px" HeaderStyle-Width="15px" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                        <HeaderTemplate>
                                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="GridchkObjective" runat="server" />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="deleteicon" AllowFiltering="false" ItemStyle-Width="15px" HeaderStyle-Width="15px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:ImageButton runat="server" ID="Delete"
                                                                ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                                                OnClick="DashboardPropertyDelete_Click" BackColor="Transparent" BorderWidth="0" />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="QualifyingItemDescr" HeaderText="Qualifying Item" ReadOnly="true" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="80px" HeaderStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridTemplateColumn UniqueName="Qualifier" HeaderText="Qualifier"
                                                        SortExpression="Qualifier" AllowFiltering="false" ItemStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="LblQualifier" Font-Bold="true" Text='<%# DataBinder.Eval(Container.DataItem, "Qualifier")%>'></asp:Label>
                                                            </br>                    
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadComboBox ID="QualifierDDL" OnLoad="QualifierDDL_Load" runat="server" Skin="WebBlue" Enabled="true"
                                                                RenderMode="Lightweight" Width="140px" OnClientDropDownOpening="QualifierDDL_Filter" HighlightTemplatedItems="true">
                                                            </telerik:RadComboBox>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="QualifierList" HeaderText="QualifierList" DataField="QualifierList" AllowFiltering="false" ItemStyle-Width="100px"
                                                        HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" Display="false">
                                                        <ItemTemplate>
                                                            <telerik:RadTextBox runat="server" ID="QualifierListTxt" Text='<%# Eval("QualifierList") %>' Width="140px">
                                                            </telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="QualifyingValueList" HeaderText="QualifyingValueList" DataField="QualifyingValue" AllowFiltering="false" ItemStyle-Width="100px"
                                                        HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" Display="false">
                                                        <ItemTemplate>
                                                            <telerik:RadTextBox runat="server" ID="QualifyingValueListTxt" Text='<%# Eval("QualifyingValueList") %>' Width="140px">
                                                            </telerik:RadTextBox>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                                      <telerik:GridTemplateColumn Reorderable="false" UniqueName="docicon" AllowFiltering="false" ItemStyle-Width="15px" HeaderStyle-Width="15px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:ImageButton runat="server" ID="Doc" Visible="True" ImageUrl="../../image/detail.gif" Width="15" ToolTip="QualifyingValue"
                                                             OnClick="DocIcon_Click"></asp:ImageButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridTemplateColumn UniqueName="QualifyingValue" HeaderText="Qualifying Value" DataField="QualifyingValue" AllowFiltering="false" ItemStyle-Width="120px"
                                                        HeaderStyle-Width="120px" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="LblQualifyingValue" Text='<%# Eval("QualifyingValue") %>' Width="140px" CssClass="wordwrap"></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadComboBox ID="QualifyingValueDDL" OnLoad="QualifyingValueDDL_Load" runat="server" Skin="WebBlue" Enabled="true"
                                                                RenderMode="Lightweight" Width="140px" OnClientDropDownOpening="QualifyingValueDDL_Filter" Filter="Contains" AllowCustomText="true" HighlightTemplatedItems="true">
                                                            </telerik:RadComboBox>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridBoundColumn DataField="DashboardPropertyId" UniqueName="DashboardPropertyId" Display="False">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="QualifyingItem" UniqueName="QualifyingItem" Display="False" />
                                                    
                                                    <telerik:GridBoundColumn DataField="QualifyingValue" UniqueName="QualifyingValueItems" Display="False">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>

                                    </td>
                                </tr>
                                <br />
                                <br />
                                <tr>
                                    <td>
                                        <asp:Label ID="Countlbl" runat="server" Style="color: red; font-size: medium; font-weight: bold"></asp:Label>
                                        <asp:Label ID="TripNoLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr align="right" style="padding-top: 24%">
                <td style="padding-top: 24%"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                    <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
                </td>
            </tr>
        </table>
        <telerik:RadCodeBlock ID="RadCodeBlock" runat="server">
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
            <script type="text/javascript">
                function saveChangesToGrid() {
                    // ref: https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/data-editing/commanditem/command-item-template#custom-commanditemtemplate-for-batch-edit-mode
                    var grid = $find('<%=ResultDG.ClientID%>');
                    grid.get_batchEditingManager().saveChanges(grid.get_masterTableView());
                }

                function QualifierDDL_Filter(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var QualifierList = $telerik.findControl(currentRow, "QualifierListTxt").get_value();
                    var QualifierListArr = new Array();
                    QualifierListArr = QualifierList.split(",");
                    var PrevQ = "";

                    var QualifierDDL = $telerik.findControl(currentRow, "QualifierDDL");
                    var QualifierListItems = QualifierDDL.get_items();

                    for (Q in QualifierListArr) {
                        var Qualifier = QualifierListArr[Q];

                        for (var i = 0; i < QualifierListItems.get_count() ; i++) {
                            var item = QualifierListItems.getItem(i);
                            if (!PrevQ.includes(item.get_value()) && item.get_value() !== "") {
                                if (Qualifier === item.get_value()) {
                                    item.show();
                                    PrevQ = PrevQ + ',' + item.get_value();
                                }
                                else {
                                    item.hide();
                                }
                            }
                        }
                    }

                    QualifierDDL.commitChanges();
                }

                function QualifyingValueDDL_Filter(sender, args) {
                    var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
                    var QualifyingValueList = $telerik.findControl(currentRow, "QualifyingValueListTxt").get_value();
                    var QualifyingValueListArr = new Array();
                    QualifyingValueListArr = QualifyingValueList.split(",");
                    var PrevQ = "";

                    var QualifyingValueDDL = $telerik.findControl(currentRow, "QualifyingValueDDL");
                    var QualifyingValueListItems = QualifyingValueDDL.get_items();

                    for (Q in QualifyingValueListArr) {
                        var Qualifier = QualifyingValueListArr[Q];

                        for (var i = 0; i < QualifyingValueListItems.get_count() ; i++) {
                            var item = QualifyingValueListItems.getItem(i);
                            if (!PrevQ.includes(item.get_value()) && item.get_value() !== "") {
                                if (Qualifier === item.get_value()) {
                                    item.show();
                                    PrevQ = PrevQ + ',' + item.get_value();
                                }
                                else {
                                    item.hide();
                                }
                            }
                        }
                    }

                    QualifyingValueDDL.commitChanges();
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
