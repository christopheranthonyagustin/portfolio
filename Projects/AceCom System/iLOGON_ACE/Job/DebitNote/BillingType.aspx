<%@ Page Language="c#" CodeBehind="BillingType.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.DebitNote.BillingType" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BillingType</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="7200"/>
        <asp:UpdatePanel ID="UpdBody" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td align="right">
                            <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdButton" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="GenerateBtn" runat="server" Text="Generate" CssClass="white"
                                        OnClick="GenerateBtn_Click"></asp:Button>
                                    &nbsp;
                                    <asp:Button ID="ActiveBtn" runat="server" Text="Active" CssClass="white"
                                        OnClick="ActiveBtn_Click"></asp:Button>
                                    &nbsp;
                                    <asp:Button ID="UndoBtn" runat="server" Text="Undo" CssClass="white"
                                        OnClick="UndoBtn_Click"></asp:Button>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="ResultDG" />
                                    <asp:PostBackTrigger ControlID="ActiveBtn" />
                                    <asp:PostBackTrigger ControlID="UndoBtn" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" AllowSorting="false"
                    Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                    OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" AllowMultiRowSelection="True">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" Scrolling-AllowScroll="true">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="10" DataKeyNames="id" EditMode="InPlace">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:Button runat="server" ID="JobgridBtn" Text="Job" Width="30" OnClick="JobgridBtn_Click" />
                                    <asp:ImageButton runat="server" Visible="True" ID="queryImgBtn" ImageUrl="../../image/query.png"
                                        Width="15" OnClick="query_JobNotInvoice" Height="15" AlternateText="JobNotInvoiced"
                                        BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <a id="lnkUndo" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Undo Generate Billable?')"
                                        onserverclick="Undo_GenerateBillable" runat="server">
                                        <img id="Undomg" src="../../image/Undo.png" width="15" height="15" border="0" alt="Undo"
                                            runat="server" /></a>
                                    <asp:Label ID="UndoStsLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "status") %>'></asp:Label>
                                    <asp:Label ID="BillLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "billingtype") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <label id="completelbl">
                                    </label>
                                    &nbsp;<input id="SelectALLCB" type="checkbox" onclick="CheckAll(this)">
                                </HeaderTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image\floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="billingtype" SortExpression="billingtype"
                                UniqueName="billingtype" ReadOnly="true" Display="false" />
                            <telerik:GridBoundColumn HeaderText="BillingType" DataField="billingtypedescr" AllowFiltering="false"
                                ColumnGroupName="billingtypedescr" SortExpression="billingtypedescr" UniqueName="billingtypedescr"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="Active" Reorderable="false" UniqueName="checkbox"
                                AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:CheckBox ID="ActiveItemCB" runat="server" Enabled="false"></asp:CheckBox>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="ActiveCB" runat="server"></asp:CheckBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="From" Reorderable="false" UniqueName="frdate"
                                AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "frdate", "{0:dd/MMM/yyyy}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="FrDateLbl" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "frdate", "{0:dd/MMM/yyyy}")%>' />
                                    <telerik:RadDatePicker ID="FrDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy"
                                        Skin="Office2010Blue">
                                    </telerik:RadDatePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="To" Reorderable="false" UniqueName="todate"
                                AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "todate", "{0:dd/MMM/yyyy}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="ToDateLbl" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "todate", "{0:dd/MMM/yyyy}")%>' />
                                    <telerik:RadDatePicker ID="ToDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy"
                                        Skin="Office2010Blue">
                                    </telerik:RadDatePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="BillingGrp" Reorderable="false" UniqueName="billinggrpdescr"
                                AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "billinggrpdescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="BGrpList" Enabled="True" DataTextField="Descr" DataValueField="code"
                                        runat="server" DataSource='<%# bGrpListDS%>' AutoPostBack="True" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Source" Reorderable="false" UniqueName="srcDescr"
                                AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "srcDescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="BSrcList" Enabled="True" DataTextField="Descr" DataValueField="item"
                                        runat="server" DataSource='<%# bSrcListDS%>' AutoPostBack="True" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="JobNo" Reorderable="false" UniqueName="srcno"
                                AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "srcno") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="SrcNoTxt" runat="server" Width="100" Value='<%# DataBinder.Eval(Container.DataItem, "srcno") %>' />
                                    <asp:CompareValidator ID="SrcNoTxtCompVal" runat="server" ControlToValidate="SrcNoTxt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="String" />
                                    <asp:CompareValidator ID="SrcNoTxtZeroVal" runat="server" ControlToValidate="SrcNoTxt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="SourceId" Reorderable="false" UniqueName="srcid"
                                AllowFiltering="false" Display="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "srcid") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="SrcIdTxt" runat="server" Width="100" Value='<%# DataBinder.Eval(Container.DataItem, "srcid") %>'
                                        ReadOnly="True" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="status" AllowFiltering="false" ColumnGroupName="status"
                                SortExpression="status" UniqueName="status" Reorderable="true" ReadOnly="true"
                                Display="false" />
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false"
                                ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                                Reorderable="true" ReadOnly="true" />
                            <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="false"
                                ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" ReadOnly="true"
                                Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" />
                            <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="false"
                                ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true"
                                ReadOnly="true" />
                            <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="false"
                                ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                                ReadOnly="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" />
                            <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="false"
                                ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true"
                                ReadOnly="true" />
                            <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" AllowFiltering="true"
                                SortExpression="statuscolor" UniqueName="statuscolor" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="src" Reorderable="false" UniqueName="src"
                                AllowFiltering="false" Display="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "src") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="SrcTxt" runat="server" Width="100" Value='<%# DataBinder.Eval(Container.DataItem, "src") %>' />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:UpdateProgress ID="updateProgress" runat="server">
                    <ProgressTemplate>
                        <div class="busybiz" style="z-index: 1" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                        </div>
                        <div id="LoaderPopup">
                            <a id="loader"></a>
                            <a id="text">We are processing your request ...</a>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:HiddenField ID="HiddenField" runat="server" />
        <telerik:RadWindow ID="OsJobGenerationRadWindow" runat="server" VisibleOnPageLoad="true" Title="OSJobGeneration" Width="900px" Height="500px"
            NavigateUrl='<%# "JobsNotInvoiceGen.aspx?acId="+ HiddenField.Value %>'
            Modal="true" Left="100px" Top="20px" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
