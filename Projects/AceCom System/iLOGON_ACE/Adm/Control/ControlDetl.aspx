<%@ Page Language="c#" CodeBehind="ControlDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Control.ControlDetl" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>ControlDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function () {
                $(".show_hide_Detail").slideToggle();
            });
        });
    </script>

      <style type="text/css">
        body {
            overflow-x: scroll;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

          <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click" Visible="true"
            Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
         <asp:Button ID="AddDetailBtn" runat="server" OnClick="AddDetailBtn_Click"
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" class="white" Text="New" Visible="false" />
         <asp:Button ID="DeleteBtn" runat="server" CssClass="white" Text="Delete"
            OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
        <br />
        <asp:Button ID="ConfirmDelete" Text="" Style="display: none;" OnClick="ConfirmDeleteBtn_Click" runat="server" />
        <br />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Panel ID="AddPanel" runat="server" Visible="False">
                        <a name="#AddDetailBtn"></a>
                        <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                            <asp:Button ID="SaveNextBtn" runat="server" Text="Save & Next" ToolTip="SaveAndNext" OnClick="SaveNextBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" class="white" />
                            &nbsp;
                              <asp:Button ID="SaveBtn" runat="server" Text="Save" ToolTip="Save" OnClick="SaveBtn_Click"
                                  OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" class="white" />
                            &nbsp;
                                   <asp:Button ID="ClosePanelBtn" runat="server" Text="Hide" ToolTip="Hide" OnClick="ClosePanelBtn_Click"
                                       OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" class="white" CausesValidation="False" />
                            <br />
                            &nbsp;<asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;
                        <tr>
                            <td style="width: 190px"><%--Type--%>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                <%--<br />
                                <telerik:RadMultiColumnComboBox ID="TypeMCBB" runat="server" RenderMode="Lightweight" CausesValidation="false" Skin="Sunset" BackColor="#ded7c6"
                                    DataSource='<%# TypeDS%>' Filter="Contains" AutoPostBack="true"
                                    DataTextField="Descr" DataValueField="Item">
                                </telerik:RadMultiColumnComboBox>

                                <asp:RequiredFieldValidator ID="TypeReq" runat="server" ControlToValidate="TypeMCBB"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>--%>
                            </td>
                        </tr>
                            <tr>
                                <td style="width: 190px">Date Format
                                <br>
                                    <telerik:RadTextBox ID="DateValueTxt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td style="width: 190px">Current ID
                                <asp:CompareValidator ID="NumValueVal" ControlToValidate="NumValueTxt" ErrorMessage="#"
                                    runat="server" EnableClientScript="True" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="NumValueReq" runat="server" ControlToValidate="NumValueTxt"
                                        ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                    <telerik:RadTextBox ID="NumValueTxt" runat="server" Skin="Sunset" BackColor="#ded7c6"
                                        Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td style="width: 190px">Length of ID
                                <asp:CompareValidator ID="NumDigitVal" ControlToValidate="NumDigitTxt" ErrorMessage="#"
                                    runat="server" EnableClientScript="True" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="NumDigitReq" runat="server" ControlToValidate="NumDigitTxt"
                                        ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                    <telerik:RadTextBox ID="NumDigitTxt" runat="server" Skin="Sunset" BackColor="#ded7c6"
                                        Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td style="width: 190px">Prefix
                                <br>
                                    <telerik:RadTextBox ID="PrefixTxt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td style="width: 190px">Suffix
                                <br>
                                    <telerik:RadTextBox ID="SuffixTxt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>UsrDef01
                                <br>
                                    <telerik:RadTextBox ID="UsrDef01Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef02
                                <br>
                                    <telerik:RadTextBox ID="UsrDef02Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef03
                                <br>
                                    <telerik:RadTextBox ID="UsrDef03Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef04
                                <br>
                                    <telerik:RadTextBox ID="UsrDef04Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef05
                                <br>
                                    <telerik:RadTextBox ID="UsrDef05Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>UsrDef06
                                <br>
                                    <telerik:RadTextBox ID="UsrDef06Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef07
                                <br>
                                    <telerik:RadTextBox ID="UsrDef07Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef08
                                <br>
                                    <telerik:RadTextBox ID="UsrDef08Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef09
                                <br>
                                    <telerik:RadTextBox ID="UsrDef09Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef10
                                <br>
                                    <telerik:RadTextBox ID="UsrDef10Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>UsrDef11
                                <br>
                                    <telerik:RadTextBox ID="UsrDef11Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef12
                                <br>
                                    <telerik:RadTextBox ID="UsrDef12Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef13
                                <br>
                                    <telerik:RadTextBox ID="UsrDef13Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef14
                                <br>
                                    <telerik:RadTextBox ID="UsrDef14Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef15
                                <br>
                                    <telerik:RadTextBox ID="UsrDef15Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>UsrDef16
                                <br>
                                    <telerik:RadTextBox ID="UsrDef16Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef17
                                <br>
                                    <telerik:RadTextBox ID="UsrDef17Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef18
                                <br>
                                    <telerik:RadTextBox ID="UsrDef18Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef19
                                <br>
                                    <telerik:RadTextBox ID="UsrDef19Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef20
                                <br>
                                    <telerik:RadTextBox ID="UsrDef20Txt" runat="server" Width="190px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>&nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Height="450px"
            EnableLinqExpressions="false" AllowPaging="false" Skin="Metro" AllowSorting="true"
            AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <%--<Scrolling AllowScroll="true" ScrollHeight="395px" />--%>
                <Scrolling UseStaticHeaders="true" SaveScrollPosition="true" AllowScroll="true" />
                <%--<ClientEvents OnGridCreated="GridCreated" />--%>
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="checkbox" AllowFiltering="false">
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ControlEdit" ImageUrl="../../image/pencil.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Control"
                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete Control?')"
                                onserverclick="Control_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Control"
                                    runat="server" /></a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Description"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="datevalue" SortExpression="datevalue" HeaderText="Date Format"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="numvalue" SortExpression="numvalue" HeaderText="Current ID"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="numdigit" SortExpression="numdigit" HeaderText="Length of ID"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="prefix" SortExpression="prefix" HeaderText="Prefix"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="suffix" SortExpression="suffix" HeaderText="Suffix"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef01" SortExpression="UsrDef01" HeaderText="UsrDef01"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef02" SortExpression="UsrDef02" HeaderText="UsrDef02"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef03" SortExpression="UsrDef03" HeaderText="UsrDef03"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef04" SortExpression="UsrDef04" HeaderText="UsrDef04"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef05" SortExpression="UsrDef05" HeaderText="UsrDef05"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef06" SortExpression="UsrDef06" HeaderText="UsrDef06"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef07" SortExpression="UsrDef07" HeaderText="UsrDef07"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef08" SortExpression="UsrDef08" HeaderText="UsrDef08"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef09" SortExpression="UsrDef09" HeaderText="UsrDef09"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef10" SortExpression="UsrDef10" HeaderText="UsrDef10"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef11" SortExpression="UsrDef11" HeaderText="UsrDef11"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef12" SortExpression="UsrDef12" HeaderText="UsrDef12"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef13" SortExpression="UsrDef13" HeaderText="UsrDef13"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef14" SortExpression="UsrDef14" HeaderText="UsrDef14"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef15" SortExpression="UsrDef15" HeaderText="UsrDef15"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef16" SortExpression="UsrDef16" HeaderText="UsrDef16"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef17" SortExpression="UsrDef17" HeaderText="UsrDef17"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef18" SortExpression="UsrDef18" HeaderText="UsrDef18"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef19" SortExpression="UsrDef19" HeaderText="UsrDef19"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UsrDef20" SortExpression="UsrDef20" HeaderText="UsrDef20"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" SortExpression="status " HeaderText="Generated Control"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                        HeaderText="EditUser">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
