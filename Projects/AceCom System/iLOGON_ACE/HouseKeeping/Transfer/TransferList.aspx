<%@ Page Language="c#" CodeBehind="TransferList.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.Transfer.TransferList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvMoveList</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <script language="javascript" type="text/javascript">
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

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <asp:Label ID="StepLbl" runat="server" CssClass="pagetitle">Inventory Transfer (Step 2 of 3)</asp:Label>
            </td>
            <td align="right">
                <asp:Button ID="NextBtn" runat="server" Text=" Next " CssClass="white" OnClick="NextBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label>
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowFilteringByColumn="true" EnableLinqExpressions="false" AllowSorting="true"
            Skin="Metro" AllowPaging="false" GroupPanelPosition="Top" OnItemDataBound="ResultDG_ItemDataBound"  OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false">
                        <HeaderStyle HorizontalAlign="Center" Wrap="false" />
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)" /></HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="SelectCB" runat="server"></asp:CheckBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="zonedescr" SortExpression="zonedescr" HeaderText="Zone">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lotskudescr" SortExpression="lotskudescr" HeaderText="Description">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="Lot">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="onhandqty" SortExpression="onhandqty" HeaderText="On Hand">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="allocatedqty" SortExpression="allocatedqty" HeaderText="Allocated">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pickedqty" SortExpression="pickedqty" HeaderText="Picked">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="heldqty" SortExpression="heldqty" HeaderText="Held">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="availqty" SortExpression="availqty" HeaderText="Available">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Receive Date"
                        DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot1"
                        DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot7">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot2" DataFormatString="{0:dd/MMM/yyyy}">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot2"
                        DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--    <asp:BoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot3" DataFormatString="{0:dd/MMM/yyyy}">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot3"
                        DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--   <asp:BoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot8">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot8">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot9" SortExpression="lot9" HeaderText="Lot9">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot9" SortExpression="lot9" HeaderText="Lot9">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot10" SortExpression="lot10" HeaderText="Lot10">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot10" SortExpression="lot10" HeaderText="Lot10">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot11" SortExpression="lot11" HeaderText="Lot11">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot11" SortExpression="lot11" HeaderText="Lot11">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot12" SortExpression="lot12" HeaderText="Lot12">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot12" SortExpression="lot12" HeaderText="Lot12">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot13" SortExpression="lot13" HeaderText="Lot13">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot13" SortExpression="lot13" HeaderText="Lot13">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot14" SortExpression="lot14" HeaderText="Lot14">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot14" SortExpression="lot14" HeaderText="Lot14">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot15" SortExpression="lot15" HeaderText="Lot15">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot15" SortExpression="lot15" HeaderText="Lot15">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot16" SortExpression="lot16" HeaderText="Lot16">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot16" SortExpression="lot16" HeaderText="Lot16">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot17" SortExpression="lot17" HeaderText="Lot17">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot17" SortExpression="lot17" HeaderText="Lot17">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot18" SortExpression="lot18" HeaderText="Lot18">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot18" SortExpression="lot18" HeaderText="Lot18">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot19" SortExpression="lot19" HeaderText="Lot19">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot19" SortExpression="lot19" HeaderText="Lot19">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot20" SortExpression="lot20" HeaderText="Lot20">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot20" SortExpression="lot20" HeaderText="Lot20">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot21" SortExpression="lot21" HeaderText="Lot21">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot21" SortExpression="lot21" HeaderText="Lot21">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot22" SortExpression="lot22" HeaderText="Lot22">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot22" SortExpression="lot22" HeaderText="Lot22">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot23" SortExpression="lot23" HeaderText="Lot23">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot23" SortExpression="lot23" HeaderText="Lot23">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot24" SortExpression="lot24" HeaderText="Lot24">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot24" SortExpression="lot24" HeaderText="Lot24">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot25" SortExpression="lot25" HeaderText="Lot25">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot25" SortExpression="lot25" HeaderText="Lot25">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot26" SortExpression="lot26" HeaderText="Lot26">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot26" SortExpression="lot26" HeaderText="Lot26">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot27" SortExpression="lot27" HeaderText="Lot27">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot27" SortExpression="lot27" HeaderText="Lot27">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot28" SortExpression="lot28" HeaderText="Lot28">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot28" SortExpression="lot28" HeaderText="Lot28">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot29" SortExpression="lot29" HeaderText="Lot29">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot29" SortExpression="lot29" HeaderText="Lot29">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--  <asp:BoundColumn DataField="lot30" SortExpression="lot30" HeaderText="Lot30">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot30" SortExpression="lot30" HeaderText="Lot30">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--   <asp:BoundColumn DataField="lot31" SortExpression="lot31" HeaderText="Lot31">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot31" SortExpression="lot31" HeaderText="Lot31">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot32" SortExpression="lot32" HeaderText="Lot32">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot32" SortExpression="lot32" HeaderText="Lot32">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot33" SortExpression="lot33" HeaderText="Lot33">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot33" SortExpression="lot33" HeaderText="Lot33">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot34" SortExpression="lot34" HeaderText="Lot34">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot34" SortExpression="lot34" HeaderText="Lot34">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot35" SortExpression="lot35" HeaderText="Lot35">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot35" SortExpression="lot35" HeaderText="Lot35">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot36" SortExpression="lot36" HeaderText="Lot36">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot36" SortExpression="lot36" HeaderText="Lot36">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot37" SortExpression="lot37" HeaderText="Lot37">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot37" SortExpression="lot37" HeaderText="Lot37">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot38" SortExpression="lot38" HeaderText="Lot38">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot38" SortExpression="lot38" HeaderText="Lot38">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot39" SortExpression="lot39" HeaderText="Lot39">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot39" SortExpression="lot39" HeaderText="Lot39">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot40" SortExpression="lot40" HeaderText="Lot40">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot40" SortExpression="lot40" HeaderText="Lot40">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot41" SortExpression="lot41" HeaderText="Lot41">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot41" SortExpression="lot41" HeaderText="Lot41">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot42" SortExpression="lot42" HeaderText="Lot42">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot42" SortExpression="lot42" HeaderText="Lot42">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot43" SortExpression="lot43" HeaderText="Lot43">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot43" SortExpression="lot43" HeaderText="Lot43">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot44" SortExpression="lot44" HeaderText="Lot44">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot44" SortExpression="lot44" HeaderText="Lot44">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot45" SortExpression="lot45" HeaderText="Lot45">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot45" SortExpression="lot45" HeaderText="Lot45">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot46" SortExpression="lot46" HeaderText="Lot46">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot46" SortExpression="lot46" HeaderText="Lot46">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot47" SortExpression="lot47" HeaderText="Lot47">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot47" SortExpression="lot47" HeaderText="Lot47">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot48" SortExpression="lot48" HeaderText="Lot48">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot48" SortExpression="lot48" HeaderText="Lot48">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lot49" SortExpression="lot49" HeaderText="Lot49">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot49" SortExpression="lot49" HeaderText="Lot49">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--  <asp:BoundColumn DataField="lot50" SortExpression="lot50" HeaderText="Lot50">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot50" SortExpression="lot50" HeaderText="Lot50">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot51" SortExpression="lot51" HeaderText="Lot51">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot51" SortExpression="lot51" HeaderText="Lot51">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot52" SortExpression="lot52" HeaderText="Lot52">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot52" SortExpression="lot52" HeaderText="Lot52">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot53" SortExpression="lot53" HeaderText="Lot53">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot53" SortExpression="lot53" HeaderText="Lot53">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot54" SortExpression="lot54" HeaderText="Lot54">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot54" SortExpression="lot54" HeaderText="Lot54">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot55" SortExpression="lot55" HeaderText="Lot55">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot55" SortExpression="lot55" HeaderText="Lot55">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--  <asp:BoundColumn DataField="lot56" SortExpression="lot56" HeaderText="Lot56">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot56" SortExpression="lot56" HeaderText="Lot56">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--<asp:BoundColumn DataField="lot57" SortExpression="lot57" HeaderText="Lot57">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot57" SortExpression="lot57" HeaderText="Lot57">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--  <asp:BoundColumn DataField="lot58" SortExpression="lot58" HeaderText="Lot58">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot58" SortExpression="lot58" HeaderText="Lot58">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--  <asp:BoundColumn DataField="lot59" SortExpression="lot59" HeaderText="Lot59">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%><telerik:GridBoundColumn DataField="lot59" SortExpression="lot59"
            HeaderText="Lot59">
            <HeaderStyle Wrap="False"></HeaderStyle>
            <ItemStyle Wrap="False"></ItemStyle>
        </telerik:GridBoundColumn>
                    <%--  <asp:BoundColumn DataField="lot60" SortExpression="lot60" HeaderText="Lot60">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lot60" SortExpression="lot60" HeaderText="Lot60">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="length" SortExpression="length" HeaderText="Length" DataFormatString="{0:#,0.####}">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="length" SortExpression="length" HeaderText="Length"
                        DataFormatString="{0:#,0.####}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="width" SortExpression="width" HeaderText="Width" DataFormatString="{0:#,0.####}">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="width" SortExpression="width" HeaderText="Width"
                        DataFormatString="{0:#,0.####}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="height" SortExpression="height" HeaderText="Height" DataFormatString="{0:#,0.####}">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="height" SortExpression="height" HeaderText="Height"
                        DataFormatString="{0:#,0.####}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--   <asp:BoundColumn DataField="vol" SortExpression="vol" HeaderText="Vol." DataFormatString="{0:#,0.####}">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="vol" SortExpression="vol" HeaderText="Vol." DataFormatString="{0:#,0.####}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="wt" SortExpression="wt" HeaderText="Wt." DataFormatString="{0:#,0.####}">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="wt" SortExpression="wt" HeaderText="Wt." DataFormatString="{0:#,0.####}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="netwt" SortExpression="netwt" HeaderText="Net Wt." DataFormatString="{0:#,0.####}">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="netwt" SortExpression="netwt" HeaderText="Net Wt."
                        DataFormatString="{0:#,0.####}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%-- <asp:BoundColumn DataField="lotskudescr" SortExpression="lotskudescr" HeaderText="SKU Descr."
          DataFormatString="{0:#,0.####}">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lotskudescr" SortExpression="lotskudescr" HeaderText="SKU Descr."
                        DataFormatString="{0:#,0.####}">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--  <asp:BoundColumn DataField="lotuom" SortExpression="lotuom" HeaderText="LotUOM">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>--%>
                    <telerik:GridBoundColumn DataField="lotuom" SortExpression="lotuom" HeaderText="LotUOM">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <%--</Columns>--%>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid></div>
    <%--    <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>--%>
    <%-- </asp:DataGrid>
  </div>--%>
    </form>
</body>
</html>
