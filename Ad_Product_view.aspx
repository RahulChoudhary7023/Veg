<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ad_Product_view.aspx.cs" Inherits="Ad_Product_view" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

 
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
       
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
   <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script>
        $(function () {
            $("#<%= txtSearch.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "textlog.aspx/GetSuggestions",
                        data: "{ 'prefix': '" + request.term + "' }",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (xhr, status, error) {
                            alert("Error: " + error);
                        }
                    });
                },
                minLength: 1, // Show suggestions after one character
                select: function (event, ui) {
                    $("#<%= txtSearch.ClientID %>").val(ui.item.label);
                    __doPostBack('<%= btnSearch.UniqueID %>', ''); // Trigger the search button click event
                    return false;
                }
            });
        });
    </script> 
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
         <asp:TextBox ID="txtSearch" runat="server" placeholder="Search for"></asp:TextBox>
          <asp:LinkButton ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CausesValidation="false" CssClass="btn btn-primary"></asp:LinkButton>
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
           <asp:LinkButton ID="LinkButton2" class="nav-link collapsed" PostBackUrl="~/Ad_Category_add.aspx" CausesValidation="false" runat="server">Category add</asp:LinkButton>
        </li>

        <li class="nav-item">
           <asp:LinkButton ID="LinkButton10" class="nav-link collapsed" PostBackUrl="~/Ad_Category_view.aspx" CausesValidation="false" runat="server">Category view</asp:LinkButton>
        </li>

         <li class="nav-item">
           <asp:LinkButton ID="LinkButton11" class="nav-link collapsed" PostBackUrl="~/Ad_Add_categoryid.aspx" CausesValidation="false" runat="server">Product add</asp:LinkButton>
        </li>

        <li class="nav-item">
           <asp:LinkButton ID="LinkButton12" class="nav-link collapsed" PostBackUrl="~/Ad_Product_view.aspx" CausesValidation="false" runat="server">Product view</asp:LinkButton>
        </li>
     </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Product</h1>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Product Table</h5>
               <table class="table table-dark">
                <thead>
                  <tr>
                    <th scope="col" class="auto-style1">CAid</th>
                    <th scope="col">Photo</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Price</th>
                    <th scope="col">Discount</th>
                    <th scope="col">Tax</th>
                    <th scope="col">status</th>
                    <th scope="col">Ch_status</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Remove</th>
                  </tr>
                </thead>
                   <tbody>
                <asp:Repeater ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand1">
                <ItemTemplate>
                
                  <tr>
                    <th scope="row" class="auto-style1"> <asp:Label ID="Label8" runat="server" Text='<%# Eval("PRid") %>'></asp:Label></th>
                    <td><asp:Image ID="Image3" runat="server" Height="52px" Width="70" ImageUrl='<%# Eval("photo") %>' /></td>
                    <td> <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label></td>
                    <td> <asp:Label ID="Label2" runat="server" Text='<%# Eval("description") %>'></asp:Label></td>
                    <td> <asp:Label ID="Label3" runat="server" Text='<%# Eval("price") %>'></asp:Label></td>
                    <td> <asp:Label ID="Label5" runat="server" Text='<%# Eval("disc") %>'></asp:Label></td>
                    <td> <asp:Label ID="Label6" runat="server" Text='<%# Eval("tax") %>'></asp:Label></td>
                    <td> <asp:Label ID="Label4" runat="server" Text='<%# Eval("status1") %>'></asp:Label></td>
                    <td><asp:LinkButton ID="LinkButton2" CommandName="change_status" runat="server">Change status</asp:LinkButton></td>
                    <td><asp:LinkButton ID="LinkButton10" CommandName="edit" runat="server">Edit</asp:LinkButton></td>
                    <td><asp:LinkButton ID="LinkButton11" CommandName="btn_Delete" runat="server">Remove</asp:LinkButton></td>
                    <asp:Label ID="lbl_PRid" Visible="false" runat="server" Text='<%# Eval("PRid") %>'></asp:Label>
                    <asp:Label ID="lbl_sta" Visible="false" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                  </tr>
                
               </ItemTemplate>
               </asp:Repeater>
            </tbody>  </table>
            </div>
          </div>
        </div>
      </div>
       

    </section>
  </main>
    </form>

  <script src="assets/js/main.js"></script>

    Price
</body>
</html>
