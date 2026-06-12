<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="TripPlanningTimeBlock.aspx.cs"
    Inherits="iWMS.Web.Job.TripPlanning.TripPlanningTimeBlock" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title id="title1" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
        <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    </meta>
    <style type="text/css">
        .style2 {
            width: 125px;
        }
    </style>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <script type="text/javascript">
        function popupDetail(id) {
            if (id.toString().trim() != "0") {
                var openWnd = radopen("TripDetail2.aspx?id=" + id + "&srcpage=TripPlanningTimeBlock", "RadWindowDetails");
                return false;
                //window.open("TripDetail2.aspx?id=" + id, "myWindow", "dialogWidth:1400px;dialogHeight:800px;status:no;dialogHide:true;help:no;scroll:yes;resizable=yes;")                
            }
        }

        function popupSchedule(id, date) {
            var strReturn;
            strReturn = window.showModalDialog("VehBookingSchedule.aspx?vehno=" + id + "&date=" + date, "myWindow", "dialogWidth:1000px;dialogHeight:500px;status:no;dialogHide:true;help:no;scroll:yes;resizable=yes;")
            if (strReturn != null) document.getElementById('HIDDEN_date').value = strReturn;
            window.reload(true);
        }

        $(document).ready(function () {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function () {
                $(".show_hide_Detail").slideToggle();
            });
        });
    </script>

</head>
<body id="bdy" bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" runat="server">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
            <Windows>
                <telerik:RadWindow ID="RadWindowDetails" VisibleOnPageLoad="false" Width="1400px" Height="750px" Modal="true" Behaviors="Move, Close" runat="server" CenterIfModal="false"
                    Left="20px" Top="20px">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>
        <table width="100%">
            <tr>
                <td class="style1">
                    <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs
                        ID="MenuTabs" runat="server"></iWMS:Tabs>
                    </a>
                </td>
                <td class="NewModuleTitle" align="right">
                    <asp:Label ID="MenuLbl" runat="server">Trip Time Block</asp:Label>
                </td>
            </tr>
        </table>
        <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header" align="center">
            <asp:Label ID="lblText" Text=" Hide / Show Search Filters" runat="server" />
            <asp:Label ID="lblProcessID" runat="server" Visible="False"></asp:Label>
        </asp:Panel>
        <br />
        <div id="div1" runat="server">
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td class="style2">
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        <input id="HIDDEN_date" type="hidden" runat="server" />
                    </td>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="30%">
                                    <asp:CheckBox ID="showTdy_cbox" runat="server" Text="ShowOnlyToday" />
                                </td>
                                <td width="30%">
                                    <asp:Button Style="z-index: 0" ID="refreshBtn" runat="server" CssClass="white"
                                        Text="Refresh" OnClick="refreshBtn_Click"></asp:Button>
                                    &nbsp;&nbsp;&nbsp;
                                </td>
                                <td width="40%">
                                    <asp:Button Style="z-index: 0" ID="CompleteAllAssignedBtn" runat="server" CssClass="detailbutton"
                                        Text="CompleteAllAssigned" OnClick="CompleteAllAssignedBtn_Click" Visible="false"
                                        ForeColor="Red" OnClientClick="return confirm('Confirm to Complete All Assigned Trip?')"></asp:Button>
                                    &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="ExcelBtn" runat="server" Text="Excel" Visible="false" CssClass="detailButton"
                                    OnClick="ExcelBtn_Click"></asp:Button>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                                <td colspan="2" height="5px">
                                    <br />
                                    <asp:Label ID="LastLbl" runat="server">Last refresh</asp:Label>:
                                <asp:Label ID="LastRefreshLbl" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" height="5px"></td>
                            </tr>
                            <tr>
                                <td colspan="2" height="5px"></td>
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div id="div-datagrid">
            <!-- style="height: 20%" -->
            <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                GridLines="Both" CellPadding="2" UseAccessibleHeader="True" HorizontalAlign="Center">
                <AlternatingItemStyle CssClass="DGItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DGAlternateItem"></ItemStyle>
                <Columns>
                    <asp:TemplateColumn>
                        <HeaderTemplate>
                            No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex + 1%>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Vehicle" ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:LinkButton ForeColor="Black" ID="vehno1" runat="server" Text='<%#Eval("vehno") %>' OnCommand="RadWindow_Popup" CommandName="RowClick"
                                ToolTip='Click to view booking schedule' CommandArgument='<%# Eval("vehno") + "," + Eval("TripDate")  %>' />
                            <asp:Label ID="vehno" Text='<%#Eval("vehno") %>' runat="server" Visible="false" />
                            <asp:Label ID="vehtype" Text='<%#Eval("vehtype") %>' runat="server" />
                            <asp:Label ID="vehcolor" Text='<%#Eval("vehcolor") %>' runat="server" Visible="false" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>
        </div>
        <%--<div id="div-datagrid"> <!-- style="height: 20%" -->
        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None"
            GridLines="Both" CellPadding="2" UseAccessibleHeader="True" HorizontalAlign="Center">
            <AlternatingItemStyle CssClass="DGItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGAlternateItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex + 1%>
                    </ItemTemplate>
                </asp:TemplateColumn> <asp:TemplateColumn HeaderText="Vehicle" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="vehno" Text= '<%#Eval("vehno") %>' runat="server"/>
                        <asp:Label ID="vehtype" Text= '<%#Eval("vehtype") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="A" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname1" runat="server" Text='<%#Eval("s1Job") %>'
                            ToolTip='<%#Eval("s1Job") %>' OnClientClick='<%# Eval("s1CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp; 
                        <asp:Label ID="s1ctnrno" Text= '<%#Eval("s1ctnrno") %>' runat="server"/> &nbsp;
                        <asp:Label ID="s1ctnrtype" Text= '<%#Eval("s1ctnrtype") %>' runat="server"/><br />                         
                        <asp:Label ID="S1SvcPtFrTo" Text= '<%#Eval("S1SvcPtFrTo") %>' runat="server"/>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="B" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname2" runat="server" Text='<%#Eval("s2Job") %>'
                            ToolTip='<%#Eval("s2Job") %>' OnClientClick='<%# Eval("s2CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp; 
                        <asp:Label ID="s2ctnrno" Text= '<%#Eval("s2ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s2ctnrtype" Text= '<%#Eval("s2ctnrtype") %>' runat="server"/><br />                       
                        <asp:Label ID="S2SvcPtFrTo" Text= '<%#Eval("S2SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="C" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname3" runat="server" Text='<%#Eval("s3Job") %>'
                            ToolTip='<%#Eval("s3Job") %>' OnClientClick='<%# Eval("s3CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;        
                        <asp:Label ID="s3ctnrno" Text= '<%#Eval("s3ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s3ctnrtype" Text= '<%#Eval("s3ctnrtype") %>' runat="server"/><br />                      
                        <asp:Label ID="S3SvcPtFrTo" Text= '<%#Eval("S3SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="D" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname4" runat="server" Text='<%#Eval("s4Job") %>'
                            ToolTip='<%#Eval("s4Job") %>' OnClientClick='<%# Eval("s4CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;  
                        <asp:Label ID="s4ctnrno" Text= '<%#Eval("s4ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s4ctnrtype" Text= '<%#Eval("s4ctnrtype") %>' runat="server"/><br />                             
                        <asp:Label ID="S4SvcPtFrTo" Text= '<%#Eval("S4SvcPtFrTo") %>' runat="server"/>   
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="E" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname5" runat="server" Text='<%#Eval("s5Job") %>'
                            ToolTip='<%#Eval("s5Job") %>' OnClientClick='<%# Eval("s5CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;   
                        <asp:Label ID="s5ctnrno" Text= '<%#Eval("s5ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s5ctnrtype" Text= '<%#Eval("s5ctnrtype") %>' runat="server"/><br />                            
                        <asp:Label ID="S5SvcPtFrTo" Text= '<%#Eval("S5SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="F" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname6" runat="server" Text='<%#Eval("s6Job") %>'
                            ToolTip='<%#Eval("s6Job") %>' OnClientClick='<%# Eval("s6CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s6ctnrno" Text= '<%#Eval("s6ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s6ctnrtype" Text= '<%#Eval("s6ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S6SvcPtFrTo" Text= '<%#Eval("S6SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="G" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname7" runat="server" Text='<%#Eval("s7Job") %>'
                            ToolTip='<%#Eval("s7Job") %>' OnClientClick='<%# Eval("s7CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;  
                        <asp:Label ID="s7ctnrno" Text= '<%#Eval("s7ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s7ctnrtype" Text= '<%#Eval("s7ctnrtype") %>' runat="server"/><br />                             
                        <asp:Label ID="S7SvcPtFrTo" Text= '<%#Eval("S7SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="H" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname8" runat="server" Text='<%#Eval("s8Job") %>'
                            ToolTip='<%#Eval("s8Job") %>' OnClientClick='<%# Eval("s8CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;  
                        <asp:Label ID="s8ctnrno" Text= '<%#Eval("s8ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s8ctnrtype" Text= '<%#Eval("s8ctnrtype") %>' runat="server"/><br />                             
                        <asp:Label ID="S8SvcPtFrTo" Text= '<%#Eval("S8SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="I" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname9" runat="server" Text='<%#Eval("s9Job") %>'
                            ToolTip='<%#Eval("s9Job") %>' OnClientClick='<%# Eval("s9CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;     
                        <asp:Label ID="s9ctnrno" Text= '<%#Eval("s9ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s9ctnrtype" Text= '<%#Eval("s9ctnrtype") %>' runat="server"/><br />                           
                        <asp:Label ID="S9SvcPtFrTo" Text= '<%#Eval("S9SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="J" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname10" runat="server" Text='<%#Eval("s10Job") %>'
                            ToolTip='<%#Eval("s10Job") %>' OnClientClick='<%# Eval("s10CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;  
                        <asp:Label ID="s10ctnrno" Text= '<%#Eval("s10ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s10ctnrtype" Text= '<%#Eval("s10ctnrtype") %>' runat="server"/><br />                             
                        <asp:Label ID="S10SvcPtFrTo" Text= '<%#Eval("S10SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="K" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname11" runat="server" Text='<%#Eval("s11Job") %>'
                            ToolTip='<%#Eval("s11Job") %>' OnClientClick='<%# Eval("s11CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;     
                        <asp:Label ID="s11ctnrno" Text= '<%#Eval("s11ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s11ctnrtype" Text= '<%#Eval("s11ctnrtype") %>' runat="server"/><br />                          
                        <asp:Label ID="S11SvcPtFrTo" Text= '<%#Eval("S11SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="L" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname12" runat="server" Text='<%#Eval("s12Job") %>'
                            ToolTip='<%#Eval("s12Job") %>' OnClientClick='<%# Eval("s12CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;   
                        <asp:Label ID="s12ctnrno" Text= '<%#Eval("s12ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s12ctnrtype" Text= '<%#Eval("s12ctnrtype") %>' runat="server"/><br />                            
                        <asp:Label ID="S12SvcPtFrTo" Text= '<%#Eval("S12SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="M" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname13" runat="server" Text='<%#Eval("s13Job") %>'
                            ToolTip='<%#Eval("s13Job") %>' OnClientClick='<%# Eval("s13CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;  
                        <asp:Label ID="s13ctnrno" Text= '<%#Eval("s13ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s13ctnrtype" Text= '<%#Eval("s13ctnrtype") %>' runat="server"/><br />                             
                        <asp:Label ID="S13SvcPtFrTo" Text= '<%#Eval("S13SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="N" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname14" runat="server" Text='<%#Eval("s14Job") %>'
                            ToolTip='<%#Eval("s14Job") %>' OnClientClick='<%# Eval("s14CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp; 
                        <asp:Label ID="s14ctnrno" Text= '<%#Eval("s14ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s14ctnrtype" Text= '<%#Eval("s14ctnrtype") %>' runat="server"/><br />                              
                        <asp:Label ID="S14SvcPtFrTo" Text= '<%#Eval("S14SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="O" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname15" runat="server" Text='<%#Eval("s15Job") %>'
                            ToolTip='<%#Eval("s15Job") %>' OnClientClick='<%# Eval("s15CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;    
                        <asp:Label ID="s15ctnrno" Text= '<%#Eval("s15ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s15ctnrtype" Text= '<%#Eval("s15ctnrtype") %>' runat="server"/><br />                           
                        <asp:Label ID="S15SvcPtFrTo" Text= '<%#Eval("S15SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="P" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname16" runat="server" Text='<%#Eval("s16Job") %>'
                            ToolTip='<%#Eval("s16Job") %>' OnClientClick='<%# Eval("s16CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;   
                        <asp:Label ID="s16ctnrno" Text= '<%#Eval("s16ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s16ctnrtype" Text= '<%#Eval("s16ctnrtype") %>' runat="server"/><br />                            
                        <asp:Label ID="S16SvcPtFrTo" Text= '<%#Eval("S16SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Q" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname17" runat="server" Text='<%#Eval("s17Job") %>'
                            ToolTip='<%#Eval("s17Job") %>' OnClientClick='<%# Eval("s17CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;         
                        <asp:Label ID="s17ctnrno" Text= '<%#Eval("s17ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s17ctnrtype" Text= '<%#Eval("s17ctnrtype") %>' runat="server"/><br />                      
                        <asp:Label ID="S17SvcPtFrTo" Text= '<%#Eval("S17SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="R" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname18" runat="server" Text='<%#Eval("s18Job") %>'
                            ToolTip='<%#Eval("s18Job") %>' OnClientClick='<%# Eval("s18CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp; 
                        <asp:Label ID="s18ctnrno" Text= '<%#Eval("s18ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s18ctnrtype" Text= '<%#Eval("s18ctnrtype") %>' runat="server"/><br />                              
                        <asp:Label ID="S18SvcPtFrTo" Text= '<%#Eval("S18SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="S" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname19" runat="server" Text='<%#Eval("s19Job") %>'
                            ToolTip='<%#Eval("s19Job") %>' OnClientClick='<%# Eval("s19CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;     
                        <asp:Label ID="s19ctnrno" Text= '<%#Eval("s19ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s19ctnrtype" Text= '<%#Eval("s19ctnrtype") %>' runat="server"/><br />                          
                        <asp:Label ID="S19SvcPtFrTo" Text= '<%#Eval("S19SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="T" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname20" runat="server" Text='<%#Eval("s20Job") %>'
                            ToolTip='<%#Eval("s20Job") %>' OnClientClick='<%# Eval("s20CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;   
                        <asp:Label ID="s20ctnrno" Text= '<%#Eval("s20ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s20ctnrtype" Text= '<%#Eval("s20ctnrtype") %>' runat="server"/><br />                            
                        <asp:Label ID="S20SvcPtFrTo" Text= '<%#Eval("S20SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="U" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname21" runat="server" Text='<%#Eval("s21Job") %>'
                            ToolTip='<%#Eval("s21Job") %>' OnClientClick='<%# Eval("s21CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp; 
                        <asp:Label ID="s21ctnrno" Text= '<%#Eval("s21ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s21ctnrtype" Text= '<%#Eval("s21ctnrtype") %>' runat="server"/><br />                              
                        <asp:Label ID="S21SvcPtFrTo" Text= '<%#Eval("S21SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="V" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname22" runat="server" Text='<%#Eval("s22Job") %>'
                            ToolTip='<%#Eval("s22Job") %>' OnClientClick='<%# Eval("s22CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp; 
                        <asp:Label ID="s22ctnrno" Text= '<%#Eval("s22ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s22ctnrtype" Text= '<%#Eval("s22ctnrtype") %>' runat="server"/><br />                              
                        <asp:Label ID="S22SvcPtFrTo" Text= '<%#Eval("S22SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="W" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname23" runat="server" Text='<%#Eval("s23Job") %>'
                            ToolTip='<%#Eval("s23Job") %>' OnClientClick='<%# Eval("s23CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;  
                        <asp:Label ID="s23ctnrno" Text= '<%#Eval("s23ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s23ctnrtype" Text= '<%#Eval("s23ctnrtype") %>' runat="server"/><br />                             
                        <asp:Label ID="S23SvcPtFrTo" Text= '<%#Eval("S23SvcPtFrTo") %>' runat="server"/>  
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="X" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname24" runat="server" Text='<%#Eval("s24Job") %>'
                            ToolTip='<%#Eval("s24Job") %>' OnClientClick='<%# Eval("s24CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s24ctnrno" Text= '<%#Eval("s24ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s24ctnrtype" Text= '<%#Eval("s24ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S24SvcPtFrTo" Text= '<%#Eval("S24SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Y" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname25" runat="server" Text='<%#Eval("s25Job") %>'
                            ToolTip='<%#Eval("s25Job") %>' OnClientClick='<%# Eval("s25CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s25ctnrno" Text= '<%#Eval("s25ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s25ctnrtype" Text= '<%#Eval("s25ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S25SvcPtFrTo" Text= '<%#Eval("S25SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Z" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname26" runat="server" Text='<%#Eval("s26Job") %>'
                            ToolTip='<%#Eval("s26Job") %>' OnClientClick='<%# Eval("s26CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s26ctnrno" Text= '<%#Eval("s26ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s26ctnrtype" Text= '<%#Eval("s26ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S26SvcPtFrTo" Text= '<%#Eval("S26SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AA" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname27" runat="server" Text='<%#Eval("s27Job") %>'
                            ToolTip='<%#Eval("s27Job") %>' OnClientClick='<%# Eval("s27CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s27ctnrno" Text= '<%#Eval("s27ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s27ctnrtype" Text= '<%#Eval("s27ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S27SvcPtFrTo" Text= '<%#Eval("S27SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AB" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname28" runat="server" Text='<%#Eval("s28Job") %>'
                            ToolTip='<%#Eval("s28Job") %>' OnClientClick='<%# Eval("s28CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s28ctnrno" Text= '<%#Eval("s28ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s28ctnrtype" Text= '<%#Eval("s28ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S28SvcPtFrTo" Text= '<%#Eval("S28SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AC" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname29" runat="server" Text='<%#Eval("s29Job") %>'
                            ToolTip='<%#Eval("s29Job") %>' OnClientClick='<%# Eval("s29CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s29ctnrno" Text= '<%#Eval("s29ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s29ctnrtype" Text= '<%#Eval("s29ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S29SvcPtFrTo" Text= '<%#Eval("S29SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AD" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname30" runat="server" Text='<%#Eval("s30Job") %>'
                            ToolTip='<%#Eval("s30Job") %>' OnClientClick='<%# Eval("s30CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s30ctnrno" Text= '<%#Eval("s30ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s30ctnrtype" Text= '<%#Eval("s30ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S30SvcPtFrTo" Text= '<%#Eval("S30SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AE" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname31" runat="server" Text='<%#Eval("s31Job") %>'
                            ToolTip='<%#Eval("s31Job") %>' OnClientClick='<%# Eval("s31CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s31ctnrno" Text= '<%#Eval("s31ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s31ctnrtype" Text= '<%#Eval("s31ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S31SvcPtFrTo" Text= '<%#Eval("S31SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AF" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname32" runat="server" Text='<%#Eval("s32Job") %>'
                            ToolTip='<%#Eval("s32Job") %>' OnClientClick='<%# Eval("s32CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s32ctnrno" Text= '<%#Eval("s32ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s32ctnrtype" Text= '<%#Eval("s32ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S32SvcPtFrTo" Text= '<%#Eval("S32SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AG" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname33" runat="server" Text='<%#Eval("s33Job") %>'
                            ToolTip='<%#Eval("s33Job") %>' OnClientClick='<%# Eval("s33CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s33ctnrno" Text= '<%#Eval("s33ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s33ctnrtype" Text= '<%#Eval("s33ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S33SvcPtFrTo" Text= '<%#Eval("S33SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AH" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname34" runat="server" Text='<%#Eval("s34Job") %>'
                            ToolTip='<%#Eval("s34Job") %>' OnClientClick='<%# Eval("s34CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s34ctnrno" Text= '<%#Eval("s34ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s34ctnrtype" Text= '<%#Eval("s34ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S34SvcPtFrTo" Text= '<%#Eval("S34SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AI" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname35" runat="server" Text='<%#Eval("s35Job") %>'
                            ToolTip='<%#Eval("s35Job") %>' OnClientClick='<%# Eval("s35CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s35ctnrno" Text= '<%#Eval("s35ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s35ctnrtype" Text= '<%#Eval("s35ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S35SvcPtFrTo" Text= '<%#Eval("S35SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AJ" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname36" runat="server" Text='<%#Eval("s36Job") %>'
                            ToolTip='<%#Eval("s36Job") %>' OnClientClick='<%# Eval("s36CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s36ctnrno" Text= '<%#Eval("s36ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s36ctnrtype" Text= '<%#Eval("s36ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S36SvcPtFrTo" Text= '<%#Eval("S36SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AK" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname37" runat="server" Text='<%#Eval("s37Job") %>'
                            ToolTip='<%#Eval("s37Job") %>' OnClientClick='<%# Eval("s37CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s37ctnrno" Text= '<%#Eval("s37ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s37ctnrtype" Text= '<%#Eval("s37ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S37SvcPtFrTo" Text= '<%#Eval("S37SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AL" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname38" runat="server" Text='<%#Eval("s38Job") %>'
                            ToolTip='<%#Eval("s38Job") %>' OnClientClick='<%# Eval("s38CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s38ctnrno" Text= '<%#Eval("s38ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s38ctnrtype" Text= '<%#Eval("s38ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S38SvcPtFrTo" Text= '<%#Eval("S38SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AM" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname39" runat="server" Text='<%#Eval("s39Job") %>'
                            ToolTip='<%#Eval("s39Job") %>' OnClientClick='<%# Eval("s39CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s39ctnrno" Text= '<%#Eval("s39ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s39ctnrtype" Text= '<%#Eval("s39ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S39SvcPtFrTo" Text= '<%#Eval("S39SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AN" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname40" runat="server" Text='<%#Eval("s40Job") %>'
                            ToolTip='<%#Eval("s40Job") %>' OnClientClick='<%# Eval("s40CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s40ctnrno" Text= '<%#Eval("s40ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s40ctnrtype" Text= '<%#Eval("s40ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S40SvcPtFrTo" Text= '<%#Eval("S40SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AO" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname41" runat="server" Text='<%#Eval("s41Job") %>'
                            ToolTip='<%#Eval("s41Job") %>' OnClientClick='<%# Eval("s41CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s41ctnrno" Text= '<%#Eval("s41ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s41ctnrtype" Text= '<%#Eval("s41ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S41SvcPtFrTo" Text= '<%#Eval("S41SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AP" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname42" runat="server" Text='<%#Eval("s42Job") %>'
                            ToolTip='<%#Eval("s42Job") %>' OnClientClick='<%# Eval("s42CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s42ctnrno" Text= '<%#Eval("s42ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s42ctnrtype" Text= '<%#Eval("s42ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S42SvcPtFrTo" Text= '<%#Eval("S42SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AQ" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname43" runat="server" Text='<%#Eval("s43Job") %>'
                            ToolTip='<%#Eval("s43Job") %>' OnClientClick='<%# Eval("s43CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s43ctnrno" Text= '<%#Eval("s43ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s43ctnrtype" Text= '<%#Eval("s43ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S43SvcPtFrTo" Text= '<%#Eval("S43SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AR" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname44" runat="server" Text='<%#Eval("s44Job") %>'
                            ToolTip='<%#Eval("s44Job") %>' OnClientClick='<%# Eval("s44CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s44ctnrno" Text= '<%#Eval("s44ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s44ctnrtype" Text= '<%#Eval("s44ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S44SvcPtFrTo" Text= '<%#Eval("S44SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AS" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname45" runat="server" Text='<%#Eval("s45Job") %>'
                            ToolTip='<%#Eval("s45Job") %>' OnClientClick='<%# Eval("s45CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s45ctnrno" Text= '<%#Eval("s45ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s45ctnrtype" Text= '<%#Eval("s45ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S45SvcPtFrTo" Text= '<%#Eval("S45SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AT" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname46" runat="server" Text='<%#Eval("s46Job") %>'
                            ToolTip='<%#Eval("s46Job") %>' OnClientClick='<%# Eval("s46CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s46ctnrno" Text= '<%#Eval("s46ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s46ctnrtype" Text= '<%#Eval("s46ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S46SvcPtFrTo" Text= '<%#Eval("S46SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AU" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname47" runat="server" Text='<%#Eval("s47Job") %>'
                            ToolTip='<%#Eval("s47Job") %>' OnClientClick='<%# Eval("s47CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s47ctnrno" Text= '<%#Eval("s47ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s47ctnrtype" Text= '<%#Eval("s47ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S47SvcPtFrTo" Text= '<%#Eval("S47SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AV" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname48" runat="server" Text='<%#Eval("s48Job") %>'
                            ToolTip='<%#Eval("s48Job") %>' OnClientClick='<%# Eval("s48CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s48ctnrno" Text= '<%#Eval("s48ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s48ctnrtype" Text= '<%#Eval("s48ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S48SvcPtFrTo" Text= '<%#Eval("S48SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AV" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname49" runat="server" Text='<%#Eval("s49Job") %>'
                            ToolTip='<%#Eval("s49Job") %>' OnClientClick='<%# Eval("s49CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s49ctnrno" Text= '<%#Eval("s49ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s49ctnrtype" Text= '<%#Eval("s49ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S49SvcPtFrTo" Text= '<%#Eval("S49SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="AX" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname50" runat="server" Text='<%#Eval("s50Job") %>'
                            ToolTip='<%#Eval("s50Job") %>' OnClientClick='<%# Eval("s50CtrId", "return popupDetail(\"{0}\");") %>' />  &nbsp;       
                        <asp:Label ID="s50ctnrno" Text= '<%#Eval("s50ctnrno") %>' runat="server"/>&nbsp;
                        <asp:Label ID="s50ctnrtype" Text= '<%#Eval("s50ctnrtype") %>' runat="server"/><br />                        
                        <asp:Label ID="S50SvcPtFrTo" Text= '<%#Eval("S50SvcPtFrTo") %>' runat="server"/> 
                    </ItemTemplate>
                </asp:TemplateColumn>
                
                <asp:BoundColumn DataField="vehcolor" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s1Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s2Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s3Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s4Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s5Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s6Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s7Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s8Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s9Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s10Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s11Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s12Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s13Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s14Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s15Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s16Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s17Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s18Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s19Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s20Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s21Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s22Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s23Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s24Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s25Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s26Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s27Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s28Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s29Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s30Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s31Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s32Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s33Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s34Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s35Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s36Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s37Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s38Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s39Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s40Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s41Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s42Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s43Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s44Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s45Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s46Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s47Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s48Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s49Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s50Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s1JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s2JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s3JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s4JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s5JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s6JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s7JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s8JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s9JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s10JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s11JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s12JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s13JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s14JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s15JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s16JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s17JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s18JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s19JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s20JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s21JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s22JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s23JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s24JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s25JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s26JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s27JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s28JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s29JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s30JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s31JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s32JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s33JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s34JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s35JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s36JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s37JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s38JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s39JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s40JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s41JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s42JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s43JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s44JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s45JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s46JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s47JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s48JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s49JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s50JobDesc" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s1SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s2SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s3SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s4SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s5SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s6SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s7SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s8SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s9SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s10SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s11SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s12SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s13SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s14SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s15SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s16SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s17SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s18SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s19SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s20SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s21SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s22SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s23SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s24SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s25SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s26SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s27SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s28SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s29SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s30SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s31SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s32SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s33SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s34SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s35SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s36SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s37SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s38SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s39SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s40SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s41SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s42SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s43SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s44SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s45SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s46SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s47SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s48SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s49SpecInstr" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s50SpecInstr" Visible="False"></asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </div>--%>
    </form>
</body>
</html>
