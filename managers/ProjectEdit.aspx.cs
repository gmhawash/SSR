using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrackerTableAdapters;

public partial class managers_Default2 : ZaytonaClasses.ZPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
      DeptsTableAdapter dta = new DeptsTableAdapter();
      DropDownList dept = FormView1.FindControl("Dept") as DropDownList;
      var d = dta.GetDeptByDescription(dept.Text);

      GroupsTableAdapter gta = new GroupsTableAdapter();
      DropDownList group = FormView1.FindControl("Group") as DropDownList;
      var g = gta.GetGroupByName(group.Text);

      ProjectsTableAdapter ta = new ProjectsTableAdapter();
      TextBox tb = FormView1.FindControl("NameTextBox") as TextBox;
      CheckBox cb = FormView1.FindControl("ActiveCheckBox") as CheckBox;
      ta.Insert(Guid.NewGuid(), tb.Text, cb.Checked, d[0].Id, g[0].Id);
    }                                                       
}
