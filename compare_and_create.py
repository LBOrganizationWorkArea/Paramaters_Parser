from numpy import loadtxt
import numpy as np
import sys
DEFAULT_PARAM=sys.argv[1]
MODIFIED_PARAM=sys.argv[2]
#import text file into NumPy array as integer
data_DEFAULT = loadtxt(DEFAULT_PARAM, dtype='str')
data_MODIFIED = loadtxt(MODIFIED_PARAM, dtype='str')
ARR_DATA_DEFAULT = []
ARR_DATA_MODIFIED = []
data_NAME_DEFAULT = []
#LIST FOR READING
ARR_DATA_MODIFIED_READING = []
#TRANSFER ARRAY

for z in range(len(data_DEFAULT)):
    ARR_DATA_DEFAULT.append(data_DEFAULT[z])
for z in range(len(data_MODIFIED)):
    ARR_DATA_MODIFIED.append(data_MODIFIED[z])
    ARR_DATA_MODIFIED_READING.append(data_MODIFIED[z])

data_REFERENCE = []
data_NOT_EXIST_IN_DEFAULT = []
#display content of text file

for i in range(len(data_DEFAULT)):
    data_NAME_DEFAULT.append(ARR_DATA_DEFAULT[i].split(",")[0])



#CHECK IF NAME EXIST IN DEFAULT
#create 2 array only name

#CHECK IF EXIST

for b in range(len(data_MODIFIED)):

    if (ARR_DATA_MODIFIED[b].split(",")[0]  in data_NAME_DEFAULT):

        for c in range(len(data_NAME_DEFAULT)):
                       if(data_DEFAULT[c].split(",")[0] == ARR_DATA_MODIFIED[b].split(",")[0]):
                           if(data_DEFAULT[c].split(",")[1] != ARR_DATA_MODIFIED[b].split(",")[1]):
                                   #print(data_DEFAULT[c] + " ---- " +  ARR_DATA_MODIFIED[b])
                                   data_REFERENCE.append(ARR_DATA_MODIFIED[b])
                                   break

    else:
        data_NOT_EXIST_IN_DEFAULT.append(ARR_DATA_MODIFIED[b])
        #print(ARR_DATA_MODIFIED[b] + " ---- " + " NON ESISTE IN DEFAULT")
        
FINAL_ARRAY = data_REFERENCE + data_NOT_EXIST_IN_DEFAULT
for z in range(len(FINAL_ARRAY)):
    print(FINAL_ARRAY[z])
print(FINAL_ARRAY)
scelta=input("Press key")
