<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RobotConfigurationTab.aspx.cs" Inherits="iWMS.Web.Master.RobotMaster.RobotConfigurationTab" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Robot Configuration</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">

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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>


    <style type="text/css">
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table border="0" cellpadding="2" cellspacing="2" runat="server">
                <tr>
                    <td>
                        <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
            <br />
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
                AllowFilteringByColumn="false" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ControlId" EditMode="InPlace" TableLayout="Fixed" Width="100%">
                    <Columns>
                        <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                            <HeaderTemplate>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                            <ItemStyle Wrap="False"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="BillofMaterialEdit" ImageUrl="../../image/pencil.gif"
                                    Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                    Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="S/No" HeaderText="S/No" ReadOnly="true" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Item" HeaderText="Item" ReadOnly="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Name" HeaderText="Name" ReadOnly="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CreatedOn" HeaderText="CreatedOn" ReadOnly="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ModifiedOn" HeaderText="ModifiedOn" ReadOnly="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn SortExpression="Value" UniqueName="Value" HeaderText="Value">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "Value") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadDropDownList ID="ValueDDL" runat="server" Skin="WebBlue" DataSource='<%# ValueDS %>' DataTextField="descr" DataValueField="item"
                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ValueDS,DataBinder.Eval(Container.DataItem, "Value").ToString())%>'>
                                </telerik:RadDropDownList>
                                <asp:RequiredFieldValidator ControlToValidate="ValueDDL" runat="server" ErrorMessage="*" Font-Bold="true" Font-Size="Large" ForeColor="Red" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
