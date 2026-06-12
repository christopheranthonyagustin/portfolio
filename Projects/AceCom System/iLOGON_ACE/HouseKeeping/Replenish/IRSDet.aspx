<%@ Page Language="c#" CodeBehind="IRSDet.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.Replenish.IRSDet" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReplenishSuggestedDetl</title>
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
<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />    
    <div style="height: 92%" id="div1">
    <br />    
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" OnUpdateCommand="ResultDG_Update"
        Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" OnEditCommand="ResultDG_Edit"
        OnItemDataBound="ResultDG_ItemDataBound">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" EditMode="InPlace">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                    <HeaderTemplate>
                        <label id="completelbl">
                        </label>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="Editbutton" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                            </ItemTemplate> 
                    <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false">
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU" ReadOnly="true" />
                <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description" ReadOnly="true" />   
                <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="FromLocation" ReadOnly="true" /> 
                 <telerik:GridBoundColumn DataField="pfloccode" SortExpression="pfloccode" HeaderText="ToPickFace" ReadOnly="true" />
                <telerik:GridBoundColumn AllowFiltering="true" ColumnGroupName="suggestedqty" DataField="suggesteduomqty" HeaderText="SuggestedQty" 
                     Reorderable="true" SortExpression="suggesteduomqty" UniqueName="suggestedqty" >
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="UOM" ReadOnly="true" />   
                <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="Lot#" ReadOnly="true" Display="false"/>

                <telerik:GridBoundColumn HeaderText="Lot4" DataField="lot4" AllowFiltering="true"
                    SortExpression="lot4" UniqueName="lot4" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot1" DataField="lot1" AllowFiltering="true"
                    SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot5" DataField="lot5" AllowFiltering="true"
                    SortExpression="lot5" UniqueName="lot5" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot6" DataField="lot6" AllowFiltering="true"
                    SortExpression="lot6" UniqueName="lot6" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot7" DataField="lot7" AllowFiltering="true"
                    SortExpression="lot7" UniqueName="lot7" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot2" DataField="lot2" AllowFiltering="true"
                    SortExpression="lot2" UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot3" DataField="lot3" AllowFiltering="true"
                    SortExpression="lot3" UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot8" DataField="lot8" AllowFiltering="true"
                    SortExpression="lot8" UniqueName="lot8" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" AllowFiltering="true"
                    SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" AllowFiltering="true"
                    SortExpression="lot10" UniqueName="lot10" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" AllowFiltering="true"
                    SortExpression="lot11" UniqueName="lot11" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" AllowFiltering="true"
                    SortExpression="lot12" UniqueName="lot12" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot13" DataField="lot13" AllowFiltering="true"
                    SortExpression="lot13" UniqueName="lot13" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot14" DataField="lot14" AllowFiltering="true"
                    SortExpression="lot14" UniqueName="lot14" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot15" DataField="lot15" AllowFiltering="true"
                    SortExpression="lot15" UniqueName="lot15" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot16" DataField="lot16" AllowFiltering="true"
                    SortExpression="lot16" UniqueName="lot16" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot17" DataField="lot17" AllowFiltering="true"
                    SortExpression="lot17" UniqueName="lot17" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot18" DataField="lot18" AllowFiltering="true"
                    SortExpression="lot18" UniqueName="lot18" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot19" DataField="lot19" AllowFiltering="true"
                    SortExpression="lot19" UniqueName="lot19" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot20" DataField="lot20" AllowFiltering="true"
                    SortExpression="lot20" UniqueName="lot20" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot21" DataField="lot21" AllowFiltering="true"
                    SortExpression="lot21" UniqueName="lot21" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot22" DataField="lot22" AllowFiltering="true"
                    SortExpression="lot22" UniqueName="lot22" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot23" DataField="lot23" AllowFiltering="true"
                    SortExpression="lot23" UniqueName="lot23" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot24" DataField="lot24" AllowFiltering="true"
                    SortExpression="lot24" UniqueName="lot24" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot25" DataField="lot25" AllowFiltering="true"
                    SortExpression="lot25" UniqueName="lot25" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot26" DataField="lot26" AllowFiltering="true"
                    SortExpression="lot26" UniqueName="lot26" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot27" DataField="lot27" AllowFiltering="true"
                    SortExpression="lot27" UniqueName="lot27" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot28" DataField="lot28" AllowFiltering="true"
                    SortExpression="lot28" UniqueName="lot28" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot29" DataField="lot29" AllowFiltering="true"
                    SortExpression="lot29" UniqueName="lot29" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot30" DataField="lot30" AllowFiltering="true"
                    SortExpression="lot30" UniqueName="lot30" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot31" DataField="lot31" AllowFiltering="true"
                    SortExpression="lot31" UniqueName="lot31" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot32" DataField="lot32" AllowFiltering="true"
                    SortExpression="lot32" UniqueName="lot32" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot33" DataField="lot33" AllowFiltering="true"
                    SortExpression="lot33" UniqueName="lot33" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot34" DataField="lot34" AllowFiltering="true"
                    SortExpression="lot34" UniqueName="lot34" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot35" DataField="lot35" AllowFiltering="true"
                    SortExpression="lot35" UniqueName="lot35" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot36" DataField="lot36" AllowFiltering="true"
                    SortExpression="lot36" UniqueName="lot36" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot37" DataField="lot37" AllowFiltering="true"
                    SortExpression="lot37" UniqueName="lot37" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot38" DataField="lot38" AllowFiltering="true"
                    SortExpression="lot38" UniqueName="lot38" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot39" DataField="lot39" AllowFiltering="true"
                    SortExpression="lot39" UniqueName="lot39" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot40" DataField="lot40" AllowFiltering="true"
                    SortExpression="lot40" UniqueName="lot40" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot41" DataField="lot41" AllowFiltering="true"
                    SortExpression="lot41" UniqueName="lot41" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot42" DataField="lot42" AllowFiltering="true"
                    SortExpression="lot42" UniqueName="lot42" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot43" DataField="lot43" AllowFiltering="true"
                    SortExpression="lot43" UniqueName="lot43" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot44" DataField="lot44" AllowFiltering="true"
                    SortExpression="lot44" UniqueName="lot44" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot45" DataField="lot45" AllowFiltering="true"
                    SortExpression="lot45" UniqueName="lot45" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot46" DataField="lot46" AllowFiltering="true"
                    SortExpression="lot46" UniqueName="lot46" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot47" DataField="lot47" AllowFiltering="true"
                    SortExpression="lot47" UniqueName="lot47" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot48" DataField="lot48" AllowFiltering="true"
                    SortExpression="lot48" UniqueName="lot48" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot49" DataField="lot49" AllowFiltering="true"
                    SortExpression="lot49" UniqueName="lot49" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot50" DataField="lot50" AllowFiltering="true"
                    SortExpression="lot50" UniqueName="lot50" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot51" DataField="lot51" AllowFiltering="true"
                    SortExpression="lot51" UniqueName="lot51" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot52" DataField="lot52" AllowFiltering="true"
                    SortExpression="lot52" UniqueName="lot52" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot53" DataField="lot53" AllowFiltering="true"
                    SortExpression="lot53" UniqueName="lot53" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot54" DataField="lot54" AllowFiltering="true"
                    SortExpression="lot54" UniqueName="lot54" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot55" DataField="lot55" AllowFiltering="true"
                    SortExpression="lot55" UniqueName="lot55" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot56" DataField="lot56" AllowFiltering="true"
                    SortExpression="lot56" UniqueName="lot56" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot57" DataField="lot57" AllowFiltering="true"
                    SortExpression="lot57" UniqueName="lot57" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot58" DataField="lot58" AllowFiltering="true"
                    SortExpression="lot58" UniqueName="lot58" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot59" DataField="lot59" AllowFiltering="true"
                    SortExpression="lot59" UniqueName="lot59" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot60" DataField="lot60" AllowFiltering="true"
                    SortExpression="lot60" UniqueName="lot60" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1" ReadOnly="true" /> 
                <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2" ReadOnly="true" />
                <telerik:GridBoundColumn DataField="status" SortExpression="status" Display="false" ReadOnly="true" />
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" ReadOnly="true" />
                <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks" ReadOnly="true" />
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" ReadOnly="true"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" />
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" ReadOnly="true" />
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" ReadOnly="true"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" />
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" ReadOnly="true" /> 
                <telerik:GridBoundColumn DataField="StatusColourCode" Display="False">
                </telerik:GridBoundColumn> 
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
