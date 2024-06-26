using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Product_view : System.Web.UI.Page
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

        qry = "SELECT *,CASE WHEN status=1 THEN 'Enable' ELSE 'disable' END AS status1 FROM Product_tb where name LIKE '" + txtSearch.Text + "%' ORDER BY CAid ASC";
        dt = c1.GetDT(qry);

        DataList1.DataSource = dt;
        DataList1.DataBind();

    }
    protected void DataList1_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {

        string id = "", qry1, status = "1";

        id = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lbl_PRid")).Text;

        status = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lbl_sta")).Text;

        if (e.CommandName == "change_status")
        {
            if (status.Equals("0"))
            {
                qry1 = "Update Product_tb set status = 1 where  PRid=" + id;

                c1.ExeQry(qry1);
                FillDetails();
            }
            else
            {
                qry1 = "Update Product_tb set status = 0 where  PRid=" + id;

                c1.ExeQry(qry1);
                FillDetails();
            }
        }

        else if (e.CommandName == "btn_Delete")
        {
            qry1 = "Delete from Product_tb where PRid =" + id;

            c1.ExeQry(qry1);
            FillDetails();
        }

        else if (e.CommandName == "edit")
        {
            Session.Add("ProId", id);
            Response.Redirect("Ad_Product_update.aspx");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string searchTerm = txtSearch.Text.Trim();
        FillDetails();
    }

    [WebMethod]
    public static List<string> GetSuggestions(string prefix)
    {
        List<string> suggestions = new List<string>();
        string connectionString = "SERVER=DESKTOP-8H03IUM;DATABASE=Db_veg;Trusted_Connection=yes;";
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT name FROM Product_tb WHERE name LIKE @Prefix + '%'", con))
            {
                cmd.Parameters.AddWithValue("@Prefix", prefix);
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        suggestions.Add(sdr["name"].ToString());
                    }
                }
                con.Close();
            }
        }
        return suggestions;
    }
}
