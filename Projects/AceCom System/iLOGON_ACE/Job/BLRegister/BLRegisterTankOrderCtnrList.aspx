<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BLRegisterTankOrderCtnrList.aspx.cs" Inherits="iWMS.Web.Job.BLRegister.BLRegisterTankOrderCtnrList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Choose-a-Tank pop-up</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
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
     <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
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
                    <asp:Button ID="NextBtn" class="white" runat="server" OnClick="NextBtn_Click" Text="Next"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="true" />
                </td>
                <td align="right">
                    <div class="auto-style1">
                        Step 3 of 3: Update Tank Information
                    </div>
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
                            <asp:TextBox ID="GrossWtTxt" runat="server" Width="90%" Style="text-align: right"></asp:TextBox>
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

