# -*- coding: utf-8 -*-
notify_status = ('Open', 'Closed')
notify_type = ('Gnrl_leads','Frsh_leads','G_reminder','F_reminder','message')
lead_type = ('General Lead', 'Fresh Lead')
Status = ('Details Send', 'No Response', 'Switch Off', 'Invalid no.', 'Call back', 'Not intrested', 'Follow-up','SMS Pending','SMS Processing','SMS Completed','Mailer Pending','Mailer Processing','Mailer Completed','Intrested','Converted','Lost')


db.define_table('Lead_Status',
                Field('lead_id','integer'),
                Field('lead_type',requires=IS_IN_SET(lead_type)),
                Field('status', requires=IS_IN_SET(Status)),
                Field('Update_Date','datetime', default=request.now),
                Field('Updated_by', 'reference auth_user'),
                Field('Remarks', 'text')
                )


db.define_table('app_log',
                 Field('Description', 'string'),
                 Field('Log_datetime', 'datetime', default=request.now)
                 )

db.define_table('notifications',
                Field('set_date','datetime', default=request.now),
                Field('notif_use', requires=IS_IN_SET(notify_type)),
                Field('lead_id','integer'),
                Field('Message', 'string'),
                Field('Given_by', 'reference auth_user'),
                Field('Given_to', 'reference auth_user'),
                Field('Status', requires=IS_IN_SET(notify_status), default='Open')
                )
