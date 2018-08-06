<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobCreationEdit.aspx.cs" Inherits="Compass.ModuleUI.JobCreationEdit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <body>

                <header class="mainHeader">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                <a href="#">
                                    <img src="/img/compass-logo.jpg" alt=""></a>
                            </div>

                            <div class="col-sm-6">

                                <div class="dropdown pull-right">
                                    <div class="pull-left">
                                        <h4>Michael Smith</h4>
                                        <p>Miami, Florida</p>
                                    </div>

                                    <span class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                                    </span>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>

                <!-- container -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="add-jobs">
                            <span>
                                <img alt="" src="images/new-job-icon.png"></span> Edit Job
                        </div>
                        <p>Job Description</p>
                    </div>
                </div>
                <div class="form-inline" role="form">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group form-group-style">
                                <div class="col-sm-3">
                                    <label for="email">Number</label>
                                </div>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtJobNumber" runat="server" class="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group form-group-style">
                                <div class="col-sm-3">
                                    <label for="email">Submit Date</label>
                                </div>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtSubmitDate" runat="server" class="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group form-group-style">
                                <div class="col-sm-3">
                                    <label for="email">Branch</label>
                                </div>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtBranch" runat="server" class="form-control" Enabled="false"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group form-group-style">
                                <div class="col-sm-3">
                                    <label for="email">Submitted By</label>
                                </div>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtSubmitBy" runat="server" class="form-control" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="col-sm-12">
                            <div class="form-group form-group-style">
                                <div class="col-sm-2 text-area-label">
                                    <label for="email">Job Type </label>
                                </div>
                                <div class="col-sm-10 text-area-style">
                                    <asp:DropDownList ID="ddlJobType" runat="server" class="form-control">
                                        <asp:ListItem>Select</asp:ListItem>
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
                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Height="73px" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group form-group-style">
                                <div class="col-sm-2 text-area-label">
                                    <label for="email"></label>
                                </div>
                                <div class="col-sm-10 text-area-style">
                                    <a class="btn btn-link">Attachments <span>[3]</span></a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


                <div class="form-inline" role="form">
                    <div class="row">


                        <div class="col-sm-12">
                            <div class="form-group form-group-style">
                                <div class="col-sm-2 text-area-label">
                                    <label for="email">Job Status </label>
                                </div>
                                <div class="col-sm-10 text-area-style">
                                    <asp:DropDownList ID="ddlJobStatus" runat="server" class="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group form-group-style">
                                <div class="col-sm-4">
                                    <label for="email">Team</label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlTeam" runat="server" class="form-control">
                                        <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Client"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Damco"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group form-group-style">
                                <div class="col-sm-4">
                                    <label for="email">User</label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlUser" runat="server" class="form-control">
                                        <asp:ListItem>Select</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group form-group-style">
                                <div class="col-sm-4">
                                    <label for="email">QA User</label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlQAUser" runat="server" class="form-control">
                                        <asp:ListItem>Select</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-inline" role="form">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group form-group-style">
                                <div class="col-sm-2 text-area-label">
                                    <label for="email">Comment </label>
                                </div>
                                <div class="col-sm-10 text-area-style">
                                    <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12" id="divInternalUse" runat="server">
                            <div class="form-group form-group-style">
                                <div class="col-sm-2 text-area-label">
                                    <label for="email">Internal Use</label>
                                </div>
                                <div class="col-sm-10 text-area-style">
                                    <asp:CheckBox ID="chkInternalUse" runat="server" />
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12">
                            <div class="form-group form-group-style">
                                <div class="col-sm-2 text-area-label">
                                    <label for="email">Attachments </label>
                                </div>
                                <div class="col-sm-10 text-area-style">
                                    <asp:FileUpload ID="FileUploadAttachments" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="btn-style">
                                <button type="submit" class="btn btn-submit">Add</button>
                                <button type="submit" class="btn btn-cancel">Cancel</button>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <!-- blockquote -->
                            <blockquote>
                                <div class="submit-by">
                                    Submit By:
                                    <a href="#" class="comment-name">Anupam Bhardwaj</a> on
                                    <a href="#" class="comment-date">6th July 2018</a>
                                </div>
                                <div class="col-sm-10 blockquote-body">
                                    <p>Here is the new password for your mailbox. [ Acxse94458 ], and find attachment for details.</p>
                                </div>

                                <div class="col-sm-2 text-right">
                                    <i class="fa fa-paperclip fa-rotate-270" aria-hidden="true"></i>
                                    <a href="#" class="link-underline">Attachments [5]</a>
                                </div>
                            </blockquote>
                            <!-- /blockquote -->


                        </div>
                    </div>
                </div>
                <!-- container -->

                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="js/jquery.min.js"></script>
                <!-- Include all compiled plugins (below), or include individual files as needed -->
                <script src="js/bootstrap.min.js"></script>
            </body>

            </html>
     
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

