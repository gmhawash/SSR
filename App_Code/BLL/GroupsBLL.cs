using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Data.Common;
using TrackerTableAdapters;



/// <summary>
/// Summary description for Class1
/// </summary>

[System.ComponentModel.DataObject]
public class GroupsBLL
{
  private Guid _Id;
  private string _code;
  private string _name;
  private Guid _deptId;

  public GroupsBLL() { }
  public GroupsBLL(Guid id, string code, string name, Guid deptId)
  {
    _Id = id;
    _name = name;
    _code = code;
    _deptId = deptId;
  }

  public Guid Id
  {
    get { return _Id; }
    set { _Id = value; }
  }

  public string Code
  {
    get { return _code; }
    set { _code = value; }
  }

  public string Name
  {
    get { return _name; }
    set { _name = value; }
  }

  public Guid DeptId
  {
    get { return _deptId; }
    set { _deptId = value; }
  }

  public string DeptName
  {
    get
    {
      DeptsTableAdapter ta = new DeptsTableAdapter();
      Tracker.DeptsDataTable depts = ta.GetDeptById(_deptId);
      return ((Tracker.DeptsRow)depts[0]).Description;
    }
  }


  private GroupsTableAdapter _GroupsAdapter = null;
  protected GroupsTableAdapter Adapter
  {
    get
    {
      if (_GroupsAdapter == null)
        _GroupsAdapter = new GroupsTableAdapter();
      return _GroupsAdapter;
    }
  }


  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Select, true)]
  public Tracker.GroupsDataTable GetGroups()
  {
    return Adapter.GetGroups();
  }


  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Select, true)]
  public Tracker.GroupsDataTable GetGroupsWithFK()
  {
    return Adapter.GetGroupsWithFK();
  }

  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Insert, true)]
  public bool AddGroup(string code, string name, Guid deptId)
  {

    // Create a new GroupRow instance 
    Tracker.GroupsDataTable groups = new Tracker.GroupsDataTable();
    Tracker.GroupsRow group = groups.NewGroupsRow();

    group.Code = code;
    group.Name = name;
    group.DeptId = deptId;
    group.Id = Guid.NewGuid();
    groups.AddGroupsRow(group);
    int rowsAffected = Adapter.Update(groups);
    return rowsAffected == 1;
  }


  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Update, true)]
  public bool UpdateGroup(Guid id, string code, string name, Guid deptId)
  {

    // Create a new GroupRow instance 
    Tracker.GroupsDataTable groups = Adapter.GetGroupById(id);
    if (groups.Count == 0)
      return false;

    Tracker.GroupsRow group = groups[0];
    group.Code = code;
    group.Name = name;
    group.DeptId = deptId;
    int rowsAffected = Adapter.Update(groups);
    // Return true if precisely one row was inserted,
    // otherwise false
    return rowsAffected == 1;
  }

  [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Update, true)]
  public bool UpdateGroup(GroupsBLL bll)
  {
    return UpdateGroup(bll.Id, bll.Code, bll.Name, bll.DeptId);
  }

  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Delete, true)]
  public bool DeleteGroup(Guid id)
  {
    int rowsAffected = Adapter.Delete(id);
    // Return true if precisely one row was deleted,
    // otherwise false
    return rowsAffected == 1;
  }

  [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Delete, true)]
  public bool DeleteGroup(GroupsBLL bll)
  {
    return DeleteGroup(bll.Id);
  }

}
