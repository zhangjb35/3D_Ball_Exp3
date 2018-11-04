    ################################################################################################
    #
    #                                   Exp 2: Indirect Task 
	 #
    #                             Jinbo Zhang @ Sun Yat-sen University
    #                                     
    #
    ################################################################################################
    #------------------------- Header --------------------------
    pcl_file = "../Control/main.pcl";
    no_logfile = false;
    #------------------------- View Setting --------------------
    field_of_view = 37.167467; 
    front_clip_distance = 90; 
    back_clip_distance = 350; 
    #------------------------- Response --------------------------
    response_matching = simple_matching;
    active_buttons = 4;
    # 1 = J/RT 
    # 2 = F/LT
    # 3 = SPACE/START
    # 4 = TAB/BACK
    begin;
    #------------------------- Target Button Setting -----------
    $start = 3;
    $back = 4;
    #------------------------- Device Info --------------------------
    $refresh_rate = 60;
    #------------------------- Duration --------------------------
    $duration_fixation = 500;
    $duration_stimulus = 500;
    $duration_present = 2000;
    #------------------------- Position --------------------------
    $position_camera_z = -100; 
    $position_ball_z =  0;
    $position_ball_near_z = -80;
    $position_ball_far_z = 400;
    $position_fixation_z = -475;
    #------------------------- 确定可以呈现的 Frame 数量 --------------------------
    $frame = 35; # 500 ms = 36 frames at 144 Hz and 3D Version Model
    # －1 是为了去除第一格 Frame
    $interval = '1000/$refresh_rate';
    $count = 1;
    # count = 1 等同于说：这是第一格
    #------------------------- Speed --------------------------
    $ball_abs_speed = '($position_ball_far_z-$position_ball_near_z)/($frame + 1)';
    #------------------------- Size --------------------------
    $sphere_r = 5;
    #------------------------- Texture ------------------------
	 texture { filename = "../Media/hor.bmp";} txr_ball;
    #------------------------- Sound --------------------------
    array {
        sound { 
            wavefile { 
                filename = "../Media/ramp_sin_increase_gap1.wav"; 
                preload = true; 
            }; 
            description = "increase_gap"; 
        } sound_increase_gap;   
        sound { 
            wavefile { 
                filename = "../Media/ramp_sin_decrease_gap1.wav"; 
                preload = true; 
            }; 
            description = "decrease_gap"; 
        } sound_decrease_gap;
        sound { 
            wavefile { 
                filename = "../Media/ramp_sin_increase.wav"; 
                preload = true; 
            }; 
            description = "increase"; 
        } sound_increase;   
        sound { 
            wavefile { 
                filename = "../Media/ramp_sin_decrease.wav"; 
                preload = true; 
            }; 
            description = "decrease"; 
        } sound_decrease;
    } sounds;
    #------------------------- Light --------------------------
    light {
        light_type = light_directional; 
        direction = 0, 0, 1;
        diffuse = 1.0, 1.0, 1.0;
        ambient = 0.1, 0.1, 0.1;
        specular = 1.0, 0.3, 0.3;
    } light_main;
    #------------------------- Object --------------------------
    sphere { 
        radius = $sphere_r;

        slices = 512; 
        stacks = 512;
        alpha = 1; 
        # 1 = 不透明
        mesh_texture = txr_ball;
    } ball;
    #------------------------- Plane --------------------------
    texture {
        filename = "../Media/fixation.jpg";
    } txr_fix;

    plane {
        width = 6; height = 6;
        mesh_texture = txr_fix;
        color = 255.0, 255.0, 255.0;
        emissive = 1.0, 1.0, 1.0;
    } fix_plane;
    #------------------------- Pic --------------------------
    #------------------------- Block --------------------------
    picture {
        text {
            caption = "当前任务";
            font_size = 96;
            font_color = 255,255,0;
        } text_task_remind_title;
        x = 0; y = 350;
        text {
            caption = " ";
            font_size = 24;
            font_color = 255,255,255;
        }text_remind_type;
        x = 0; y = 100;
        text {
            caption = " ";
            font_size = 24;
            font_color = 255,255,255;
        }text_remind_task;
        x = 0; y = -50;
        text {
            caption = "按 \" START \" 键开始测试";
            font_size = 24;
            font_color = 255,255,255;
        }text_term_button;
        x = 0; y = -350;
    } pic_block_instruct;
    #------------------------- Start Instruct --------------------------
    picture {
        text{
            caption = "欢迎";
            font_size = 96;
            font_color = 255,255,0;
        }txt_welcome;
        x = 0; y = 350;
      text {
            caption = "请始终注视白色十字";
            font_size = 24;
            font_color = 0,255,0;
         } text_start_instruct;
        x = 0; y = 100;
        bitmap {filename = "../Media/fixation.jpg";};
        x = 0; y = 0;
        text {
            caption = "按 \" START \" 键进入测试（首先是任务指导）";
            font_size = 24;
            font_color = 255,255,255;
        }start_term_button;
        x = 0; y = -100;
    } pic_start_instruct;
    #------------------------- Entire end instruct --------------------------
     picture {
        text{
            caption = "感谢&再会";
            font_size = 96;
            font_color = 255,255,0;
        }txt_goodbye;
        x = 0; y = 200;
      text {
            caption = "测试结束，请通知主试。";
            font_size = 48;
            font_color = 0,255,0;
         } text_entire_end_instruct;
        x = 0; y = -50;
     } pic_entire_end_instruct;
    #------------------------- Relax Pic --------------------------
    picture {
        text {
            caption = "休息";
            font_size = 96;
            font_color = 255,255,0;
        } text_relax_remind;
        x = 0; y = 350;
        text {
            caption = "当前任务";
            font_size = 24;
            font_color = 255,0,0;
        } text_task_remind;
        x = 0; y = 100;
        text text_remind_type;
        x = 0; y = 50;
        text text_remind_task;
        x = 0; y = -50;
        text {
            caption = "按 \" BACK \" 键返回测试";
            font_size = 24;
            font_color = 255,255,255;
        }relax_term_button;
        x = 0; y = -350;
    } pic_relax_instruct;
    #------------------------- Trial --------------------------
    #------------------------- Static --------------------------
    trial {
        trial_duration = forever;
        trial_type = specific_response;
        terminator_button = $start;
        stimulus_event {
            picture pic_start_instruct;
            code = "!Start EXP";
        };
        
    } trial_start_instruct;

    trial {
        trial_duration = forever;
        trial_type = specific_response;
        terminator_button = $back;
        stimulus_event {
            picture pic_entire_end_instruct;
            code = "!End EXP";
        };
    } trial_entire_end_instruct;

    trial {
        trial_duration = forever;
        trial_type = specific_response;
        terminator_button = $back;
        stimulus_event {
            picture pic_relax_instruct;
            code = "+++relax+++";
        };

    } trial_relax_instruct;

    trial {
        trial_duration = forever;
        trial_type = specific_response;
        terminator_button = $start;
        stimulus_event {
           picture pic_block_instruct;
            code = "===Block Change===";
        };
    } block_instruct_trial;

    trial {
        trial_duration = forever;
        trial_type = specific_response;
        terminator_button = $start;
		  picture {
			  camera_position = 0.0, 0.0, $position_camera_z;
           camera_lookat = 0.0, 0.0, 0.0; 
           camera_up = 0.0, 1.0, 0.0; 

           background_color = 0,0,0;

			  sphere { 
				  radius = $sphere_r;

				  slices = 512; 
				  stacks = 512;
				  alpha = 1; 
				  # 1 = 不透明
				  mesh_texture = txr_ball;
			  } ;
           x = -10; y = 0; z = 0;
			  rotation = 0.0, 0.0, 90.0;
                
         sphere { 
				  radius = $sphere_r;

				  slices = 512; 
				  stacks = 512;
				  alpha = 1; 
				  # 1 = 不透明
				  mesh_texture = txr_ball;
		   };
         x = 10; y = 0; z = 0;
		   light light_main;
		 };
    } block_instruct_show_trial;

    trial {
        trial_duration = $duration_fixation;
        stimulus_event {
        /*
             picture {
                  text{
                    caption = "+";
                    font_size = 24;
                    font_color = 255,255,255;
                };
                  x = 0; y = 0;
             };
            */
            picture {
                camera_position = 0.0, 0.0, $position_camera_z;
                camera_lookat = 0.0, 0.0, 0.0; 
                camera_up = 0.0, 1.0, 0.0; 

                background_color = 0,0,0;

                plane fix_plane;
                x = 0; y = 0; z = 1;

                light light_main;
            };
            time = 0;
            code = "---fixation---";
        };

    } trial_fixation;
    #------------------------- Dynamic --------------------------
    #------------------------- M-Far & S-Increase --------------------------
    trial {
        trial_duration = $duration_present;
        trial_type = fixed;
        # all_responses = false;

        $position_ball_z = $position_ball_near_z;
        
       stimulus_event {
            sound sound_increase;
            time = 'int(($count - .5) * $interval)';
        } event_mfsi_s;
        stimulus_event {
            picture {
                camera_position = 0.0, 0.0, $position_camera_z;
                camera_lookat = 0.0, 0.0, 0.0; 
                camera_up = 0.0, 1.0, 0.0; 

                background_color = 0,0,0;

                sphere ball;
                x = 0; y = 0; z = $position_ball_z;

                light light_main;
            };
              target_button = 1,2;
              code = "mfsi";
            time = 'int(.5 * $interval)';
        } event_mfsi_m;
        LOOP $i $frame;
                  picture {
                        camera_position = 0.0, 0.0, $position_camera_z; 
                        camera_lookat = 0.0, 0.0, 0.0;
                        camera_up = 0.0, 1.0, 0.0; 

                        background_color =  0,0,0;

                        sphere ball;
                        x = 0; y = 0; z = '$position_ball_z + $i * $ball_abs_speed';
                        light light_main;
                  };
                  time = 'int((($i + 1) - .5) * $interval)';
        ENDLOOP;
            picture {
            camera_position = 0.0, 0.0, $position_camera_z; 
            camera_lookat = 0.0, 0.0, 0.0;
            camera_up = 0.0, 1.0, 0.0; 

            background_color =  0,0,0;

            sphere ball;
            x = 0; y = 0; z = '$position_ball_z + 35 * $ball_abs_speed';
            light light_main;
        };
        time = 'int(((35 + 1) - .5) * $interval)';
        stimulus_event{
            picture {
                background_color = 0,0,0;
            };
            time = $duration_stimulus;
        };
    } mfsi_trial;
    #------------------------- M-Far & S-Decrease --------------------------
    trial {
        trial_duration = $duration_present;
        trial_type = fixed;
        # all_responses = false;

        $position_ball_z = $position_ball_near_z;
        
        stimulus_event {
            sound sound_decrease;
            time = 'int(($count - .5) * $interval)';
        } event_mfsd_s;
        stimulus_event {
            picture {
                camera_position = 0.0, 0.0, $position_camera_z;
                camera_lookat = 0.0, 0.0, 0.0; 
                camera_up = 0.0, 1.0, 0.0; 

                background_color = 0,0,0;

                sphere ball;
                x = 0; y = 0; z = $position_ball_z;

                light light_main;
            };
              target_button = 1,2;
            code = "mfsd";
            time = 'int(.5 * $interval)';
        } event_mfsd_m;
        LOOP $i $frame;
                  picture {
                        camera_position = 0.0, 0.0, $position_camera_z; 
                        camera_lookat = 0.0, 0.0, 0.0;
                        camera_up = 0.0, 1.0, 0.0; 

                        background_color =  0,0,0;

                        sphere ball;
                        x = 0; y = 0; z = '$position_ball_z + $i * $ball_abs_speed';
                        light light_main;
                  };
                  time = 'int((($i + 1) - .5) * $interval)';
        ENDLOOP;
            picture {
            camera_position = 0.0, 0.0, $position_camera_z; 
            camera_lookat = 0.0, 0.0, 0.0;
            camera_up = 0.0, 1.0, 0.0; 

            background_color =  0,0,0;

            sphere ball;
            x = 0; y = 0; z = '$position_ball_z + 35 * $ball_abs_speed';
            light light_main;
        };
        time = 'int(((35 + 1) - .5) * $interval)';
        stimulus_event{
            picture {
                background_color = 0,0,0;
            };
            time = $duration_stimulus;
        };
    } mfsd_trial;
	#------------------------- M-Far & S-No --------------------------
trial {
    trial_duration = $duration_present;
    trial_type = fixed;
    all_responses = false;

    $position_ball_z = $position_ball_near_z;
    
    stimulus_event {
        picture {
            camera_position = 0.0, 0.0, $position_camera_z;
            camera_lookat = 0.0, 0.0, 0.0; 
            camera_up = 0.0, 1.0, 0.0; 

            background_color = 0,0,0;

            sphere ball;
            x = 0; y = 0; z = $position_ball_z;

            light light_main;
        };
        code = "mf";
        time = 'int(.5 * $interval)';
    } event_mf_m;
    LOOP $i $frame;
              picture {
                    camera_position = 0.0, 0.0, $position_camera_z; 
                    camera_lookat = 0.0, 0.0, 0.0;
                    camera_up = 0.0, 1.0, 0.0; 

                    background_color =  0,0,0;

                    sphere ball;
                    x = 0; y = 0; z = '$position_ball_z + $i * $ball_abs_speed';
                    light light_main;
              };
              time = 'int((($i + 1) - .5) * $interval)';
    ENDLOOP;
		picture {
		camera_position = 0.0, 0.0, $position_camera_z; 
		camera_lookat = 0.0, 0.0, 0.0;
		camera_up = 0.0, 1.0, 0.0; 

		background_color =  0,0,0;

		sphere ball;
		x = 0; y = 0; z = '$position_ball_z + 35 * $ball_abs_speed';
		light light_main;
	};
	time = 'int(((35 + 1) - .5) * $interval)';
    stimulus_event{
        picture {
            background_color = 0,0,0;
        };
		time = $duration_stimulus;
    };
} mf_trial;
    #----------------------------------------- M-Near & S-Increase -------------------
    trial {
        trial_duration = $duration_present;
        trial_type = fixed;
        
        $position_ball_z = $position_ball_far_z;
        stimulus_event {
            sound sound_increase;
            time = 'int(($count - .5) * $interval)';
        } event_mnsi_s;
        stimulus_event {   
            picture {
                camera_position = 0.0, 0.0, $position_camera_z;
                camera_lookat = 0.0, 0.0, 0.0; 
                camera_up = 0.0, 1.0, 0.0; 

                background_color = 0,0,0;

                sphere ball;
                x = 0; y = 0; z = $position_ball_z;

                light light_main;
            };
                target_button = 1,2;
                code = "mnsi";
                time = 'int(.5 * $interval)';
        } event_mnsi_m;

        LOOP $i $frame;
            picture {
                camera_position = 0.0, 0.0, $position_camera_z; 
                camera_lookat = 0.0, 0.0, 0.0;
                camera_up = 0.0, 1.0, 0.0; 

                background_color = 0,0,0;

                sphere ball;
                x = 0; y = 0; z = '$position_ball_z - $i * $ball_abs_speed';
                light light_main;
            };
            time = 'int((($i + 1) - .5) * $interval)';
       ENDLOOP;
            picture {
            camera_position = 0.0, 0.0, $position_camera_z; 
            camera_lookat = 0.0, 0.0, 0.0;
            camera_up = 0.0, 1.0, 0.0; 

            background_color =  0,0,0;

            sphere ball;
            x = 0; y = 0; z = '$position_ball_z - 35 * $ball_abs_speed';
            light light_main;
        };
        time = 'int(((35 + 1) - .5) * $interval)';
        stimulus_event {
            picture {
                background_color = 0,0,0;
            };
            time = $duration_stimulus;
        } ;
    } mnsi_trial;
    #----------------------------------------- M-Near & S-Decrease -------------------
    trial {
        trial_duration = $duration_present;
        trial_type = fixed;
        # all_responses = false;
        
        $position_ball_z = $position_ball_far_z;
        stimulus_event {
            sound sound_decrease;
            time = 'int(($count - .5) * $interval)';
        } event_mnsd_s;
        stimulus_event {   
            picture {
                camera_position = 0.0, 0.0, $position_camera_z;
                camera_lookat = 0.0, 0.0, 0.0; 
                camera_up = 0.0, 1.0, 0.0; 

                background_color = 0,0,0;

                sphere ball;
                x = 0; y = 0; z = $position_ball_z;

                light light_main;
            };
              target_button = 1,2; 
            code = "mnsd";
            time = 'int(.5 * $interval)';
        } event_mnsd_m;

       LOOP $i $frame;
            picture {
                camera_position = 0.0, 0.0, $position_camera_z; 
                camera_lookat = 0.0, 0.0, 0.0;
                camera_up = 0.0, 1.0, 0.0; 

                background_color = 0,0,0;

                sphere ball;
                x = 0; y = 0; z = '$position_ball_z - $i * $ball_abs_speed';
                light light_main;
            };
            time = 'int((($i + 1) - .5) * $interval)';
       ENDLOOP;
            picture {
            camera_position = 0.0, 0.0, $position_camera_z; 
            camera_lookat = 0.0, 0.0, 0.0;
            camera_up = 0.0, 1.0, 0.0; 

            background_color =  0,0,0;

            sphere ball;
            x = 0; y = 0; z = '$position_ball_z - 36 * $ball_abs_speed';
            light light_main;
        };
        time = 'int(((36 + 1) - .5) * $interval)';
        stimulus_event {
            picture {
                background_color = 0,0,0;
            };
            time = $duration_stimulus;
        } ;
} mnsd_trial;
#----------------------------------------- M-Near & S-No -------------------
trial {
    trial_duration = $duration_present;
    trial_type = fixed;
    all_responses = false;
    
    $position_ball_z = $position_ball_far_z;
    stimulus_event {   
        picture {
            camera_position = 0.0, 0.0, $position_camera_z;
            camera_lookat = 0.0, 0.0, 0.0; 
            camera_up = 0.0, 1.0, 0.0; 

            background_color = 0,0,0;

            sphere ball;
            x = 0; y = 0; z = $position_ball_z;

            light light_main;
        };
        code = "mn";
        time = 'int(.5 * $interval)';
    } event_mn_m;

    LOOP $i $frame;
        picture {
            camera_position = 0.0, 0.0, $position_camera_z; 
            camera_lookat = 0.0, 0.0, 0.0;
            camera_up = 0.0, 1.0, 0.0; 

            background_color = 0,0,0;

            sphere ball;
            x = 0; y = 0; z = '$position_ball_z - $i * $ball_abs_speed';
            light light_main;
        };
        time = 'int((($i + 1) - .5) * $interval)';
   ENDLOOP;
		picture {
		camera_position = 0.0, 0.0, $position_camera_z; 
		camera_lookat = 0.0, 0.0, 0.0;
		camera_up = 0.0, 1.0, 0.0; 

		background_color =  0,0,0;

		sphere ball;
		x = 0; y = 0; z = '$position_ball_z - 35 * $ball_abs_speed';
		light light_main;
	};
	time = 'int(((35 + 1) - .5) * $interval)';
    stimulus_event {
        picture {
            background_color = 0,0,0;
        };
		time = $duration_stimulus;
    } ;
} mn_trial;
#------------------------- M-No & S-Increase --------------------------
trial {
    trial_duration = $duration_present;
    trial_type = fixed;
    all_responses = false;
    
    stimulus_event {
        sound sound_increase;
		  code = "si";
        time = 0;
    } event_si_s;
    stimulus_event{
        picture {
            background_color = 0,0,0;
        };
		time = 0;
    };
} si_trial;
#------------------------- M-No & S-Decrease --------------------------
trial {
    trial_duration = $duration_present;
    trial_type = fixed;
    all_responses = false;

    $position_ball_z = $position_ball_far_z;
    
    stimulus_event {
        sound sound_decrease;
		  code = "sd";
        time = 0;
    } event_sd_s;
    stimulus_event{
        picture {
            background_color = 0,0,0;
        };
		time = 0;
    };
} sd_trial;