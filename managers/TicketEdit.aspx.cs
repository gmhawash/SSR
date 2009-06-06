using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrackerTableAdapters;

public struct StructControl
{
  public string Title;
  public string TextField;
  public string ValueField;
  public string DataSource;
  public string SelectMethod;
  public string Required;

  public StructControl(string title, string text, string value, string source, string method, string required)
  {
    Title = title;
    TextField = text;
    ValueField = value;
    DataSource = source;
    SelectMethod = method;
    Required = required;
  }
}
/* 
 * 
 * Description:
 * 
 * 
 * Input:
 * 
 * Output:
 * 
 */
public partial class managers_Default2 : System.Web.UI.Page
{

  StructControl[] m_controls = { 
        new StructControl ("Dept", "Description", "Id", "TrackerTableAdapters.DeptsTableAdapter", "GetDepts", "required" ), 
        new StructControl ("Group", "Name", "Id", "TrackerTableAdapters.GroupsTableAdapter", "GetGroups", "" ), 
        new StructControl ("Team", "Name", "Id", "TrackerTableAdapters.TeamsTableAdapter", "GetTeams", "" ),
        new StructControl ("Project", "Name", "Id", "TrackerTableAdapters.ProjectsTableAdapter", "GetProjects", "required" ),
        new StructControl ("Status", "Description", "Id", "TrackerTableAdapters.StatusesTableAdapter", "GetStatuses", "" ),
        new StructControl ("Priority", "Description", "Id", "TrackerTableAdapters.PrioritiesTableAdapter", "GetPriorities", "required"),
        new StructControl ("Created By", "UserName", "UserId", "TrackerTableAdapters.aspnet_UsersTableAdapter", "GetUsers", "" ),
        new StructControl ("Requested By", "UserName", "UserId", "TrackerTableAdapters.aspnet_UsersTableAdapter", "GetUsers", "" )
      };

  protected void Page_Load(object sender, EventArgs e)
  {
    foreach (StructControl ctrl in m_controls)
    {
      ObjectDataSource ods = new ObjectDataSource(ctrl.DataSource, ctrl.SelectMethod);
      ods.DataObjectTypeName = "System.Guid";
      DropDownList dd = new DropDownList();
      dd.DataTextField = ctrl.TextField;
      dd.DataValueField = ctrl.ValueField;
      dd.ID = ctrl.Title.Replace(' ', '_');
      dd.DataSource = ods;
      dd.DataBind();
      dd.SelectedIndexChanged += new EventHandler(dd_SelectedIndexChanged);

      dd.AutoPostBack = true;
      Panel1.Controls.Add(new LiteralControl(string.Format("<div class='field'><label class='{0}'>{1}</label><br/>", ctrl.Required, ctrl.Title)));
      Panel1.Controls.Add(dd);
      Panel1.Controls.Add(new LiteralControl("</div>"));

    }

    //// set initial status to pending...
    DropDownList ddd = Panel1.FindControl("Status") as DropDownList;
    ddd.Enabled = false;



    ////DeptsBLL deptBll = new DeptsBLL();
    //DeptDropDown.DataSource = deptBll.GetDepts();
    //DeptDropDown.DataBind();
  }

  void dd_SelectedIndexChanged(object sender, EventArgs e)
  {
    DropDownList dept = Panel1.FindControl("dept") as DropDownList;
    DropDownList group = Panel1.FindControl("Group") as DropDownList;
    DropDownList team = Panel1.FindControl("team") as DropDownList;

    GroupsTableAdapter gta = new GroupsTableAdapter();
    group.DataSource = gta.GetGroupsByDeptId(new Guid(dept.SelectedValue));
    group.DataBind();

    TeamsTableAdapter tta = new TeamsTableAdapter();
    team.DataSource = tta.GetTeamsByGroupId(new Guid(group.SelectedValue));
    team.DataBind();

  }

  protected bool PageValid()
  {
    TextBox[] textBoxes = { Summary, Description };
    bool rc = true;
    foreach (TextBox tb in textBoxes)
    {
      tb.BorderColor = System.Drawing.ColorTranslator.FromHtml("#770000");
      tb.BorderWidth = 0;
      if (tb.Text.Trim().Length == 0)
      {
        tb.BorderWidth = 5;
        rc = false;
      }
    }

    DropDownList prj = Panel1.FindControl("Project") as DropDownList;
    prj.BorderColor = System.Drawing.ColorTranslator.FromHtml("#770000");
    prj.BorderWidth = 0;
    if (prj.SelectedValue.Trim().Length == 0)
    {
      prj.BorderWidth = 5;
      rc = false;
    }

    return rc;
  }

  protected void Discard_Click(object sender, EventArgs e)
  {

  }
  protected void CreateAndAssign_Click(object sender, EventArgs e)
  {

  }
  protected Guid GetId(string id)
  {
    string txt = ((DropDownList)Panel1.FindControl(id)).SelectedValue;
    if (txt.Trim().Length == 0)
      return Guid.Empty;
    else
      return new Guid(txt);
  }
  protected void Create_Click(object sender, EventArgs e)
  {
    if (PageValid())
    {
      DropDownList dept = Panel1.FindControl("dept") as DropDownList;
      DropDownList group = Panel1.FindControl("Group") as DropDownList;
      DropDownList team = ((DropDownList)Panel1.FindControl("team")) as DropDownList;

      TicketsBLL bll = new TicketsBLL();
      bll.deptId = GetId("Dept");
      bll.groupId = GetId("Group");
      bll.teamId = GetId("Team");
      bll.projectId = GetId("Project");
      bll.statusId = GetId("Status");
      bll.priorityId = GetId("Priority");
      bll.createdBy = GetId("Created_By");
      bll.requestedBy = GetId("Requested_By");
      bll.summary = Summary.Text;
      bll.description = Description.Text;
      bll.qaRequired = NeedsQA.Checked;
      bll.workOrderNumber = Work_Order.Text;
      //bll.estimatedCost = Estimated_Dollars.Text;
      //bll.estimatedHours = Estimated_Hours.Text;
      bll.AddTicket();
    }
  }
}
