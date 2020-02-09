# -*- coding: utf-8 -*-
# this file is released under public domain and you can use without limitations

# ----------------------------------------------------------------------------------------------------------------------
# this is the main application menu add/remove items as required
# ----------------------------------------------------------------------------------------------------------------------

response.menu = [
    (T('Home'), False, URL('default', 'home'), [])
]

# ----------------------------------------------------------------------------------------------------------------------
# provide shortcuts for development. you can remove everything below in production
# ----------------------------------------------------------------------------------------------------------------------
if auth.has_membership('Admin'):
	response.menu += (
        (T('General Data'), False, URL(), [
                (T('View'), False, URL('lead_entry', 'view'),[]),
                (T('Add'), False, URL('lead_entry', 'create'),[]),
                (T('Assign'),False,URL('default','assign'),[]),
            ]),
        (T('Fresh Data'),False,URL(),[
                (T('View'),False,URL('naukri_lead','view'),[]),
                (T('Add'),False,URL('naukri_lead','create'),[]),
                (T('Assign'),False,URL('naukri_lead','N_assign'),[])
            ]),
        (T('SMS/EMailer'),False,URL('default','SMS_Mail'),[]),
        (T('Enrollments'),False,URL('default','enroll'),[]),
        (T('Settings'),False,URL('default','settings'),[])
    )

if auth.has_membership('Creator'):
	response.menu += (
        (T('General Data'), False, URL(), [
                (T('View'), False, URL('lead_entry', 'view'),[]),
                (T('Add'), False, URL('lead_entry', 'create'),[]),
                (T('Assign'),False,URL('default','assign'),[]),
            ]),
        (T('Fresh Data'),False,URL(),[
                (T('View'),False,URL('naukri_lead','view'),[]),
                (T('Add'),False,URL('naukri_lead','create'),[]),
                (T('Assign'),False,URL('naukri_lead','N_assign'),[])
            ]),
        (T('SMS/EMailer'),False,URL('default','SMS_Mail'),[]),
        (T('Enrollments'),False,URL('default','enroll'),[])
    )

if auth.has_membership('Sales_Staff'):
	response.menu += (
        (T('General Data'), False, URL('lead_entry', 'view'),[]),
        (T('Fresh Data'),False,URL('naukri_lead','view'),[]),
        (T('Enrollments'),False,URL('default','enroll'),[])
    )
