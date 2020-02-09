# -*- coding: utf-8 -*-

Platforms = ('Facebook', 'LinkedIn', 'Website', 'Call', 'Whatsapp', 'Reference', 'Fresh Data', 'Old Student', 'Bill Board','Own Data')


Courses = ('MBA', 'BBA', 'MSC', 'CEO', 'BBA 3Y', 'MBA A', 'MBA AI')


Country = ('AF','AX','AL','DZ','AS','AD','AO','AI','AQ','AG','AR','AM','AW','AU','AT','AZ','BS','BH','BD','BB','BY','BE','BZ','BJ','BM','BT','BO','BQ','BA','BW','BV','BR','IO','BN','BG','BF','BI','KH','CM','CA','CV','KY','CF','TD','CL','CN','CX','CC','CO','KM','CG','CD','CK','CR','CI','HR','CU','CW','CY','CZ','DK','DJ','DM','DO','EC','EG','SV','GQ','ER','EE','ET','FK','FO','FJ','FI','FR','GF','PF','TF','GA','GM','GE','DE','GH','GI','GR','GL','GD','GP','GU','GT','GG','GN','GW','GY','HT','HM','VA','HN','HK','HU','IS','IN','ID','IR','IQ','IE','IM','IL','IT','JM','JP','JE','JO','KZ','KE','KI','KP','KR','KW','KG','LA','LV','LB','LS','LR','LY','LI','LT','LU','MO','MK','MG','MW','MY','MV','ML','MT','MH','MQ','MR','MU','YT','MX','FM','MD','MC','MN','ME','MS','MA','MZ','MM','NA','NR','NP','NL','NC','NZ','NI','NE','NG','NU','NF','MP','NO','OM','PK','PW','PS','PA','PG','PY','PE','PH','PN','PL','PT','PR','QA','RE','RO','RU','RW','BL','SH','KN','LC','MF','PM','VC','WS','SM','ST','SA','SN','RS','SC','SL','SG','SX','SK','SI','SB','SO','ZA','GS','SS','ES','LK','SD','SR','SJ','SZ','SE','CH','SY','TW','TJ','TZ','TH','TL','TG','TK','TO','TT','TN','TR','TM','TC','TV','UG','UA','AE','GB','US','UM','UY','UZ','VU','VE','VN','VG','VI','WF','EH','YE','ZM','ZW',)
db.define_table('Fb_leads',
                Field('Lead_Date','date'),
                Field('campaign_name','string'),
                Field('Course',requires=IS_IN_SET(Courses)),
                Field('platform',requires=IS_IN_SET(Platforms)),
                Field('email','string'),
                Field('full_name','string'),
                Field('phone_number','string'),
                Field('country',requires=IS_IN_SET(Country)),
                Field('Assigned_to','reference auth_user'),
                Field('Final_Status','string')
                )

Batch = ('SHJ ABS MBA W','SHJ SBS MBA W','SHJ SBS MSC HCM W','DXB ABS BBA W','DXB SBS BBA W','DXB ABS MBA O','DXB ABS MBA DS','DXB SBS MBA O','DXB SBS MSC HCM O','DXB SBS DBA 8','DXB SBS DBA 9','DXB SBS DBA 10','AD ABS BBA 0','AD SBS BBA O','AD ABS MBA O','AD SBS MBA O','AD SBS MSC HCM O','AD ABS MBA W','AD SBS MBA W','AD SBS MSC HCM W','AA ABS MBA O','AA SBS MBA O','AA SBS MSC HCM O','RAK ABS BBA O','RAK SBS BBA O','RAK SBS BBA 3Y','RAK ABS MBA O','RAK SBS MBA O','RAK SBS MSC HCM O','RAK ABS MBA W','RAK SBS MBA W','RAK SBS MSC HCM W','BH ABS MBA O','BH SBS MBA O','BH SBS MSC HCM O','BH DBA 4','BH DBA 5','KWT ABS MBA O','KWT SBS MBA O','KWT SBS MSC HCM O','KWT DBA 1','KWT DBA 2','QTR ABS MBA O','QTR SBS MBA O','QTR SBS MSC HCM O','KSA ABS MBA O','KSA SBS MBA O','KSA SBS MSC HCM O','NHSD','PGD','CEO')

db.define_table('Enrollment',
                Field('Enroll_Date', 'date',requires=IS_NOT_EMPTY()),
                Field('Student_name', 'string',requires=IS_NOT_EMPTY()),
                Field('Mobile', 'string',requires=IS_NOT_EMPTY()),
                Field('Email', 'string',requires=IS_NOT_EMPTY()),
                Field('Batch', requires=IS_IN_SET(Batch)),
                Field('En_Source', requires=IS_IN_SET(Platforms)),
                auth.signature
                )
