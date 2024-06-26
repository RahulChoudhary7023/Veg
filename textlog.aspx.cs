using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Xml;
using System.Web.Services;
using System.Web.UI.WebControls;

public partial class textlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
          
                LoadAdvertisement();
          
        }

        private void LoadAdvertisement()
        {
           
        }
    }

