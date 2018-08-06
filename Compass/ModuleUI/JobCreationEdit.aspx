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
                            <a href="#"><img src="/img/compass-logo.jpg" alt=""></a>
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
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-sm-12">
                <h4 class="blueIcon20 font-size-20 m-t-40">
                    <i class="fa fa-user-plus" aria-hidden="true"></i>
                    Edit Job
                </h4>

                <h4>Job Description</h4>
            </div>

            <!-- content area -->
            <div class="col-sm-12 contentArea">
                <form class="form-horizontal">

                    <div class="form-group form-group-sm">
                        <!-- left column -->
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="new_name" class="col-sm-3 control-label">Number</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtJobNumber" runat="server" class="form-control" Enabled="false"></asp:TextBox>                                   
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="new_subname" class="col-sm-3 control-label">Submit By</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtSubmitBy" runat="server" class="form-control" Enabled="false"></asp:TextBox>
                                    
                                </div>
                            </div>



                        </div>





                        <!-- right column -->
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="new_company_identity" class="col-sm-3 control-label">Submit Date</label>
                                <div class="col-sm-9">                                      
                                       <asp:TextBox ID="txtSubmitDate" runat="server" class="form-control" Enabled="false"></asp:TextBox>
                                   
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="new_bol_require" class="col-sm-3 control-label">Branch</label>
                                <div class="col-sm-9">
                                      <asp:TextBox ID="txtBranch" runat="server" class="form-control" Enabled="false" ></asp:TextBox>
                                   
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <div class="col-sm-12">
                            <div class="form-group descriptionDiv">
                                <label for="new_pod_require" class="col-sm-2 control-label">Job Type</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="ddlJobType" runat="server"  class="form-control">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                                    
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="form-group form-group-sm">
                        <div class="col-sm-12">
                            <div class="form-group descriptionDiv">
                                <label for="new_comments" class="col-sm-2 control-label">Description</label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Height="73px" class="form-control" Width="1118px"></asp:TextBox>                                   
                                    <h4>
                                        <a href="#">Attachments [3]</a>
                                    </h4>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <!-- /content area -->



            <div class="col-sm-12">
                <h4 class="m-t-40">Allocation</h4>
            </div>

            <!-- content area -->
            <div class="col-sm-12 contentArea">
                <form class="form-horizontal">

                    <div class="form-group form-group-sm">
                        <div class="col-sm-12">
                            <div class="form-group descriptionDiv">
                                <label for="new_pod_require" class="col-sm-2 control-label">Job Status</label>
                                <div class="col-sm-10">
                                     <asp:DropDownList ID="ddlJobStatus" runat="server"  class="form-control">                               
                                    </asp:DropDownList>                                    
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="form-group form-group-sm fields3">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="new_name" class="col-sm-3 control-label">Team</label>
                                <div class="col-sm-9">
                                     <asp:DropDownList ID="ddlTeam" runat="server" class="form-control">
                                 <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                               <asp:ListItem Value="1" Text="Client"></asp:ListItem>
                               <asp:ListItem Value="2" Text="Damco"></asp:ListItem>
                            </asp:DropDownList>                                   
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="new_name" class="col-sm-3 control-label">User</label>
                                <div class="col-sm-9">
                                     <asp:DropDownList ID="ddlUser" runat="server" class="form-control" >
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>                                   
                                </div>
                            </div>
                        </div>


                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="new_name" class="col-sm-3 control-label">QA User</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlQAUser" runat="server" class="form-control" >
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>                                   
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <!-- /content area -->












            <div class="col-sm-12">
                <h4 class="blueIcon20 font-size-20 m-t-40">
                    <i class="fa fa-comments-o" aria-hidden="true"></i> Comments</h4>
            </div>

            <!-- content area -->
            <div class="col-sm-12 contentArea">
                <form class="form-horizontal">

                    <div class="form-group form-group-sm">
                        <div class="col-sm-12">
                            <div class="form-group descriptionDiv">
                                <label for="new_pod_require" class="col-sm-2 control-label">Comment</label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" class="form-control" Height="50px" Width="1118px"></asp:TextBox>
                                   
                                </div>
                            </div>
                        </div>
                    </div>




                    <div class="form-group form-group-sm">
                        <div class="col-sm-12">
                            <div class="form-group descriptionDiv">
                                <label for="new_comments" class="col-sm-2 control-label">Internal Use </label>
                                <div class="col-sm-10">
                                    <asp:CheckBox ID="chkInternalUse" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="form-group form-group-sm">
                        <div class="col-sm-12">
                            <div class="form-group descriptionDiv">
                                <label for="" class="col-sm-2 control-label">Attachments </label>
                                <div class="col-sm-10">
                                    <div class="fileUpload">
                                        <asp:FileUpload ID="FileUploadAttachments" runat="server" />
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="form-group btnGroup">
                        <div class="col-sm-12">
                            <div class="form-group descriptionDiv">
                                <label for="" class="col-sm-2 control-label"></label>
                                <div class="col-sm-6">
                                    <input type="submit" value="Add" class="btn btn-info btn-lg">
                                    <input type="reset" value="Cancel" class="btn btn-grey btn-lg">
                                </div>

                                <div class="col-sm-4 text-right">
                                    <a href="#" class="link-underline">Historical Allocation / Status</a>
                                </div>
                            </div>
                        </div>
                    </div>




                    <div class="col-sm-12">
                        <!-- blockquote -->
                        <blockquote>
                            <header>
                                Submit By:
                                <a href="#" class="comment-name">Anupam Bhardwaj</a> on
                                <a href="#" class="comment-date">6th July 2018</a>
                            </header>
                            <div class="col-sm-10 blockquote-body">
                                <p>Here is the new password for your mailbox. [ Acxse94458 ], and find attachment for details.</p>
                            </div>

                            <div class="col-sm-2 text-right">
                                <i class="fa fa-paperclip fa-rotate-270" aria-hidden="true"></i>
                                <a href="#" class="link-underline">Attachments [5]</a>
                            </div>
                        </blockquote>
                        <!-- /blockquote -->

                        <!-- blockquote -->
                        <blockquote>
                            <header>
                                Submit By:
                                <a href="#" class="comment-name">Anupam Bhardwaj</a> on
                                <a href="#" class="comment-date">6th July 2018</a>
                            </header>
                            <div class="col-sm-10 blockquote-body">
                                <p>Here is the new password for your mailbox. [ Acxse94458 ], and find attachment for details.</p>
                            </div>

                            <div class="col-sm-2 text-right">
                                <i class="fa fa-paperclip fa-rotate-270" aria-hidden="true"></i>
                                <a href="#" class="link-underline">Attachments [5]</a>
                            </div>
                        </blockquote>
                        <!-- /blockquote -->

                        <!-- blockquote -->
                        <blockquote>
                            <header>
                                Submit By:
                                <a href="#" class="comment-name">Anupam Bhardwaj</a> on
                                <a href="#" class="comment-date">6th July 2018</a>
                            </header>
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

                </form>
            </div>
            <!-- /content area -->


        </div>
        <!-- /row -->
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

