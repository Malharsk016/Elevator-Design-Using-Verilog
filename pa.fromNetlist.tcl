
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name elevatorproject2 -dir "C:/Users/Asus/Desktop/01fe21bee016/Verilog/elevatorproject2/planAhead_run_1" -part xc6slx4tqg144-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Asus/Desktop/01fe21bee016/Verilog/elevatorproject2/elevatorproject2.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Asus/Desktop/01fe21bee016/Verilog/elevatorproject2} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "elevatorproject2.ucf" [current_fileset -constrset]
add_files [list {elevatorproject2.ucf}] -fileset [get_property constrset [current_run]]
link_design
