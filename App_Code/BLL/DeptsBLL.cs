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
using TrackerTableAdapters;

using System.Collections.Generic;
using System.Linq;
using System.Data.Common;


/// <summary>
/// Summary description for Class1
/// </summary>

[System.ComponentModel.DataObject]
public class DeptsBLL
{
  private Guid _Id;
  private string _code;
  private string _description;

  public DeptsBLL(){}
  public DeptsBLL(Guid id, string code, string description)
  {
    _Id = id;
    _description = description;
    _code = code;
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

  public string Description
  {
    get { return _description; }
    set { _description = value; }
  }

  private DeptsTableAdapter _DeptsAdapter = null;
  protected DeptsTableAdapter Adapter
  {
    get
    {
      if (_DeptsAdapter == null)
        _DeptsAdapter = new DeptsTableAdapter();
      return _DeptsAdapter;
    }
  }

  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Select, true)]
  public Tracker.DeptsDataTable GetDepts()
  {
    return Adapter.GetDepts();
  }


  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Insert, true)]
  public bool AddDept(string code, string description)
{

    // Create a new DeptRow instance 
  Tracker.DeptsDataTable depts = new Tracker.DeptsDataTable();
  Tracker.DeptsRow dept = depts.NewDeptsRow();
  dept.Code = code;
  dept.Description = description;
  dept.Id = Guid.NewGuid();
  depts.AddDeptsRow(dept);
  int rowsAffected = Adapter.Update(depts);
  // Return true if precisely one row was inserted,
  // otherwise false
return rowsAffected == 1;
}


  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Update, true)]
  public bool UpdateDept(Guid id, string code, string description)
{

    // Create a new DeptRow instance 
  Tracker.DeptsDataTable depts = Adapter.GetDeptById(id);
  if (depts.Count == 0)
    return false;

  Tracker.DeptsRow dept = depts[0];
  dept.Code = code;
  dept.Description = description;
  int rowsAffected = Adapter.Update(depts);
  // Return true if precisely one row was inserted,
  // otherwise false
  return rowsAffected == 1;
}

  [System.ComponentModel.DataObjectMethodAttribute
(System.ComponentModel.DataObjectMethodType.Update, true)]
  public bool UpdateDept(DeptsBLL bll)
  {
    return UpdateDept(bll.Id, bll.Code, bll.Description);
  }

  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Delete, true)]
  public bool DeleteDept(Guid id)
  {
    int rowsAffected = Adapter.Delete(id);
    // Return true if precisely one row was deleted,
    // otherwise false
    return rowsAffected == 1;
  }

    [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Delete, true)]
    public bool DeleteDept(DeptsBLL bll)
    {
      return DeleteDept(bll.Id);
    }

}
