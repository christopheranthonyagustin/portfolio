<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderFabricationStage.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrderFabrication.DistributionSalesOrderFabricationStage" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>Sales Order Fabrication Stage</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

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
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
            OnUpdateCommand="ResultDG_UpdateCommand" OnEditCommand="ResultDG_EditCommand" OnCancelCommand="ResultDG_CancelCommand">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="25" DataKeyNames="SalesOrderFabricationStageId" EditMode="InPlace">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="ResultDGEdit"
                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.SalesOrderFabricationStageId")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="InkDelette_ServerClick" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Sales Order Fabricatoin Stage"
                                    align="absmiddle" runat="server"></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDGUpdate" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDGCancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="LineNo">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "LineNo") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="ItemCode">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ItemCode") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="ItemDescription">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ItemDescription") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="FabricationCode">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "FabricationCode") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="FabricationDescription">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "FabricationDescription") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="FabricationStageCode">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "FabricationStageCode") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="FabricationStageCode">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "FabricationStageCode") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="FabricationStageDescr">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "FabricationStageDescr") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>              

                    <telerik:GridTemplateColumn HeaderText="StartDate">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "StartDate") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="DATE_startdate" Width="155"></asp:TextBox>
                            <asp:CalendarExtender ID="StartDate_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="DATE_startdate" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                Format="dd/MMM/yyyy"></asp:CalendarExtender>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="StartRemarks">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "StartRemarks") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="StartRemarksTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>                  

                    <telerik:GridTemplateColumn HeaderText="EndDate">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "EndDate") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="DATE_enddate" Width="155"></asp:TextBox>
                            <asp:CalendarExtender ID="EndDate_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="DATE_enddate" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                Format="dd/MMM/yyyy"></asp:CalendarExtender>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="EndRemarks">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "EndRemarks") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="EndRemarksTxt" runat="server" Width="60"></asp:TextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="SalesOrderFabricationStageStatus">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "SalesOrderFabricaitonStageStatusDescr") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="SalesorderFabricationStageStatusDDL" DataMember="" DataTextField="descr" DataValueField="item"
                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(SalesorderFabricationStageStatusDS,DataBinder.Eval(Container.DataItem, "SalesOrderFabricationStageStatus").ToString())%>'
                                DataSource='<%# SalesorderFabricationStageStatusDS%>' runat="server" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ReadOnly="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="SalesOrderFabricationId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesOrderFabricationItemId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FabricationId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FabricationStageId" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesOrderFabricaitonStageStatusDescr" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
