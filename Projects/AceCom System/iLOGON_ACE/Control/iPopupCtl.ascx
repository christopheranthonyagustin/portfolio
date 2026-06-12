<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="iPopupCtl.ascx.cs"
    Inherits="iWMS.Web.Control.iPopupCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
<script src="../../js/Script.js" type="text/javascript"></script>

<%--<telerik:RadButton id="InputBtn" CssClass="detailButton" Skin="WebBlue" CausesValidation="False" runat="server"></telerik:RadButton>--%>
<asp:Button ID="InputBtn" CssClass="white" runat="server" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
<asp:Label id="ImgLbl" runat="server"></asp:Label>
