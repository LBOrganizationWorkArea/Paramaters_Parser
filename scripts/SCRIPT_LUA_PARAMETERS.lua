--param_code , this is the code that identify the parameter_list 

local param_code_lua = 220712

-- let arducopter know of parameter LB_PARAM_CODE

local PARAM_TABLE_KEY = 72
assert(param:add_table(PARAM_TABLE_KEY, "LB_", 1), 'could not add param table')
assert(param:add_param(PARAM_TABLE_KEY, 1,  'PARAM_CODE', 0), 'could not add param1')

--READ LB_PARAM_CODE

local LB_PARAM_CODE = Parameter()
LB_PARAM_CODE:init('LB_PARAM_CODE')
local parameter = LB_PARAM_CODE:get()

--check parameter exist(LB_PARAM_CODE)

if (parameter == 0 ) then --not exist

    gcs:send_text(0,"LS-NO CODE-create W param")

    --WRITE PARAM_CODE_LUA
    LB_PARAM_CODE = Parameter()
    LB_PARAM_CODE : init("LB_PARAM_CODE")
    Parameter_name = LB_PARAM_CODE:set_and_save(param_code_lua)

else
    if(parameter == param_code_lua )then 

        gcs:send_text(0,"LS-code same exit no W param")
        return
    else
        if(parameter ~= param_code_lua)then

            LB_PARAM_CODE = Parameter()
            LB_PARAM_CODE : init("LB_PARAM_CODE")
            Parameter_name = LB_PARAM_CODE:set_and_save(param_code_lua)

            gcs:send_text(0,"LS-code diff overwrite code and params")
            
        end

    end



    
end 


--function for split 
function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end


local PARAM_ARRAY = {'AHRS_GPS_USE,2','AHRS_ORIENTATION,6','ANGLE_MAX,4500','ARMING_CHECK,13822','ATC_ACCEL_P_MAX,200000','ATC_ACCEL_R_MAX,200000','ATC_ACCEL_Y_MAX,50000','ATC_ANG_PIT_P,18','ATC_ANG_RLL_P,18','ATC_ANG_YAW_P,10','ATC_RAT_PIT_D,0.003','ATC_RAT_PIT_FLTD,50','ATC_RAT_PIT_FLTT,10','ATC_RAT_PIT_I,0.14','ATC_RAT_PIT_P,0.14','ATC_RAT_RLL_D,0.003','ATC_RAT_RLL_FLTD,50','ATC_RAT_RLL_FLTT,10','ATC_RAT_RLL_I,0.14','ATC_RAT_RLL_P,0.14','ATC_RAT_YAW_FLTD,50','ATC_RAT_YAW_FLTE,3.7','ATC_RAT_YAW_FLTT,10','ATC_RAT_YAW_I,0.05','ATC_RAT_YAW_P,0.5','AUTOTUNE_AGGR,0.075','AUTOTUNE_MIN_D,0.0003','AVOID_ENABLE,0','BARO1_GND_PRESS,101445.3','BATT_MONITOR,4','BRD_SAFETY_MASK,16368','BRD_SAFETYENABLE,0','BRD_SAFETYOPTION,0','CAN_D1_PROTOCOL,0','CAN_D2_PROTOCOL,0','COMPASS_ORIENT,12','COMPASS_TYPEMASK,514942','COMPASS_USE2,0','COMPASS_USE3,0','EK3_ALT_M_NSE,3','EK3_IMU_MASK,1','EK3_POSNE_M_NSE,0.1','EK3_SRC1_POSZ,3','ESC_CALIBRATION,9','FLTMODE3,2','FLTMODE4,2','FLTMODE5,5','FLTMODE6,5','FRAME_CLASS,1','FRSKY_DNLINK_ID,-1','FRSKY_DNLINK1_ID,-1','FRSKY_DNLINK2_ID,-1','FRSKY_UPLINK_ID,-1','FS_OPTIONS,20','FS_THR_ENABLE,0','FS_VIBE_ENABLE,0','GND_EFFECT_COMP,0','INS_ACC_BODYFIX,1','INS_ACC_ID,3474466','INS_ACCEL_FILTER,10','INS_ACCSCAL_X,1','INS_ACCSCAL_Y,1','INS_ACCSCAL_Z,1','INS_ENABLE_MASK,1','INS_GYR_ID,3474466','INS_GYR1_CALTEMP,41.90821','INS_GYRO_FILTER,50','INS_GYROFFS_X,-0.001282835','INS_GYROFFS_Y,0.002730493','INS_GYROFFS_Z,0.00403388','INS_HNTCH_ENABLE,1','INS_LOG_BAT_CNT,32','INS_LOG_BAT_OPT,2','LAND_ALT_LOW,500','LAND_SPEED,80','LAND_SPEED_HIGH,300','LOG_BITMASK,141310','LOG_FILE_DSRMROT,1','LOIT_SPEED,2000','MOT_BAT_VOLT_MAX,7.56','MOT_BAT_VOLT_MIN,5.2','MOT_HOVER_LEARN,1','MOT_PWM_TYPE,6','MOT_SPIN_ARM,0.05','MOT_SPIN_MIN,0.16','MOT_THST_EXPO,0.55','MOT_THST_HOVER,0.47','NTF_BUZZ_TYPES,1','NTF_LED_BRIGHT,1','NTF_LED_TYPES,1','PSC_ACCZ_I,0.94','PSC_ACCZ_P,0.47','PSC_JERK_XY,6','PSC_JERK_Z,6','RC_PROTOCOLS,0','RC6_OPTION,5','SCHED_LOOP_RATE,800','SERIAL1_BAUD,921','SERIAL2_OPTIONS,8','SERIAL4_BAUD,115','SERIAL4_PROTOCOL,16','SERIAL5_BAUD,921','SERVO_BLH_AUTO,1','SERVO_BLH_POLES,12','SERVO_BLH_TRATE,0','SERVO_DSHOT_ESC,1','SERVO_DSHOT_RATE,2','SERVO1_FUNCTION,33','SERVO1_MAX,2000','SERVO1_MIN,1000','SERVO2_FUNCTION,34','SERVO2_MAX,2000','SERVO2_MIN,1000','SERVO3_FUNCTION,35','SERVO3_MAX,2000','SERVO3_MIN,1000','SERVO4_FUNCTION,36','SERVO4_MAX,2000','SERVO4_MIN,1000','SRTL_POINTS,0','STAT_BOOTCNT,1','TERRAIN_ENABLE,0','WP_YAW_BEHAVIOR,0','WPNAV_ACCEL,300','WPNAV_ACCEL_Z,300','WPNAV_JERK,6','WPNAV_SPEED_DN,300','WPNAV_SPEED_UP,300','BATT_AMP_OFFSET,0','BATT_AMP_PERVLT,4.6135','BATT_ARM_MAH,0','BATT_ARM_VOLT,7.2','BATT_CAPACITY,3400','BATT_CRT_MAH,0','BATT_CRT_VOLT,6','BATT_CURR_PIN,15','BATT_FS_CRT_ACT,1','BATT_FS_LOW_ACT,2','BATT_FS_VOLTSRC,0','BATT_LOW_MAH,0','BATT_LOW_TIMER,10','BATT_LOW_VOLT,6.2','BATT_OPTIONS,0','BATT_SERIAL_NUM,-1','BATT_VLT_OFFSET,0','BATT_VOLT_MULT,2.74','BATT_VOLT_PIN,14','CM_FLOCK_OPTIONS,0','INS_HNTCH_ATT,40','INS_HNTCH_BW,20','INS_HNTCH_FREQ,100','INS_HNTCH_HMNCS,3','INS_HNTCH_MODE,3','INS_HNTCH_OPTS,6','INS_HNTCH_REF,1','SERVO_BLH_BDMASK,15','SHOW_CTRL_MODE,1','SHOW_CTRL_RATE,10','SHOW_GROUP,0','SHOW_LED0_CHAN,7','SHOW_LED0_COUNT,100','SHOW_LED0_GAMMA,2.2','SHOW_LED0_TYPE,2','SHOW_MAX_XY_ERR,3','SHOW_MODE_BOOT,2','SHOW_ORIENTATION,-1','SHOW_ORIGIN_AMSL,-10000000','SHOW_ORIGIN_LAT,0','SHOW_ORIGIN_LNG,0','SHOW_PRE_LIGHTS,2','SHOW_START_AUTH,0','SHOW_START_TIME,-1','SHOW_SYNC_MODE,1','SHOW_TAKEOFF_ALT,2.5','SHOW_VEL_FF_GAIN,1'} --array where param are write

--WRITE ALL PARAMETERS FROM  THE ARRAY
for i = 1, (#PARAM_ARRAY) do

    split_string = Split(PARAM_ARRAY[i], ",")

    name = Parameter()
    name : init(tostring(split_string[1]))
    Parameter_name = name:set_and_save(tonumber(split_string[2]))

end