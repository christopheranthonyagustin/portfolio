<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamIncentiveDetl.aspx.cs" Inherits="iWMS.Web.Master.Personnel.TeamIncentiveDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TeamIncentiveForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
     <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
         <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" OnUpdateCommand="ResultDG_Update"
            AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnEditCommand="ResultDG_Edit"
            OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id" EditMode="InPlace" CommandItemDisplay="Top">
                <CommandItemSettings ShowRefreshButton="false" />
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns> 
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="Detailicon" AllowFiltering="false"
                    HeaderStyle-Width="40px" ItemStyle-Width="40px">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="SkuGrpUOMEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="Delete"
                            runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete UOM"
                                runat="server"></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="QUSDetUpdate" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="QUSDetCancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="ContainerNumber" DataField="ActivityCode" AllowFiltering="true" ItemStyle-CssClass="break-word"
                        SortExpression="ActivityCode" UniqueName="ActivityCode" Reorderable="true"
                        HeaderStyle-Width="20px" ItemStyle-Width="20px">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ActivityCode")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="ActivityCodeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ActivityCode") %>'>
                            </telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="ActivityCodeTxtReqVal" runat="server" ControlToValidate="ActivityCodeTxt" ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                     <telerik:GridTemplateColumn HeaderText="Remarks" DataField="Remarks" AllowFiltering="true" ItemStyle-CssClass="break-word"
                       SortExpression="Remarks" UniqueName="Remarks" Reorderable="true"
                        HeaderStyle-Width="20px" ItemStyle-Width="20px">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Remarks")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="RemarksTxt" Text='<%# DataBinder.Eval(Container.DataItem, "Remarks") %>'
                               TextMode="MultiLine">
                            </telerik:RadTextBox>                           
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>                   
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
