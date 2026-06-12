<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentControl.aspx.cs" Inherits="iWMS.Web.Master.Department.DepartmentControl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>DepartmentControl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <br />
                    &nbsp;     
                 <asp:Button ID="AddDetailBtn" runat="server" CssClass="white" Visible="false" Text="New" OnClick="AddDetailBtn_Click"
                     UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                </td>
            </tr>
            <tr>
                <td colspan="2"><br />
                    <asp:Panel ID="AddPanel" runat="server" Visible="False">
                        <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                            <tr>
                                <td colspan="5">
                                    <asp:Button ID="SaveNextBtn" runat="server" CssClass="white" Text="Save &amp; Next" OnClick="SaveNextBtn_Click"
                                        UseSubmitBehavior="false" OnClientClick="disableBtn(this.id, true)" />
                                    &nbsp;
                                <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text="Save" OnClick="SaveBtn_Click"
                                    UseSubmitBehavior="false" OnClientClick="disableBtn(this.id, true)" />
                                    &nbsp;
                                <asp:Button ID="ClosePanelBtn" runat="server" CssClass="white" Text="Hide" OnClick="ClosePanelBtn_Click"
                                    UseSubmitBehavior="false" CausesValidation="False" OnClientClick="disableBtn(this.id)" />
                                </td>
                                <td align="left">
                                    <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    &nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <br />
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <div style="height: 80%" id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="DepartmentControlEdit" ImageUrl="../../image/pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Control"
                                    OnClick="DepartmentControlEdit_Click" CausesValidation="False"></asp:ImageButton>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete Control?')"
                                    onserverclick="lnkDelete_ServerClick" runat="server">
                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Control"
                                        runat="server"></a>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="entid" Display="False" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="datevalue" SortExpression="datevalue" HeaderText="Date Format"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="numvalue" SortExpression="numvalue" HeaderText="Current ID"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="numdigit" SortExpression="numdigit" HeaderText="Length of ID"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="prefix" SortExpression="prefix" HeaderText="Prefix"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="suffix" SortExpression="suffix" HeaderText="Suffix"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef01" SortExpression="UsrDef01" HeaderText="UsrDef01"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef02" SortExpression="UsrDef02" HeaderText="UsrDef02"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef03" SortExpression="UsrDef03" HeaderText="UsrDef03"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef04" SortExpression="UsrDef04" HeaderText="UsrDef04"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef05" SortExpression="UsrDef05" HeaderText="UsrDef05"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef06" SortExpression="UsrDef06" HeaderText="UsrDef06"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef07" SortExpression="UsrDef07" HeaderText="UsrDef07"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef08" SortExpression="UsrDef08" HeaderText="UsrDef08"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef09" SortExpression="UsrDef09" HeaderText="UsrDef09"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef10" SortExpression="UsrDef10" HeaderText="UsrDef10"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef11" SortExpression="UsrDef11" HeaderText="UsrDef11"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef12" SortExpression="UsrDef12" HeaderText="UsrDef12"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef13" SortExpression="UsrDef13" HeaderText="UsrDef13"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef14" SortExpression="UsrDef14" HeaderText="UsrDef14"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef15" SortExpression="UsrDef15" HeaderText="UsrDef15"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef16" SortExpression="UsrDef16" HeaderText="UsrDef16"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef17" SortExpression="UsrDef17" HeaderText="UsrDef17"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef18" SortExpression="UsrDef18" HeaderText="UsrDef18"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef19" SortExpression="UsrDef19" HeaderText="UsrDef19"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef20" SortExpression="UsrDef20" HeaderText="UsrDef20"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" HeaderText="Generated Control" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        </div>
    </form>
</body>
</html>
