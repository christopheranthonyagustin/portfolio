<%@ Page Language="c#" CodeBehind="ListDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.App.List.ListDetl" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html>
<head runat="server">
    <title>ListDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td class="pagetitle">
                &nbsp;<asp:Label ID="ListCodeLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="height: 10px;" />
        </tr>
        <tr>
             <td>
                 &nbsp;
                    <asp:Button ID="AddDetailBtn" CssClass="white" runat="server" OnClick="AddDetailBtn_Click" Visible="True" 
                        Text="New" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"  />
              </td>
              <td>
                         &nbsp;
                        <asp:Button ID="InactiveBtn" CssClass="white" runat="server" OnClick="InactiveBtn_Click" Visible="True" 
                            Text="Inactive" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"  />
              </td>
              <td>
                         &nbsp;
                        <asp:Button ID="ActiveBtn" CssClass="white" runat="server" OnClick="ActiveBtn_Click" Visible="True" 
                            Text="Active" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"  />
              </td>
         </tr>
     </table>
        
     <table>        
         <tr>
             <td>
                <asp:Panel ID="AddPanel" runat="server" Visible="False">
                 <a name="#AddDetailBtn"></a>
                 <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                 <tr>
                   <td colspan="3" align="left">
                   &nbsp;                               
                   <asp:Button ID="SaveNextBtn" CssClass="white" runat="server" OnClick="SaveNextBtn_Click"
                         Text="Save &amp; Next" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false"  />
                               &nbsp;                               
                              <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click"
                                   Text="Save" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false"  />
                                    &nbsp;                                
                                <asp:Button ID="ClosePanelBtn" CssClass="white" runat="server" OnClick="ClosePanelBtn_Click" CausesValidation="false"
                                     Text="Hide" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"  />
                   </td>
                   <td colspan="2" align="left">
                        <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                   </td>
                </tr>
                <tr>
                    <td nowrap>
                                Account:<br>
                                <telerik:RadDropDownList ID="AccountList" runat="server" Skin="WebBlue">
                                </telerik:RadDropDownList>
                                <telerik:RadTextBox runat="server" ID="AllTxt" Width="200px" ReadOnly="True" Text='All'>
                                </telerik:RadTextBox>
                    </td>
                    <td nowrap>
                                Item:
                                <asp:RequiredFieldValidator ID="ItemVal" runat="server" ControlToValidate="ItemTxt"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                <telerik:RadTextBox ID="ItemTxt" runat="server" BackColor="Yellow">
                                </telerik:RadTextBox>
                     </td>
                     <td nowrap>
                                Description:
                                <br>
                                <telerik:RadTextBox ID="DescrTxt" runat="server">
                                </telerik:RadTextBox>
                      </td>
                            <td nowrap>
                                Status:
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="StatusList"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br><br>
                                <telerik:RadDropDownList ID="StatusList" runat="server" Skin="WebBlue">
                                </telerik:RadDropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap>
                                <asp:Label ID="usrdef1lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef1Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef2lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef2Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef3lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef3Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef4lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef4Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef5lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef5Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap>
                                <asp:Label ID="usrdef6lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef6Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef7lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef7Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef8lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef8Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef9lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef9Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef10lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef10Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap>
                                <asp:Label ID="usrdef11lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef11Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef12lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef12Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef13lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef13Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef14lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef14Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef15lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef15Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap>
                                <asp:Label ID="usrdef16lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef16Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef17lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef17Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef18lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef18Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef19lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef19Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                            <td nowrap>
                                <asp:Label ID="usrdef20lbl" runat="server"></asp:Label><br>
                                <telerik:RadTextBox ID="UserDef20Txt" runat="server">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <br>
    <div style="height: 80%" id="div-datagrid">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
            AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="200" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="..\..\image\pencil.gif"
                                Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Issue Detail"
                                ToolTip="Edit Issue Detail" OnClick="ldEdit_Click" CausesValidation="False">
                            </asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete list detail?')"
                                onserverclick="ListDetail_Delete" runat="server">
                                <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete List Detail"
                                    title="Delete List Detail" runat="server" /></a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <HeaderTemplate>
                            No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="acid" Display="False" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="item" SortExpression="item" HeaderText="Item"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Description"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef01" SortExpression="usrdef01" HeaderText="User Def.01"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef02" SortExpression="usrdef02" HeaderText="User Def.02"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef03" SortExpression="usrdef03" HeaderText="User Def.03"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef04" SortExpression="usrdef04" HeaderText="User Def.04"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef05" SortExpression="usrdef05" HeaderText="User Def.05"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef06" SortExpression="usrdef06" HeaderText="User Def.06"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef07" SortExpression="usrdef07" HeaderText="User Def.07"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef08" SortExpression="usrdef08" HeaderText="User Def.08"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef09" SortExpression="usrdef09" HeaderText="User Def.09"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef10" SortExpression="usrdef10" HeaderText="User Def.10"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef11" SortExpression="usrdef11" HeaderText="UserDef.11">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef12" SortExpression="usrdef12" HeaderText="UserDef.12">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef13" SortExpression="usrdef13" HeaderText="UserDef.13">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef14" SortExpression="usrdef14" HeaderText="UserDef.14">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef15" SortExpression="usrdef15" HeaderText="UserDef.15">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef16" SortExpression="usrdef16" HeaderText="UserDef.16">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef17" SortExpression="usrdef17" HeaderText="UserDef.17">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef18" SortExpression="usrdef18" HeaderText="UserDef.18">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef19" SortExpression="usrdef19" HeaderText="UserDef.19">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="usrdef20" SortExpression="usrdef20" HeaderText="UserDef.20">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
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
                    <telerik:GridBoundColumn DataField="id" Display="False" ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                    </telerik:GridBoundColumn>
                    
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxtoolkit:modalpopupextender id="mpeMessagePopup" runat="server" popupcontrolid="pnlMessageBox"
        targetcontrolid="btnMessagePopupTargetButton" okcontrolid="btnOk" cancelcontrolid="btnCancel"
        backgroundcssclass="MessageBoxPopupBackground">
    </ajaxtoolkit:modalpopupextender>
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
