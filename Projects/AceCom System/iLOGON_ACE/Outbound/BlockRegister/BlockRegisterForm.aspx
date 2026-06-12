<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockRegisterForm.aspx.cs"
    Inherits="iWMS.Web.Outbound.BlockRegister.BlockRegisterForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>Block Register</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <base target="_self" />

    <script type="text/javascript" src="../../js/row.js"></script>   
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            width: 540px;
        }
    </style>
</head>
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table>
        <tr>
            <td>
                &nbsp;<asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <telerik:RadButton ID="UpdateBtn" runat="server" Text="  Update  " CssClass="detailButton"
                    Skin="WebBlue" OnClick="UpdateBtn_Click" CausesValidation="false">
                </telerik:RadButton>
                <br />
            </td>
        </tr>
        <tr>
            <td valign="top">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
            </td>
        </tr>
    </table>
      <table>
        <tr>
            <td>           
            <%--<asp:ImageButton ID="ReleaseBtn" runat="server" ImageUrl="../../Image/Release.png" 
                Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                OnClick="ReleaseBtn_Click"/>--%>
                <asp:Button ID="ReleaseBtn" class="white" runat="server" OnClick="ReleaseBtn_Click" Text="Release" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </td>
        </tr>
    </table>

    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound" OnPreRender="ResultDG_PreRender">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Scrolling ScrollHeight="400px" AllowScroll="true" />
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevAndNumeric" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid"
            EditMode="InPlace" Width="100%" AllowFilteringByColumn="true" HierarchyLoadMode="Client">
           <%-- CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="New Record">--%>
         <%--   <CommandItemTemplate>
                <div style="padding: 5px 5px;">
                    &nbsp;&nbsp;
                    <asp:ImageButton runat="server" Visible="True" ID="BRDetlAdd" ImageUrl="..\..\image\add.png"
                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Add BR Detail"
                        ToolTip="Add BR Detail" OnClick="BRDetlAdd_Click" CausesValidation="False"></asp:ImageButton>&nbsp;
                    <asp:Label ID="Lbl1" runat="server" Text="New Record" Font-Bold="true" />
                </div>
            </CommandItemTemplate>--%>
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>                   
                    <ItemTemplate>                        
                        <asp:LinkButton ID="lnkSplit" Runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>' OnClick="lnkSplit_Click" Visible="false">
										<img id="SplitImg" src="..\..\image\pencil.gif" Width="15" Height="15" border="0" alt="Split"	runat="server"></asp:LinkButton>                        
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="LotID">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="TransQty" AllowFiltering="false"
                HeaderText="ReleaseQty" ItemStyle-Width="20%">
                <ItemTemplate>
                    <telerik:RadTextBox ID="QtyTxt" runat="server" Skin="WebBlue" Text="0" Width="80px"
                        EnabledStyle-HorizontalAlign="Center" Visible="false">
                    </telerik:RadTextBox>
                </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="helduomqty" SortExpression="helduomqty" HeaderText="Qty" 
                    DataFormatString="{0:0.###}" AllowFiltering="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 4">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot4") %>'
                            ID="FrLot4Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="spqty" SortExpression="spqty" HeaderText="spqty" Display="false">
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                    <HeaderStyle Wrap="False"></HeaderStyle>                    
                </telerik:GridBoundColumn>    
                <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="RCDate">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rcdate","{0:dd/MMM/yyyy}") %>'
                            ID="rcdateLbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>            
                <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 1">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot1","{0:dd/MMM/yyyy}") %>'
                            ID="FrLot1Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>                
                <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 5">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot5") %>'
                            ID="FrLot5Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 6">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot6") %>'
                            ID="FrLot6Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 7">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot7") %>'
                            ID="FrLot7Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 2">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot2","{0:dd/MMM/yyyy}") %>'
                            ID="FrLot2Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 3">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot3","{0:dd/MMM/yyyy}") %>'
                            ID="FrLot3Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 8">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot8") %>'
                            ID="FrLot8Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot9" HeaderText="Lot9" SortExpression="lot9">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot9") %>'
                            ID="FrLot9Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot10" HeaderText="Lot10" SortExpression="lot10">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot10") %>'
                            ID="FrLot10Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot11" HeaderText="Lot11" SortExpression="lot11">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot11") %>'
                            ID="FrLot11Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot12" HeaderText="Lot12" SortExpression="lot12">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot12") %>'
                            ID="FrLot12Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot13" HeaderText="Lot13" SortExpression="lot13">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot13") %>'
                            ID="FrLot13Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot14" HeaderText="Lot14" SortExpression="lot14">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot14") %>'
                            ID="FrLot14Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot15" HeaderText="Lot15" SortExpression="lot15">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot15") %>'
                            ID="FrLot15Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot16" HeaderText="Lot16" SortExpression="lot16">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot16") %>'
                            ID="FrLot16Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot17" HeaderText="Lot17" SortExpression="lot17">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot17") %>'
                            ID="FrLot17Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot18" HeaderText="Lot18" SortExpression="lot18">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot18") %>'
                            ID="FrLot18Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot19" HeaderText="Lot19" SortExpression="lot19">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot19") %>'
                            ID="FrLot19Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot20" HeaderText="Lot20" SortExpression="lot20">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot20") %>'
                            ID="FrLot20Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot21" HeaderText="Lot21" SortExpression="lot21">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot21") %>'
                            ID="FrLot21Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot22" HeaderText="Lot22" SortExpression="lot22">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot22") %>'
                            ID="FrLot22Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot23" HeaderText="Lot23" SortExpression="lot23">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot23") %>'
                            ID="FrLot23Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot24" HeaderText="Lot24" SortExpression="lot24">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot24") %>'
                            ID="FrLot24Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot25" HeaderText="Lot25" SortExpression="lot25">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot25") %>'
                            ID="FrLot25Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot26" HeaderText="Lot26" SortExpression="lot26">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot26") %>'
                            ID="FrLot26Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot27" HeaderText="Lot27" SortExpression="lot27">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot27") %>'
                            ID="FrLot27Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot28" HeaderText="Lot28" SortExpression="lot28">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot28") %>'
                            ID="FrLot28Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot29" HeaderText="Lot29" SortExpression="lot29">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot29") %>'
                            ID="FrLot29Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot30" HeaderText="Lot30" SortExpression="lot30">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot30") %>'
                            ID="FrLot30Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot31" HeaderText="Lot31" SortExpression="lot31">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot31") %>'
                            ID="FrLot31Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot32" HeaderText="Lot32" SortExpression="lot32">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot32") %>'
                            ID="FrLot32Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot33" HeaderText="Lot33" SortExpression="lot33">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot33") %>'
                            ID="FrLot33Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot34" HeaderText="Lot34" SortExpression="lot34">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot34") %>'
                            ID="FrLot34Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot35" HeaderText="Lot35" SortExpression="lot35">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot35") %>'
                            ID="FrLot35Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot36" HeaderText="Lot36" SortExpression="lot36">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot36") %>'
                            ID="FrLot36Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot37" HeaderText="Lot37" SortExpression="lot37">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot37") %>'
                            ID="FrLot37Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot38" HeaderText="Lot38" SortExpression="lot38">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot38") %>'
                            ID="FrLot38Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot39" HeaderText="Lot39" SortExpression="lot39">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot39") %>'
                            ID="FrLot39Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot40" HeaderText="Lot40" SortExpression="lot40">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot40") %>'
                            ID="FrLot40Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot41" HeaderText="Lot41" SortExpression="lot41">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot41") %>'
                            ID="FrLot41Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot42" HeaderText="Lot42" SortExpression="lot42">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot42") %>'
                            ID="FrLot42Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot43" HeaderText="Lot43" SortExpression="lot43">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot43") %>'
                            ID="FrLot43Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot44" HeaderText="Lot44" SortExpression="lot44">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot44") %>'
                            ID="FrLot44Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot45" HeaderText="Lot45" SortExpression="lot45">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot45") %>'
                            ID="FrLot45Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot46" HeaderText="Lot46" SortExpression="lot46">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot46") %>'
                            ID="FrLot46Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot47" HeaderText="Lot47" SortExpression="lot47">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot47") %>'
                            ID="FrLot47Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot48" HeaderText="Lot48" SortExpression="lot48">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot48") %>'
                            ID="FrLot48Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot49" HeaderText="Lot49" SortExpression="lot49">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot49") %>'
                            ID="FrLot49Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot50" HeaderText="Lot50" SortExpression="lot50">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot50") %>'
                            ID="FrLot50Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot51" HeaderText="Lot51" SortExpression="lot51">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot51") %>'
                            ID="FrLot51Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot52" HeaderText="Lot52" SortExpression="lot52">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot52") %>'
                            ID="FrLot52Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot53" HeaderText="Lot53" SortExpression="lot53">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot53") %>'
                            ID="FrLot53Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot54" HeaderText="Lot54" SortExpression="lot54">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot54") %>'
                            ID="FrLot54Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot55" HeaderText="Lot55" SortExpression="lot55">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot55") %>'
                            ID="FrLot55Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot56" HeaderText="Lot56" SortExpression="lot56">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot56") %>'
                            ID="FrLot56Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot57" HeaderText="Lot57" SortExpression="lot57">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot57") %>'
                            ID="FrLot57Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot58" HeaderText="Lot58" SortExpression="lot58">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot58") %>'
                            ID="FrLot58Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot59" HeaderText="Lot59" SortExpression="lot59">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot59") %>'
                            ID="FrLot59Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="lot60" HeaderText="Lot60" SortExpression="lot60">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot60") %>'
                            ID="FrLot60Lbl" /><br>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>                
                <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TuNo1">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TuNo2">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>                
                <telerik:GridBoundColumn DataField="status" Display="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                    ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                    ReadOnly="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="slltid" Display="False">
                </telerik:GridBoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
