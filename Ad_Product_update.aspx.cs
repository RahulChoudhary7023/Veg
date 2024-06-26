using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Product_update : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ADid"] == null)
            Response.Redirect("Ad_login.aspx");

        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        string abc, qry;

        abc = "SELECT * from tb_admin where ADid =" + Session["ADid"].ToString();

        DataList3.DataSource = c1.GetDS(abc);
        DataList3.DataBind();

        DataTable dt = new DataTable();
        qry = "SELECT * FROM Product_tb where PRid =" + Session["ProId"].ToString();

        dt = c1.GetDT(qry);

        if(dt.Rows.Count > 0)
        {
            txt_name.Text = dt.Rows[0]["name"].ToString();
            txt_discription.Text = dt.Rows[0]["description"].ToString();
            txt_price.Text = dt.Rows[0]["price"].ToString();
            txt_status.Text = dt.Rows[0]["status"].ToString();
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        String picture, fn, ext, path;
        FileInfo finfo;

        if(FileUpload1.HasFile)
        {
            fn = FileUpload1.FileName;
            finfo = new FileInfo(fn);
            ext = finfo.Extension;

            path = Server.MapPath("img");
            path = path + "\\" + ext;

            FileUpload1.SaveAs(path);

            picture = "UPDATE Product_tb SET photo='img\\" + fn + "',name='" + txt_name.Text + "',price='" + txt_price.Text + "',description='" + txt_discription.Text + "',status='" + txt_status.Text + "'where  CAid=" + Session["ProId"].ToString();
            c1.ExeQry(picture);
        }
        else
        {
            picture = "UPDATE Product_tb SET name='" + txt_name.Text + "',price='" + txt_price.Text + "',description='" + txt_discription.Text + "',status='" + txt_status.Text + "'where  CAid=" + Session["ProId"].ToString();
            c1.ExeQry(picture);
        }
        Response.Redirect("Ad_Product_view.aspx");
    }
}