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
public partial class managers_Default2 : ZaytonaClasses.ZPage
{
  string m_ddTrigger = null;

  StructControl[] m_controls = { 
        new StructControl ("Dept", "Description", "Id", "TrackerTableAdapters.DeptsTableAdapter", "GetDepts", "required" ), 
        new StructControl ("Group", "Name", "Id", "TrackerTableAdapters.GroupsTableAdapter", "GetGroups", "" ), 
        new StructControl ("Team", "Name", "Id", "TrackerTableAdapters.TeamsTableAdapter", "GetTeams", "" ),
        new StructControl ("Product", "Name", "Id", "TrackerTableAdapters.ProjectsTableAdapter", "GetProjects", "required" ),
        new StructControl ("Status", "Description", "Id", "TrackerTableAdapters.StatusesTableAdapter", "GetStatuses", "" ),
        new StructControl ("Priority", "Description", "Id", "TrackerTableAdapters.PrioritiesTableAdapter", "GetPriorities", ""),
        new StructControl ("Created By", "UserName", "UserId", "TrackerTableAdapters.aspnet_UsersTableAdapter", "GetUsers", "" ),
        new StructControl ("Requested By", "UserName", "UserId", "TrackerTableAdapters.aspnet_UsersTableAdapter", "GetUsers", "required" ),
        new StructControl ("Business Unit Rep", "UserName", "UserId", "TrackerTableAdapters.aspnet_UsersTableAdapter", "GetUsers", "" )
      };

  /// <summary>
  /// 
  /// </summary>
  /// <param name="sender"></param>
  /// <param name="e"></param>
  protected void Page_Load(object sender, EventArgs e)
  {

    // create controls from above array...
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
      dd.PreRender += new EventHandler(dd_PreRender);

      dd.AutoPostBack = true;
      Panel1.Controls.Add(new LiteralControl(string.Format("<div class='field'><label class='{0}'>{1}</label><br/>", ctrl.Required, ctrl.Title)));
      Panel1.Controls.Add(dd);
      Panel1.Controls.Add(new LiteralControl("</div>"));
    }

    if (!IsPostBack)
    {
      SetText("Created_By", User.Identity.Name, false);

      string Id = Request.QueryString["Id"];
      if (Id == null)
      {
        SetText("Status", "Pending", false);
        SetText("Group", "S&P", true);
        DropDownList ddd = Panel1.FindControl("Product") as DropDownList;
        ddd.Items.Insert(0, "");
        SetText("Product", "", true);
      }
      else
      {
        TicketsTableAdapter ta = new TicketsTableAdapter();

        Tracker.TicketsDataTable dt = ta.GetTicket(new Guid(Id));
        SetValue("Dept", dt[0].DeptId);
        SetValue("Group", dt[0].GroupId);
        SetValue("Team", dt[0].TeamId);
        SetValue("Product", dt[0].ProjectId);
        SetValue("Status", dt[0].StatusId);
        SetValue("Priority", dt[0].PriorityId);
        SetValue("Created_By", dt[0].CreatedBy);
        SetValue("Requested_By", dt[0].RequestedBy);
        try { SetValue("Business_Unit_Rep", dt[0].BusinessUnitRep); }
        catch { }
        Summary.Text = dt[0].Summary;
        Description.Text = dt[0].Description;
        Actual_Hours.Text = dt[0].ActualHours.ToString();
        Actual_Cost.Text = dt[0].ActualCost.ToString();
        TicketId.Text = dt[0].Id.ToString();
        Create.Text = "Assign";
        CreateAndAssign.Text = "Update";
        CreateAndAssign.OnClientClick = "Update_Click";
        NeedsQA.Checked = dt[0].QARequired;

        try { ReceivedDate.Text = dt[0].ReceivedOn.ToShortDateString(); }
        catch { ReceivedDate.Text = ""; }

        try { DueToQADate.Text = dt[0].QAStartDate.ToShortDateString(); }
        catch {DueToQADate.Text = "";}
        try { QACompleteDate.Text = dt[0].QACompletedDate.ToShortDateString(); }
        catch { QACompleteDate.Text = ""; }

        try { ImplementationDate.Text = dt[0].PlannedImplementationDate.ToShortDateString(); }
        catch { ImplementationDate.Text = ""; }
        try { UserCompleteDate.Text = dt[0].UserTestCompleteDate.ToShortDateString(); }
        catch { UserCompleteDate.Text = ""; }
        try { UserTestDueDate.Text = dt[0].UserTestDueDate.ToShortDateString(); }
        catch { UserTestDueDate.Text = ""; }
      }
      QAPanel.Visible = (((DropDownList)Panel1.FindControl("Status")).SelectedItem.Text == "Pending") || (((DropDownList)Panel1.FindControl("Status")).SelectedItem.Text == "In Progress");
      InProgressPanel.Visible = (((DropDownList)Panel1.FindControl("Status")).SelectedItem.Text == "In Progress");
    }
  }

  void SetText(string dd, string text, bool enabled)
  {
    DropDownList ddd = Panel1.FindControl(dd) as DropDownList;
    ddd.SelectedIndex = ddd.Items.IndexOf(ddd.Items.FindByText(text));
    ddd.Enabled = enabled;
  }

  void SetValue(string dd, object value)
  {
    DropDownList ddd = Panel1.FindControl(dd) as DropDownList;
    try { ddd.SelectedValue = value.ToString(); }
    catch { ddd.SelectedValue = ""; }
  }


  /// <summary>
  /// 
  /// </summary>
  /// <param name="sender"></param>
  /// <param name="e"></param>
  void dd_PreRender(object sender, EventArgs e)
  {
    return;
    // Clear Team in case the Group is empty...
    if (m_ddTrigger == "Group")
    {
      DropDownList dd = sender as DropDownList;
      if (dd.SelectedItem == null)
      {
        DropDownList dst = Panel1.FindControl("Team") as DropDownList;
        dst.Items.Clear();
      }
      else
      {
        TeamsTableAdapter tta = new TeamsTableAdapter();
        DropDownList dst = Panel1.FindControl("Team") as DropDownList;
        dst.DataSource = tta.GetTeamsByGroupId(new Guid(dd.SelectedValue));
        dst.DataBind();
      }
    }
  }

  void dd_SelectedIndexChanged(object sender, EventArgs e)
  {
    DropDownList dd = sender as DropDownList;

    if (dd.SelectedItem == null)
      return;

    m_ddTrigger = dd.ID;

    switch (dd.ID)
    {
      case "Dept":
        GroupsTableAdapter gta = new GroupsTableAdapter();
        DropDownList dst = Panel1.FindControl("Group") as DropDownList;
        dst.DataSource = gta.GetGroupsByDeptId(new Guid(dd.SelectedValue));
        dst.DataBind();
        break;
      case "Group":
        TeamsTableAdapter tta = new TeamsTableAdapter();
        dst = Panel1.FindControl("Team") as DropDownList;
        dst.DataSource = tta.GetTeamsByGroupId(new Guid(dd.SelectedValue));
        dst.DataBind();
        break;
      case "Team":
        break;
    }

  }

  /// <summary>
  /// Handle required fields..
  /// </summary>
  /// <returns></returns>
  protected bool PageValid()
  {
    TextBox[] textBoxes = { Summary, Description, ReceivedDate };
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


    string[] dds = { "Product", "Requested_By" };

    foreach (string id in dds)
    {
      DropDownList dd = Panel1.FindControl(id) as DropDownList;
      dd.BorderColor = System.Drawing.ColorTranslator.FromHtml("#770000");
      dd.BorderWidth = 0;
      if (dd.SelectedValue.Trim().Length == 0)
      {
        dd.BorderWidth = 5;
        rc = false;
      }
    }

    return rc;
  }

  /// <summary>
  /// 
  /// </summary>
  /// <param name="sender"></param>
  /// <param name="e"></param>
  protected void Discard_Click(object sender, EventArgs e)
  {
    Response.Redirect("Tickets.aspx", true);
  }

  /// <summary>
  /// 
  /// </summary>
  /// <param name="id"></param>
  /// <returns></returns>
  protected Guid GetId(string id)
  {
    string txt = ((DropDownList)Panel1.FindControl(id)).SelectedValue;
    if (txt.Trim().Length == 0)
      return Guid.Empty;
    else
      return new Guid(txt);
  }

  protected void Update_Click(object sender, EventArgs e)
  {

  }


  protected Int32 ToInt(string str)
  {
    if (str.Trim().Length > 0)
      return Convert.ToInt32(str);

    return 0;
  }
  /// <summary>
  /// 
  /// </summary>
  /// <param name="sender"></param>
  /// <param name="e"></param>
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
      bll.projectId = GetId("Product");
      bll.statusId = GetId("Status");
      bll.priorityId = GetId("Priority");
      bll.createdBy = GetId("Created_By");
      bll.requestedBy = GetId("Requested_By");
      bll.businessUnitRep = GetId("Business_Unit_Rep");
      
      bll.summary = Summary.Text;
      bll.description = Description.Text;
      bll.actualCost = ToInt(Actual_Cost.Text);
      bll.actualHours = ToInt(Actual_Hours.Text);

      try { bll.receivedOn = Convert.ToDateTime(ReceivedDate.Text); }
      catch { }
      try { bll.qaStartDate = Convert.ToDateTime(DueToQADate.Text); }
      catch { }
      try { bll.qaCompleteDate = Convert.ToDateTime(QACompleteDate.Text); }
      catch { }
      try { bll.userTestDate = Convert.ToDateTime(UserTestDueDate.Text); }
      catch { }
      try { bll.userTestCompleteDate = Convert.ToDateTime(UserCompleteDate.Text); }   catch { }
      try { bll.plannedImplementationDate = Convert.ToDateTime(ImplementationDate.Text); }   catch { }

      switch (((Button)sender).Text)
      {
        case "Update":
          bll.Id = new Guid(TicketId.Text);
          bll.Update();
          break;

        case "Create and Assign":
          bll.AddTicket();
          goto case "Assign";

        case "Create":
          bll.AddTicket();
          break;

        case "Assign":
          Session.Add("TicketId", (Request.QueryString["Id"] == null) ? bll.Id.ToString() : Request.QueryString["Id"]);
          Redirect("Assign.aspx?Id=" + ((Request.QueryString["Id"] == null) ? bll.Id.ToString() : Request.QueryString["Id"]));
          break;
      }

      Redirect("Tickets.aspx");
    }
  }

  public bool IsStatus(string status)
  {
    return false;
  }

}
