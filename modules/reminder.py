from datetime import date


def main():
    reminder_no = db((db.Reminder_GN.GRemind_Date >= date.today())& (db.Reminder_GN.GRStatus != 'Closed')).count()
    db.app_log.insert(Description="running cron task")
    db.commit()
    db.app_log.insert(Description="pending reminder count:" + reminder_no)
    db.commit()
    
if __name__ == '__main__':
    main()
