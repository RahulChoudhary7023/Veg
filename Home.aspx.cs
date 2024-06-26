using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        string query;
        query = "SELECT * FROM Category_tb order by CAid";
        Repeater1.DataSource = c1.GetDT(query);
        Repeater1.DataBind();
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id;

        id = ((Label) Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_CAid"));
    }
}