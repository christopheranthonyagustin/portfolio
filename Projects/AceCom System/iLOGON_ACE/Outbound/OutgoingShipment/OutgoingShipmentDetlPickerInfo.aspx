<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutgoingShipmentDetlPickerInfo.aspx.cs" Inherits="iWMS.Web.Outbound.OutgoingShipment.OutgoingShipmentDetlPickerInfo" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Outgoing Shipment PickerInfo</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <script language="javascript" type="text/javascript">
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
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Height="58%"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowFilteringByColumn="false"
            Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling ScrollHeight="350px" AllowScroll="true" UseStaticHeaders="true" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
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
                    <telerik:GridBoundColumn HeaderText="PickerName" DataField="PickerName" AllowFiltering="false"
                        SortExpression="PickerName" UniqueName="PickerName" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PickerStatus" DataField="Pickerstatusdescr" AllowFiltering="false"
                        SortExpression="PickerStatus" UniqueName="PickerStatus" Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="StartDate" DataField="StartDate" AllowFiltering="false"
                        SortExpression="StartDate" UniqueName="StartDate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="EndDate" DataField="EndDate" AllowFiltering="false"
                        SortExpression="EndDate" UniqueName="EndDate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="PickerNotes" DataField="PickerNotes" AllowFiltering="false"
                        SortExpression="PickerNotes" UniqueName="PickerNotes" Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false"
                        SortExpression="Status" UniqueName="Status" Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="AddDate" AllowFiltering="false"
                        SortExpression="AddDate" UniqueName="AddDate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="AddUser" DataField="AddUser" AllowFiltering="false"
                        SortExpression="AddUser" UniqueName="AddUser" Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="EditDate " DataField="EditDate" AllowFiltering="false"
                        SortExpression="EditDate" UniqueName="EditDate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="EditUser" DataField="EditUser" AllowFiltering="false"
                        SortExpression="EditUser" UniqueName="EditUser" Reorderable="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
