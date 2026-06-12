<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderManpowerManage.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderManpowerManage" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>Manage Personnel @ TMS Booking Order</title>
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
        <br />
        <table>
            <tr>
                <td>&nbsp;
                             <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
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
                                                            <asp:ImageButton runat="server" Visible="True" ID="JbPerAtvtCancel" ImageUrl="../../image/bin.gif"
                                                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                                                OnClick="JbPerAtvtCancel_Click" OnClientClick="return confirm('Confirm Cancel?')" CausesValidation="False"></asp:ImageButton>
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

                                                    <telerik:GridTemplateColumn UniqueName="Personnel" HeaderText="Personnel" HeaderStyle-Width="100px" ItemStyle-Width="100px" AllowSorting="true">
                                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                        <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                                        <ItemTemplate>
                                                            <%# DataBinder.Eval(Container.DataItem, "pername")%>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadDropDownList ID="PersonnelAtvtList" runat="server" DefaultMessage="Select a Charge"
                                                                DropDownHeight="150px" Skin="WebBlue" DataSource='<%# resultDS%>'
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(resultDS,DataBinder.Eval(Container.DataItem, "perid").ToString())%>'
                                                                DataTextField="descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains"
                                                                AutoPostBack="true" CausesValidation="false">
                                                            </telerik:RadDropDownList>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridTemplateColumn UniqueName="PlannedStartTime" HeaderText="Planned Start Time<br/>Planned End Time" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                            <%# DataBinder.Eval(Container.DataItem, "frexpdate", "{0:dd/MMM/yyyy HH:mm}")%>
                                                            <br />
                                                            <%# DataBinder.Eval(Container.DataItem, "toexpdate", "{0:dd/MMM/yyyy HH:mm}")%>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadDateTimePicker ID="PlannedStartTime" runat="server" SelectedDate='<%# Convert.IsDBNull(Eval("frexpdate")) ? (DateTime?)null : Convert.ToDateTime(Eval("frexpdate")) %>' Width="180px" Skin="Office2007" RenderMode="Lightweight" DateInput-DateFormat="dd/MMM/yyyy HH:mm">
                                                            </telerik:RadDateTimePicker>
                                                            <br />
                                                            <telerik:RadDateTimePicker ID="PlannedEndTime" runat="server" SelectedDate='<%# Convert.IsDBNull(Eval("toexpdate")) ? (DateTime?)null : Convert.ToDateTime(Eval("toexpdate")) %>' Width="180px" Skin="Office2007" RenderMode="Lightweight" DateInput-DateFormat="dd/MMM/yyyy HH:mm">
                                                            </telerik:RadDateTimePicker>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridTemplateColumn UniqueName="ActualStartTime" HeaderText="Actual Start Time<br/>Actual End Time" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                            <%# DataBinder.Eval(Container.DataItem, "fractdate", "{0:dd/MMM/yyyy HH:mm}")%>
                                                            <br />
                                                            <%# DataBinder.Eval(Container.DataItem, "toactdate", "{0:dd/MMM/yyyy HH:mm}")%>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadDateTimePicker ID="ActualStartTime" runat="server" SelectedDate='<%# Convert.IsDBNull(Eval("fractdate")) ? (DateTime?)null : Convert.ToDateTime(Eval("fractdate")) %>' Width="180px" Skin="Office2007" RenderMode="Lightweight" DateInput-DateFormat="dd/MMM/yyyy HH:mm">
                                                            </telerik:RadDateTimePicker>
                                                            <br />
                                                            <telerik:RadDateTimePicker ID="ActualEndTime" runat="server" SelectedDate='<%# Convert.IsDBNull(Eval("toactdate")) ? (DateTime?)null : Convert.ToDateTime(Eval("toactdate")) %>' Width="180px" Skin="Office2007" RenderMode="Lightweight" DateInput-DateFormat="dd/MMM/yyyy HH:mm">
                                                            </telerik:RadDateTimePicker>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridTemplateColumn UniqueName="WorkThroughLunch" HeaderText="WorkThroughLunch" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                        <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                                        <ItemTemplate>
                                                            <%# DataBinder.Eval(Container.DataItem, "WorkThruLunchDescr")%>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadDropDownList ID="WorkThroughLunchDDL" runat="server" DataTextField="descr" DataValueField="item"
                                                                DataSource='<%#WorkThruLunchDS%>' Skin="WebBlue" ExpandDirection="Up"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(WorkThruLunchDS,DataBinder.Eval(Container.DataItem, "WorkThroughLunch").ToString())%>'>
                                                            </telerik:RadDropDownList>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>


                                                    <telerik:GridTemplateColumn UniqueName="AllowanceAmount" HeaderText="Allowance Amount" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                                        <ItemTemplate>
                                                            <%-- <%# string.Format("{0:}",Eval("AllowanceAmount")) %>--%>
                                                            <%# Eval("AllowanceAmount", "{0:#,0.00}") %>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox runat="server" ID="AllowanceAmountTxt" Text='<%# DataBinder.Eval(Container.DataItem, "AllowanceAmount") %>'
                                                                TextMode="SingleLine">
                                                            </telerik:RadTextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="AllowanceAmountTxt" runat="server"
                                                                ErrorMessage="Positive Intergers Only" ForeColor="Red" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>


                                                    <telerik:GridTemplateColumn UniqueName="OTHours" HeaderText="OT Hours" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                                        <ItemTemplate>
                                                            <%--  <%# string.Format("{0:}",Eval("OTHours")) %>--%>
                                                            <%# Eval("OTHours", "{0:#,0.00}") %>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox runat="server" ID="OTHoursTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OTHours") %>'
                                                                TextMode="SingleLine">
                                                            </telerik:RadTextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="OTHoursTxt" runat="server"
                                                                ErrorMessage="Positive Intergers Only" ForeColor="Red" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridTemplateColumn UniqueName="TaskDescription" HeaderText="Task Description" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                                        <ItemTemplate>
                                                            <%# string.Format("{0:}",Eval("TaskDescription")) %>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox runat="server" ID="TaskDescriptionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TaskDescription") %>'
                                                                TextMode="SingleLine">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowSorting="true">
                                                        <ItemTemplate>
                                                            <%# string.Format("{0:}",Eval("StatusDescr")) %>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox runat="server" ID="NameTxt" Text='<%# DataBinder.Eval(Container.DataItem, "StatusDescr") %>'
                                                                TextMode="SingleLine" Enabled="false">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>


                                                    <telerik:GridTemplateColumn HeaderText="Created On">
                                                        <ItemTemplate>
                                                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("CreatedOn")) %>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Modified On">
                                                        <ItemTemplate>
                                                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ModifiedOn")) %>
                                                        </ItemTemplate>
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

    </form>
</body>
</html>
