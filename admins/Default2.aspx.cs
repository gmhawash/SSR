﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data.Common;


public partial class admins_Default2 : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {

  }
  protected void NoDataInsert_Click(object sender, EventArgs e)
  {
      TextBox tbCode = DeptGridView.Controls[0].Controls[0].FindControl("NoDataCode") as TextBox;
      TextBox tbDescription = DeptGridView.Controls[0].Controls[0].FindControl("NoDataDescription") as TextBox;

      DeptsBLL deptBll = new DeptsBLL();
      deptBll.AddDept(tbCode.Text, tbDescription.Text);
      DeptGridView.DataBind();
  }

  protected void InsertNew_Click(object sender, EventArgs e)
  {
    TextBox tbCode = DeptGridView.FooterRow.FindControl("InsertCode") as TextBox;
    TextBox tbDescription = DeptGridView.FooterRow.FindControl("InsertDescription") as TextBox;

    DeptsBLL deptBll = new DeptsBLL();
    deptBll.AddDept(tbCode.Text, tbDescription.Text);
    DeptGridView.DataBind();
  }
}