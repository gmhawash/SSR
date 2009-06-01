using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data.Common;


public partial class admins_Config : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
 //     DeptsBLL deptBll = new DeptsBLL();
 //     DeptGridView.DataSource = deptBll.GetDepts();
 //     DeptGridView.DataBind();
    }

    // here we keep the SqlParameters that we will use to insert new row
    private List<SqlParameter> insertParameters = new List<SqlParameter>();

    protected void DataGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "NoDataInsert")
        {
            TextBox tbCode = DeptGridView.Controls[0].Controls[0].FindControl("NoDataCode") as TextBox;
            TextBox tbDescription = DeptGridView.Controls[0].Controls[0].FindControl("NoDataDescription") as TextBox;

            SqlParameter spCode = new SqlParameter("@Code", SqlDbType.VarChar, 10);
            spCode.Direction = ParameterDirection.Input;
            spCode.Value = tbCode.Text;
            insertParameters.Add(spCode);

            SqlParameter spDescription = new SqlParameter("@Description", SqlDbType.VarChar, 30);
            spDescription.Direction = ParameterDirection.Input;
            spDescription.Value = tbDescription.Text;
            insertParameters.Add(spDescription);

            // Autogenerate the ID
            SqlParameter spId = new SqlParameter("@Id", SqlDbType.UniqueIdentifier);
            spId.Direction = ParameterDirection.Input;
            spId.Value = Guid.NewGuid();
            insertParameters.Add(spId);

            DeptSqlDataSource.Insert();
        }
        else if (e.CommandName == "InsertNew")
        {
            TextBox tbCode = DeptGridView.FooterRow.FindControl("InsertCode") as TextBox;
            TextBox tbDescription = DeptGridView.FooterRow.FindControl("InsertDescription") as TextBox;

            SqlParameter spCode = new SqlParameter("@Code", SqlDbType.VarChar, 10);
            spCode.Direction = ParameterDirection.Input;
            spCode.Value = tbCode.Text;
            insertParameters.Add(spCode);

            SqlParameter spDescription = new SqlParameter("@Description", SqlDbType.VarChar, 30);
            spDescription.Direction = ParameterDirection.Input;
            spDescription.Value = tbDescription.Text;
            insertParameters.Add(spDescription);
            // Autogenerate the ID
            SqlParameter spId = new SqlParameter("@Id", SqlDbType.UniqueIdentifier);
            spId.Direction = ParameterDirection.Input;
            spId.Value = Guid.NewGuid();
            insertParameters.Add(spId);

            DeptSqlDataSource.Insert();
        }
    }
    
    protected void DeptSqlDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters.Clear();
        foreach (SqlParameter p in insertParameters)
            e.Command.Parameters.Add(p);
    }

    protected void DeptSqlDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        insertParameters.Clear();
    }

}
