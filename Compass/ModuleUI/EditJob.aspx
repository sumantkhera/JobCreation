<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditJob.aspx.cs" Inherits="Compass.ModuleUI.EditJob" Title="View Job Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            var hdnAttachementCountValue = document.getElementById('<%= hdnAttachementCount.ClientID %>').value;
            $('#<%=lblAttachmentCount.ClientID%>').html('(' + hdnAttachementCountValue + ')');
        });
    </script>

    <section>
        <asp:HiddenField ID="hdnAttachementCount" runat="server" />
        <div class="section-bg">
            <!-- container -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="add-jobs">
                        <span>
                            <img class="rectangle-icon"  alt="" src="/images/new-job-icon.png"></span> View Job Details
                    </div>
                    <p class="sub-head"> <img class="rectangle-icon" alt="" src="/images/reqtangle.jpg"> Job Request Details</p>
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
                                <asp:TextBox ID="txtJobNumber" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
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
                                <asp:TextBox ID="txtSubmitDate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
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
                                <asp:TextBox ID="txtBranch" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>

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
                                <asp:TextBox ID="txtSubmitBy" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                    </div>


                    <div class="col-sm-12">
                        <div class="form-group form-group-style">
                            <div class="col-sm-2 text-area-label">
                                <label for="email">Job Type </label>
                            </div>
                            <div class="col-sm-10 text-area-style">
                                <asp:DropDownList ID="ddlJobType" runat="server" CssClass="form-control" Enabled="false">
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
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Height="73px" CssClass="form-control" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group form-group-style">
                            <div class="col-sm-2 text-area-label">
                                <label for="email"></label>
                            </div>
                            <div class="col-sm-10 text-area-style">
                                <a class="btn btn-link" id="attachment"><span class="minus-attach"></span>Attachments
                                    <img alt="" src="/images/attachment-icon.png">
                                    <asp:Label ID="lblAttachmentCount" runat="server" />
                                </a>
                                <div class="attachment-download" style="display: block">
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

            <p class="sub-head">  <img class="rectangle-icon" alt="" src="/images/reqtangle.jpg"> Job Status and Allocation Details</p>
            <asp:UpdatePanel ID="up" runat="server">
                <ContentTemplate>
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
                                        <label for="email">Allocated to Team</label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlTeam" runat="server" class="form-control">
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

                            <div class="col-sm-12">
                                <div class="col-sm-6">
                                    <div class="btn-style">
                                        <asp:Button ID="btnUpdate" Text="Update" class="btn btn-submit" runat="server" OnClick="btnUpdate_Click" />
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Modal -->
                    <div id="history" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">History</h4>
                                </div>
                                <div class="table-responsive">
                                    <div class="history-table">
                                        <asp:GridView ID="grdHistory" runat="server" CssClass="table"
                                            AutoGenerateColumns="false" Font-Names="Arial" ShowFooter="false"
                                            Font-Size="11pt">
                                            <Columns>
                                                <asp:BoundField  DataField="Type" HeaderText="Type" />
                                                <asp:BoundField DataField="Previous" HeaderText="Previous" />
                                                <asp:BoundField  DataField="Current" HeaderText="Current" />
                                                <asp:BoundField  DataField="ChangedBy" HeaderText="ChangedBy" />
                                                <asp:BoundField  DataField="ChangedOn" HeaderText="ChangedOn" DataFormatString="{0:MM/dd/yyyy}" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="grdHistory" />
                </Triggers>
            </asp:UpdatePanel>
            <p class="sub-head">
                <img class="rectangle-icon"  alt="" src="/images/chat-icon.png">
                Job Comments
            </p>
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
                                <asp:FileUpload ID="FileUploadAttachments" runat="server" AllowMultiple="true" class="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="col-sm-6">
                            <div class="btn-style">
                                <asp:Button ID="btnAdd" Text="Add" class="btn btn-submit" runat="server" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" Text="Back" class="btn btn-cancel" OnClick="btnCancel_Click" runat="server" />

                            </div>
                        </div>
                        <div class="col-sm-6 text-right">
                            <a href="#" data-toggle="modal" data-target="#history" class="link-underline">History</a>
                        </div>
                    </div>
                    <div id="divComments" class="col-sm-12" runat="server">
                    </div>
                </div>
            </div>
            <!-- container -->
        </div>
    </section>
    <script>
        $("#attachment").click(function () {
            $(".attachment-download").slideToggle();
        });
        //$("#link-underline1").click(function(){
        //    $(".attachment-download1").slideToggle();
        //});
        $('#attachment ').click(function () {
            $("span.minus-attach").toggleClass("plus-attach");
        });

    </script>
    <script type="text/javascript">

        function ToggleAttachments(obj) {
            var sibling = obj.nextSibling;
            $(sibling).slideToggle();
        }

        //$(".togglea").click(function () {           
        //    var items = $(".togglea");
        //    for (i = 0; i < items.length; i++) {
        //        debugger;
        //        var sibling = items[0].nextSibling;
        //        //$(sibling.className).slideToggle();
        //        $(sibling).slideToggle();
        //    }
        //});       

    </script>

    <style type="text/css">
        div#gridPanel {
            width: 900px;
            overflow: scroll;
            position: relative;
        }


            div#gridPanel th {
                top: expression(document.getElementById("gridPanel").scrollTop-2);
                left: expression(parentNode.parentNode.parentNode.parentNode.scrollLeft);
                position: relative;
                z-index: 20;
            }
    </style>
</asp:Content>

