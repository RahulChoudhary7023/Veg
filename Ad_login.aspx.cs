using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_login : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        txt_number.Focus();
    }

    protected void login_Click (object sender, EventArgs e)
    {
        string abc;
        DataTable dt = new DataTable();
   
        abc = "Select * from tb_admin where number = '"+ txt_number.Text +"' and password = '"+ txt_password.Text +"'";
        dt = c1.GetDT(abc);

        if(dt.Rows.Count == 0)
        {
            lbl_msg.Text = "Either Mobile Number / Password is Wrong";
            lbl_msg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            Session.Add("number", dt.Rows[0]["number"]);
            Session.Add("ADid", dt.Rows[0]["ADid"]);
            Response.Redirect("Ad_Profile.aspx");
        }
    }


}