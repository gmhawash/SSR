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


public partial class admins_Default2 : ZaytonaClasses.ZPage
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
  
  protected void GroupInsert(TextBox tb1, TextBox tb2, DropDownList dd)
  {
    try
    {
      GroupsBLL groupBll = new GroupsBLL();
      groupBll.AddGroup(tb1.Text, tb2.Text, new Guid(dd.SelectedItem.Value));
      GroupGridView.DataBind();
    }
    catch (Exception e)
    {
      Flash.Text = e.Message;
      Flash.Visible = true;
    }
 }
  
  protected void GroupInsert_Click(object sender, EventArgs e)
  {
    if (((LinkButton)sender).ID == "InsertFirst")
    {
      TextBox tb1 = GroupGridView.Controls[0].Controls[0].FindControl("GroupFirstCode") as TextBox;
      TextBox tb2 = GroupGridView.Controls[0].Controls[0].FindControl("GroupFirstName") as TextBox;
      DropDownList dd = GroupGridView.Controls[0].Controls[0].FindControl("GroupFirstDeptId") as DropDownList;
      GroupInsert(tb1, tb2, dd);

    }
    else if (((LinkButton)sender).ID == "InsertNew")
    {
      TextBox tb1 = GroupGridView.FooterRow.FindControl("GroupCode") as TextBox;
      TextBox tb2 = GroupGridView.FooterRow.FindControl("GroupName") as TextBox;
      DropDownList dd = GroupGridView.FooterRow.FindControl("GroupDeptId") as DropDownList;
      GroupInsert(tb1, tb2, dd);

    }
  }
  protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
  {
    TextBox tb1 = GroupGridView.FooterRow.FindControl("GroupCode") as TextBox;
    
  }
  protected void GroupGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
  {
    if (e.Exception != null)
    {
      Flash.Visible = true;
      Flash.Text = e.Exception.Message;
      e.ExceptionHandled = true;
      e.KeepInEditMode = true;
    }
  }
}
