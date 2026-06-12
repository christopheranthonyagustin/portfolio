<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankReleaseOrderTask.aspx.cs"
    Inherits="iWMS.Web.Outbound.TankReleaseOrder.TankReleaseOrderTask" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title id="JTListTitle" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function selectAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = true; // for checking the checkboxes
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = false; // for unchecking the checkboxes
                    }
                }
            }
        </script>

    </telerik:RadCodeBlock>
    <style type="text/css">
        .style2
        {
            width: 125px;
        }
        .break-word
        {
            max-width: 200px !important;
            white-space: normal;
            word-wrap: break-word;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
    <table border="0">
        <tr>
            <td>
                <asp:Button ID="GenerateBtn" CssClass="white" runat="server" OnClick="GenerateBtn_Click" Visible="true"  
                    Text="Generate" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
            </td>
            <td width="20%"></td>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
        Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" AllowAutomaticInserts="True"
        OnEditCommand="ResultDG_Edit" OnUpdateCommand="ResultDG_Update">
        <clientsettings allowcolumnsreorder="true" reordercolumnsonclient="true" allowexpandcollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </clientsettings>
        <sortingsettings enableskinsortstyles="false" />
        <alternatingitemstyle wrap="false"></alternatingitemstyle>
        <itemstyle wrap="false"></itemstyle>
        <headerstyle wrap="false"></headerstyle>
        <pagerstyle mode="NextPrevNumericAndAdvanced" />
        <mastertableview allowmulticolumnsorting="true" datakeynames="id" name="ParentGrid"
            editmode="InPlace" allowfilteringbycolumn="true" hierarchyloadmode="Client">
            <Columns>
                <telerik:GridTemplateColumn UniqueName="icon" Reorderable="false" AllowFiltering="false">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="70px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="70px" />
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                        <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit"
                            CommandName="Edit" CausesValidation="False"></asp:ImageButton>
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
                <telerik:GridTemplateColumn HeaderText="Task" UniqueName="taskcode" DataField="taskcodedescr">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" Width="200px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "taskcodedescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="TaskCodeList" runat="server" DataTextField="descr" DataValueField="item"
                            DataSource='<%# taskDS%>' AutoPostBack="true" Skin="WebBlue" Width="150px" DropDownWidth="150px"
                            RenderMode="Lightweight" CausesValidation="false" Filter="Contains" Enabled="false">
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="enddate" HeaderText="CompleteDate">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="150px" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="150px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "enddate", "{0:dd/MMM/yyyy}")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDatePicker ID="EndDatePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                            Skin="Office2007" PopupDirection="TopRight" DbSelectedDate='<%# DataBinder.Eval(Container.DataItem, "enddate") %>'>
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="180px" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "statusdescr")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="StatusList" runat="server" DropDownHeight="150px" Skin="WebBlue"
                            DataSource='<%# statusDS %>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(statusDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'
                            DataTextField="descr" DataValueField="item" Enabled="false">
                        </telerik:RadDropDownList>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn UniqueName="endremarks" HeaderText="Remarks">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "endremarks")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="EndRemTxt" Text='<%# DataBinder.Eval(Container.DataItem, "endremarks") %>' 
                            TextMode="MultiLine" Rows="2" Width="90%">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="id" AllowFiltering="true" Reorderable="true" Display="false">
                    <ItemTemplate>
                        <asp:Label ID="TaskIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="TaskCtnrStsUpdate" HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false" Display="false">
                    <ItemTemplate>
                        <asp:Label ID="TaskCtnrStsUpdateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TaskCtnrStsUpdate") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </mastertableview>
    </telerik:RadGrid>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="max-height: 500px; width: 420px; overflow: hidden;">
            <div style="float: left; width: 380px; margin: 20px;">
                <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%;">
                            <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                        </td>
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>
