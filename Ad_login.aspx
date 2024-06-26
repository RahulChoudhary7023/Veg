﻿<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Ad_login.aspx.cs" Inherits="Ad_login" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pages / Login - NiceAdmin Bootstrap Template</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"/>
    <link href="assets/css/style.css" rel="stylesheet"/>
    <style>
        .input-group .form-control {
            padding-right: 2.5rem;
        }
        .input-group .input-group-text {
            cursor: pointer;
        }
        .validator-message {
            display: block;
            margin-top: 0.5rem;
            font-size: 0.875em;
            color: #FF0066;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-6 col-md-6 d-flex flex-column align-items-center justify-content-center">
                            <div class="d-flex justify-content-center py-4">
                                <a href="index.html" class="logo d-flex align-items-center w-auto">
                                    <img src="assets/img/logo.png" alt=""/>
                                    <span class="d-none d-lg-block">NiceAdmin</span>
                                </a>
                            </div>
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                                        <p class="text-center small">Enter your username & password to login</p>
                                    </div>
                                    <div class="row g-3 needs-validation">
                                        <div class="col-12">
                                            <label for="txt_number" class="form-label">Number</label>
                                            <asp:TextBox ID="txt_number" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fill in the Number" ControlToValidate="txt_number" CssClass="validator-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-12">
                                            <label for="txt_password" class="form-label">Password</label>
                                            <div class="input-group">
                                                <asp:TextBox ID="txt_password" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Fill in the Password" ControlToValidate="txt_password" CssClass="validator-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-12 d-flex justify-content-between">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe" onclick="togglePasswordVisibilityByCheckbox('txt_password', this)"/>
                                                <label class="form-check-label" for="rememberMe">Remember me</label>
                                            </div>
                                            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Ad_ForgetPassword.aspx.cs" runat="server">Forget Password?</asp:HyperLink>
                                        </div>
                                        <div class="col-12">
                                            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary w-100" OnClick="login_Click" runat="server">Login</asp:LinkButton>
                                        </div>
                                        <div class="col-12">
                                            <p class="small mb-0 mt-2">Don't have an account? 
                                                <asp:LinkButton ID="LinkButton2" CausesValidation="false" PostBackUrl="~/Ad_register.aspx" runat="server">Create an account</asp:LinkButton>   
                                            </p>
                                            <asp:Label ID="lbl_msg" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
    <script>
        function togglePasswordVisibility(id) {
            const passwordField = document.getElementById(id);
            const toggleIcon = document.getElementById("toggleIcon");
            if (passwordField.type === "password") {
                passwordField.type = "text";
                toggleIcon.classList.remove("fa-eye");
                toggleIcon.classList.add("fa-eye-slash");
            } else {
                passwordField.type = "password";
                toggleIcon.classList.remove("fa-eye-slash");
                toggleIcon.classList.add("fa-eye");
            }
        }

        function togglePasswordVisibilityByCheckbox(id, checkbox) {
            const passwordField = document.getElementById(id);
            if (checkbox.checked) {
                passwordField.type = "text";
            } else {
                passwordField.type = "password";
            }
        }
    </script>
</body>
</html>
