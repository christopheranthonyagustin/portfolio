<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteSurveyItem.aspx.cs" Inherits="iWMS.Web.MoveManagement.SiteSurvey.SiteSurveyItem" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head runat="server">
    <title>Site Survey Item</title>    
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" >
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table runat="server">
            <tr>
                <td>
                    <iwms:iform ID="formCtl" runat="server"></iwms:iform>                    
                </td>        
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnNeedDataSource="ResultDG_NeedDataSource"
            AllowPaging="True" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
            OnEditCommand="ResultDG_Edit" GroupPanelPosition="Top" OnUpdateCommand="ResultDG_UpdateCommand"
            OnItemCommand="ResultDG_ItemCommand">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="id" EditMode="InPlace"
                CommandItemDisplay="Top">
                <RowIndicatorColumn Visible="False">
                </RowIndicatorColumn>
                <ExpandCollapseColumn Created="True">
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="TaskDetail_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                    title="Delete Detail" runat="server" /></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0" ValidationGroup="reqvalgrp"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderText="S/N">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Items" HeaderText="Items">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "RMSItemDescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="skudescrddl" runat="server" DropDownHeight="150px" Skin="Sunset"
                                DataSource='<%# SKUCodeDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(SKUCodeDS,DataBinder.Eval(Container.DataItem, "RMSItemDescr").ToString())%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                             <asp:RequiredFieldValidator ID="skucodeReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="skudescrddl" ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="inqty" HeaderText="Quantity">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "inqty")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtinqty" Text='<%# DataBinder.Eval(Container.DataItem, "inqty") %>'
                                TextMode="SingleLine" Rows="1" Width="90%">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="inqty" HeaderText="Length" Visible="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "inqty")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtlength" Text='<%# DataBinder.Eval(Container.DataItem, "inqty") %>'
                                TextMode="SingleLine" Rows="1" Width="90%">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="wt" HeaderText="Width">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "wt")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtwt" Text='<%# DataBinder.Eval(Container.DataItem, "wt") %>'
                                TextMode="SingleLine" Rows="1" Width="90%">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="inqty" HeaderText="Height" Visible="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "inqty")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtheight" Text='<%# DataBinder.Eval(Container.DataItem, "inqty") %>'
                                TextMode="SingleLine" Rows="1" Width="90%">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="ItemRemarks" HeaderText="Remarks">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ItemRemarks")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="txtrem" Text='<%# DataBinder.Eval(Container.DataItem, "ItemRemarks") %>'
                                TextMode="SingleLine" Rows="1" Width="90%">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" />
                    <telerik:GridBoundColumn Display="False" DataField="jbctnrid" SortExpression="jbctnrid" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
