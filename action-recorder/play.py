import os
import logging
import datetime
import time
import cv2
import mss
import numpy as np

HOME = os.environ['HOME']

if __name__ == '__main__':

    MULTIPLIER = 6

    can_path = os.path.join(HOME, '.my_log', '2018-05-24', 'can')
    screen_path = os.path.join(HOME, '.my_log', '2018-05-24', 'screen')
    fourcc = cv2.VideoWriter_fourcc(*'mp4v')
    # out = cv2.VideoWriter('out.mp4', fourcc, MULTIPLIER * 30.0, (640,480))

    files = sorted(os.listdir(can_path))

    i = 0
    for img_name in files:
        print("{:.2f} %".format(100 * i / len(files)), end='\r')
        i += 1
        time = datetime.datetime.fromtimestamp(int(img_name.split('.')[0]))

        formated = time.strftime('%d/%m/%Y %H:%M:%S')

        can_img = cv2.imread(os.path.join(can_path, img_name))

        cv2.putText(can_img, formated, (0, 30), cv2.FONT_HERSHEY_SIMPLEX,
                    1, (255, 255, 255), 1, cv2.LINE_AA)
        cv2.imshow('can', can_img)
        # out.write(can_img)
        #screen_img = cv2.imread(os.path.join(screen_path, img_name))
        #screen_img = cv2.resize(screen_img, (780, 438))
        #cv2.imshow('screen', screen_img)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    # out.release()
