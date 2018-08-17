<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Compass.ModuleUI.Dashboard" MasterPageFile="~/Site.Master" Title="Dashboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section>
        <asp:UpdatePanel ID="uppanel" runat="server">
            <ContentTemplate>                
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
                                            <asp:Button ID="btnCancel" runat="server" Text="Reset" class="btn btn-cancel" OnClick="btnCancel_Click" />
                                            <asp:Button ID="btnFilter" runat="server" Text="Filter" class="btn btn-submit" OnClick="btnFilter_Click" />
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="chart_div0" class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="width: 400px; height: 200px; visibility:hidden" >
                </div>
                <div id="chart_div1" class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="width: 400px; height: 200px; visibility:hidden ">
                </div>
                <div id="chart_div2" class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="width: 400px; height: 200px; visibility:hidden">
                </div>
                <div id="chart_div3" class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="width: 400px; height: 200px; visibility:hidden">
                </div>

                <div id="divTable" runat="server">
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


        var chartData; // global variable for hold chart data  
        google.load("visualization", "1", { packages: ["corechart"] });
        // Here We will fill chartData  

        $(function () {
            var UserId = '<%= UserID %>';
            var BranchId = '<%= BranchId %>';
            var FromDate = '<%= FromDate %>';
            var ToDate = '<%= ToDate %>';

            $(document).ready(function () { 
                BindDataForChart(UserId, BranchId, FromDate, ToDate); // Binding data for chart with default filters by calling Ajax Web method
            });
        });

        <%--$('#<%=btnFilter.ClientID %>').click(function () {
            debugger;
            var UserId = '<%= UserID %>';
            var BranchId = $('#<%=ddlBranch.ClientID %>').val(); 
            var FromDate = $('#<%=txtFromDate.ClientID %>').val();
            var ToDate = $('#<%=txtToDate.ClientID %>').val();

            BindDataForChart(UserId, BranchId, FromDate, ToDate);
        })--%>


        function BindDataForChart(UserId, BranchId, FromDate, ToDate)
        {
            $("#chart_div0").css("visibility", "hidden");
            $("#chart_div1").css("visibility", "hidden");
            $("#chart_div2").css("visibility", "hidden");
            $("#chart_div3").css("visibility", "hidden");

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
                google.setOnLoadCallback(drawChart);
                for (var i = 0; i < chartData.length; i++) {
                    drawChart(chartData[i].Name, chartData[i].StatusCount, i); // used for drawing the chart
                }
            });
        }

  
        function drawChart(name, data, ChartDivCount) {            
            var dataTable = new google.visualization.DataTable();
            dataTable.addColumn('string', 'Status');
            dataTable.addColumn('number', 'Count');

            for (i = 0; i < data.length; i++)
                dataTable.addRow([data[i].Status, data[i].Count]);

            //var chartData = google.visualization.arrayToDataTable(dataTable);

            var options = {
                title: name,
                pointSize: 5,
                is3D: true,
            };

            $("#chart_div" + ChartDivCount).css("visibility","visible"); // setting Chart div visible to true with ChartDivCount
            var pieChart = new google.visualization.PieChart(document.getElementById('chart_div' + ChartDivCount)); // finding control of chart div to display the chart
            pieChart.draw(dataTable, options);

        }

    </script>

</asp:Content>
