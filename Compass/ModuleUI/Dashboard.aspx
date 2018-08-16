<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Compass.ModuleUI.Dashboard" MasterPageFile="~/Site.Master" Title="Dashboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section>
        <asp:UpdatePanel ID="uppanel" runat="server">
            <ContentTemplate>
                <asp:HiddenField  ID="hdntxtFromDate" runat  ="server" />
                <asp:HiddenField  ID="hdntxtToDate" runat  ="server" />
                <asp:HiddenField  ID="hdnUserId" runat  ="server" />
                <asp:HiddenField  ID="hdnBranch" runat  ="server" />
                <div class="section-bg">                    
                    <div class="row ">
                        <div class="col-sm-12">
                            <div class="search-listing">
                                <ul>                                   
                                    <li>
                                        <label>Branch</label>
                                        <asp:DropDownList ID="ddlBranch" runat="server" class="form-control"></asp:DropDownList>

                                    </li>
                                    <li>
                                        <label>Date From</label>
                                        <asp:TextBox ID="txtFromDate" runat="server" class="form-control txtDate" placeholder="From Date"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Date To</label>
                                        <asp:TextBox ID="txtToDate" runat="server" class="form-control txtDate" placeholder="To Date"></asp:TextBox>
                                    </li>
                                    <li>
                                        <div class="btn-style">
                                            <asp:Button ID="btnCancel" runat="server" Text="Reset" class="btn btn-cancel" OnClick ="btnCancel_Click"/>
                                            <asp:Button ID="btnFilter" runat="server" Text="Filter" class="btn btn-submit" OnClick="btnFilter_Click" />
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="chart_div" class="col-xs-12 col-sm-12 col-md-6 col-lg-4" style="width: 400px; height: 200px;">
                </div>

                <div id="divTable"  runat="server">
                </div>

                <%--<div class="table-responsive">
                    <asp:GridView ID="gvBranchWiseJobStatus" runat="server"
                        AutoGenerateColumns="false"
                        CssClass="table">
                        <Columns>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PO">
                                <ItemTemplate>
                                    <asp:Label ID="lblPO" runat="server" Text='<%# Eval("PO")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Merchandise Tarnsfer">
                                <ItemTemplate>
                                    <asp:Label ID="lblMerchandiseTarnsfer" runat="server" Text='<%#Eval("MerchandiseTarnsfer")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Weekly Cash Report">
                                <ItemTemplate>
                                    <asp:Label ID="lblWeeklyCashReport" runat="server" Text='<%# Eval("WeeklyCashReport")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Other">
                                <ItemTemplate>
                                    <asp:Label ID="lblOther" runat="server" Text='<%#Eval("Other")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>--%>
            </ContentTemplate>
        </asp:UpdatePanel>
    </section>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('[id*=txtFromDate]').datepicker({
                changeMonth: true,
                changeYear: true,
                format: "mm/dd/yyyy",
                language: "tr"
            });
            $('[id*=txtToDate]').datepicker({
                changeMonth: true,
                changeYear: true,
                format: "mm/dd/yyyy",
                language: "tr"
            });           
        });

        var parameter = Sys.WebForms.PageRequestManager.getInstance();
        parameter.add_endRequest(function () {
            $(document).ready(function () {
                $('[id*=txtFromDate]').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    format: "mm/dd/yyyy",
                    language: "tr"
                });
                $('[id*=txtToDate]').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    format: "mm/dd/yyyy",
                    language: "tr"
                });               
            });
        });      

        $(document).ready(function () {
             var hdntxtFromDate = document.getElementById('<%= hdntxtFromDate.ClientID %>').value;
        });

       

        var chartData; // global variable for hold chart data  
        google.load("visualization", "1", { packages: ["corechart"] });
        // Here We will fill chartData  

        $(function () {
           var UserId = '<%= UserID %>';
            var BranchId = '<%= BranchId %>';
            var FromDate = '<%= FromDate %>';
            var ToDate = '<%= ToDate %>';

            $(document).ready(function () {
                debugger;
                $.ajax({

                    url: "AjaxCallPage.aspx/GetChartData",
                    data: "{'UserId':'" + UserId + "', 'BranchId':'" + BranchId + "', 'FromDate':'" + FromDate + "', 'ToDate':'" + ToDate + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; chartset=utf-8",
                    success: function (data) {
                        chartData = data.d;
                    },
                    error: function () {
                        alert("Error loading data! Please try again.");
                    }
                }).done(function () {
                    // after complete loading data  
                    google.setOnLoadCallback(drawChartPO);
                    drawChartPO();
                });
            });
        });

        function drawChartPO() {
            debugger;
            var data = google.visualization.arrayToDataTable(chartData);

            //var data = google.visualization.arrayToDataTable([
            //  ['AAA', 'XXX'],
            //  ['Work', 11],
            //  ['Eat', 2],
            //  ['Commute', 2],
            //  ['Watch TV', 2],
            //  ['Sleep', 7]
            //]);

            var options = {
                title: "Purchase Order",
                pointSize: 5,
                is3D: true,
            };

            //var options = {
            //    title: 'My Daily Activities'
            //};

            var pieChart = new google.visualization.PieChart(document.getElementById('chart_div'));
            pieChart.draw(data, options);

        }     

    </script>

</asp:Content>
