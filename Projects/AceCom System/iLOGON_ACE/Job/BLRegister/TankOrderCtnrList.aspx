<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderCtnrList.aspx.cs" Inherits="iWMS.Web.Job.BLRegister.TankOrderCtnrList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Update-TankOrder_Ctnr pop-up</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />

    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
            font-size: 16px;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            width: 1188px;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="true" />
                </td>
            </tr>
        </table>
        <br />
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
                    <telerik:GridBoundColumn HeaderText="jbid" DataField="jbid" AllowFiltering="false" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TankNo" DataField="ctnrno" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="JobNo" DataField="jbno" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="SealNo" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="SealNoTxt" runat="server" Width="90%" Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrsealno", "") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="TareWt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="IdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' Visible="false"></asp:Label>
                            <asp:TextBox ID="TareWtTxt" runat="server" Width="90%" Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrwt", "{0:#.##}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="TareWtTxtCompVal" runat="server" ControlToValidate="TareWtTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="NetWt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="NetWtTxt" runat="server" Width="90%" Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "goodswt", "{0:#.##}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="NetWtTxtCompVal" runat="server" ControlToValidate="NetWtTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="GrossWt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="GrossWtTxt" runat="server" Width="90%" Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrgrosswt", "{0:#.##}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="GrossWtTxtCompVal" runat="server" ControlToValidate="GrossWtTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Measurement" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:TextBox ID="ctnrvolTxt" runat="server" Width="90%" Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrvol", "{0:#.##}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="ctnrvolTxtCompVal" runat="server" ControlToValidate="ctnrvolTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
