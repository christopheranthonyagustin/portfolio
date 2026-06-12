<%@ Page Language="c#" CodeBehind="HSCasc.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HS.HSCasc.HSCasc" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>HSCasc</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
   <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
</head>    
    <body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td><br />
                <asp:Label ID="CodeLbl" runat="server" CssClass="pagetitle"></asp:Label><asp:Label
                    ID="CASCLbl" runat="server" CssClass="pagetitle" Visible="false"> : CASC</asp:Label>
                <div>
                </div>
            </td>
            <td align="right">
                <asp:Button ID="AddDetailBtn" runat="server" Text="+ Detail" CssClass="detailButton"
                    Visible="False" OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="AddPanel" runat="server" Visible="False">
                    <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                        <tr>
                            <td colspan="5">
                                &nbsp;
                                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="right">
                                <asp:Button ID="SaveNextBtn" runat="server" CssClass="detailButton" Text="Save &amp; Next"
                                    OnClick="SaveNextBtn_Click"></asp:Button>&nbsp;
                                <asp:Button ID="SaveBtn" runat="server" CssClass="detailButton" Text=" Save " OnClick="SaveBtn_Click">
                                </asp:Button>&nbsp;
                                <asp:Button ID="ClosePanelBtn" runat="server" CssClass="detailButton" Text="- Hide"
                                    CausesValidation="False" OnClick="ClosePanelBtn_Click"></asp:Button>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" nowrap>
                                Code :
                                <asp:RequiredFieldValidator ID="CodeReq" runat="server" ErrorMessage="*" ControlToValidate="CodeTxt"></asp:RequiredFieldValidator><br>
                                <asp:TextBox ID="CodeTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                            </td>
                            <td colspan="2" nowrap>
                                Description :
                                <br>
                                <asp:TextBox ID="DescrTxt" runat="server"></asp:TextBox>
                            </td>
                            <td colspan="2" nowrap>
                                Controlling Agency :
                                <br>
                                <asp:TextBox ID="AgencyTxt" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <br>
    <div style="height: 50%" id="div-datagrid">
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
        AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
         <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" >
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                        
                        <asp:ImageButton runat="server" Visible="True" ID="DetailEdit" ImageUrl="..\..\image\pencil.gif"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit CASC"
                            OnClick = "ldEdit_Click"  CausesValidation="False"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.code")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="CASC_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete CASC"
                                runat="server"></a>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="code" SortExpression="code" HeaderText="CASC Code"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="CASC Description"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="agency" SortExpression="agency" HeaderText="Controlling Agency"
                            ItemStyle-Wrap="false">
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
   
    </form>
</body>
</html>
