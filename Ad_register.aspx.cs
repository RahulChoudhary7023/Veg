using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_register : System.Web.UI.Page
{
    Class1 cl = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            FillDetails(); 
    }

    private void FillDetails()
    {

    }
    
    protected void Create_Click(object sender, EventArgs e)
    {
        string qry, fn, path, ext, cnt;
        FileInfo finfo;

        fn = FileUpload1.FileName;
        finfo = new FileInfo(fn);
        ext = finfo.Extension;

        path = Server.MapPath("Picture");
        path = path + "\\" + ext;

        FileUpload1.SaveAs(path);

        qry = "Select Count (*) From tb_admin where number = '" + txt_number.Text + "' and password ='" + txt_password.Text + "' ";
        cnt = cl.getScalar(qry);

        if(Convert.ToInt32(cnt) > 0)
        {
            lbl_Msg.Text = "Mobile Number is Already Registered, Login to View Details ";
            lbl_Msg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            qry = "Insert Into tb_admin (photo,name,email,number,password) values('Picture //" + fn + "','" + txt_name.Text + "','"+ txt_email.Text +"','" + txt_number.Text + "','" + txt_password.Text + "')";
            cl.ExeQry(qry);
            Response.Redirect("Ad_login.aspx");
        }
    }

}