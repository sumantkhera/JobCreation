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
                                        <%--<asp:Label ID="lblJobNumber" runat="server" cssClass="form-control" />  --%>
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
                                        <%--<asp:Label  ID ="lblSubmitDate" runat="server" cssClass="form-control" />  --%>
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
                                        <%--<asp:Label ID="lblBranch" runat="server" cssClass="form-control" />--%>
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
                                        <%--<asp:Label  ID="lblSubmitBy" runat="server" cssClass="form-control" />--%>
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
                                        <a class="btn btn-link" id="attachment"><span class="plus-attach"></span>Attachments <img alt="" src="/images/attachment-icon.png"> 
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
                            <div id="divUser" class="col-sm-4" runat="server">
                                <div class="form-group form-group-style">
                                    <div class="col-sm-4">
                                        <label for="email">User</label>
                                        <%--<asp:Label ID="lblUser" Text="User" runat="server" />--%>
                                        
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlUser" runat="server" class="form-control">
                                            <asp:ListItem>Select</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div id="divQaUser" class="col-sm-4" runat="server">
                                <div class="form-group form-group-style">
                                    <div class="col-sm-4">
                                        <label for="email">QA User</label>
                                        <%--<asp:Label ID="lblQAUser" Text="QA User" runat="server" />--%>
                                        
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
                                            <asp:Button  ID="btnCancel" Text="Back" class="btn btn-cancel" OnClick="btnCancel_Click" runat="server" />
                                            
                                        </div>
                                    </div>
                                        <div class="col-sm-6 text-right">
                                            <a href="#" data-toggle="modal" data-target="#history" class="link-underline">History</a>
                                        </div>
                            </div>
                            <div id="divComments" class="col-sm-12" runat="server">
                                <!-- blockquote -->
                                <blockquote>
                                        <div class="submit-by">
                                            <%--<asp:Panel ID="pnlComments" runat="server"></asp:Panel>--%>
                                            Added By:
                                        <a href="#" class="comment-name">Anupam Bhardwaj</a> on
                                        <a href="#" class="comment-date">6th July 2018</a>
                                        </div>
                                        <div class="col-sm-10 blockquote-body">
                                            <p><img alt="" src="/images/qoute-icon.png"> Here is the new password for your mailbox. [ Acxse94458 ], and find attachment for details.</p>
                                        </div>
    
                                        <div class="col-sm-2 text-right">
                                            <i class="fa fa-paperclip fa-rotate-270" aria-hidden="true"></i>
                                            <a  class="link-underline" id="link-underline1"><img alt="" src="/images/attachment-icon.png"> Attachments [5]</a>
                                            <div class="attachment-download1" style="display: none">
                                                  <a class="btn btn-link">Attachments <span>[1]</span></a>
                                                        <a class="btn btn-link">Attachments <span>[2]</span></a>
                                                        <a class="btn btn-link">Attachments <span>[3]</span></a>
                                                </div>
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
                                            <a  class="link-underline"><img alt="" src="/images/attachment-icon.png"> Attachments [5]</a>
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
                                            <a  class="link-underline"><img alt="" src="/images/attachment-icon.png"> Attachments [5]</a>
                                        </div>
                                    </blockquote>
                                    <!-- /blockquote -->


                            </div>
                        </div>
                    </div>
                    <!-- container -->
                </div>
            </section>

            
            
            <!-- Modal -->
            <div id="history" class="modal fade" role="dialog">
              <div class="modal-dialog">
            
                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                  </div>
                  <div class="modal-body">
                        <div class="table-responsive">          
                                <table class="table">
                                  <thead>
                                    <tr>
                                      <th>#</th>
                                      <th>Firstname</th>
                                      <th>Lastname</th>
                                      <th>Age</th>
                                      <th>City</th>
                                      <th>Country</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                        <tr>
                                                <td>1</td>
                                                <td>Anna</td>
                                                <td>Pitt</td>
                                                <td>35</td>
                                                <td>New York</td>
                                                <td>USA</td>
                                              </tr>
                                              <tr>
                                                    <td>1</td>
                                                    <td>Anna</td>
                                                    <td>Pitt</td>
                                                    <td>35</td>
                                                    <td>New York</td>
                                                    <td>USA</td>
                                                  </tr>
                                                  <tr>
                                                        <td>1</td>
                                                        <td>Anna</td>
                                                        <td>Pitt</td>
                                                        <td>35</td>
                                                        <td>New York</td>
                                                        <td>USA</td>
                                                      </tr>
                                  </tbody>
                                </table>
                                </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>
                </div>
            
              </div>
            </div>
<script>
$("#attachment").click(function(){
    $(".attachment-download").slideToggle();
});
$("#link-underline1").click(function(){
    $(".attachment-download1").slideToggle();
});
$('#attachment ').click(function() {
    $("span.plus-attach").toggleClass("minus-attach");
});
</script>
            </html>
     
       
    

</asp:Content>

