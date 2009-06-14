﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrackerTableAdapters;
using System.Web.Security;

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


public partial class admins_Default2 : System.Web.UI.Page
{

  StructControl[] m_controls = { 
        new StructControl ("Dept", "Description", "Id", "TrackerTableAdapters.DeptsTableAdapter", "GetDepts", "required" ), 
        new StructControl ("Group", "Name", "Id", "TrackerTableAdapters.GroupsTableAdapter", "GetGroups", "" ), 
        new StructControl ("Team", "Name", "Id", "TrackerTableAdapters.TeamsTableAdapter", "GetTeams", "" )
      };

  protected void Page_Load(object sender, EventArgs e)
  {
    foreach (StructControl ctrl in m_controls) {
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
      Panel1.Controls.Add(new LiteralControl(string.Format("<div><label class='{0}'>{1}</label><br/>", ctrl.Required, ctrl.Title)));
      Panel1.Controls.Add(dd);
      Panel1.Controls.Add(new LiteralControl("</div>"));
    }

  }

  void dd_SelectedIndexChanged(object sender, EventArgs e)
  {

  }

  void dd_PreRender(object sender, EventArgs e)
  {

  }

  protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
  {
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

  /// <summary>
  /// 
  /// </summary>
  /// <param name="sender"></param>
  /// <param name="e"></param>
  protected void Wizard_FinishClick(object sender, EventArgs e)
  {
    MembershipUser User = Membership.GetUser(CreateUserWizard1.UserName);
    Guid UserGUID = (Guid)User.ProviderUserKey;

    ResourcesTableAdapter ta = new ResourcesTableAdapter();
    ta.Insert(UserGUID, GetId("Dept"), GetId("Group"), GetId("Team"), true);
  }

}