<%@ Page Language="c#" CodeBehind="AccountControlDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.AccountControl.AccountControlDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>AccountControlDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body onload='displayRow("table1")' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>&nbsp;
                <asp:Button ID="AddDetailBtn" class="white" runat="server" OnClick="AddDetailBtn_Click" Text="New" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="False" />
                </td>
                <td align="right">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="AddPanel" runat="server" Visible="False">
                        <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                            <tr>
                                <td colspan="5">
                                    <asp:Button ID="SaveNextBtn" class="white" runat="server" OnClick="SaveNextBtn_Click" Text="Save &amp; Next" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Visible="true" />
                                    <asp:Button ID="SaveBtn" class="white" runat="server" OnClick="SaveBtn_Click" Text=" Save " OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Visible="true" />
                                    <asp:Button ID="ClosePanelBtn" class="white" runat="server" OnClick="ClosePanelBtn_Click" Text="Cancel" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Visible="true" CausesValidation="false" />
                                </td>
                                <td align="left">
                                    <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td nowrap style="padding-left: 5px; padding-top:5px">
                                    <asp:Label ID="TypeLbl" runat="server">Type</asp:Label>
                                    <asp:RequiredFieldValidator ID="TypeReq" runat="server" ControlToValidate="TypeList"
                                        ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                    <telerik:RadComboBox ID="TypeList" runat="server" DataValueField="item" DataTextField="descr"
                                        Skin="WebBlue" AutoPostBack="true" CausesValidation="false" EnableLoadOnDemand="true" AllowCustomText="false" RenderMode="Lightweight"
                                        Filter="Contains" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol" ItemsPerRequest="200" ShowMoreResultsBox="true"
                                        HighlightTemplatedItems="true" OnItemsRequested="Test_ItemsRequested" Width="155" OnLoad="Type_Load" OnSelectedIndexChanged="TypeList_SelectedIndexChanged">
                                    </telerik:RadComboBox>
                                    &nbsp;&nbsp;
                                    <asp:Label ID="Title" runat="server" class="graytitle" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">
                                    <asp:Label ID="DateLbl" runat="server">Date Format</asp:Label>
                                    <br>
                                    <telerik:RadTextBox ID="DateValueTxt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="CurrentIDLbl" runat="server">Current ID</asp:Label>
                                    <asp:CompareValidator ID="NumValueVal" ControlToValidate="NumValueTxt" ErrorMessage="#"
                                        runat="server" EnableClientScript="True" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="NumValueReq" runat="server" ControlToValidate="NumValueTxt"
                                        ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                    <telerik:RadTextBox ID="NumValueTxt" runat="server" BackColor="Yellow" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="LengthLbl" runat="server">Length of ID</asp:Label>
                                    <asp:CompareValidator ID="NumDigitVal" ControlToValidate="NumDigitTxt" ErrorMessage="#"
                                        runat="server" EnableClientScript="True" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="NumDigitReq" runat="server" ControlToValidate="NumDigitTxt"
                                        ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                    <telerik:RadTextBox ID="NumDigitTxt" runat="server" BackColor="Yellow" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="PrefixLbl" runat="server">Prefix</asp:Label>
                                    <br>
                                    <telerik:RadTextBox ID="PrefixTxt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="SuffixLbl" runat="server">Suffix</asp:Label>
                                    <br>
                                    <telerik:RadTextBox ID="SuffixTxt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">UsrDef01<br>
                                    <telerik:RadTextBox ID="UsrDef01Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef02
                                <br>
                                    <telerik:RadTextBox ID="UsrDef02Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef03
                                <br>
                                    <telerik:RadTextBox ID="UsrDef03Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef04
                                <br>
                                    <telerik:RadTextBox ID="UsrDef04Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef05
                                <br>
                                    <telerik:RadTextBox ID="UsrDef05Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <br />
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">UsrDef06
                                <br>
                                    <telerik:RadTextBox ID="UsrDef06Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef07
                                <br>
                                    <telerik:RadTextBox ID="UsrDef07Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef08
                                <br>
                                    <telerik:RadTextBox ID="UsrDef08Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef09
                                <br>
                                    <telerik:RadTextBox ID="UsrDef09Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef10
                                <br>
                                    <telerik:RadTextBox ID="UsrDef10Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <br />
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">UsrDef11
                                <br>
                                    <telerik:RadTextBox ID="UsrDef11Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef12
                                <br>
                                    <telerik:RadTextBox ID="UsrDef12Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef13
                                <br>
                                    <telerik:RadTextBox ID="UsrDef13Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef14
                                <br>
                                    <telerik:RadTextBox ID="UsrDef14Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <td>UsrDef15
                                <br>
                                    <telerik:RadTextBox ID="UsrDef15Txt" runat="server" Width="155px">
                                    </telerik:RadTextBox>
                                </td>
                                <br />
                            </tr>
                            <td style="padding-left: 5px;">UsrDef16
                            <br>
                                <telerik:RadTextBox ID="UsrDef16Txt" runat="server" Width="155px">
                                </telerik:RadTextBox>
                            </td>
                            <td>UsrDef17
                            <br>
                                <telerik:RadTextBox ID="UsrDef17Txt" runat="server" Width="155px">
                                </telerik:RadTextBox>
                            </td>
                            <td>UsrDef18
                            <br>
                                <telerik:RadTextBox ID="UsrDef18Txt" runat="server" Width="155px">
                                </telerik:RadTextBox>
                            </td>
                            <td>UsrDef19
                            <br>
                                <telerik:RadTextBox ID="UsrDef19Txt" runat="server" Width="155px">
                                </telerik:RadTextBox>
                            </td>
                            <td>UsrDef20
                            <br>
                                <telerik:RadTextBox ID="UsrDef20Txt" runat="server" Width="155px">
                                </telerik:RadTextBox>
                            </td>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid" style="height: 380px;">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
                AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="AcControlEdit" ImageUrl="../../image/pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Control"
                                    OnClick="ldEdit_Click" CausesValidation="False" OnItemsRequested="Test_ItemsRequested"></asp:ImageButton>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete Control?')"
                                    onserverclick="AcControl_Delete" runat="server">
                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Control"
                                        runat="server"></a>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="acid" Display="False" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Type" SortExpression="Type" HeaderText="Type Code"
                            ItemStyle-Wrap="false" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type Description"
                            ItemStyle-Wrap="false" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="datevalue" SortExpression="datevalue" HeaderText="Date Format"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="numvalue" SortExpression="numvalue" HeaderText="Current ID"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="numdigit" SortExpression="numdigit" HeaderText="Length of ID"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="prefix" SortExpression="prefix" HeaderText="Prefix"
                            ItemStyle-Wrap="false" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="suffix" SortExpression="suffix" HeaderText="Suffix"
                            ItemStyle-Wrap="false" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef01" SortExpression="UsrDef01" HeaderText="User Defined01"
                            ItemStyle-Wrap="false" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef02" SortExpression="UsrDef02" HeaderText="User Defined02"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef03" SortExpression="UsrDef03" HeaderText="User Defined03"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef04" SortExpression="UsrDef04" HeaderText="User Defined04"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef05" SortExpression="UsrDef05" HeaderText="User Defined05"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef06" SortExpression="UsrDef06" HeaderText="User Defined06"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef07" SortExpression="UsrDef07" HeaderText="User Defined07"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef08" SortExpression="UsrDef08" HeaderText="User Defined08"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef09" SortExpression="UsrDef09" HeaderText="User Defined09"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef10" SortExpression="UsrDef10" HeaderText="User Defined10"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef11" SortExpression="UsrDef11" HeaderText="User Defined11"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef12" SortExpression="UsrDef12" HeaderText="User Defined12"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef13" SortExpression="UsrDef13" HeaderText="User Defined13"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef14" SortExpression="UsrDef14" HeaderText="User Defined14"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef15" SortExpression="UsrDef15" HeaderText="User Defined15"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef16" SortExpression="UsrDef16" HeaderText="User Defined16"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef17" SortExpression="UsrDef17" HeaderText="User Defined17"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef18" SortExpression="UsrDef18" HeaderText="User Defined18"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef19" SortExpression="UsrDef19" HeaderText="User Defined19"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UsrDef20" SortExpression="UsrDef20" HeaderText="User Defined20"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" HeaderText="Generated Control" ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                            HeaderText="EditUser" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
