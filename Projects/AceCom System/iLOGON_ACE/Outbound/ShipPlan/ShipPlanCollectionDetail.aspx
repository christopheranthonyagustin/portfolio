<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipPlanCollectionDetail.aspx.cs" Inherits="iWMS.Web.Outbound.ShipPlan.ShipPlanCollectionDetail" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ShipPlanCollectionDetail</title>
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
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
     <table border="0" cellspacing="0" cellpadding="0" width="100%">          
        <tr>
            <td>
                <asp:Button ID="BuildBtn" CssClass="white" runat="server" OnClick="BuildBtn_Click" Visible="true"  
                    Text="Build" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"  />
                &nbsp;
                <asp:Button ID="BackBtn" CssClass="white" runat="server" OnClick="BackBtn_Click" Visible="true"  
                    Text="Back" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </td>
        </tr>
    </table>
        <br />
        <br />
    <div>    
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" 
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>                    
                    <telerik:GridBoundColumn DataField="accode" ItemStyle-Wrap="false" SortExpression="accode"
                        HeaderText="Account">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sitedescr" ItemStyle-Wrap="false" SortExpression="sitedescr"
                        HeaderText="Site">
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="number" ItemStyle-Wrap="false" SortExpression="number"
                        HeaderText="ReceiptNo">
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="statusdescr" ItemStyle-Wrap="false" SortExpression="statusdescr"
                        HeaderText="Status">
                    </telerik:GridBoundColumn> 
                     <telerik:GridBoundColumn DataField="exprcdate" SortExpression="exprcdate" HeaderText="Expected"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="suid" SortExpression="suid" HeaderText="Supplier Code">
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="suname" SortExpression="suname" HeaderText="Name">
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="suaddr1" SortExpression="suaddr1" HeaderText="Address">
                    </telerik:GridBoundColumn>                                                           
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
         &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
            CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
