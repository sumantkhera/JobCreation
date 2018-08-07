<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Compass.ModuleUI.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-bg-main">
            <div class="login-inner">
        <div class="login-logo">
            <img alt="" src="/images/compass-gray.png">
        </div>
        <div class="login-form">
            <div class="login-head">
                <span><img src="/images/login-icon.png">Login</span>
            </div>
            <div class="row">
            <div class="col-sm-12">
                <label for="uname"><b>Username</b></label>  
            <asp:TextBox ID="txtUserId" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="reqUserId" controltovalidate="txtUserId" errormessage="Please enter username" ForeColor="Red" />
            <asp:RegularExpressionValidator runat="server" id="rexEmail" controltovalidate="txtUserId" validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" errormessage="Please enter a vaild username"  ForeColor="Red" />
        </div>
        <div class="col-sm-12">
                <label for="uname"><b>Password</b></label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" id="reqPassword" controltovalidate="txtPassword" errormessage="Please enter password" ForeColor="Red" />
        </div> 
        <div class="col-sm-12">  
            <div class="btn-login">                       
            <asp:Button ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click"  CssClass="btn btn-submit"/>
        </div>
        </div>
    </div>
    </div>
        <div class="login-footer">
            
                <img alt="" src="/images/damco-logo.png">
        </div>
    </div></div>
    </form>
</body>
</html>
