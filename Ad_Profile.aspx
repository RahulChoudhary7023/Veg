<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Ad_Profile.aspx.cs" Inherits="Ad_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

  <title>Users / Profile - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description"/>
  <meta content="" name="keywords"/> 
    
  <link href="assets/img/favicon.png" rel="icon"/>
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"/>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet"/>
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet"/>
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet"/>
  <link href="assets/css/style.css" rel="stylesheet"/>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <style>
        .active {
            background-color: #007bff;
            color: white;
        }
        .content {
            display: none;
            
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="#" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt=""/>
        <span class="d-none d-lg-block">NiceAdmin</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div>

    <div class="search-bar">
      <div class="search-form d-flex align-items-center" method="POST" action="#">
         <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by Name" title="Enter admin name"></asp:TextBox>
          <asp:LinkButton ID="LinkButton9" runat="server" Text="Search" CausesValidation="false" OnClick="btn_sea" CssClass="btn btn-primary"></asp:LinkButton>
           </div>
      </div>

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
          </a>
        </li>

        <li class="nav-item ">
             <asp:LinkButton ID="LinkButton7" PostBackUrl="~/Ad_login.aspx" CausesValidation="false" class="nav-link nav-icon d-flex align-items-center" runat="server">Sign Out</asp:LinkButton>
        </li>

        <li class="nav-item dropdown pe-3">
            <asp:DataList ID="DataList3" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton8" CausesValidation="false" PostBackUrl="~/Ad_Profile.aspx" runat="server" class="nav-link nav-profile d-flex align-items-center pe-0">
                      <asp:Image ID="Image2" runat="server" class="rounded-circle pe-2" ImageUrl='<%# Eval("photo") %>' />
                      <asp:Label ID="Label7" runat="server" class="d-none d-md-block" Text='<%# Eval("name") %>'></asp:Label>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:DataList>
        </li>
      </ul>
    </nav>

  </header>
     
  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
            <i class="bi bi-grid"></i>
          <span>Admin sDashboard</span>
        </a>
      </li>

      <li class="nav-heading">Pages</li>
        <li class="nav-item">
          <asp:LinkButton ID="LinkButton6" class="nav-link " PostBackUrl="~/Ad_Profile.aspx" CausesValidation="false" runat="server">Profile</asp:LinkButton>
        </li>

        <li class="nav-item">
          <asp:LinkButton ID="LinkButton5" class="nav-link collapsed" CausesValidation="false" runat="server">Contact</asp:LinkButton>
        </li>

        <li class="nav-item">
          <asp:LinkButton ID="LinkButton3" class="nav-link collapsed" PostBackUrl="~/Ad_register.aspx" CausesValidation="false" runat="server">Register</asp:LinkButton>
        </li>

        <li class="nav-item">
           <asp:LinkButton ID="LinkButton4" class="nav-link collapsed" PostBackUrl="~/Ad_login.aspx" CausesValidation="false" runat="server">Login</asp:LinkButton>
        </li>

         <li class="nav-item">
           <asp:LinkButton ID="LinkButton10" class="nav-link collapsed" PostBackUrl="~/Ad_Category_add.aspx" CausesValidation="false" runat="server">Category add</asp:LinkButton>
        </li>

        <li class="nav-item">
           <asp:LinkButton ID="LinkButton11" class="nav-link collapsed" PostBackUrl="~/Ad_Category_view.aspx" CausesValidation="false" runat="server">Category view</asp:LinkButton>
        </li>

         <li class="nav-item">
           <asp:LinkButton ID="LinkButton12" class="nav-link collapsed" PostBackUrl="~/Ad_Add_categoryid.aspx" CausesValidation="false" runat="server">Product add</asp:LinkButton>
        </li>

        <li class="nav-item">
           <asp:LinkButton ID="LinkButton13" class="nav-link collapsed" PostBackUrl="~/Ad_Product_view.aspx" CausesValidation="false" runat="server">Product view</asp:LinkButton>
        </li>
     </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Profile</h1>
    </div>

    <section class="section profile" id="showpro">
      <div class="row">
        <div class="col-xl-4">
          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
              <asp:DataList ID="DataList1" runat="server">
                  <ItemTemplate>
                      <asp:Image ID="Image1" runat="server" class="rounded-circle" ImageUrl='<%# Eval("photo") %>'/>
                      
                      <h2 class="text-center pb-1s"><asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label></h2>
                  </ItemTemplate>
                </asp:DataList>
              <h3>Web Designer</h3>
              <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>
        </div>

       <div class="col-xl-8">
          <div class="card">
            <div class="card-body pt-3">
              <ul class="nav nav-tabs nav-tabs-bordered">
                <li class="nav-item">
                   <button type="button" id="btnProfileDetails" class="active nav-link">Profile Details</button>
                </li>
                <li class="nav-item">
                  <button type="button" class="nav-link" id="btnEdit">Edit</button>
                </li>
                <li class="nav-item">
                  <button type="button" class="nav-link" id="btnChangePassword">Change Password</button>
                </li>
              </ul>
          <div>
        </div>
        <div id="contentPlaceholder">
            <div id="profileDetails" class="content pt-3">
                <!-- Profile details content -->
                <asp:Label ID="Label6" class="card-title pb-5" runat="server" Font-Size="24px" Font-Bold="true" Text="Profile Details"></asp:Label>
                <asp:DataList ID="DataList2" runat="server">
                <ItemTemplate>
                  <div class="row " style="width:350px !important;">
                      <div class="col-6">
                        <asp:Label ID="Label4" runat="server" Font-Size="21px" Text="Full Name"></asp:Label>
                    </div>
                    <div class="col-6 ">
                        <asp:Label ID="Label2" runat="server" Font-Size="21px" Text='<%# Eval("name") %>'></asp:Label>
                    </div>
                  </div>
                  <div class="row">
                      <div class="col-6">
                        <asp:Label ID="Label3" runat="server" Font-Size="21px" Text="Phone Number"></asp:Label>
                    </div>
                    <div class="col-6 ">

                        <asp:Label ID="Label5" runat="server" Font-Size="21px" Text='<%# Eval("number") %>'></asp:Label>
                    </div>
                  </div>
               </ItemTemplate>
               </asp:DataList>
            </div>
            <div id="editProfile" class="content pt-4">
             
                  <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                        <div class="pt-2">
                          <asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
                         </div>
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                      <div class="col-md-8 col-lg-9">
                        <asp:TextBox ID="txt_name" class="form-control" runat="server"></asp:TextBox>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                      <div class="col-md-8 col-lg-9">
                        <asp:TextBox ID="txt_phone" TextMode="Phone" class="form-control" runat="server" MaxLength="10"></asp:TextBox>             
                        <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txt_phone" ErrorMessage="Phone number is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txt_phone" ErrorMessage="Please enter a valid 10-digit phone number." ValidationExpression="^\d{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                      </div>
                    </div>
                       
                    <div class="text-center">
                       <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" class="btn btn-primary" OnClick="ed_Click">Save Changes</asp:LinkButton>
                    </div>
                      
                
            </div>
            <div id="changePassword" class="content pt-4">
                <!-- Change Password Form -->

                    <div class="row mb-3 ">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                      <div class="col-md-8 col-lg-9">
                        <asp:TextBox ID="Cu_pass" runat="server" class="form-control"></asp:TextBox>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <asp:TextBox ID="Ne_pass" runat="server" class="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="Ne_pass" ErrorMessage="Password is required." ForeColor="Red" />
                         <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="Ne_pass" 
                         ErrorMessage="Password must be at least 8 characters" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$" />
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Re-enter" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <asp:TextBox ID="Re_pass" runat="server" class="form-control"></asp:TextBox>
                      </div>
                    </div>

                    <div class="text-center">
                      <asp:LinkButton ID="LinkButton2" runat="server" class="btn btn-primary" OnClick="Chpas_Click">Change Password</asp:LinkButton>
                    </div>
                    <!-- End Change Password Form -->
                </div>
              </div>
            </div>
          </div>
        </div>
      
      </div>
    </section>

  </main>
    </form>
    <script>
        $(document).ready(function () {
            $('#profileDetails').show();

            $('button').click(function () {
                $('button').removeClass('active');
                $(this).addClass('active');

                var contentId = '';

                if (this.id === 'btnProfileDetails') {
                    contentId = '#profileDetails';
                } else if (this.id === 'btnEdit') {
                    contentId = '#editProfile';
                } else if (this.id === 'btnChangePassword') {
                    contentId = '#changePassword';
                }

                $('.content').hide();
                $(contentId).show();
            });
        });
    </script>
  <script src="assets/js/main.js"></script>
</body>
</html>
