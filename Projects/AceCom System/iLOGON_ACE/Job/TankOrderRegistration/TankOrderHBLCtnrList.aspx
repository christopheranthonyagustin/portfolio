<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderHBLCtnrList.aspx.cs" Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderHBLCtnrList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html>
<head runat="server">
    <title>Choose-a-Tank HBL pop-up</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />


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
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
            AllowFilteringByColumn="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Center" />
                        <HeaderTemplate>
                            <asp:CheckBox ID="SelectALLCB" runat="server" Checked="true" onclick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" Checked="true" />
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="JbblId" DataField="jbblid" AllowFiltering="false" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TankNo" DataField="ctnrno" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="SealNo" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="SealNoTxt" runat="server" Width="100" Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrsealno", "") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="TareWt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="IdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' Visible="false"></asp:Label>
                            <asp:TextBox ID="TareWtTxt" runat="server" Width="100" Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrwt", "{0:#.##}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="TareWtTxtCompVal" runat="server" ControlToValidate="TareWtTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="NetWt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="NetWtTxt" runat="server" Width="100" Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "goodswt", "{0:#.##}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="NetWtTxtCompVal" runat="server" ControlToValidate="NetWtTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="GrossWt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="GrossWtTxt" runat="server" Width="100" Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "grosswt", "{0:#.##}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="GrossWtTxtCompVal" runat="server" ControlToValidate="GrossWtTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Measurement" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="ctnrvolTxt" runat="server" Width="100" Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrvol", "{0:#.##}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="ctnrvolTxtCompVal" runat="server" ControlToValidate="ctnrvolTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <br />
        <br />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <telerik:RadButton ID="OkBtn" runat="server" Text="Ok" Visible="true"
                        CssClass="detailButton" OnClick="OkBtn_Click" Skin="WebBlue">
                    </telerik:RadButton>
                    &nbsp;
                <telerik:RadButton ID="CancelBtn" runat="server" Text="Cancel" Visible="true"
                    CssClass="detailButton" OnClick="CancelBtn_Click" Skin="WebBlue">
                </telerik:RadButton>

                </td>
            </tr>
        </table>
    </form>
</body>
</html>
