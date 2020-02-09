# -*- coding: utf-8 -*-
# try something like
@auth.requires(auth.has_membership('Creator') or auth.has_membership('Admin'))
def create():
    form = SQLFORM(db.Fb_leads).process()
    if form.accepted:
        session.flash = 'form accepted'
        redirect(URL('default','home'))
    elif form.errors:
        response.flash = 'form has errors'
    else:
        response.flash = 'please fill the form'
    upload_form = FORM(INPUT(_type='file', _name='data'),
                       INPUT(_type='submit', _class='btn btn-primary' ))
    if upload_form.process().accepted:
        db.Fb_leads.import_from_csv_file(upload_form.vars.data.file, encoding='utf-8', newline='')
        redirect(URL('default','home'))
    return locals()


@auth.requires_login()
def show():
    post = db.Fb_leads(request.args(0,cast=int))
    statuss = db(db.Lead_Status.lead_type=='General Lead').select()
    return locals()


@auth.requires_login()
def view():
    members = db(db.auth_user).select()
    sorter = request.vars.sortdate
    if sorter != None:
        if auth.user_groups.values()[0] == 'Sales_Staff':
            query = db.Fb_leads.Assigned_to == auth.user_id
            leads = db(query & (db.Fb_leads.Lead_Date > sorter)).select()
        else:
            query = db.Fb_leads.Assigned_to != None
            leads = db(query & (db.Fb_leads.Lead_Date > sorter)).select()
    else:
        if auth.user_groups.values()[0] == 'Sales_Staff':
            query = db.Fb_leads.Assigned_to == auth.user_id
            leads = db(query).select()
        else:
            query = db.Fb_leads.Assigned_to != None
            leads = db(query).select()
    return locals()

@auth.requires_login()
def set_reminder():
    db.notifications.insert(set_date=request.vars.remind_date, notif_use='G_reminder', lead_id=request.vars.lead_id, Message=request.vars.user_remarks, Given_by=request.vars.set_byuser, Given_to=request.vars.set_byuser)
    db.commit()
    db.Lead_Status.insert(lead_id=request.vars.lead_id, status="Reminder Set", Updated_by=request.vars.set_byuser, Remarks=request.vars.user_remarks)
    db.commit()
    db(db.Fb_leads.id == request.vars.lead_id).update(Final_Status="Reminder Set")
    db.commit()
    message = 'Status Updated'
    redirect(URL('lead_entry', 'view'))
    return locals()


@auth.requires(auth.has_membership('Creator') or auth.has_membership('Admin'))
def unassign_lead():
    leads = db(db.Fb_leads.id == request.vars.deassign).select()
    for lead in leads:
        to_userid = lead.Assigned_to
    db.notifications.insert(notif_use='Gnrl_leads', lead_id=request.vars.deassign, Message='One General Lead was removed by Admin', Given_by=auth.user_id, Given_to=to_userid)
    db.commit()
    db(db.Fb_leads.id == request.vars.deassign).update(Assigned_to=None)
    db.commit()
    message = 'Status Updated'
    return message


@auth.requires(auth.has_membership('Sales_Staff') or auth.has_membership('Admin'))
def leadStatus_update():
    db.Lead_Status.insert(lead_id=request.vars.view_leadno, lead_type='General Lead', status=request.vars.view_status, Updated_by=request.vars.view_updater, Remarks=request.vars.view_remarks)
    db.commit()
    db(db.Fb_leads.id == request.vars.view_leadno).update(Final_Status=request.vars.view_status)
    db.commit()
    message = request.vars.view_leadno
    return message


@auth.requires_login()
def report():
    Total_leads = 10
    Pending_leads = 2
    firstcontact_leads = 4
    converted_leads = 1
    lost_leads = 3
    return locals()
