<%@ Page Title="Job List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobList.aspx.cs"
    Inherits="Compass.ModuleUI.JobList"
    EnableEventValidation="true" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
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
                        <a href="CreateJob.aspx" class="add-job-btn">
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
                                <input type="text" /></li>
                            <li>
                                <label>Branch</label>
                                <select type="text" />
                                <option value="0">Select JobType</option>
                                <option value="1">Purchase Order</option>
                                <option value="2">Merchandise Transfer</option>
                                </select>
                            </li>
                            <li>
                                <label>From</label>
                                <select type="text" />
                                <option value="0">Select JobType</option>
                                <option value="1">Purchase Order</option>
                                <option value="2">Merchandise Transfer</option>
                                </select>
                            </li>
                            <li>
                                <label>To</label>
                                <select type="text" />
                                <option value="0">Select JobType</option>
                                <option value="1">Purchase Order</option>
                                <option value="2">Merchandise Transfer</option>
                                </select>
                            </li>
                            <li>
                                <label>Status</label>
                                <select type="text" />
                                <option value="0">Select JobType</option>
                                <option value="1">Purchase Order</option>
                                <option value="2">Merchandise Transfer</option>
                                </select>
                            </li>
                            <li>
                                <label>Team</label>
                                <select type="text" />
                                <option value="0">Select JobType</option>
                                <option value="1">Purchase Order</option>
                                <option value="2">Merchandise Transfer</option>
                                </select></li>
                            <li>
                                <label>User</label>
                                <input type="text" /></li>
                            <li>
                                <label>Priority</label>
                                <select type="text" />
                                <option value="0">Select JobType</option>
                                <option value="1">Purchase Order</option>
                                <option value="2">Merchandise Transfer</option>
                                </select>
                            </li>
                            <li>
                                <label>Job Type</label>
                                <select type="text" />
                                <option value="0">Select JobType</option>
                                <option value="1">Purchase Order</option>
                                <option value="2">Merchandise Transfer</option>
                                </select>
                            </li>
                            <li>
                                <div class="btn-style">
                                    <button type="submit" class="btn btn-submit">Filter</button>
                                    <button type="submit" class="btn btn-cancel">Reset</button>
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
                OnRowDataBound="grdViewJobList_RowDataBound"
                AutoGenerateSelectButton="true"
                OnSelectedIndexChanged="grdViewJobList_SelectedIndexChanged">
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
    </section>
</asp:Content>
