using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public struct StructControl
{
  public string Title;
  public string TextField;
  public string ValueField;
  public string DataSource;
  public string SelectMethod;

  public StructControl(string title, string text, string value, string source, string method)
  {
    Title = title;
    TextField = text;
    ValueField = value;
    DataSource = source;
    SelectMethod = method;
  }
}
public partial class managers_Default2 : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    StructControl[] controls = { 
        new StructControl ("Dept", "Description", "Id", "TrackerTableAdapters.DeptsTableAdapter", "GetDepts" ), 
        new StructControl ("Group", "Name", "Id", "TrackerTableAdapters.GroupsTableAdapter", "GetGroups" ), 
        new StructControl ("Team", "Name", "Id", "TrackerTableAdapters.TeamsTableAdapter", "GetTeams" ),
        new StructControl ("Project", "Name", "Id", "TrackerTableAdapters.ProjectsTableAdapter", "GetProjects" ),
        new StructControl ("Status", "Description", "Id", "TrackerTableAdapters.StatusesTableAdapter", "GetStatuses" ),
        new StructControl ("Priority", "Description", "Id", "TrackerTableAdapters.PrioritiesTableAdapter", "GetPriorities" ),
    };

    foreach (StructControl ctrl in controls)
    {
      ObjectDataSource ods = new ObjectDataSource(ctrl.DataSource, ctrl.SelectMethod);
      ods.DataObjectTypeName = "System.Guid";
      DropDownList dd = new DropDownList();
      dd.DataTextField = ctrl.TextField;
      dd.DataValueField = ctrl.ValueField;
      dd.ID = ctrl.Title;
      dd.DataSource = ods;
      dd.DataBind();
      Panel1.Controls.Add(new LiteralControl(string.Format("<div class='field'>{0}:<br/>", ctrl.Title)));
      Panel1.Controls.Add(dd);
      Panel1.Controls.Add(new LiteralControl("</div>"));
    }

    // set initial status to pending...
    DropDownList ddd = Panel1.FindControl("Status") as DropDownList;
    ddd.Enabled = false;
    ddd.SelectedValue = "Pending";

    ////DeptsBLL deptBll = new DeptsBLL();
    //DeptDropDown.DataSource = deptBll.GetDepts();
    //DeptDropDown.DataBind();

  }
}
