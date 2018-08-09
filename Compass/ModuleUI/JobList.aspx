<%@ Page Title="Job List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobList.aspx.cs"
    Inherits="Compass.ModuleUI.JobList"
    EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <asp:UpdatePanel ID="uppanel" runat="server">
            <ContentTemplate>
                <div class="section-bg">
                    <div class="row job-listing">
                        <div class="col-sm-6 col-xs-6">
                            <div class="add-jobs">
                                <img alt="" src="../images/listing-icon.png">
                                Job Listings
                            </div>
                        </div>
                        <div class="col-sm-6  col-xs-6 text-right">
                            <div class="add-jobs">
                                <a href="CreateJob.aspx" class="add-job-btn" runat="server" id="btnAdd">
                                    <img alt="" src="../images/add-job-white.png">
                                    Add Job</a>
                            </div>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-sm-12">
                            <div class="search-listing">
                                <ul>
                                    <li>
                                        <label>Job No.</label>
                                        <asp:TextBox ID="txtJobNo" runat="server" class="form-control" placeholder="Job No"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Branch</label>
                                        <asp:DropDownList ID="ddlBranch" runat="server" class="form-control"></asp:DropDownList>

                                    </li>
                                    <li>
                                        <label>From</label>
                                        <asp:TextBox ID="txtFromDate" runat="server" class="form-control txtDate" placeholder="From date"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>To</label>
                                        <asp:TextBox ID="txtToDate" runat="server" class="form-control txtDate" placeholder="To date"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Status</label>
                                        <asp:ListBox ID="lstStatus" runat="server" Height="50px" SelectionMode="Multiple"></asp:ListBox>
                                    </li>
                                    <li>
                                        <label>Team</label>
                                        <asp:DropDownList ID="ddlTeam" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlTeam_SelectedIndexChanged"></asp:DropDownList>

                                    </li>
                                    <li>
                                        <label>Allocated</label>
                                        <asp:DropDownList ID="ddlUser" runat="server" class="form-control"></asp:DropDownList>
                                    </li>
                                    <li>
                                        <label>Priority</label>
                                        <asp:DropDownList ID="ddlPriority" runat="server" class="form-control"></asp:DropDownList>
                                    </li>
                                    <li>
                                        <label>Job Type</label>
                                        <asp:DropDownList ID="ddlJobType" runat="server" class="form-control"></asp:DropDownList>
                                    </li>
                                    <li>
                                        <div class="btn-style">
                                            <asp:Button ID="btnFilter" runat="server" Text="Filter" class="btn btn-submit" OnClick="btnFilter_Click" />
                                            <asp:Button ID="btnCancel" runat="server" Text="Reset" class="btn btn-cancel" OnClick="btnCancel_Click" />
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="grdViewJobList" runat="server"
                        AutoGenerateColumns="false"
                        CssClass="table"
                        PageSize="5"
                        AllowPaging="true"
                        OnRowDataBound="grdViewJobList_RowDataBound"
                        AutoGenerateSelectButton="true"
                        OnSelectedIndexChanged="grdViewJobList_SelectedIndexChanged"
                        OnPageIndexChanging="grdViewJobList_PageIndexChanging">
                        <PagerStyle HorizontalAlign="Left" CssClass="GridPager" />
                        <EmptyDataTemplate>No Record Found</EmptyDataTemplate>
                        <Columns>
                            <asp:TemplateField HeaderText="Id" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblID" runat="server" Text='<%#Eval("Id")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Job Number">
                                <ItemTemplate>
                                    <asp:Label ID="lblJobNumber" runat="server" Text='<%# Eval("JobNumber")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch">
                                <ItemTemplate>
                                    <asp:Label ID="lblBranchName" runat="server" Text='<%#Eval("BranchName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Job Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblJobType" runat="server" Text='<%# Eval("JobType")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblJobStatus" runat="server" Text='<%#Eval("JobStatus")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Allocated To">
                                <ItemTemplate>
                                    <asp:Label ID="lblAllocatedTo" runat="server" Text='<%# Eval("AllocatedTo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Priority">
                                <ItemTemplate>
                                    <asp:Label ID="lblPriorityType" runat="server" Text='<%#Eval("PriorityType")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Submission Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblSubmitDate" runat="server" Text='<%# Eval("SubmitDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="60px" HeaderText="Submitted By">
                                <ItemTemplate>
                                    <asp:Label ID="lblSubmitByName" runat="server" Text='<%#Eval("SubmitByName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Updated">
                                <ItemTemplate>
                                    <asp:Label ID="lblLastUpdatedDate" runat="server" Text='<%# Eval("LastUpdatedDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </section>
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
            $('[id*=lstStatus]').multiselect({
                includeSelectAllOption: true
            })
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
                $('[id*=lstStatus]').multiselect({
                    includeSelectAllOption: true
                })
            });
        });
    </script>
</asp:Content>
