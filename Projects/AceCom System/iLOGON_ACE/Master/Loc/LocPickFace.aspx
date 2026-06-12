<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocPickFace.aspx.cs" Inherits="iWMS.Web.Master.Loc.LocPickFace" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>LocPickFace</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>&nbsp;<asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="NewBtn" runat="server" Text="New" CssClass="white"
                        OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                    &nbsp;
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" OnClick="EditBtn_Click"
                                Text="Edit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                    &nbsp;
                </td>
                <td>
                    <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="PickFaceResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="PickFaceResultDG_NeedDataSource"
            Skin="Metro" OnItemDataBound="PickFaceResultDG_ItemDataBound" Width="90%">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" PageSize="100">
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="6%" ItemStyle-Width="6%">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" ID="EditIcon" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="EditIcon_Click"></asp:ImageButton>
                            &nbsp;
                            <asp:ImageButton ID="DeleteIcon" runat="server" Visible="True" ImageUrl="../../image/deleted.png" ToolTip="Delete"
                                Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteIcon_Click"
                                BorderWidth="0"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="Account" DataField="AcCode" AllowFiltering="false" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SKUCode" DataField="SKUCode" AllowFiltering="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Description" DataField="SKuDescr" AllowFiltering="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="UOM" DataField="UOM" AllowFiltering="true" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="MinQuantity" DataField="minqty" AllowFiltering="true" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="MaxQuantity" DataField="maxqty" AllowFiltering="true" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ModifiedOn" DataField="ModifiedOn" UniqueName="ModifiedOn" SortExpression="ModifiedOn" AllowFiltering="false"
                        HeaderStyle-Width="120px" ItemStyle-Width="120px">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
