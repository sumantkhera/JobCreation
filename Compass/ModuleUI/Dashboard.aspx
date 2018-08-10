<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Compass.ModuleUI.Dashboard" MasterPageFile="~/Site.Master" %>


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
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="chart_div" class="col-xs-12 col-sm-12 col-md-6 col-lg-4" runat="server">
                </div>


                <div class="table-responsive">
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
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </section>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>

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

        google.load('visualization', '1', { packages: ['corechart'] });

        function OverallPerformanceGraphScore() {

        }

        function drawChart() {         
            var data = google.visualization.arrayToDataTable([  
            ['Status', 'PO'], ""]);
            }

        $(function () {  
      
        $.ajax({
            type: "POST",
            url: "Dashboard.aspx/GetBranchWiseJobStatusReportData?",
            data: '{vendorId:' + vendorId + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                OverallPerformanceGraphScore(response.d.CurrentPerformance);
                DrawAllScores(response.d.HistroicPerformance);
                SetVendorInfo(response.d.VendorInfo);
            }
        });
    });

    </script>

</asp:Content>
