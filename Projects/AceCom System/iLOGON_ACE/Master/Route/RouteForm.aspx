<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RouteForm.aspx.cs" Inherits="iWMS.Web.Master.Route.RouteForm" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>RouteDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body onload='displayRow("table1");' topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <%-- <telerik:RadTab Text="Detail" Value="50" runat="server">
                </telerik:RadTab>--%>
            </Tabs>
        </telerik:RadTabStrip>
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <br />
                    &nbsp;
                <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="MainRadPageView" Height="600px">
                <table cellspacing="2" cellpadding="2" width="100%" border="0">
                    <tr>
                        <td align="left">
                            <br />
                            &nbsp;
                            <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="white"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button><br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <table cellspacing="2" cellpadding="2" width="100%" border="0">
                                <%--<tr>
                                    <td> 
                                         &nbsp;<asp:Button ID="AddBtn" runat="server" Text="New" CssClass="white" CausesValidation="false"
                                         OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                                        <br />
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td>
                                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true" OnPreRender="ResultDG_PreRender"
                                            AllowFilteringByColumn="false" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                                            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand">
                                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                            <SortingSettings EnableSkinSortStyles="false" />
                                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                            <ItemStyle Wrap="false"></ItemStyle>
                                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top" Name="RouteDetail"
                                                EditMode="InPlace">
                                                <CommandItemSettings ShowRefreshButton="false" />                                             
                                                <Columns>
                                                    <telerik:GridTemplateColumn>
                                                       <ItemTemplate>
                                                        <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                                                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                            BorderWidth="0"></asp:ImageButton>
                                                        <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                            onserverclick="ResultDG_Delete" runat="server">
                                                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                                                title="Delete" runat="server" /></a>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                                                BorderWidth="0"></asp:ImageButton>
                                                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                                            <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                                        </EditItemTemplate>
                                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                    </telerik:GridTemplateColumn>                                                    

                                                     <telerik:GridTemplateColumn HeaderText="SeqNo">
                                                        <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <%# DataBinder.Eval(Container.DataItem, "seqno")  %>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox runat="server" ID="SeqnoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "seqno") %>'></telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>  

                                                     <telerik:GridTemplateColumn UniqueName="type" HeaderText="Type">
                                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                            <%# DataBinder.Eval(Container.DataItem, "type")%>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox runat="server" ID="TypeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "type") %>'></telerik:RadTextBox>
                                                        </EditItemTemplate> 
                                                    </telerik:GridTemplateColumn>                                                   

                                                     <telerik:GridTemplateColumn UniqueName="FrPostalCode" HeaderText="FrPostalCode">
                                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                            <%# DataBinder.Eval(Container.DataItem, "FrPostalCode")%>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                             <telerik:RadTextBox runat="server" ID="FrPostalCodeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "FrPostalCode") %>'></telerik:RadTextBox>                                                          
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>  
                                                    
                                                    <telerik:GridTemplateColumn UniqueName="ToPostalCode" HeaderText="ToPostalCode">
                                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                            <%# DataBinder.Eval(Container.DataItem, "ToPostalCode")%>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox runat="server" ID="ToPostalCodeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ToPostalCode") %>'></telerik:RadTextBox>                                                           
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                                                                   
                                                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                                                        AllowFiltering="false">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                                                        AllowFiltering="false">
                                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="id" SortExpression="id" Display="false">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                         <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>  
            <%-- <telerik:RadPageView runat="server" Height="500px" ID="DetailRadPageView">                
                 <%--<iframe id="RouteDetlIFrame" scrolling="no" width="345px" height="280px" runat="server"></iframe>--%>
            <%-- </telerik:RadPageView>--%>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
