<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueDetlSerialNo.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueDetlSerialNo" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Goods Issue SerialNo</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
     <script language="javascript" type="text/javascript">
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
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" /> 
          <br />       
         <table border="0" cellspacing="0" cellpadding="0" width="100%">
             <tr>
                 <td>
                      <asp:Button ID="NewBtn" CssClass="white" runat="server" OnClick="NewBtn_Click" Text="New" 
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CommandName="InitInsert" />&nbsp;
                      <asp:Button ID="MassDeleteBtn" CssClass="white" runat="server" OnClick="MassDeleteBtn_Click" Text="MassDelete" 
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                      &nbsp;
                      <asp:Button ID="UploadBtn" CssClass="white" runat="server" OnClick="UploadBtn_Click" Text="Upload" 
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                 </td>
             </tr>
             </table>   
        <br />
         <div id="div-datagrid">    
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnUpdateCommand="ResultDG_UpdateCommand"  OnEditCommand="ResultDG_EditCommand" OnCancelCommand="ResultDG_CancelCommand" >
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace" >
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                            <HeaderTemplate>
                                <label id="completelbl">
                                </label>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="SkuGrpUOMEdit" ImageUrl="..\..\image\pencil.gif"
                                    Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <a id="lnkDelete" onclick="return confirm('Confirm delete?')" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                    runat="server" onserverclick="SNDetail_Delete">
                                    <img id="delImg" border="0" alt="Delete Serial No" src="..\..\image\bin.gif" width="15"
                                        height="15" runat="server" /></a>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="QUSDetUpdate" ImageUrl="..\..\image\floppy.gif"
                                    Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="QUSDetCancel" ImageUrl="..\..\image\arrow6.gif"
                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <HeaderTemplate>
                                No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="SerialNo" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "serialno")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="SerialNoTxt" Skin="Office2007" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "serialno") %>'></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Production Line" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "usrdef01")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="Usrdef01Txt" Skin="Office2007" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "usrdef01") %>'></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Usrdef02" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "usrdef02")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="Usrdef02Txt" Skin="Office2007" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "usrdef02") %>'></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Usrdef03" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "usrdef03")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="Usrdef03Txt" Skin="Office2007" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "usrdef03") %>'></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Usrdef04" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "usrdef04")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="Usrdef04Txt" Skin="Office2007" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "usrdef04") %>'></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Usrdef05" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "usrdef05")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="Usrdef05Txt" Skin="Office2007" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "usrdef05") %>'></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="TUNO1" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "tuno1")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="TUNO1Txt" Skin="Office2007" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "tuno1") %>'></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="PrintCopy" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "printcopy")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="PrintCopyTxt" Skin="Office2007" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "printcopy") %>'></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Remarks" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "rem1")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="RemarksTxt" Skin="Office2007" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "rem1") %>'></telerik:RadTextBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status" ReadOnly="true">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" ReadOnly="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" ReadOnly="true">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" ReadOnly="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" ReadOnly="true">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
