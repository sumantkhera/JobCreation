<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditJob.aspx.cs" Inherits="Compass.ModuleUI.EditJob" Title="Edit Job" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script language="javascript" type="text/javascript">
         $(document).ready(function () {
             debugger;
             var hdnAttachementCountValue = document.getElementById('<%= hdnAttachementCount.ClientID %>').value;
             $('#<%=lblAttachmentCount.ClientID%>').html('('+ hdnAttachementCountValue + ')'); 
         });
    </script>
   
            <section>
                <asp:HiddenField  id="hdnAttachementCount"   runat="server" />
                <div class="section-bg">
                    <!-- container -->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="add-jobs">
                                <span>
                                    <img alt="" src="/images/new-job-icon.png"></span> Edit Job
                            </div>
                            <p class="sub-head">Job Description</p>
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
                                        <asp:TextBox ID="txtJobNumber" runat="server" cssClass="form-control" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group form-group-style">
                                    <div class="col-sm-3">
                                        <label for="email">Submit Date</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtSubmitDate" runat="server" cssClass="form-control" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group form-group-style">
                                    <div class="col-sm-3">
                                        <label for="email">Branch</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtBranch" runat="server" cssClass="form-control" Enabled="false"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group form-group-style">
                                    <div class="col-sm-3">
                                        <label for="email">Submitted By</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtSubmitBy" runat="server" cssClass="form-control" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                            </div>


                            <div class="col-sm-12">
                                <div class="form-group form-group-style">
                                    <div class="col-sm-2 text-area-label">
                                        <label for="email">Job Type </label>
                                    </div>
                                    <div class="col-sm-10 text-area-style">
                                        <asp:DropDownList ID="ddlJobType" runat="server" cssClass="form-control"  Enabled="false">
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
                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Height="73px" cssClass="form-control"  Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group form-group-style">
                                    <div class="col-sm-2 text-area-label">
                                        <label for="email"></label>
                                    </div>
                                    <div class="col-sm-10 text-area-style">
                                        <a class="btn btn-link" id="attachment">Attachments 
                                            <asp:Label ID="lblAttachmentCount"  runat="server" />
                                        </a>
                                        <div class="attachment-download" style="display: none">
                                            <asp:Panel ID="pnlAttachment" runat="server"></asp:Panel>
                                          
                                                <%--<a class="btn btn-link">Attachments <span>[1]</span></a>
                                                <a class="btn btn-link">Attachments <span>[2]</span></a>
                                                <a class="btn btn-link">Attachments <span>[3]</span></a>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <p class="sub-head">Allocation</p>
                    <div class="form-inline" role="form">
                        <div class="row">


                            <div class="col-sm-12">
                                <div class="form-group form-group-style">
                                    <div class="col-sm-2 text-area-label">
                                        <label for="email">Job Status </label>
                                    </div>
                                    <div class="col-sm-10 text-area-style padd-left-0">
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

                    <p class="sub-head"><img alt="" src="/images/chat-icon.png"> Comment</p>
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
                                        <asp:CheckBox ID="chkInternalUse" runat="server" class="internal-checkbox" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-12">
                                <div class="form-group form-group-style">
                                    <div class="col-sm-2 text-area-label">
                                        <label for="email">Attachments </label>
                                    </div>
                                    <div class="col-sm-10 text-area-style">
                                        <asp:FileUpload ID="FileUploadAttachments" runat="server" AllowMultiple="true" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                    <div class="col-sm-6">
                                        <div class="btn-style">
                                            <asp:Button  ID="btnAdd" Text="Add" class="btn btn-submit" runat="server" OnClick="btnSubmit_Click" />
                                            <asp:Button  ID="btnCancel" Text="Cancel" class="btn btn-submit" OnClick="btnCancel_Click" runat="server" />
                                            
                                        </div>
                                    </div>
                                        <div class="col-sm-6 text-right">
                                            <a href="#" class="link-underline">History</a>
                                        </div>
                            </div>
                            <div class="col-sm-12">
                                <!-- blockquote -->
                                <blockquote>
                                        <div class="submit-by">
                                            <asp:Panel ID="pnlComments" runat="server"></asp:Panel>
                                            Added By:
                                        <%--<a href="#" class="comment-name">Anupam Bhardwaj</a> on
                                        <a href="#" class="comment-date">6th July 2018</a>--%>
                                        </div>
                                        <div class="col-sm-10 blockquote-body">
                                            <p><img alt="" src="/images/qoute-icon.png"> Here is the new password for your mailbox. [ Acxse94458 ], and find attachment for details.</p>
                                        </div>
    
                                        <div class="col-sm-2 text-right">
                                            <i class="fa fa-paperclip fa-rotate-270" aria-hidden="true"></i>
                                            <a href="#" class="link-underline"><img alt="" src="/images/attachment-icon.png"> Attachments [5]</a>
                                        </div>
                                    </blockquote>
                                    <!-- /blockquote -->
                                     <!-- blockquote -->
                                <blockquote>
                                        <div class="submit-by">
                                            Added By:
                                        <a href="#" class="comment-name">Anupam Bhardwaj</a> on
                                        <a href="#" class="comment-date">6th July 2018</a>
                                        </div>
                                        <div class="col-sm-10 blockquote-body">
                                            <p><img alt="" src="/images/qoute-icon.png">Here is the new password for your mailbox. [ Acxse94458 ], and find attachment for details.</p>
                                        </div>
    
                                        <div class="col-sm-2 text-right">
                                            <i class="fa fa-paperclip fa-rotate-270" aria-hidden="true"></i>
                                            <a href="#" class="link-underline"><img alt="" src="/images/attachment-icon.png"> Attachments [5]</a>
                                        </div>
                                    </blockquote>
                                    <!-- /blockquote -->
                                     <!-- blockquote -->
                                <blockquote>
                                        <div class="submit-by">
                                            Added By:
                                        <a href="#" class="comment-name">Anupam Bhardwaj</a> on
                                        <a href="#" class="comment-date">6th July 2018</a>
                                        </div>
                                        <div class="col-sm-10 blockquote-body">
                                            <p><img alt="" src="/images/qoute-icon.png">Here is the new password for your mailbox. [ Acxse94458 ], and find attachment for details.</p>
                                        </div>
    
                                        <div class="col-sm-2 text-right">
                                            <i class="fa fa-paperclip fa-rotate-270" aria-hidden="true"></i>
                                            <a href="#" class="link-underline"><img alt="" src="/images/attachment-icon.png"> Attachments [5]</a>
                                        </div>
                                    </blockquote>
                                    <!-- /blockquote -->


                            </div>
                        </div>
                    </div>
                    <!-- container -->
                </div>
            </section>
<script>
$("#attachment").click(function(){
    $(".attachment-download").slideToggle();
});

</script>
            </html>
     
       
    

</asp:Content>

