<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ad_register.aspx.cs" EnableEventValidation="false" Inherits="Ad_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
  <title>Pages / Register - NiceAdmin Bootstrap Template</title>

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
   <script type="text/javascript" src="js/JScript.js" ></script>

   <link href="assets/css/style.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-xl-6 lg col-md-6 d-flex flex-column align-items-center justify-content-center" style="width:100% !important;">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt=""/>
                  <span class="d-none d-lg-block">NiceAdmin</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3 lg" style="width:420px;">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
                    <p class="text-center small">Enter your personal details to create account</p>
                  </div>

                  <form class="row g-3 needs-validation">
                    <div class="col-12">
                        <asp:FileUpload ID="FileUpload1" class="form-control mb-4" runat="server" />
                    </div>

                    <div class="col-12">
                      <label for="yourName" class="form-label">Full Name</label>
                      <asp:TextBox ID="txt_name" runat="server" class="form-control"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Fill The Name" ControlToValidate="txt_name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-12">
                      <label for="yourEmail" class="form-label">Email</label>
                      <asp:TextBox ID="txt_email" TextMode="Email" runat="server" class="form-control"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Fill The Email" ControlToValidate="txt_email" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Number</label>
                      <asp:TextBox ID="txt_number" TextMode="Number" runat="server" class="form-control"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Fill The Number" ControlToValidate="txt_number" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>


                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                      <asp:TextBox ID="txt_password" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Fill The Password" ControlToValidate="txt_password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-12 mt-3">
                      <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary w-100" runat="server" OnClick="Create_Click">Create Account</asp:LinkButton>
                    </div>
                    <div class="col-12 mt-2">
                      <p class="small mb-0">Already have an account?
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" PostBackUrl="Ad_login.aspx">Log in</asp:LinkButton>
                      </p>
                        <asp:Label ID="lbl_Msg" runat="server"></asp:Label>
                    </div>
                  </form>

                </div>
              </div>
            </div>
          </div>
        </div>

      </section>

    </div>
</form>
  
</body>
</html>
