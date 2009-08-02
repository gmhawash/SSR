using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using TrackerTableAdapters;

public partial class admins_Default2 : ZaytonaClasses.ZPage
{
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
  public static string m_name;

  StructControl[] m_controls = { 
        new StructControl ("Dept", "Description", "Id", "TrackerTableAdapters.DeptsTableAdapter", "GetDepts", "required" ), 
        new StructControl ("Group", "Name", "Id", "TrackerTableAdapters.GroupsTableAdapter", "GetGroups", "" ), 
        new StructControl ("Team", "Name", "Id", "TrackerTableAdapters.TeamsTableAdapter", "GetTeams", "" )
      };

  void SetValue(string dd, object value)
  {
    DropDownList ddd = Panel1.FindControl(dd) as DropDownList;
    try { ddd.SelectedValue = value.ToString(); }
    catch { ddd.SelectedValue = ""; }
  }

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
      dd.SelectedIndexChanged += new EventHandler(dd_SelectedIndexChanged);
      dd.PreRender += new EventHandler(dd_PreRender);
      dd.DataBind();

      dd.AutoPostBack = true;
      Panel1.Controls.Add(new LiteralControl(string.Format("<div><label class='{0}'>{1}</label><br/>", ctrl.Required, ctrl.Title)));
      Panel1.Controls.Add(dd);
      Panel1.Controls.Add(new LiteralControl("</div>"));
    }

    if (!IsPostBack)
    {
      MembershipUser User = Membership.GetUser(new Guid(Request["Id"]));
      Guid UserGUID = (Guid)User.ProviderUserKey;

      ResourcesTableAdapter ta = new ResourcesTableAdapter();
      Tracker.ResourcesDataTable dt = ta.GetResource(UserGUID);
      SetValue("Dept", dt[0].DeptId);
      SetValue("Group", dt[0].GroupId);
      SetValue("Team", dt[0].TeamId);
      Active.Checked = dt[0].Active;
      Active.Enabled = !Utility.IsAssigned(UserGUID);
      Active.Text = Active.Enabled ? "Active" : "Active - <small>Currently assigned to In Progress SSRs</small>";
    }
  }

  void dd_SelectedIndexChanged(object sender, EventArgs e)
  {

  }

  void dd_PreRender(object sender, EventArgs e)
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

  protected void Save_Click(object sender, EventArgs e)
  {
    MembershipUser User = Membership.GetUser(new Guid(Request["Id"]));
    Guid UserGUID = (Guid)User.ProviderUserKey;

    ResourcesTableAdapter ta = new ResourcesTableAdapter();

    Tracker.ResourcesDataTable dt = ta.GetResource(UserGUID);
    dt[0].GroupId = GetId("Group");
    dt[0].DeptId = GetId("Dept");
    dt[0].TeamId = GetId("Team");
    ta.Update1(GetId("Dept"), GetId("Group"), GetId("Team"), Active.Checked, UserGUID);
    GoBack();
  }

  protected void Cancel_Click(object sender, EventArgs e)
  {
    GoBack();
  }
}
