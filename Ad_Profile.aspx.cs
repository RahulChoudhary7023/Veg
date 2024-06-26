using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Profile : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ADid"] == null)
            Response.Redirect("Ad_login.aspx");

        if(!IsPostBack)
        FillDetails();

    }

     private void  FillDetails()
      {
         string abc;

        DataTable dt = new DataTable();
        abc = "SELECT * from tb_admin where ADid =" + Session["ADid"].ToString();
        dt = c1.GetDT(abc);

        if(dt.Rows.Count >0)
        {
            txt_name.Text = dt.Rows[0]["name"].ToString();
            txt_phone.Text = dt.Rows[0]["number"].ToString();

        }
        DataList1.DataSource = c1.GetDS(abc);
        DataList1.DataBind();

        DataList2.DataSource = c1.GetDS(abc);
        DataList2.DataBind();

        DataList3.DataSource = c1.GetDS(abc);
        DataList3.DataBind();
       }

     protected void ed_Click(object sender, EventArgs e)
    {
        string qry,path,fn,ext;
        FileInfo finfo;

        if (FileUpload1.HasFile)
        {
            fn = FileUpload1.FileName;
            finfo = new FileInfo(fn);
            ext = finfo.Extension;

            path = Server.MapPath("Picture");
            path = path + "\\" + ext;

            FileUpload1.SaveAs(path);

            qry = "UPDATE tb_admin SET photo ='Picture//" + fn + "' ,name='" + txt_name.Text + "',number='" + txt_phone.Text + "' where  ADid = " + Session["ADid"].ToString();
            c1.ExeQry(qry);
        }
        else
        {
            qry = "UPDATE tb_admin SET name='" + txt_name.Text + "',number='" + txt_phone.Text + "' where  ADid = " + Session["ADid"].ToString();
            c1.ExeQry(qry);
        }
        FillDetails();
     }

     protected void Chpas_Click(object sender, EventArgs e)
     {

         string qry = "", cnt;
         qry = "Select Count(*) From tb_admin where ADid = '" + Session["ADid"].ToString() + "' and Password = '" +Cu_pass.Text + "' ";
         cnt = c1.getScalar(qry);

         if (Convert.ToInt16(cnt) == 1)
         {
             qry = "Update tb_admin Set Password = '" + Ne_pass.Text + "' Where ADid = '" + Session["ADid"].ToString() + "'";
             c1.ExeQry(qry);
             Cu_pass.Text = "";
             Ne_pass.Text = "";
             Re_pass.Text = "";
             FillDetails();
         }
         else
         {
             Cu_pass.Text = "Current Password is worng";
             Cu_pass.ForeColor = System.Drawing.Color.Red;
             FillDetails();
         }
     }

     protected void btn_sea(object sender, EventArgs e)
     {

         string searchName = txtSearch.Text.Trim();

         if (!string.IsNullOrEmpty(searchName))
         {
             string abc = "SELECT * from tb_admin where ADid =" + Session["ADid"].ToString() + " AND name LIKE '%" + searchName + "%'";
             DataTable dt = c1.GetDT(abc);

             if (dt.Rows.Count > 0)
             {
                 txt_name.Text = dt.Rows[0]["name"].ToString();
                 txt_phone.Text = dt.Rows[0]["number"].ToString();
                 DataList1.DataSource = dt;
                 DataList1.DataBind();
                 DataList2.DataSource = dt;
                 DataList2.DataBind();
                 DataList3.DataSource = dt;
                 DataList3.DataBind();
             }
             else
             {
                 // Clear controls if no matching record found
                 txt_name.Text = "";
                 txt_phone.Text = "";
                 DataList1.DataSource = null;
                 DataList1.DataBind();
                 DataList2.DataSource = null;
                 DataList2.DataBind();
                 DataList3.DataSource = null;
                 DataList3.DataBind();
                 // Optionally, display a message indicating no records found
                 // Response.Write("No records found.");
             }
         }
         else
         {
             // Handle case where searchName is empty or null
             // Optionally, provide feedback to user to enter a search term
             // Response.Write("Please enter a name to search.");
         }
     }
   
}