--param_code , this is the code that identify the parameter_list 

gcs:send_text(0,"LS VER. 1.0 ")

local param_code_lua = default

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


local PARAM_ARRAY = {PARAM_DEFAULT_TEXT} --array where param are write

--WRITE ALL PARAMETERS FROM  THE ARRAY
for i = 1, (#PARAM_ARRAY) do

    split_string = Split(PARAM_ARRAY[i], ",")

    name = Parameter()
    name : init(tostring(split_string[1]))
    Parameter_name = name:set_and_save(tonumber(split_string[2]))

end