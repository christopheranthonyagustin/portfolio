<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackingPlan.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.PackingPlan" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PackingPlanDetails</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <br />
                    &nbsp;
                <asp:Button  ID="SaveBtn" runat="server" CssClass="white"
                    Text="Save" OnClick="SaveBtn_Click" OnClientClick="return busyBox.Show();"></asp:Button>
                    &nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tr>
                            <td width="10%">
                                <asp:Label ID="Label1" runat="server" CssClass="pagetitle" Text="&nbsp;IssueNo" />
                            </td>
                            <td width="90%">
                                <asp:Label ID="IssueIdLbl" runat="server" CssClass="pagetitle" />
                            </td>
                        </tr>
                        <tr>
                            <td width="10%">
                                <asp:Label ID="Label2" runat="server" CssClass="pagetitle" Text="&nbsp;DONo" />
                            </td>
                            <td width="90%">
                                <asp:Label ID="DoNoLbl" runat="server" CssClass="pagetitle" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid">
            <asp:DataGrid ID="ResultDG" runat="server" BorderStyle="None" GridLines="Both" CellPadding="2"
                AutoGenerateColumns="False" UseAccessibleHeader="True">
                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem"></ItemStyle>
                <Columns>
                    <asp:TemplateColumn>
                        <HeaderTemplate>
                            No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="idLbl" runat="server" Text='<%#Container.ItemIndex+1%>' />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="skucode" HeaderText="SKU">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="pickedqty" HeaderText="PickedQty">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="uomdescr" HeaderText="UOM">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="packedqty" HeaderText="PackedQty">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="variance" HeaderText="Variance">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot4" HeaderText="Lot4">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot1" HeaderText="Lot1" DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot5" HeaderText="Lot5">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot6" HeaderText="Lot6">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot7" HeaderText="Lot7">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot2" HeaderText="Lot2" DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot3" HeaderText="Lot3" DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot8" HeaderText="Lot8">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot9" HeaderText="Lot9">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot10" HeaderText="Lot10">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot11" HeaderText="Lot11">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot12" HeaderText="Lot12">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot13" HeaderText="Lot13">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot14" HeaderText="Lot14">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot15" HeaderText="Lot15">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot16" HeaderText="Lot16">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot17" HeaderText="Lot17">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot18" HeaderText="Lot18">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot19" HeaderText="Lot19">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot20" HeaderText="Lot20">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot21" HeaderText="Lot21">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot22" HeaderText="Lot22">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot23" HeaderText="Lot23">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot24" HeaderText="Lot24">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot25" HeaderText="Lot25">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot26" HeaderText="Lot26">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot27" HeaderText="Lot27">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot28" HeaderText="Lot28">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot29" HeaderText="Lot29">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot30" HeaderText="Lot30">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot31" HeaderText="Lot31">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot32" HeaderText="Lot32">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot33" HeaderText="Lot33">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot34" HeaderText="Lot34">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot35" HeaderText="Lot35">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot36" HeaderText="Lot36">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot37" HeaderText="Lot37">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot38" HeaderText="Lot38">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot39" HeaderText="Lot39">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot40" HeaderText="Lot40">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot41" HeaderText="Lot41">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot42" HeaderText="Lot42">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot43" HeaderText="Lot43">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot44" HeaderText="Lot44">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot45" HeaderText="Lot45">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot46" HeaderText="Lot46">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot47" HeaderText="Lot47">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot48" HeaderText="Lot48">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot49" HeaderText="Lot49">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot50" HeaderText="Lot50">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot51" HeaderText="Lot51">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot52" HeaderText="Lot52">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot53" HeaderText="Lot53">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot54" HeaderText="Lot54">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot55" HeaderText="Lot55">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot56" HeaderText="Lot56">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot57" HeaderText="Lot57">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot58" HeaderText="Lot58">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot59" HeaderText="Lot59">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="lot60" HeaderText="Lot60">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn1_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn1_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo1" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg1" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty1_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty1") %>' />
                            <asp:CompareValidator ID="QtyVal1" runat="server" ControlToValidate="ctnqty1_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn2_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn2_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo2" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg2" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty2_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty2") %>' />
                            <asp:CompareValidator ID="QtyVal2" runat="server" ControlToValidate="ctnqty2_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn3_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn3_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo3" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg3" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty3_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty3") %>' />
                            <asp:CompareValidator ID="QtyVal3" runat="server" ControlToValidate="ctnqty3_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn4_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn4_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo4" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg4" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty4_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty4") %>' />
                            <asp:CompareValidator ID="QtyVal4" runat="server" ControlToValidate="ctnqty4_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn5_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn5_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo5" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg5" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty5_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty5") %>' />
                            <asp:CompareValidator ID="QtyVal5" runat="server" ControlToValidate="ctnqty5_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn6_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn6_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo6" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg6" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty6_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty6") %>' />
                            <asp:CompareValidator ID="QtyVal6" runat="server" ControlToValidate="ctnqty6_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn7_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn7_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo7" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg7" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty7_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty7") %>' />
                            <asp:CompareValidator ID="QtyVal7" runat="server" ControlToValidate="ctnqty7_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn8_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn1_dd8" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo8" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg8" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty8_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty8") %>' />
                            <asp:CompareValidator ID="QtyVal8" runat="server" ControlToValidate="ctnqty8_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn9_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn9_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo9" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg9" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty9_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty9") %>' />
                            <asp:CompareValidator ID="QtyVal9" runat="server" ControlToValidate="ctnqty9_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn10_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn10_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo10" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg10" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty10_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty10") %>' />
                            <asp:CompareValidator ID="QtyVal10" runat="server" ControlToValidate="ctnqty10_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn11_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn11_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo11" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg11" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty11_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty11") %>' />
                            <asp:CompareValidator ID="QtyVal11" runat="server" ControlToValidate="ctnqty11_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn12_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn12_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo12" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg12" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty12_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty12") %>' />
                            <asp:CompareValidator ID="QtyVal12" runat="server" ControlToValidate="ctnqty12_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn13_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn13_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo13" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg13" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty13_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty13") %>' />
                            <asp:CompareValidator ID="QtyVal13" runat="server" ControlToValidate="ctnqty13_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn14_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn14_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo14" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg14" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty14_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty14") %>' />
                            <asp:CompareValidator ID="QtyVal14" runat="server" ControlToValidate="ctnqty14_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn15_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn15_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo15" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg15" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty15_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty15") %>' />
                            <asp:CompareValidator ID="QtyVal15" runat="server" ControlToValidate="ctnqty15_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn16_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn16_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo16" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg16" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty16_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty16") %>' />
                            <asp:CompareValidator ID="QtyVal16" runat="server" ControlToValidate="ctnqty16_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn17_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn17_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo17" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg17" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty17_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty17") %>' />
                            <asp:CompareValidator ID="QtyVal17" runat="server" ControlToValidate="ctnqty17_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn18_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn18_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo18" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg18" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty18_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty18") %>' />
                            <asp:CompareValidator ID="QtyVal18" runat="server" ControlToValidate="ctnqty18_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn19_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn19_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo19" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <img id="printDOImg19" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty19_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty19") %>' />
                            <asp:CompareValidator ID="QtyVal19" runat="server" ControlToValidate="ctnqty19_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn ItemStyle-Wrap="False">
                        <HeaderTemplate>
                            <asp:TextBox runat="server" ID="ctn20_tbox" AutoPostBack="true" OnTextChanged="CtnName_TextChanged"
                                Width="125px" />
                            <asp:DropDownList ID="ctn20_ddl" DataMember="" DataTextField="descr" DataValueField="item"
                                DataSource='<%# pkStatusListDS%>' OnSelectedIndexChanged="CtnStatus_SelectedIndexChanged"
                                runat="server" Width="125px" />
                            <a id="lnkPrintdo20" onclick="return confirm('Confirm Print DO?')" onserverclick="PackCtn_PrintDO"
                                runat="server">
                                <br />
                                <img id="printDOImg20" src="../../image/print.gif" width="15" height="15" border="0"
                                    alt="Print DO" runat="server"></a>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="ctnqty20_tbox" Text='<%# DataBinder.Eval(Container.DataItem, "ctnqty20") %>' />
                            <asp:CompareValidator ID="QtyVal20" runat="server" ControlToValidate="ctnqty20_tbox"
                                ErrorMessage="#" Type="Integer" Operator="DataTypeCheck" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="ptdtid" Visible="false" />
                    <asp:BoundColumn DataField="skuid" Visible="false" />
                </Columns>
                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
            </asp:DataGrid>
        </div>
        <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
            scrolling="no"></iframe>

        <script>
            // Instantiate our BusyBox object
            var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
        </script>

    </form>
</body>
</html>
