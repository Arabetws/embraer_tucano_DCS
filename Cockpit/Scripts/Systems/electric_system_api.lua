function get_elec_avionics_ok()
    return elec_avionics_ok:get()==1 and true or false
end

function get_elec_avionics_emergency_ok()
    return elec_avionics_emergency_ok:get()==1 and true or false
end

function get_elec_main_bar_ok()
    return elec_main_bar_ok:get()==1 and true or false
end

function get_elec_emergency_ok()
    return elec_emergency_ok:get()==1 and true or false
end

function get_elec_emergency_reserve_ok()
    return elec_emergency_reserve_ok:get()==1 and true or false
end

----- api cockpit
function get_batt_on()
    return get_cockpit_draw_argument_value(1001) == 1
end

function get_generator_on()
    return get_cockpit_draw_argument_value(1002) == 0
end

function get_main_ac_on()
    return get_cockpit_draw_argument_value(1003) == 1
end

function get_stby_ac_on()
    return get_cockpit_draw_argument_value(1004) == 1
end

function get_ext_pwr_on()
    return get_cockpit_draw_argument_value(1001) == -1
end

elec_avionics_ok=get_param_handle("ELEC_AVIONICS_OK") -- 1 or 0
elec_avionics_emergency_ok=get_param_handle("ELEC_AVIONICS_EMEGENCY_OK") -- 1 or 0
elec_main_bar_ok=get_param_handle("ELEC_MAIN_BAR_OK") -- 1 or 0
elec_emergency_ok=get_param_handle("ELEC_EMERGENCY_OK") -- 1 or 0
elec_emergency_reserve_ok=get_param_handle("ELEC_EMERGENCY_RESERVE_OK") -- 1 or 0
elec_avionics_master_mdp=get_param_handle("ELEC_AVIONICS_MASTER_MDP") -- 0, 1 or 2
