<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkshiftManagerManage.aspx.cs" Inherits="iWMS.Web.Job.WorkshiftManager.WorkshiftManagerManage" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>WorkshiftManager Manage Shift</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <base target="_self" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>
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

</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="UploadTab" Text="Upload" Value="250" runat="server">
                </telerik:RadTab>

            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="580px" ID="MainRadPageView">

                <br />
                <table>
                    <tr>
                        <td>&nbsp;
                             <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add Team" Enabled="true"
                                OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>

                        </td>
                    </tr>
                </table>

                <table width="100%">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel">
                                            <ContentTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                            <ContentTemplate>
                                                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false"
                                                    OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
                                                    OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" Width="850px" OnItemCommand="ResultDG_ItemCommand">
                                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                                                        <Selecting AllowRowSelect="true" />
                                                        <Scrolling AllowScroll="true" />
                                                    </ClientSettings>
                                                    <SortingSettings EnableSkinSortStyles="true" />
                                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <HeaderStyle Wrap="false"></HeaderStyle>
                                                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top" Name="CBAdd"
                                                        EditMode="InPlace">
                                                        <CommandItemSettings ShowRefreshButton="false" />
                                                        <Columns>
                                                            <telerik:GridTemplateColumn UniqueName="icon" HeaderStyle-Width="50px" ItemStyle-Width="50px">

                                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                                        BorderWidth="0"></asp:ImageButton>
                                                                    <asp:ImageButton runat="server" Visible="True" ID="MemberCancel" ImageUrl="../../image/bin.gif"
                                                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                                                        OnClick="MemberCancel_Click" OnClientClick="return confirm('Confirm Cancel?')" CausesValidation="False"></asp:ImageButton>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                                                        BorderWidth="0"></asp:ImageButton>
                                                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                                                    <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                                                </EditItemTemplate>
                                                            </telerik:GridTemplateColumn>

                                                            <telerik:GridTemplateColumn UniqueName="TeamDescr" HeaderText="Team" HeaderStyle-Width="100px" ItemStyle-Width="100px" AllowSorting="true">
                                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                                <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <%# DataBinder.Eval(Container.DataItem, "teamdescr")%>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                </EditItemTemplate>
                                                            </telerik:GridTemplateColumn>

                                                            <telerik:GridTemplateColumn UniqueName="Member" HeaderText="Member" HeaderStyle-Width="100px" ItemStyle-Width="100px" AllowSorting="true">
                                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                                <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <%# DataBinder.Eval(Container.DataItem, "pername")%>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <telerik:RadComboBox ID="PersonnelList" runat="server" DefaultMessage="Select a Charge"
                                                                        DropDownHeight="150px" Skin="WebBlue" DataSource='<%# PersonnelDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PersonnelDS,DataBinder.Eval(Container.DataItem, "PerId").ToString())%>'
                                                                        DataTextField="descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains"
                                                                        AutoPostBack="true" CausesValidation="false">
                                                                    </telerik:RadComboBox>

                                                                </EditItemTemplate>
                                                            </telerik:GridTemplateColumn>

                                                            <telerik:GridTemplateColumn UniqueName="AbsentType" HeaderText="AbsentType" HeaderStyle-Width="100px" ItemStyle-Width="100px" AllowSorting="true">
                                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                                <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <%# DataBinder.Eval(Container.DataItem, "absenttype")%>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <telerik:RadComboBox ID="AbsentTypeList" runat="server" DefaultMessage="Select Absent Type"
                                                                        DropDownHeight="150px" Skin="WebBlue" DataSource='<%# AbsentDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(AbsentDS,DataBinder.Eval(Container.DataItem, "absenttype").ToString())%>'
                                                                        DataTextField="descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains"
                                                                        AutoPostBack="true" CausesValidation="false">
                                                                    </telerik:RadComboBox>
                                                                </EditItemTemplate>
                                                            </telerik:GridTemplateColumn>

                                                            <telerik:GridTemplateColumn UniqueName="Notes" HeaderText="Notes" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                                <ItemTemplate>
                                                                    <%# DataBinder.Eval(Container.DataItem, "notes")%>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <telerik:RadTextBox runat="server" ID="NotesTxtBox" Text='<%# Eval("notes") %>' Skin="WebBlue" TextMode="MultiLine" Rows="3" Width="250px">
                                                                    </telerik:RadTextBox>
                                                                </EditItemTemplate>
                                                            </telerik:GridTemplateColumn>

                                                            <telerik:GridTemplateColumn UniqueName="ShiftOption" HeaderText="ShiftOption" HeaderStyle-Width="100px" ItemStyle-Width="100px" AllowSorting="true">
                                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                                <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <%# DataBinder.Eval(Container.DataItem, "ShiftOptionDescr")%>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <telerik:RadComboBox ID="ShiftOptionList" runat="server" DefaultMessage="Select Shift Option"
                                                                        DropDownHeight="150px" Skin="WebBlue" DataSource='<%# ShiftOptionDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ShiftOptionDS,DataBinder.Eval(Container.DataItem, "ShiftOption").ToString())%>'
                                                                        DataTextField="descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains"
                                                                        AutoPostBack="true" CausesValidation="false">
                                                                    </telerik:RadComboBox>

                                                                </EditItemTemplate>
                                                            </telerik:GridTemplateColumn>

                                                            <telerik:GridTemplateColumn UniqueName="ShiftFrDateTime" HeaderText="From" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                                <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <%# DataBinder.Eval(Container.DataItem, "ShiftFrDateTime", "{0:dd/MMM/yyyy HH:mm}")%>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <telerik:RadDateTimePicker ID="FromDTP" runat="server" SelectedDate='<%# Eval("ShiftFrDateTime") %>' Width="180px" Skin="Office2007" RenderMode="Lightweight" DateInput-DateFormat="dd/MMM/yyyy HH:mm">
                                                                    </telerik:RadDateTimePicker>
                                                                </EditItemTemplate>
                                                            </telerik:GridTemplateColumn>

                                                            <telerik:GridTemplateColumn UniqueName="ShiftToDateTime" HeaderText="To" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                                <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <%# DataBinder.Eval(Container.DataItem, "ShiftToDateTime", "{0:dd/MMM/yyyy HH:mm}")%>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <telerik:RadDateTimePicker ID="ToDTP" runat="server" SelectedDate='<%# Eval("ShiftToDateTime") %>' Width="180px" Skin="Office2007" RenderMode="Lightweight" DateInput-DateFormat="dd/MMM/yyyy HH:mm">
                                                                    </telerik:RadDateTimePicker>
                                                                </EditItemTemplate>
                                                            </telerik:GridTemplateColumn>

                                                        </Columns>
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Countlbl" runat="server" Style="color: red; font-size: medium; font-weight: bold"></asp:Label>
                                        <asp:Label ID="TripNoLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                    <tr align="right" style="padding-top: 24%">
                        <td style="padding-top: 24%"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:Label Style="z-index: 0" ID="Label1" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="580px" ID="UploadRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
