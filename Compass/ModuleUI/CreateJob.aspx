<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateJob.aspx.cs" Inherits="Compass.ModuleUI.Compass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section>
        <div class="section-bg">
            <div class="row">
                <div class="col-sm-12">
                    <div class="add-jobs">
                        <span><img alt="" src="/images/new-job-icon.png"></span>Create Job
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group form-group-style">
                        <div class="col-sm-3">
                            <label for="email">Job Type</label>
                        </div>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlJobType" runat="server" class="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group form-group-style">
                        <div class="col-sm-3">
                            <label for="email">Branch</label>
                        </div>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlBranch" runat="server" class="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group form-group-style">
                        <div class="col-sm-3">
                            <label for="email">Submitted By</label>
                        </div>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlUsers" runat="server" class="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group form-group-style">
                        <div class="col-sm-3">
                            <label for="email">Submitted On</label>
                        </div>
                        <div class="col-sm-9">
                            <select class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group form-group-style">
                        <div class="col-sm-3">
                            <label for="email">Priority</label>
                        </div>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddlPriority" runat="server" class="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="col-sm-12">
                    <div class="form-group form-group-style">
                        <div class="col-sm-2 text-area-label">
                            <label for="email">Description </label>
                        </div>
                        <div class="col-sm-10 text-area-style">
                            <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Height="50px" Width="1100px"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="form-group form-group-style">
                        <div class="col-sm-2 text-area-label">
                            <label for="email">Attachments</label>
                        </div>
                        <div class="col-sm-10 text-area-style">
                            <asp:FileUpload ID="fileJobAttachment" runat="server" AllowMultiple="true" class="form-control" />
                        </div>
                    </div>
                </div>

            </div>
            <div class="btn-style">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Clear" />
            </div>

        </div>
    </section>

</asp:Content>

