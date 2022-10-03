import os
import requests
import json
import time

# const file_name = `${speakername}-${speakerid}-${language_id}-${sentence.id}-${today.toDateString()}-${language_name}.wav`


def getToken():
    credentials = {
        "email": "admin@hussain.com",
        "password": "Exceptional7@"
    }
    r = requests.post('https://roomie.pk:5000/auth/login',
                      credentials, verify=False)
    return r.json()['data']['token']


TOKEN = getToken()


def download(url, dest_folder):
    if not os.path.exists(dest_folder):
        os.makedirs(dest_folder)  # create folder if it does not exist

    # be careful with file names
    filename = url.split('/')[-1].replace(" ", "_")
    file_path = os.path.join(dest_folder, filename)

    # token of the user for who we want to get the sentences
    token = TOKEN

    headersAuth = {
        'accept': '*/*',
        'Authorization': 'Bearer '+token
    }
    r = requests.get(url, headers=headersAuth, verify=False, stream=True)
    if r.ok:
        print("saving to", os.path.abspath(file_path))
        with open(file_path, 'wb') as f:
            for chunk in r.iter_content(chunk_size=1024 * 8):
                if chunk:
                    f.write(chunk)
                    f.flush()
                    os.fsync(f.fileno())
    else:  # HTTP status code 4XX/5XX
        print("Download failed: status code {}\n{}".format(r.status_code, r.text))

#download("https://roomie.pk:5000/Burushaski/Mukhtar Wali/Mukhtar Wali-4-1-40598-Tue Aug 24 2021-Burushaski.wav", dest_folder="mydir")


f = open("data.json")
data = json.load(f)

# print(data['data'][1]['recordedAudio'])
existing_speakers = [
    # 'Amjad Hussain',
    # 'Asma Wali',
    #'hussain wali',
    # 'hussainwali',
    #'Irfan Baigal',
    # 'Ishtiaq',
    # 'Jahangir',
    #'Kamal Sahir',
    #'Kashif Ali',
    #'Kashif Murad',
    #'Manzoor Ali',
    #'Mubeen Ishfaq',
    #'Mukhtar Wali',
    #'Rizwan Hassan',
    #'Gulshad Bibi',
    #'Sajid Wali',
    #'Saqib Wali',
    # 'test',
    #'Zahir Uddin',
    #'Minhas Ali',
    #'Afsana Wali',
    #'Gulshad Bibi',
    #'Altaf Hussain',
    #'Eid Wali',
    #'Anwar Ali',
]

# new_speakers = [
#     'Minhas Ali',
#     'Afsana Wali',
#     'Gulshad Bibi',
#     'Altaf Hussain',
#     'Eid Wali',
#     'Anwar Ali',
# ]

new_speakers = []

for j in data['data']:
    recordAudioArray = j['recordedAudio']

    for i in recordAudioArray:
        # print(i)
        if(i):
            try:

                audio_split = i.split("https://roomie.pk:5000/Burushaski/")
                speaker_name = audio_split[1].split('/')[0]
                sentence_id = audio_split[1].split('/')[1].split('-')[3]

                print('-----------------------------------------------')
                if(speaker_name not in existing_speakers):
                    print('downloading: ', i)
                    print('into')
                    print(speaker_name)

                    if(sentence_id and speaker_name):
                        text_file_name = sentence_id+".txt"
                        if not os.path.exists(speaker_name):
                            # create folder if it does not exist
                            os.makedirs(speaker_name)

                        text_file_path = os.path.join(
                            speaker_name, text_file_name)
                        text_file = open(text_file_path, 'w+')

                        j['sentence'] = u''.join(
                            j['sentence']).encode('utf-8').strip()
                        text_file.write(j['sentence'])
                        text_file.close()
                    if(speaker_name != ''):
                        download(i, dest_folder=speaker_name)
                    else:
                        print('folder name not valid')
                        print(i)
                        print('==============================================')
                    time.sleep(2)
            except Exception:
                print("something went wrong 1235")
print("downloading done ")
