<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrailerMonitorTrailerSummary.aspx.cs" Inherits="iWMS.Web.Job.TrailerMonitor.TrailerMonitorTrailerSummary" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TrailerSummary @ TrailerMonitor</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>

    <%-- <script type="text/javascript">
        //function GridCreated(sender, args) {
        //    var scrollArea = sender.GridDataDiv;
        //    var parent = $get("gridContainer");
        //    var gridHeader = sender.GridHeaderDiv;
        //    scrollArea.style.height = parent.clientHeight -
        //gridHeader.clientHeight + "px";
        //}

        function GridCreated(sender, args) {
            alert("I am an alert box!");
            var scrollArea = sender.GridDataDiv;
            var dataHeight = sender.get_masterTableView().get_element().clientHeight; if (dataHeight < 350) {
                scrollArea.style.height = dataHeight + 17 + "px";
            }
        }

    </script>--%>

    <%-- <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            $(window).resize(function () {
                alert("resize!");
                GridCreated($find('<%= ResultDG.ClientID %>')); // resize the grid on Window resize
            });

            function GridCreated(sender, args) {
                alert("I am an alert box!");

                //var parentHeight = $(window).height(); // make grid fit the Window height
               

                //var parentHeight = sender.get_element().parentElement.offsetHeight; // make grid fit its parent container height
                var scrollArea = sender.GridDataDiv;

                alert(scrollArea);

                scrollArea.style.height = "470px";
                //var gridHeaderHeight = (sender.GridHeaderDiv) ? sender.GridHeaderDiv.offsetHeight : 0;
                //var gridTopPagerHeight = (sender.TopPagerControl) ? sender.TopPagerControl.offsetHeight : 0;
                //var gridDataHeight = sender.get_masterTableView().get_element().offsetHeight;
                //var gridFooterHeight = (sender.GridFooterDiv) ? sender.GridFooterDiv.offsetHeight : 0;
                //var gridPagerHeight = (sender.PagerControl) ? sender.PagerControl.offsetHeight : 0;
 
                //// Do nothing if scrolling is not enabled
                //if (!scrollArea) {
                //    return;
                //}
                //if (gridDataHeight < 350 || parentHeight > (gridDataHeight + gridHeaderHeight + gridPagerHeight + gridTopPagerHeight + gridFooterHeight)) {
                //    scrollArea.style.height = gridDataHeight + "px";
                //} else {
                //    scrollArea.style.height = (parentHeight - gridHeaderHeight - gridPagerHeight - gridTopPagerHeight - gridFooterHeight - 2) + "px"
                //}
            }
        </script>
    </telerik:RadCodeBlock>--%>

    <style type="text/css">
        body {
            margin: 0px;
            overflow: hidden;
        }
    </style>

    <%--<telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function Resize() {
                setTimeout(function () {
                    var scrollArea = document.getElementById("<%= ResultDG.ClientID %>" + "_GridData");
                    var screenCssPixelRatio = (window.outerWidth - 8) / window.innerWidth;

                    //Chrome Zoom % and ScreenCssPixelRatio
                    //50% = 0.5426621160409556;
                    //67% = 0.7464788732394366;
                    //75% = 0.8531187122736419;
                    //80% = 0.9332355099046221;
                    //90% = 1.0707070707070707;
                    //100% = 1.2148997134670487;
                    //110% = 1.3633440514469453;
                    //125% = 1.602015113350126;
                    //150% = 2.0319488817891376;
                    //175% = 2.513833992094862;
                    //200% = 3.0650602409638554;

                    if (scrollArea) {
                        if (screenCssPixelRatio < 0.8) {
                            scrollArea.style.height = "680px";
                        }
                        else if (screenCssPixelRatio >= 0.8 && screenCssPixelRatio < 0.9) {
                            scrollArea.style.height = "600px";
                        }
                        else if (screenCssPixelRatio >= 0.9 && screenCssPixelRatio < 1)
                        {
                            scrollArea.style.height = "550px";
                        }
                        else if (screenCssPixelRatio >= 1 && screenCssPixelRatio <1.2)
                        {
                            scrollArea.style.height = "475px";
                        }
                        else if (screenCssPixelRatio >= 1.2 && screenCssPixelRatio < 1.35) {
                            scrollArea.style.height = "410px";
                        }
                        else if (screenCssPixelRatio >= 1.35 && screenCssPixelRatio < 1.5) {
                            scrollArea.style.height = "350px";
                        }
                        else if (screenCssPixelRatio >= 1.5 && screenCssPixelRatio < 1.7) {
                            scrollArea.style.height = "290px";
                        }
                        else 
                        {
                            scrollArea.style.height = "200px";
                        }
                    }
                }, 100);
        }
        window.onresize = window.onload = Resize;
        </script>
    </telerik:RadCodeBlock>--%>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0"><br />
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False" AllowPaging="false"
                Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated" ExportSettings-UseItemStyles="true">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                    <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true" ScrollHeight="590px" />
                    <%--<ClientEvents OnGridCreated="GridCreated" />--%>
                </ClientSettings>
                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                <ItemStyle Wrap="true"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <SortingSettings EnableSkinSortStyles="false" />
                <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                </MasterTableView>
            </telerik:RadGrid>
    </form>
</body>
</html>
