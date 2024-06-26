using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Product_add : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ADid"] == null)
            Response.Redirect("Ad_login.aspx");

        if (Session["Ctgid"] == null)
            Response.Redirect("Ad_Product_add.aspx");

        txt_Ctgid.Text = Session["Ctgid"].ToString();

        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        string qry;

        qry = "SELECT * from tb_admin where ADid =" + Session["ADid"].ToString();

        DataList3.DataSource = c1.GetDS(qry);
        DataList3.DataBind();
    }

    
    protected void add_Click(object sender, EventArgs e)
    {
        String qry, id = "", fn, ext, path, cnt;

        FileInfo finfo;

        fn = FileUpload1.FileName;
        finfo = new FileInfo(fn);
        ext = finfo.Extension;

        path = MapPath("img");
        path = path + "\\" + id + ext;

        FileUpload1.SaveAs(path);

        qry = "INSERT INTO Product_tb(photo,name,description,price,disc,tax,status,CAid) VALUES ('img\\" + fn + "','" + txt_name.Text + "','" + txt_description.Text + "','" + txt_price.Text + "','" + txt_disc.Text + "','" + txt_tax.Text + "','" + txt_status.Text + "','" +txt_Ctgid.Text + "')";

        c1.ExeQry(qry);
        Response.Redirect("Ad_Product_view.aspx");
    }
}