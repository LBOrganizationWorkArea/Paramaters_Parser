from numpy import loadtxt
import numpy as np
import sys
DEFAULT_PARAM=sys.argv[1]
MODIFIED_PARAM=sys.argv[2]
PARAM_CODE = sys.argv[3]
#import text file into NumPy array as integer
data_DEFAULT = loadtxt(DEFAULT_PARAM, dtype='str')
data_MODIFIED = loadtxt(MODIFIED_PARAM, dtype='str')
ARR_DATA_DEFAULT = []
ARR_DATA_MODIFIED = []
data_NAME_DEFAULT = []
#LIST FOR READING
ARR_DATA_MODIFIED_READING = []
print("DEFAULT PARAMETER LIST : " + DEFAULT_PARAM)
print("MODIFIED PARAMETER LIST : " + MODIFIED_PARAM)
print("PARAM CODE DATE : " + PARAM_CODE)
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
print("Creating array reference ... ")
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
print("Reference Created !")

print("Creating LUA ...")
#create string
FINAL_ARRAY_STRING = ""
for z in range(len(FINAL_ARRAY)) :
    if(z+1==len(FINAL_ARRAY)):
        FINAL_ARRAY_STRING += "'" + (FINAL_ARRAY[z])+"'"
        break

        
    FINAL_ARRAY_STRING += "'" + (FINAL_ARRAY[z])+"'"+","
    
    
#create LUA with new parameters


# Read in the file
with open('DEFAULT_TEXT_LUA\default.lua', 'r') as file :
  filedata = file.read()

# Replace the target string
filedata = filedata.replace('PARAM_DEFAULT_TEXT', FINAL_ARRAY_STRING)
filedata = filedata.replace('local param_code_lua = default', "local param_code_lua = "+PARAM_CODE)

# Write the file out again
with open('scripts\SCRIPT_LUA_PARAMETERS.lua', 'w') as file:
  file.write(filedata)

print("Lua Created ! ")
print("Saved in scripts/ as SCRIPT_LUA_PARAMETERS.lua")

#print(FINAL_ARRAY)
scelta=input("Press key to exit")
