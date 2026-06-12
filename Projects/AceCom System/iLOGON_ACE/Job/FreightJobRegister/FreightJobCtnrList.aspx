<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightJobCtnrList.aspx.cs" Inherits="iWMS.Web.Job.FreightJobRegister.FreightJobCtnrList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title> Choose-a-Tank pop-up</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />

    
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
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    
    <telerik:radgrid id="ResultDG" runat="server" autogeneratecolumns="false" gridlines="None"
        onneeddatasource="ResultDG_NeedDataSource" allowpaging="false" allowsorting="true"
        allowfilteringbycolumn="true" skin="Office2007" onitemdatabound="ResultDG_ItemDataBound">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <HeaderStyle Wrap="False" HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <asp:CheckBox ID="SelectALLCB" runat="server" Checked="true" onclick="selectAll(this)" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" Checked="true"/>                    
                    </ItemTemplate>
                    <ItemStyle Wrap="false" />
                </telerik:GridTemplateColumn>    
                 <telerik:GridBoundColumn HeaderText="JbblId" DataField="jbblid" AllowFiltering="false" Display="false">                  
                </telerik:GridBoundColumn>            
                <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="ctnrno" AllowFiltering="false">                  
                </telerik:GridBoundColumn>
                 <telerik:GridTemplateColumn HeaderText="SealNo" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
               <ItemTemplate>
                           <asp:TextBox ID="SealNoTxt" runat="server" Width="100"  Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrsealno", "") %>'></asp:TextBox>
               </ItemTemplate>
               </telerik:GridTemplateColumn> 
                 <telerik:GridTemplateColumn HeaderText="TareWt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
               <ItemTemplate>
                           <asp:Label ID="IdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' Visible="false"></asp:Label>
                           <asp:TextBox ID="TareWtTxt" runat="server" Width="100"  Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrwt", "{0:#.##}") %>'></asp:TextBox>
                           <asp:CompareValidator ID="TareWtTxtCompVal" runat="server" ControlToValidate="TareWtTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
               </ItemTemplate>
               </telerik:GridTemplateColumn>              
                <telerik:GridTemplateColumn HeaderText="NetWt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
               <ItemTemplate>
                           <asp:TextBox ID="NetWtTxt" runat="server" Width="100"  Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "goodswt", "{0:#.##}") %>'></asp:TextBox>
                           <asp:CompareValidator ID="NetWtTxtCompVal" runat="server" ControlToValidate="NetWtTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
               </ItemTemplate>
               </telerik:GridTemplateColumn>
               <telerik:GridTemplateColumn HeaderText="GrossWt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
               <ItemTemplate>
                           <asp:TextBox ID="GrossWtTxt" runat="server" Width="100"  Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "grosswt", "{0:#.##}") %>'></asp:TextBox>
                           <asp:CompareValidator ID="GrossWtTxtCompVal" runat="server" ControlToValidate="GrossWtTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
               </ItemTemplate>
               </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Measurement" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
               <ItemTemplate>
                           <asp:TextBox ID="ctnrvolTxt" runat="server" Width="100"  Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrvol", "{0:#.##}") %>'></asp:TextBox>
                           <asp:CompareValidator ID="ctnrvolTxtCompVal" runat="server" ControlToValidate="ctnrvolTxt" EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
               </ItemTemplate>
               </telerik:GridTemplateColumn>                                     
            </Columns>
        </MasterTableView>
    </telerik:radgrid>
    <br /><br /><br />
    
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
        <td>&nbsp;&nbsp;&nbsp;</td>
        <td>&nbsp;&nbsp;&nbsp;</td>
        <td>&nbsp;&nbsp;&nbsp;</td>
            <td>
                <telerik:radbutton id="OkBtn" runat="server" text="Ok" visible="true"
                    cssclass="detailButton" onclick="OkBtn_Click" skin="WebBlue">
                </telerik:radbutton>  
                 &nbsp;
                <telerik:radbutton id="CancelBtn" runat="server" text="Cancel" visible="true"
                    cssclass="detailButton" onclick="CancelBtn_Click" skin="WebBlue">
                </telerik:radbutton> 
                
            </td>
      </tr>
     </table>
    </form>
</body>
</html>
