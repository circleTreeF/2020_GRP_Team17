# import detect
import schedule
import sched, time

def job():
    print("Hello world")
# job = detect.update()
# schedule.every(10).minutes.do(job)
# schedule.every().hour.do(job)
schedule.every().day.at("10:00").do(job)

while 1:
    schedule.run_pending()
    time.sleep(1)
