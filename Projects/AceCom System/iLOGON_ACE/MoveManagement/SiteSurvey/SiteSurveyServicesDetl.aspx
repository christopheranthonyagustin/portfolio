<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteSurveyServicesDetl.aspx.cs" Inherits="iWMS.Web.MoveManagement.SiteSurvey.SiteSurveyServicesDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SiteSurveyServicesDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= QUServiceDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="serachBtn_Click"
                        ToolTip="Search" CssClass="white" />&nbsp;
                    <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Add" UseSubmitBehavior="false" CssClass="white" />
                    &nbsp;
                <asp:Button ID="CloseBtn" runat="server" Text="Close" OnClick="CloseBtn_Click"
                    CssClass="white" ToolTip="Close" />&nbsp;
                  &nbsp;
                </td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
                <td></td>
            </tr>
        </table>

        <br />
        <div id="div-datagrid">
            <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                <ContentTemplate>
                    <telerik:RadGrid ID="QUServiceDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        Skin="Office2007">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <PagerStyle Mode="NextPrevAndNumeric" />
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                    HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="false" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Code" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" UniqueName="code">
                                    <ItemTemplate>
                                        <asp:Label ID="QuSIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' Visible="false"></asp:Label>
                                        <asp:TextBox ID="Codetxt" runat="server" Width="100" AutoPostBack="true"
                                            Value='<%# DataBinder.Eval(Container.DataItem, "item", "{0}") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Type" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" UniqueName="type">
                                    <ItemTemplate>
                                        <asp:TextBox ID="typetext" runat="server" AutoPostBack="true" ReadOnly="true" Text='<%# DataBinder.Eval(Container.DataItem, "usrdef01") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Description" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="True"
                                    UniqueName="descr" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:TextBox ID="Descriptiontxt" runat="server" Width="100%" TextMode="MultiLine"
                                            Text='<%# DataBinder.Eval(Container.DataItem, "descr") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
