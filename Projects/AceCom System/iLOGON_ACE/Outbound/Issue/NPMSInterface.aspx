<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NPMSInterface.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.NPMSInterface" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PSInterfaceUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .RadPivotGrid_Metro .rpgContentZoneDiv td {
            white-space: nowrap;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function onGridCreated(sender, args) {
                $telerik.$(sender.GridDataDiv).on("scroll", function (a, b, e) {
                    this.scrollLeft = 0;
                });
            }
        </script>

        <script type="text/javascript">
            function pageLoad() {
                var grid = $find("<%= ResultRadGrid.ClientID %>");
                var columns = grid.get_masterTableView().get_columns();
                for (var i = 0; i < columns.length; i++) {
                    columns[i].resizeToFit(false, true);
                }
            }
        </script>

    </telerik:RadCodeBlock>

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
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Interface" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" ID="TitleLbl" CssClass="BoldText" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="FilePathLbl" Text="Path" />&nbsp;
                        <telerik:RadTextBox runat="server" ID="FilePathTxt" Width="250px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                </td>
                <td>
                    <telerik:RadDropDownList ID="StatusDDL" runat="server" DefaultMessage="Select a Status"
                        DropDownWidth="150px" Skin="WebBlue" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="StatusDDL_Changed">
                    </telerik:RadDropDownList>
                </td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td>
                    <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                </td>
                <td>
                    <asp:Button ID="UploadBtn" runat="server" Text="Upload" OnClick="UploadBtn_Click" OnClientClick="disableBtn(this.id,false)"
                        ToolTip="Click to Upload Selected Files" UseSubmitBehavior="false" CssClass="white" />&nbsp;
                </td>
                <td>
                    <asp:Button ID="UndoBtn" runat="server" Text="Undo" OnClick="UndoBtn_Click" Visible="false" CssClass="white" />&nbsp;
                </td>
                <td>
                    <asp:Button ID="ExportExcelLnk" runat="server" class="green" Text="Excel" OnClick="ExcelBtn_Click" />&nbsp;
               
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;           
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                <td>
                    <asp:Button ID="IgnoreBtn" runat="server" Text="Ignore" OnClick="IgnoreBtn_Click" Visible="false" CssClass="white" />&nbsp;
                </td>
                
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="None" AutoGenerateColumns="false"
            GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="true" Height="700px"
            AllowSorting="false" OnItemCreated="ResultRadGrid_ItemCreated"
            OnExcelExportCellFormatting="ResultRadGrid_ExcelExportCellFormatting" OnItemCommand="ResultRadGrid_ItemCommand"
            Skin="Office2007" OnGridExporting="ResultRadGrid_GridExporting"
            OnItemDataBound="ResultRadGrid_ItemDataBound" ExportSettings-ExportOnlyData="true">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" EnablePostBackOnRowClick="false"
                Resizing-AllowColumnResize="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
            </ClientSettings>
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="true"></HeaderStyle>
            <FooterStyle Font-Bold="true" Wrap="true"></FooterStyle>
            <MasterTableView AllowMultiColumnSorting="true" TableLayout="Fixed" Name="Master"
                AlternatingItemStyle-Wrap="true">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn HeaderStyle-Width="40px" UniqueName="Selected" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="SelectChkBox" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderStyle-Width="70px" UniqueName="Preview" AllowFiltering="false">
                        <HeaderStyle />
                        <ItemTemplate>
                            <asp:LinkButton ID="browseLnkBtn" runat="server" Text="Preview" OnClick="browseLnkBtn_Click" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderStyle-Width="80px" ItemStyle-Width="80px"
                        DataField="status1" ColumnGroupName="status" AllowFiltering="false"
                        SortExpression="status" UniqueName="Status" HeaderText="Status">
                        <ItemTemplate>
                            &nbsp;
                        <asp:LinkButton ID="logLnkBtn" runat="server" OnClick="logLnkBtn_Click" Text='<% #DataBinder.Eval(Container, "DataItem.status1")%>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridDateTimeColumn DataField="filereceived" HeaderText="FileReceived" UniqueName="FileReceived"
                        HeaderStyle-Width="150px" ItemStyle-Width="150px"
                        SortExpression="filereceived" PickerType="DatePicker" EnableTimeIndependentFiltering="false"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridDateTimeColumn>
                    <telerik:GridBoundColumn HeaderText="FileName" DataField="filename" AllowFiltering="false"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px"
                        ColumnGroupName="filename" SortExpression="filename" UniqueName="FileName" AutoPostBackOnFilter="true"
                        CurrentFilterFunction="Contains" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>


                    <telerik:GridBoundColumn HeaderText="Delivery No" DataField="exref2" AllowFiltering="true"
                        FilterControlWidth="100px" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        ColumnGroupName="exref2" SortExpression="exref2" UniqueName="exref2" AutoPostBackOnFilter="true"
                        CurrentFilterFunction="Contains" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Customer References" DataField="exref1" AllowFiltering="true"
                        FilterControlWidth="100px" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        ColumnGroupName="exref1" SortExpression="exref1" UniqueName="exref1" AutoPostBackOnFilter="true"
                        CurrentFilterFunction="Contains" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Deliver To" DataField="toaddr" AllowFiltering="true"
                        FilterControlWidth="100px" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        ColumnGroupName="toaddr" SortExpression="toaddr" UniqueName="toaddr" AutoPostBackOnFilter="true"
                        CurrentFilterFunction="Contains" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn HeaderText="Expected Date" DataField="expdate" AllowFiltering="true"
                        FilterControlWidth="100px" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        ColumnGroupName="expdate" SortExpression="expdate" UniqueName="expdate" AutoPostBackOnFilter="true"
                        CurrentFilterFunction="Contains" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                        FilterControlWidth="100px" HeaderStyle-Width="140px" ItemStyle-Width="140px"
                        ColumnGroupName="type" SortExpression="type" UniqueName="type" AutoPostBackOnFilter="true"
                        CurrentFilterFunction="Contains" ShowFilterIcon="true">
                    </telerik:GridBoundColumn>                    


                    <telerik:GridBoundColumn HeaderText="FilePath" DataField="filepath" AllowFiltering="false"
                        HeaderStyle-Width="100px" ItemStyle-Width="100px"
                        ColumnGroupName="filepath" SortExpression="filepath" UniqueName="FilePath" Display="false">
                    </telerik:GridBoundColumn>                   
                  
                    <telerik:GridBoundColumn HeaderText="Agent" DataField="agentname" AllowFiltering="false"
                        Display="false" ColumnGroupName="agentname" HeaderStyle-Width="100px"
                        ItemStyle-Width="100px" SortExpression="agentname" UniqueName="agentname" AutoPostBackOnFilter="true"
                        CurrentFilterFunction="Contains" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="AgentContact" DataField="agentcontact" AllowFiltering="false"
                        Display="false" ColumnGroupName="agentcontact" HeaderStyle-Width="100px"
                        ItemStyle-Width="100px" SortExpression="agentcontact" UniqueName="agentcontact"
                        AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iwms:MsgPopup ID="MsgPopup" runat="server"></iwms:MsgPopup>
        <%--Confirm Message popup area Start--%>
        <asp:Button runat="server" ID="PopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup" runat="server" PopupControlID="ConfrimMessagePanel"
            TargetControlID="PopupTargetButton" BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="ConfrimMessagePanel" BackColor="White" Width="420"
            Style="display: none; border: 2px solid #780606;" DefaultButton="ConfirmOkayBtn">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="CancelLbl" Text="CancelReipt" runat="server" Style="size: 15px"></asp:Label>
            </div>
            <div id="Div3" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table id="Table1" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal ID="ConfrimMsgLiteral1" runat="server"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label ID="ConfrimMsg" runat="server"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="ConfirmCancelBtn" runat="server" CssClass="white" Text="Cancel" OnClick="ConfirmCancelBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="ConfirmOkayBtn" runat="server" CssClass="white" Text="OK" OnClick="ConfirmOkayBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Confirm Message popup area End--%>
    </form>
</body>
</html>
