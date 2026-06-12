<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CycleCountWorkbenchCountSheetItems.aspx.cs" Inherits="iWMS.Web.InventoryManagement.CycleCountWorkbench.CycleCountWorkbenchCountSheetItems" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pending putaway</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>

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

<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
         <table>
            <tr>
                <td>
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td> 
                    <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" Text="Refresh" 
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                    
                     <asp:Button ID="RequestRecountBtn" CssClass="LongLabelWhite" runat="server" OnClick="RequestRecountBtn_Click" Text="Request Recount"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                      
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Text="Prev"
                        CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Text="Next"
                        CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>

                <td style="padding-left: 7px">
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" CssClass="Pagetitle" Font-Size="Medium"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" AllowFilteringByColumn="true"
            EnableLinqExpressions="false"  Skin="Metro" 
            OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated" 
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
            </ClientSettings>

            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="ICID"
                         CommandItemDisplay="None">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ReadOnly="true" Display="true" HeaderStyle-Wrap="true" 
                                ItemStyle-Wrap="true">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" AutoPostBack="false" />
                                    <asp:Label ID="QtycompairSign" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
            </MasterTableView>
        </telerik:RadGrid>

    </form>
</body>
</html>
