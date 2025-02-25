# -*- coding: utf-8 -*-

gender = ('Male','Female','Transgender','Neutral')
options = ('Yes','No')

db.define_table('naukri_leads',
                Field('Name','string'),
                Field('Gender',requires=IS_IN_SET(gender)),
                Field('Industry','string'),
                Field('Functional_Area','string'),
                Field('Designation','string'),
                Field('Company','string'),
                Field('Experiance','string'),
                Field('Present_Location','string'),
                Field('City','string'),
                Field('Nationality','string'),
                Field('CV_Headline','text'),
                Field('Skills','text'),
                Field('Monthly_Salary','string'),
                Field('Languages','string'),
                Field('Highest_Qualification','string'),
                Field('Landline','string'),
                Field('Mobile','string'),
                Field('Email','string'),
                Field('Last_Modified','date',default=request.now),
                Field('Photo',requires=IS_IN_SET(options)),
                Field('Original_CV',requires=IS_IN_SET(options)),
                Field('Assigned_to','reference auth_user'),
                Field('Final_Status','string')
                )
