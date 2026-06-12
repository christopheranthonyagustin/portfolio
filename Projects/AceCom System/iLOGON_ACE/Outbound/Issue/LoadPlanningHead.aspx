<%@ Page Language="c#" CodeBehind="LoadPlanningHead.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.Issue.LoadPLanningHead" %>

<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>LoadPLanningHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/style.css" type="text/css" rel="Stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="Stylesheet" />
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
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
        .style1 {
            width: 99px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td>
                    <asp:Button ID="EditPlanBtn" runat="server" Text="Edit"
                        OnClick="EditPlanBtn_Click" CssClass="white"></asp:Button>&nbsp;&nbsp;
                    <asp:Button ID="DelImgBtn" runat="server" Text="Delete"
                        OnClick="DeleteAllBtn_Click" ToolTip="Delete Selected Container(s)" CssClass="white"></asp:Button>&nbsp;&nbsp;
                    <asp:Button ID="AutoPackBtn" runat="server" Text="Generate" CssClass="white" OnClick="AutoPackBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;&nbsp;
                    <asp:Button ID="TransferBtn" runat="server" Text="Transfer" CssClass="white"
                        OnClick="TransferBtn_Click"></asp:Button>&nbsp;&nbsp;
                    <asp:Button ID="DisChargePM" runat="server" Text="Packaging" CssClass="white"
                        OnClick="DisChargePMBtn_Click" ToolTip="Discharge Packaging Material"></asp:Button>&nbsp;&nbsp;
                    <asp:Button ID="excelImgBtn" class="LongLabelGreen" runat="server" OnClick="excelImgBtn_Click" Text="Export to Excel" UseSubmitBehavior="false" />
                </td>
                <td align="left">
                    <br />
                    &nbsp;<br />
                    &nbsp;<br />
                    <br />
                </td>
                <td align="right"></td>
            </tr>
        </table>
        <table>
            <tr>
                <td>Choose Container:
                </td>
                <td>
                    <telerik:RadDropDownList ID="CtnrDDL" runat="server" Skin="Sunset" OnSelectedIndexChanged="CtnrDDL_SelectedIndexChanged"
                        AutoPostBack="true">
                    </telerik:RadDropDownList>
                </td>
                <td></td>
                <td>OccupiedWt:
                </td>
                <td>
                    <telerik:RadLabel ID="OccWtLbl" runat="server" Skin="WebBlue">
                    </telerik:RadLabel>
                </td>
                <td class="style1"></td>
                <td>To Container:
                </td>
                <td>
                    <telerik:RadDropDownList ID="ToCtnrDDL" runat="server" Skin="Sunset" OnSelectedIndexChanged="ToCtnrDDL_SelectedIndexChanged"
                        AutoPostBack="true">
                    </telerik:RadDropDownList>
                </td>
                <td></td>
                <td>OccupiedWt:
                </td>
                <td>
                    <telerik:RadLabel ID="OccWtLbl2" runat="server" Skin="WebBlue">
                    </telerik:RadLabel>
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
            Skin="Metro" OnDetailTableDataBind="ResultDG_DetailTableDataBind" OnItemCommand="ResultDG_ItemCommand"
            OnUpdateCommand="ResultDG_Update" OnDeleteCommand="ResultDG_Delete">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                HierarchyLoadMode="Client" EditMode="InPlace" Width="100%" CommandItemDisplay="Top">
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik">
                        <HeaderStyle Wrap="false" BackColor="#05538C" ForeColor="White" />
                        <ItemStyle Wrap="false" />
                        <AlternatingItemStyle Wrap="false" />
                        <Columns>
                            <telerik:GridTemplateColumn HeaderStyle-Width="70px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="False" ID="PackDelete" ImageUrl="..\..\image\bin.gif"
                                        Width="15" Height="15" AlternateText="Delete" CommandName="Delete" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="PackUpdate" ImageUrl="..\..\image\floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="PackCancel" ImageUrl="..\..\image\arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="SkuDescr" HeaderText="SkuDescr">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "skudescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="SkuDescrLbl" runat="server" Text=""> </asp:Label>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="skucode" HeaderText="SkuCode">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "skucode")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="SkuCodeTxt" runat="server" OnTextChanged="SkuCodeTxt_OnTextChanged"
                                        AutoPostBack="true" CausesValidation="false" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="qty" HeaderText="Qty">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "packedqty")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="QtyTxt" runat="server" OnTextChanged="QtyTxt_OnTextChanged"
                                        AutoPostBack="true" CausesValidation="false" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="uom" HeaderText="Uom">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "uom")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="UomDDL" runat="server" DataTextField="uom" DataValueField="uom"
                                        DataSource='<%# uomDS%>' Width="150px" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="lot4" HeaderText="Lot4">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "lot4")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lot4Lbl" runat="server" Text=""></asp:Label>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="loccode" HeaderText="Location">
                                <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "loccode")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="tuno1" HeaderText="TUNO1">
                                <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "tuno1")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="alttuno1" HeaderText="AltTUNO1">
                                <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "AltTUNO1")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="pickcheckstatus" HeaderText="PickCheckStatus">
                                <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "pickcheckstatus")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="pickcheckon" SortExpression="pickcheckon" HeaderText="PickCheckOn"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="pickcheckby" SortExpression="pickcheckby" HeaderText="PickCheckBy">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="loadcheckstatus" HeaderText="LoadCheckStatus">
                                <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "loadcheckstatus")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="loadcheckon" SortExpression="loadcheckon" HeaderText="LoadCheckOn"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="loadcheckby" SortExpression="loadcheckby" HeaderText="LoadCheckBy">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="totwt" HeaderText="Wt">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "totwt")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="totwtLbl" runat="server" Text=""></asp:Label>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="id" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderStyle-Width="40px" ItemStyle-Width="40px">
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn>
                        <ItemTemplate>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="PackUpdate" ImageUrl="..\..\image\floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="PackCancel" ImageUrl="..\..\image\arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderStyle-Width="40px" ItemStyle-Width="40px" Reorderable="false"
                        UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="id" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="ref" HeaderText="Ref">
                        <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "ref")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox ID="RefTxt" runat="server" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="type" HeaderText="Type">
                        <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "type")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="TypeList" runat="server" DefaultMessage="Select a Type"
                                Width="120px" DropDownHeight="150px" Skin="WebBlue" DataSource='<%# TypeListDS%>'
                                DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="TypeListReqVal" runat="server" ControlToValidate="TypeList"
                                ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="skulot4" HeaderText="Sku-Lot4">
                        <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "skulot4")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="tuno1" HeaderText="TUNO1">
                        <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "tuno1")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="PickCheckStatus" HeaderText="PickCheckStatus">
                        <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "PickCheckStatus")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="LoadCheckStatus" HeaderText="LoadCheckStatus">
                        <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "LoadCheckStatus")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="totalpkdnetwt" HeaderText="TotalNetWT">
                        <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "totalpkdnetwt")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="rem1" HeaderText="rem1">
                        <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" Width="50%"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "rem1")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox ID="rem1Txt" runat="server" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="blank" HeaderText="">
                        <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" Width="20%"></ItemStyle>
                        <ItemTemplate>
                        </ItemTemplate>
                        <EditItemTemplate>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="ref" SortExpression="ref" HeaderText="PalletNo"
                        Visible="false" />
                    <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type"
                        Visible="false" />
                    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks"
                        Visible="false" ItemStyle-Width="50%" />
                    <telerik:GridBoundColumn DataField="blank" SortExpression="" HeaderText="" ItemStyle-Width="20%"
                        Visible="false" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
    </form>
</body>
</html>
