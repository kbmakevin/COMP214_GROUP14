﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using COMP214_GROUP14.App_Code;
using System.Data;

namespace COMP214_GROUP14
{
    public partial class Instructor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnAdd_ServerClick(object sender, EventArgs e)
        {
            DbContext db = new DbContext();
            OracleCommand cmd = new OracleCommand("INSERT INTO SC_INSTRUCTORS VALUES (sc_instructor_id_seq.nextval, :v_fname, :v_lname)");

            OracleParameter para1 = new OracleParameter("v_fname ", txtfName.Text);
            OracleParameter para2 = new OracleParameter("v_lname", txtlName.Text);
            cmd.Parameters.Add(para1);
            cmd.Parameters.Add(para2);
            db.ExecuteNonQuery(cmd);
            ListView1.DataBind();
            divMessage.Attributes.Remove("class");
            divMessage.Attributes.Add("class", "alert alert-success");
            divMessage.InnerText = "Instructor was inserted successfully.";
        }

        protected void ListView1_ItemCommand(object sender, System.Web.UI.WebControls.ListViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteItem")
            {
                DbContext db = new DbContext();
                OracleCommand cmd = new OracleCommand("delete_instuctor_sp");
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                OracleParameter para1 = new OracleParameter("v_instructorid ", Convert.ToInt32(e.CommandArgument));
                OracleParameter para2 = new OracleParameter("v_affectednumber", OracleDbType.Int32, ParameterDirection.Output);
                cmd.Parameters.Add(para1);
                cmd.Parameters.Add(para2);
                db.ExecuteNonQuery(cmd);

                ListView1.DataBind();
                divMessage.Attributes.Remove("class");
                divMessage.Attributes.Add("class", "alert alert-success");
                divMessageBody.InnerText = string.Format("Instructor and his {0} courses were deleted successfully.", para2.Value.ToString());

            }
        }
    }
}