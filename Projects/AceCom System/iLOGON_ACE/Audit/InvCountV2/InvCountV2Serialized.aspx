<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV2Serialized.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV2.InvCountV2Serialized" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>InvCountV2Serialized</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">   
        <script src="../../js/Script.js" type="text/javascript"></script>
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
    <script language="javascript" type="text/javascript">
	function disableBtn(id) {
            var btn = document.getElementById(id);
            btn.disabled = true;
        }
    </script>     
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td>
                <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
              <%--   <asp:ImageButton ID="UpdateBtn" runat="server" ImageUrl="../../Image/Update.png"
                    BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                    ImageAlign="AbsMiddle" OnClick="UpdateBtn_Click" />--%>
                &nbsp;&nbsp;
                <asp:Button ID="CountSheetBtn" class="white" runat="server" OnClick="CountSheetBtn_Click" Text="CountSheet" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
             </td> 
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Location
                <telerik:RadTextBox ID="LocationTxt" runat="server" Width="150px">
                </telerik:RadTextBox>     
                &nbsp;&nbsp;
                <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
            </td>    
        </tr>
    </table>              
    <br />
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" 
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" 
        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="loccode" AllowFilteringByColumn="false">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                    HeaderStyle-Width="20px" ItemStyle-Width="20px">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="cbSelect" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="skuid" Display="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKUCode">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skupckqty" SortExpression="skupckqty" HeaderText="skupckqty" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="CountQty" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:TextBox ID="CountQtyTxt" runat="server" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "counteduomqty") %>'></asp:TextBox>
                        <asp:CompareValidator ID="CountQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                            ErrorMessage="#" ControlToValidate="CountQtyTxt" Operator="GreaterThanEqual" ValueToCompare="0" Type="Integer"></asp:CompareValidator>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="onhanduomqty" SortExpression="onhanduomqty" HeaderText="OnHandQty"
                    AllowFiltering="false" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,###,###.###}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="varuomqty" SortExpression="varuomqty" HeaderText="Variance"
                    AllowFiltering="false" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,###,###.###}">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>        
    </form>
</body>
</html>
