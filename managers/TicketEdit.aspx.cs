using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class managers_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      DeptsBLL deptBll = new DeptsBLL();
      DeptDropDown.DataSource = deptBll.GetDepts();
      DeptDropDown.DataBind();

    }
}
