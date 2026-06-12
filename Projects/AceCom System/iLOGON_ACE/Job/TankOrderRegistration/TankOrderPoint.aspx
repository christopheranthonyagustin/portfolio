<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderPoint.aspx.cs"
    Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderPoint" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TankOrderPoint</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
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
    <form id="Form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td align="left" valign="top">
                <telerik:RadButton ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click"
                    Skin="WebBlue">
                </telerik:RadButton>
                &nbsp;
                <telerik:RadButton ID="GenerateBtn" runat="server" Text="Generate" OnClick="GenerateBtn_Click"
                    Skin="WebBlue">
                </telerik:RadButton>
                <asp:Label Style="z-index: 0" ID="Label1" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                &nbsp; &nbsp;
            </td>
            <td align="right">
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
            </td>
        </tr>
    </table>
    <br />
    <div id="div3" style="height: 100%">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
            AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:Label ID="invnoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "invno") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="JobNo" DataField="number" AllowFiltering="true"
                        SortExpression="number" UniqueName="number" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POL" DataField="poldescr" AllowFiltering="true"
                        SortExpression="poldescr" UniqueName="poldescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POD" DataField="poddescr" AllowFiltering="true"
                        SortExpression="poddescr" UniqueName="poddescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="Shipper" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-HorizontalAlign="Left" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="ShipperTxt" runat="server" Width="250" Height="20" Value='<%# DataBinder.Eval(Container.DataItem, "exportername") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ShipperAddr" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="ShipperAddr" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="ShipperAddrTxt" runat="server" Width="400" Height="75" TextMode="MultiLine"
                                Text='<%# DataBinder.Eval(Container.DataItem, "exporteraddr") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Consignee" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-HorizontalAlign="Left" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="ConsigneeTxt" runat="server" Width="250" Height="20" Value='<%# DataBinder.Eval(Container.DataItem, "consigneename") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ConsigneeAddr" HeaderStyle-HorizontalAlign="Center"
                        UniqueName="ConsigneeAddr" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="ConsigneeAddrTxt" runat="server" Width="400" Height="75" TextMode="MultiLine"
                                Text='<%# DataBinder.Eval(Container.DataItem, "consigneeaddr") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
