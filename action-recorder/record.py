import os
import logging
import datetime
import time
import cv2
import mss
import numpy as np

PATH=os.path.join(os.environ['HOME'], '.my_log')

def checkdir(today_path):

    if not os.path.exists(today_path):
        os.makedirs(today_path)
        return False
    return True

if __name__ == '__main__':

    log = logging.getLogger('my_record')
    log.setLevel(logging.DEBUG)
    try:
        monitor = {'top': 0,
                   'left': 0,
                   'width': 1366,
                   'height': 768}
        log.info('record monitor settings: {}', monitor)
        capture = cv2.VideoCapture(0)
        if not capture.isOpened():
            log.error("Unable to read camera feed")


        with mss.mss() as sct:
            log.info('load mss')
            while True:
                now = datetime.datetime.now()

                today_path = os.path.join(PATH, str(now.date().today()))
                name = "{}.png".format(int(now.timestamp()))

                # PATH AND FILE NAME HANDLE
                path_can = os.path.join(today_path, "can")
                _ = checkdir(path_can)
                log.debug('Check path was {}', _)
                out_can = os.path.join(path_can, name)

                # PATH AND FILE NAME HANDLE
                #path_screen = os.path.join(today_path, "screen")
                #_ = checkdir(path_screen)
                #log.debug('Check path was {}', _)
                #out_screen = os.path.join(path_screen, name)

                #log.debug('Start a new capture\n\t{}\n\t{}', out_can, out_screen)

                # OBTAIN IMAGES
                ret, frame_can = capture.read()
                #frame_screen = np.array(sct.grab(monitor))

                # SAVE IMAGES
                cv2.imwrite(out_can, frame_can)
                #cv2.imwrite(out_screen, frame_screen)

                log.debug('sleeping')
                time.sleep(1)
                # if cv2.waitKey(1) & 0xFF == ord('q'):
                    # log.info('End program')
                    # break
    except KeyboardInterrupt:
        print('interrupt')
    finally:
        capture.release()
