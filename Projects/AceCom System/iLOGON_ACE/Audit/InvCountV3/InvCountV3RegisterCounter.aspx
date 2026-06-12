<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3RegisterCounter.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3RegisterCounter" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvCountV3RegisterCounter</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
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
</head>
<body>
    <form id="Form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
            AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnCancelCommand="ResultDG_Cancel" OnItemCommand="ResultDG_ItemCommand">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top"
                EditMode="InPlace">
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
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="ICCounterEdit"
                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ICCounterUpdate" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ICCounterCancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="personnel" HeaderText="Personnel">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "pername")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadComboBox ID="personnelCombo" runat="server"
                                DropDownHeight="150px" Skin="Sunset" DataSource='<%# personnelDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(personnelDS,DataBinder.Eval(Container.DataItem, "perid").ToString())%>'
                                DataTextField="descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains" AutoPostBack="true" CausesValidation="false">
                            </telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="personnelComboReqVal" runat="server" ControlToValidate="personnelCombo" ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn SortExpression="type" UniqueName="type" HeaderText="Type">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "typedescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="typeDDL" runat="server" Skin="Sunset" DataSource='<%# typeDS %>' DataTextField="descr" DataValueField="item"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(typeDS,DataBinder.Eval(Container.DataItem, "type").ToString())%>'>
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="typeDDLReqVal" runat="server" ControlToValidate="typeDDL" ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn SortExpression="status" UniqueName="status" HeaderText="Status">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "statusdescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="statusDDL" runat="server" Enabled="false" Skin="WebBlue" DataSource='<%# statusDS %>' DataTextField="descr" DataValueField="item"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(statusDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'>
                            </telerik:RadDropDownList>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="UserId" SortExpression="UserId" HeaderText="UserId"
                        ItemStyle-Wrap="false" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                        ItemStyle-Wrap="false" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                        HeaderText="EditUser" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skuId" SortExpression="skuId" Display="False" UniqueName="skuId"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
