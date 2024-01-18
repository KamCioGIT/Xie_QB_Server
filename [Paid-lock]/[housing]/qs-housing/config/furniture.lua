--[[
	Furniture and accessories configuration!
	Of course, you can add all the furniture you want as long as they are
	existing props within your server.
	
	There is no guide format for this, but it requires knowledge in Lua syntax
	to be able to modify the code without errors, please tell a trusted developer to
	help you, if you are already a developer, Hello developer, I hope you enjoy it!


	Have you bought some props?
	These are all original GTA props, if you want to add more, you can, although
	if you use custom props maybe their vendor can give you the embed code that
	goes inside client/custom/furniture/*.lua, just stick it there and wala!
]]

--[[
	Ignore Config.roomsData if you don't have much programming knowledge, this allows
	you to create new sections, but you must know lua/html/css structures and some design.
]]

Config.roomsData = {
	{ id = 'living-room', name = '客廳' },
	{ id = 'kitchen',     name = '廚房' },
	{ id = 'bathroom',    name = '浴室' },
	{ id = 'bedroom',     name = '房間' },
	{ id = 'garden',      name = '花園' }
}

Config.FurnitureList = {
	['sofas'] = {
		['label'] = '沙發',
		['items'] = {
			{
				['object'] = 'apa_mp_h_stn_sofacorn_01',
				['price'] = 1450,
				['label'] = 'STN 沙發角',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_stn_sofacorn_01', ['price'] = 1450, ['label'] = 'STN 沙發角 白灰色' },
					{ ['object'] = 'apa_mp_h_stn_sofacorn_05', ['price'] = 1450, ['label'] = 'STN 沙發角 淺藍色' },
					{ ['object'] = 'apa_mp_h_stn_sofacorn_06', ['price'] = 1450, ['label'] = 'STN 沙發角 綠色' },
					{ ['object'] = 'apa_mp_h_stn_sofacorn_07', ['price'] = 1450, ['label'] = 'STN 沙發角 深藍色' },
					{ ['object'] = 'apa_mp_h_stn_sofacorn_08', ['price'] = 1450, ['label'] = 'STN 沙發角 淺灰色' },
					{ ['object'] = 'apa_mp_h_stn_sofacorn_09', ['price'] = 1450, ['label'] = 'STN 沙發角 深灰色' },
					{ ['object'] = 'apa_mp_h_stn_sofacorn_10', ['price'] = 1450, ['label'] = 'STN 沙發角 白色' }
				}
			},
			{
				['object'] = 'apa_mp_h_stn_sofa2seat_02',
				['price'] = 980,
				['label'] = '2座位沙發',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_stn_sofa2seat_02', ['price'] = 980, ['label'] = '2座位現代沙發' },
					{ ['object'] = 'hei_heist_stn_sofa2seat_03', ['price'] = 980, ['label'] = '2座位舊沙發' },
					{ ['object'] = 'hei_heist_stn_sofa2seat_06', ['price'] = 980, ['label'] = '2座位新沙發' }
				}
			},
			{
				['object'] = 'hei_heist_stn_sofacorn_05',
				['price'] = 1980,
				['label'] = '沙發角 05',
				['group_items'] = {
					{ ['object'] = 'hei_heist_stn_sofacorn_05', ['price'] = 1980, ['label'] = '沙發角 05' },
					{ ['object'] = 'hei_heist_stn_sofacorn_06', ['price'] = 1980, ['label'] = '沙發角 06' },
				}
			},
			{
				['object'] = 'apa_mp_h_stn_sofa_daybed_01',
				['price'] = 750,
				['label'] = '白天床',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_stn_sofa_daybed_01', ['price'] = 750, ['label'] = '白天床 咖啡色' },
					{ ['object'] = 'apa_mp_h_stn_sofa_daybed_02', ['price'] = 750, ['label'] = '白天床 黑色' }
				}
			},
			{
				['object'] = 'apa_mp_h_yacht_sofa_01',
				['price'] = 1750,
				['label'] = '遊艇沙發',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_yacht_sofa_01', ['price'] = 1750, ['label'] = '遊艇沙發 白色' },
					{ ['object'] = 'apa_mp_h_yacht_sofa_02', ['price'] = 980, ['label'] = '遊艇沙發 咖啡色' },
					{ ['object'] = 'p_yacht_sofa_01_s', ['price'] = 750, ['label'] = '戶外遊艇沙發' }
				}
			},
			{
				['object'] = 'prop_yaught_sofa_01',
				['price'] = 750,
				['label'] = '遊艇沙發 黃色',
				['group_items'] = {
					{ ['object'] = 'prop_yaught_sofa_01', ['price'] = 550, ['label'] = '遊艇沙發 黃色' },
					{ ['object'] = 'p_yacht_sofa_01_s', ['price'] = 550, ['label'] = '遊艇沙發 綠色' },
				}
			},
			{
				['object'] = 'ex_mp_h_off_sofa_003',
				['price'] = 850,
				['label'] = '辦公室沙發',
				['group_items'] = {
					{ ['object'] = 'ex_mp_h_off_sofa_003', ['price'] = 850, ['label'] = '辦公室沙發 藍色' },
					{ ['object'] = 'ex_mp_h_off_sofa_01', ['price'] = 850, ['label'] = '辦公室沙發 白色' },
					{ ['object'] = 'ex_mp_h_off_sofa_02', ['price'] = 850, ['label'] = '辦公室沙發 黑色' }
				}
			},
			{
				['object'] = 'hei_heist_stn_sofa3seat_01',
				['price'] = 1100,
				['label'] = '3座位沙發',
				['group_items'] = {
					{ ['object'] = 'hei_heist_stn_sofa3seat_01', ['price'] = 1100, ['label'] = '3座位沙發 淺灰色' },
					{ ['object'] = 'hei_heist_stn_sofa3seat_02', ['price'] = 1100, ['label'] = '3座位沙發 米色' },
					{ ['object'] = 'hei_heist_stn_sofa3seat_06', ['price'] = 1100, ['label'] = '3座位沙發 深灰色' }
				}
			},
			{
				['object'] = 'prop_t_sofa',
				['price'] = 1100,
				['label'] = 'T形沙發',
				['group_items'] = {
					{ ['object'] = 'prop_t_sofa', ['price'] = 1100, ['label'] = 'T形沙發' },
					{ ['object'] = 'prop_t_sofa_02', ['price'] = 1100, ['label'] = 'T形沙發' }
				}
			},

			{
				['object'] = 'v_tre_sofa_mess_b_s',
				['price'] = 100,
				['label'] = 'Tre 沙發 好的',
				['group_items'] = {
					{ ['object'] = 'v_tre_sofa_mess_b_s', ['price'] = 100, ['label'] = 'Tre 沙發 好的' },
					{ ['object'] = 'v_tre_sofa_mess_c_s', ['price'] = 20, ['label'] = 'Tre 沙發 混亂的' }
				}
			},
			{
				['object'] = 'xm_lab_sofa_01',
				['price'] = 1200,
				['label'] = 'Tre 沙發',
				['group_items'] = {
					{ ['object'] = 'xm_lab_sofa_01', ['price'] = 1200, ['label'] = 'Tre 沙發 白色' },
					{ ['object'] = 'xm_lab_sofa_02', ['price'] = 1200, ['label'] = 'Tre 沙發 黑色' }
				}
			},
			{
				['object'] = 'prop_bench_01a',
				['price'] = 200,
				['label'] = '室外長凳',
				['group_items'] = {
					{ ['object'] = 'prop_bench_01a', ['price'] = 200, ['label'] = '長凳 01a' },
					{ ['object'] = 'prop_bench_01b', ['price'] = 200, ['label'] = '長凳 01b' },
					{ ['object'] = 'prop_bench_01c', ['price'] = 200, ['label'] = '長凳 01c' },
					{ ['object'] = 'prop_bench_02', ['price'] = 200, ['label'] = '長凳 02' },
					{ ['object'] = 'prop_bench_03', ['price'] = 200, ['label'] = '長凳 03' },
					{ ['object'] = 'prop_bench_04', ['price'] = 200, ['label'] = '長凳 04' },
					{ ['object'] = 'prop_bench_05', ['price'] = 200, ['label'] = '長凳 05' },
					{ ['object'] = 'prop_bench_08', ['price'] = 200, ['label'] = '長凳 08' },
					{ ['object'] = 'prop_bench_10', ['price'] = 200, ['label'] = '長凳 10' },
					{ ['object'] = 'prop_bench_11', ['price'] = 200, ['label'] = '長凳 11' },
				}
			},
			{ ['object'] = 'bkr_prop_clubhouse_sofa_01a', ['price'] = 650, ['label'] = '俱樂部沙發' },
			{ ['object'] = 'imp_prop_impexp_sofabed_01a', ['price'] = 500, ['label'] = '沙發床' },
			{ ['object'] = 'p_res_sofa_l_s', ['price'] = 1000, ['label'] = '住宅沙發' },
			{ ['object'] = 'p_v_med_p_sofa_s', ['price'] = 870, ['label'] = '醫療沙發' },
			{ ['object'] = 'gr_dlc_gr_yacht_props_lounger', ['price'] = 870, ['label'] = '遊艇躺椅' },
		}
	},

	['plants'] = {
		['label'] = '植物',
		['items'] = {
			{
				['object'] = 'prop_plant_int_02a',
				['price'] = 160,
				['label'] = '工廠 02a',
				['group_items'] = {
					{ ['object'] = 'prop_plant_int_02a', ['price'] = 160, ['label'] = '工廠 02a' },
					{ ['object'] = 'prop_plant_int_02b', ['price'] = 160, ['label'] = '工廠 02b' },
					{ ['object'] = 'prop_plant_int_05a', ['price'] = 160, ['label'] = '工廠 05a' },
					{ ['object'] = 'prop_plant_int_05b', ['price'] = 160, ['label'] = '工廠 05b' },
					{ ['object'] = 'prop_plant_int_06a', ['price'] = 160, ['label'] = '工廠 06a' },
					{ ['object'] = 'prop_plant_int_06b', ['price'] = 160, ['label'] = '工廠 06b' }
				}
			},
			{
				['object'] = 'prop_pot_plant_02a',
				['price'] = 250,
				['label'] = '花盆 02a',
				['group_items'] = {
					{ ['object'] = 'prop_pot_plant_02a', ['price'] = 250, ['label'] = '花盆 02a' },
					{ ['object'] = 'prop_pot_plant_02b', ['price'] = 250, ['label'] = '花盆 02b' },
					{ ['object'] = 'prop_pot_plant_02c', ['price'] = 250, ['label'] = '花盆 02c' },
					{ ['object'] = 'prop_pot_plant_02d', ['price'] = 250, ['label'] = '花盆 02d' },
					{ ['object'] = 'prop_pot_plant_03a', ['price'] = 250, ['label'] = '花盆 03a' },
				}
			},
			{
				['object'] = 'p_int_jewel_plant_01',
				['price'] = 450,
				['label'] = '珠寶植物',
				['group_items'] = {
					{ ['object'] = 'p_int_jewel_plant_01', ['price'] = 450, ['label'] = '珠寶植物 01' },
					{ ['object'] = 'p_int_jewel_plant_02', ['price'] = 450, ['label'] = '珠寶植物 02' }
				}
			},
			{
				['object'] = 'vw_prop_casino_art_plant_01a',
				['price'] = 300,
				['label'] = '裝飾植物',
				['group_items'] = {
					{ ['object'] = 'vw_prop_casino_art_plant_01a', ['price'] = 300, ['label'] = '裝飾植物 01a' },
					{ ['object'] = 'vw_prop_casino_art_plant_02a', ['price'] = 300, ['label'] = '裝飾植物 02a' },
					{ ['object'] = 'vw_prop_casino_art_plant_03a', ['price'] = 300, ['label'] = '裝飾植物 03a' },
					{ ['object'] = 'vw_prop_casino_art_plant_04a', ['price'] = 300, ['label'] = '裝飾植物 04a' },
					{ ['object'] = 'vw_prop_casino_art_plant_05a', ['price'] = 300, ['label'] = '裝飾植物 05a' },
					{ ['object'] = 'vw_prop_casino_art_plant_06a', ['price'] = 300, ['label'] = '裝飾植物 06a' },
					{ ['object'] = 'vw_prop_casino_art_plant_07a', ['price'] = 300, ['label'] = '裝飾植物 07a' },
					{ ['object'] = 'vw_prop_casino_art_plant_08a', ['price'] = 300, ['label'] = '裝飾植物 08a' },
					{ ['object'] = 'vw_prop_casino_art_plant_09a', ['price'] = 300, ['label'] = '裝飾植物 09a' },
					{ ['object'] = 'vw_prop_casino_art_plant_10a', ['price'] = 300, ['label'] = '裝飾植物 10a' },
					{ ['object'] = 'vw_prop_casino_art_plant_11a', ['price'] = 300, ['label'] = '裝飾植物 11a' },
					{ ['object'] = 'vw_prop_casino_art_plant_12a', ['price'] = 300, ['label'] = '裝飾植物 12a' }
				}
			},
			{
				['object'] = 'bkr_prop_weed_bucket_01a',
				['price'] = 450,
				['label'] = '花園雜草',
				['group_items'] = {
					{ ['object'] = 'bkr_prop_weed_bucket_01a',         ['price'] = 450, ['label'] = '雜草桶 01a' },
					{ ['object'] = 'bkr_prop_weed_bucket_01b',         ['price'] = 450, ['label'] = '雜草桶 01b' },
					{ ['object'] = 'bkr_prop_weed_bucket_01c',         ['price'] = 450, ['label'] = '雜草桶 01c' },
					{ ['object'] = 'bkr_prop_weed_bucket_01d',         ['price'] = 450, ['label'] = '雜草桶 01d' },
					{ ['object'] = 'bkr_prop_weed_bucket_open_01a',    ['price'] = 450, ['label'] = '雜草桶(開啓)' },
					{ ['object'] = 'bkr_prop_weed_plantpot_stack_01b', ['price'] = 550, ['label'] = '鏟鬥式堆垛 01b' },
					{ ['object'] = 'bkr_prop_weed_plantpot_stack_01c', ['price'] = 550, ['label'] = '鏟鬥式堆垛 01c' },
					{ ['object'] = 'bkr_prop_weed_fan_ceiling_01a',    ['price'] = 450, ['label'] = '除草風扇 01a' },
				}
			},
			{ ['object'] = 'apa_mp_h_acc_plant_palm_01', ['price'] = 90,  ['label'] = '棕櫚樹' },
			{ ['object'] = 'apa_mp_h_acc_plant_tall_01', ['price'] = 120, ['label'] = '高大的' },
			{ ['object'] = 'ch_prop_ch_planter_01',      ['price'] = 120, ['label'] = '播種機' },
			{ ['object'] = 'prop_fbibombplant',          ['price'] = 185, ['label'] = 'FBI炸彈工廠' },
		}
	},

	['bushes'] = {
		['label'] = '灌木叢',
		['items'] = {
			{ ['object'] = 'prop_bush_med_03',      ['price'] = 150, ['label'] = '佈什醫學院 03' },
			{ ['object'] = 'prop_bush_med_05',      ['price'] = 150, ['label'] = '佈什醫學院 05' },
			{ ['object'] = 'prop_bush_med_06',      ['price'] = 150, ['label'] = '佈什醫學院 06' },
			{ ['object'] = 'prop_bush_lrg_01d',     ['price'] = 150, ['label'] = '佈什lrg 01d' },
			{ ['object'] = 'prop_bush_lrg_03',      ['price'] = 150, ['label'] = '佈什lrg 03' },
			{ ['object'] = 'prop_bush_lrg_01c',     ['price'] = 190, ['label'] = '佈什lrg 01c' },
			{ ['object'] = 'prop_bush_lrg_01c_cr',  ['price'] = 190, ['label'] = '佈什lrg 01c' },
			{ ['object'] = 'prop_bush_lrg_01e_cr2', ['price'] = 190, ['label'] = '佈什lrg 01e' },
			{ ['object'] = 'prop_bush_ivy_01_1m',   ['price'] = 123, ['label'] = '灌木常春藤 01' },
			{ ['object'] = 'prop_bush_ivy_02_2m',   ['price'] = 133, ['label'] = '灌木常春藤 02' },
			{ ['object'] = 'prop_bush_ivy_02_pot',  ['price'] = 120, ['label'] = '灌木常春藤 02 pot' },
			{ ['object'] = 'prop_bush_ivy_01_r',    ['price'] = 100, ['label'] = '灌木常春藤 01 r' },
			{ ['object'] = 'prop_bush_ivy_01_bk',   ['price'] = 180, ['label'] = '灌木常春藤 01 bk' },
			{ ['object'] = 'prop_bush_neat_06',     ['price'] = 190, ['label'] = '叢林肉 06' },
			{ ['object'] = 'prop_bush_neat_07',     ['price'] = 300, ['label'] = '叢林肉 07' },
			{ ['object'] = 'prop_bush_neat_01',     ['price'] = 312, ['label'] = '叢林肉 01' },
			{ ['object'] = 'prop_bush_neat_08',     ['price'] = 290, ['label'] = '叢林肉 08' },
			{ ['object'] = 'prop_bush_neat_02',     ['price'] = 170, ['label'] = '叢林肉 02' },
			{ ['object'] = 'prop_bush_neat_05',     ['price'] = 170, ['label'] = '叢林肉 05' },
			{ ['object'] = 'prop_bush_dead_02',     ['price'] = 170, ['label'] = '叢林死寂 02' },
			{ ['object'] = 'prop_bush_grape_01',    ['price'] = 170, ['label'] = '叢林葡萄 01' },
			{ ['object'] = 'prop_coral_bush_01',    ['price'] = 170, ['label'] = '叢林珊瑚 01' },
			{ ['object'] = 'prop_snow_bush_04',     ['price'] = 300, ['label'] = '叢林雪 04' },
			{ ['object'] = 'prop_snow_bush_03',     ['price'] = 500, ['label'] = '叢林雪 03' },
			{ ['object'] = 'prop_snow_bush_02_a',   ['price'] = 500, ['label'] = '叢林雪 02a' },
			{ ['object'] = 'prop_snow_bush_02_b',   ['price'] = 500, ['label'] = '叢林雪 02b' },

			{
				['object'] = 'prop_bush_ornament_01',
				['price'] = 1200,
				['label'] = '裝飾灌木叢 01',
				['group_items'] = {
					{ ['object'] = 'prop_bush_ornament_01', ['price'] = 1200, ['label'] = '裝飾灌木 01' },
					{ ['object'] = 'prop_bush_ornament_02', ['price'] = 1200, ['label'] = '裝飾灌木 02' },
					{ ['object'] = 'prop_bush_ornament_04', ['price'] = 1200, ['label'] = '裝飾灌木 04' },
					{ ['object'] = 'prop_bush_ornament_03', ['price'] = 1200, ['label'] = '裝飾灌木 03' },
				}
			},
		}
	},

	['large-bushes'] = {
		['label'] = '灌木叢(大型)',
		['items'] = {
			{ ['object'] = 'prop_bush_neat_04', ['price'] = 900, ['label'] = '叢林肉 04' },
			{ ['object'] = 'prop_bush_neat_03', ['price'] = 900, ['label'] = '叢林肉 03' },
		}
	},

	['trees'] = {
		['label'] = '樹木',
		['items'] = {
			{
				['object'] = 'prop_joshua_tree_02c',
				['price'] = 1500,
				['label'] = '樹 02c',
				['group_items'] = {
					{ ['object'] = 'prop_joshua_tree_02c', ['price'] = 1500, ['label'] = '樹 02c' },
					{ ['object'] = 'prop_joshua_tree_01b', ['price'] = 1500, ['label'] = '樹 01b' },
					{ ['object'] = 'prop_joshua_tree_02d', ['price'] = 1500, ['label'] = '樹 02b' },
					{ ['object'] = 'prop_joshua_tree_01a', ['price'] = 1500, ['label'] = '樹 01a' },
					{ ['object'] = 'prop_joshua_tree_01e', ['price'] = 1500, ['label'] = '樹 01e' },
					{ ['object'] = 'prop_joshua_tree_01d', ['price'] = 1500, ['label'] = '樹 01b' },
					{ ['object'] = 'prop_joshua_tree_01c', ['price'] = 1500, ['label'] = '樹 01c' },
					{ ['object'] = 'prop_joshua_tree_02b', ['price'] = 1500, ['label'] = '樹 02b' },
					{ ['object'] = 'prop_joshua_tree_02b', ['price'] = 1500, ['label'] = '樹 02b' },
				}
			},

			{
				['object'] = 'prop_snow_tree_03_h',
				['price'] = 3600,
				['label'] = '雪樹 03',
				['group_items'] = {
					{ ['object'] = 'prop_snow_tree_03_h', ['price'] = 3600, ['label'] = '雪樹 03' },
					{ ['object'] = 'prop_snow_tree_04_f', ['price'] = 3600, ['label'] = '雪樹 04' },
					{ ['object'] = 'prop_snow_tree_03_i', ['price'] = 3600, ['label'] = '雪樹 03i' },
					{ ['object'] = 'prop_xmas_tree_int',  ['price'] = 1200, ['label'] = '有雪的聖誕樹' },
				}
			},

			{
				['object'] = 'test_tree_cedar_trunk_001',
				['price'] = 1500,
				['label'] = '雪鬆 01',
				['group_items'] = {
					{ ['object'] = 'test_tree_cedar_trunk_001', ['price'] = 1500, ['label'] = '雪鬆 01' },
					{ ['object'] = 'prop_tree_cedar_s_01',      ['price'] = 1500, ['label'] = '雪鬆 01' },
					{ ['object'] = 'prop_tree_cedar_s_04',      ['price'] = 1500, ['label'] = '雪鬆 04s' },
					{ ['object'] = 'prop_tree_cedar_04',        ['price'] = 1500, ['label'] = '雪鬆 04' },
				}
			},

			{ ['object'] = 'prop_tree_fallen_01',            ['price'] = 1500, ['label'] = '倒下的樹 01' },
			{ ['object'] = 'test_tree_forest_trunk_04',      ['price'] = 1500, ['label'] = '森林 04' },
			{ ['object'] = 'prop_tree_olive_01',             ['price'] = 1500, ['label'] = '橄欖樹 01' },
			{ ['object'] = 'prop_tree_olive_creator',        ['price'] = 1500, ['label'] = '橄欖樹 cr' },
			{ ['object'] = 'prop_tree_eucalip_01',           ['price'] = 1500, ['label'] = '桉樹 01' },
			{ ['object'] = 'prop_tree_stump_01',             ['price'] = 1500, ['label'] = '樹樁 01' },
			{ ['object'] = 'prop_tree_eng_oak_creator',      ['price'] = 1500, ['label'] = '英國橡膠樹 cr' },
			{ ['object'] = 'prop_tree_eng_oak_01',           ['price'] = 1500, ['label'] = '英國橡膠樹 01' },
			{ ['object'] = 'prop_tree_maple_02',             ['price'] = 1500, ['label'] = '楓樹 02' },
			{ ['object'] = 'prop_tree_lficus_06',            ['price'] = 1500, ['label'] = '榕樹 06' },
			{ ['object'] = 'prop_tree_birch_04',             ['price'] = 1500, ['label'] = '樹樺木 04' },
			{ ['object'] = 'prop_tree_mquite_01',            ['price'] = 1500, ['label'] = '樹豆科灌木 01' },
			{ ['object'] = 'test_tree_forest_trunk_base_01', ['price'] = 1500, ['label'] = 'xxxxxxxxx' },
			{ ['object'] = 'prop_tree_jacada_02',            ['price'] = 1500, ['label'] = '雅卡達樹 02' },
			{ ['object'] = 'prop_tree_log_02',               ['price'] = 1500, ['label'] = '日誌樹 02' },
			{ ['object'] = 'prop_tree_cypress_01',           ['price'] = 1500, ['label'] = '柏樹 01' },
			{ ['object'] = 'prop_tree_birch_05',             ['price'] = 1500, ['label'] = '樺木樹 05' },
			{ ['object'] = 'prop_prop_tree_02',              ['price'] = 1500, ['label'] = '樹 02' },
		}
	},

	['carpets'] = {
		['label'] = '地毯',
		['items'] = {
			{
				['object'] = 'hei_heist_acc_rugwooll_01',
				['price'] = 300,
				['label'] = '羊毛地毯',
				['group_items'] = {
					{ ['object'] = 'hei_heist_acc_rugwooll_01', ['price'] = 300, ['label'] = '羊毛地毯 01' },
					{ ['object'] = 'hei_heist_acc_rugwooll_02', ['price'] = 300, ['label'] = '羊毛地毯 02' },
					{ ['object'] = 'hei_heist_acc_rugwooll_03', ['price'] = 300, ['label'] = '羊毛地毯 03' },
				}
			},
			{
				['object'] = 'apa_mp_h_acc_rugwoolm_01',
				['price'] = 300,
				['label'] = '毛地毯',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_acc_rugwoolm_01', ['price'] = 300, ['label'] = '毛地毯 01' },
					{ ['object'] = 'apa_mp_h_acc_rugwoolm_02', ['price'] = 300, ['label'] = '毛地毯 02' },
					{ ['object'] = 'apa_mp_h_acc_rugwoolm_03', ['price'] = 300, ['label'] = '毛地毯 03' },
					{ ['object'] = 'apa_mp_h_acc_rugwoolm_04', ['price'] = 300, ['label'] = '毛地毯 04' }
				}
			},
			{
				['object'] = 'apa_mp_h_acc_rugwools_01',
				['price'] = 300,
				['label'] = '羊毛地毯',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_acc_rugwools_01', ['price'] = 300, ['label'] = '羊毛地毯 01' },
					{ ['object'] = 'apa_mp_h_acc_rugwools_03', ['price'] = 300, ['label'] = '羊毛地毯 03' }
				}
			},
			{
				['object'] = 'prop_yoga_mat_01',
				['price'] = 50,
				['label'] = '瑜伽食物',
				['group_items'] = {
					{ ['object'] = 'prop_yoga_mat_01', ['price'] = 50, ['label'] = '瑜伽食物 01' },
					{ ['object'] = 'prop_yoga_mat_02', ['price'] = 50, ['label'] = '瑜伽食物 02' },
					{ ['object'] = 'prop_yoga_mat_03', ['price'] = 50, ['label'] = '瑜伽食物 03' },
					{ ['object'] = 'p_yoga_mat_01_s',  ['price'] = 50, ['label'] = '瑜伽食物 01s' }
				}
			},
			{ ['object'] = 'hei_heist_acc_rughidel_01', ['price'] = 300, ['label'] = '希德爾地毯' },
		}
	},

	['beds'] = {
		['label'] = '床',
		['items'] = {
			{ ['object'] = 'v_res_d_bed',                ['price'] = 700,  ['label'] = '床 1' },
			{ ['object'] = 'v_res_lestersbed',           ['price'] = 700,  ['label'] = '床 2' },
			{ ['object'] = 'v_res_mbbed',                ['price'] = 700,  ['label'] = 'MB床' },
			{ ['object'] = 'v_res_mdbed',                ['price'] = 700,  ['label'] = 'MD床' },
			{ ['object'] = 'v_res_msonbed',              ['price'] = 700,  ['label'] = '床 3' },
			{ ['object'] = 'v_res_tre_bed1',             ['price'] = 700,  ['label'] = '床 4' },
			{ ['object'] = 'v_res_tre_bed2',             ['price'] = 700,  ['label'] = '床T' },
			{ ['object'] = 'v_res_tt_bed',               ['price'] = 700,  ['label'] = '床TT' },
			{ ['object'] = 'apa_mp_h_bed_with_table_02', ['price'] = 5000, ['label'] = '漂亮的床' },
			{ ['object'] = 'apa_mp_h_bed_wide_05',       ['price'] = 5000, ['label'] = '紅色的床' },
			{ ['object'] = 'apa_mp_h_bed_double_08',     ['price'] = 3000, ['label'] = '正方形的床' },
			{ ['object'] = 'apa_mp_h_bed_double_09',     ['price'] = 3000, ['label'] = '現代床' },
			{ ['object'] = 'apa_mp_h_yacht_bed_01',      ['price'] = 5000, ['label'] = '加州大床1' },
			{ ['object'] = 'apa_mp_h_yacht_bed_02',      ['price'] = 5000, ['label'] = '加州大床2' },
			{ ['object'] = 'bkr_prop_biker_campbed_01',  ['price'] = 100,  ['label'] = '行軍床' },
			{ ['object'] = 'ex_prop_exec_bed_01',        ['price'] = 700,  ['label'] = '小床 1' },
			{ ['object'] = 'gr_prop_bunker_bed_01',      ['price'] = 700,  ['label'] = '小床 2' },
			{ ['object'] = 'p_mbbed_s',                  ['price'] = 700,  ['label'] = '床 5' },
			{ ['object'] = 'gr_prop_gr_campbed_01',      ['price'] = 700,  ['label'] = '單人床 01' },
			{
				['object'] = 'prop_beach_lilo_02',
				['price'] = 100,
				['label'] = '充氣娃娃 02',
				['group_items'] = {
					{ ['object'] = 'prop_beach_lilo_02', ['price'] = 100, ['label'] = '充氣娃娃 02' },
					{ ['object'] = 'prop_beach_lilo_01', ['price'] = 100, ['label'] = '充氣娃娃 01' }
				}
			},
		}
	},


	['tables'] = {
		['label'] = '桌子',
		['items'] = {
			{
				['object'] = 'apa_mp_h_din_table_01',
				['price'] = 1450,
				['label'] = '時鍾',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_din_table_01',  ['price'] = 1450, ['label'] = '時鍾 01' },
					{ ['object'] = 'apa_mp_h_din_table_04',  ['price'] = 1450, ['label'] = '時鍾 04' },
					{ ['object'] = 'apa_mp_h_din_table_05',  ['price'] = 1450, ['label'] = '時鍾 05' },
					{ ['object'] = 'apa_mp_h_din_table_06',  ['price'] = 1450, ['label'] = '時鍾 06' },
					{ ['object'] = 'apa_mp_h_din_table_11',  ['price'] = 1450, ['label'] = '時鍾 11' },
					{ ['object'] = 'hei_heist_din_table_04', ['price'] = 1450, ['label'] = '桌上時鍾 04' },
					{ ['object'] = 'hei_heist_din_table_06', ['price'] = 1450, ['label'] = '桌上時鍾 06' },
					{ ['object'] = 'hei_heist_din_table_07', ['price'] = 1450, ['label'] = '桌上時鍾 07' }
				}
			},
			{
				['object'] = 'apa_mp_h_yacht_coffee_table_01',
				['price'] = 400,
				['label'] = '茶幾',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_yacht_coffee_table_01', ['price'] = 400, ['label'] = '茶幾 01' },
					{ ['object'] = 'apa_mp_h_yacht_coffee_table_02', ['price'] = 400, ['label'] = '茶幾 02' },
					{ ['object'] = 'prop_fbi3_coffee_table',         ['price'] = 400, ['label'] = 'FBI茶幾' },
					{ ['object'] = 'prop_t_coffe_table',             ['price'] = 400, ['label'] = 'T茶幾' }
				}
			},
			{
				['object'] = 'apa_mp_h_yacht_side_table_01',
				['price'] = 200,
				['label'] = '邊桌',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_yacht_side_table_01', ['price'] = 200, ['label'] = '邊桌 01' },
					{ ['object'] = 'apa_mp_h_yacht_side_table_02', ['price'] = 200, ['label'] = '邊桌 02' }
				}
			},
			{
				['object'] = 'ba_prop_int_edgy_table_01',
				['price'] = 300,
				['label'] = '時尚的桌子',
				['group_items'] = {
					{ ['object'] = 'ba_prop_int_edgy_table_01', ['price'] = 300, ['label'] = '時尚的桌子 01' },
					{ ['object'] = 'ba_prop_int_edgy_table_02', ['price'] = 300, ['label'] = '時尚的桌子 02' }
				}
			},
			{
				['object'] = 'bkr_prop_weed_table_01a',
				['price'] = 1300,
				['label'] = '藥品卓',
				['group_items'] = {
					{ ['object'] = 'bkr_prop_weed_table_01a', ['price'] = 1300, ['label'] = '藥品桌 01a' },
					{ ['object'] = 'bkr_prop_weed_table_01b', ['price'] = 1300, ['label'] = '藥品桌 01b' },
					{ ['object'] = 'bkr_prop_coke_table01a',  ['price'] = 1300, ['label'] = 'Coke桌子' },
					{ ['object'] = 'bkr_prop_meth_table01a',  ['price'] = 1300, ['label'] = 'Meth桌子' }
				}
			},
			{
				['object'] = 'gr_dlc_gr_yacht_props_table_01',
				['price'] = 1100,
				['label'] = '遊艇桌',
				['group_items'] = {
					{ ['object'] = 'gr_dlc_gr_yacht_props_table_01', ['price'] = 1100, ['label'] = '遊艇桌 01' },
					{ ['object'] = 'gr_dlc_gr_yacht_props_table_02', ['price'] = 1100, ['label'] = '遊艇桌 02' },
					{ ['object'] = 'gr_dlc_gr_yacht_props_table_03', ['price'] = 1100, ['label'] = '遊艇桌 03' }
				}
			},
			{
				['object'] = 'prop_pooltable_02',
				['price'] = 120,
				['label'] = '工具桌',
				['group_items'] = {
					{ ['object'] = 'prop_pooltable_02', ['price'] = 120, ['label'] = '工具桌 02' },
					{ ['object'] = 'prop_pooltable_3b', ['price'] = 120, ['label'] = '工具桌 3b' }
				}
			},
			{
				['object'] = 'prop_table_02',
				['price'] = 120,
				['label'] = '桌子',
				['group_items'] = {
					{ ['object'] = 'prop_table_02', ['price'] = 120, ['label'] = '桌子 02' },
					{ ['object'] = 'prop_table_04', ['price'] = 120, ['label'] = '桌子 03' },
					{ ['object'] = 'prop_table_05', ['price'] = 120, ['label'] = '桌子 04' },
					{ ['object'] = 'prop_table_06', ['price'] = 120, ['label'] = '桌子 05' },
					{ ['object'] = 'prop_table_07', ['price'] = 120, ['label'] = '桌子 06' },
					{ ['object'] = 'prop_table_08', ['price'] = 120, ['label'] = '桌子 07' }
				}
			},
			{
				['object'] = 'prop_table_02',
				['price'] = 1400,
				['label'] = '玻璃桌',
				['group_items'] = {
					{ ['object'] = 'prop_table_02',              ['price'] = 1400, ['label'] = '玻璃桌' },
					{ ['object'] = 'apa_mp_h_str_sideboards_02', ['price'] = 450,  ['label'] = '餐廳玻璃桌' },
					{ ['object'] = 'apa_mp_h_tab_sidelrg_07',    ['price'] = 450,  ['label'] = '側嚮玻璃桌 07' },
					{ ['object'] = 'apa_mp_h_tab_sidesml_01',    ['price'] = 350,  ['label'] = '側嚮玻璃桌 01' },
					{ ['object'] = 'apa_mp_h_tab_sidesml_02',    ['price'] = 350,  ['label'] = '側嚮玻璃桌 02' },
				}
			},
			{ ['object'] = 'bkr_prop_coke_pallet_01a',    ['price'] = 50,   ['label'] = '托盤' },
			{ ['object'] = 'bkr_prop_crate_set_01a',      ['price'] = 50,   ['label'] = '闆條箱 01a' },
			{ ['object'] = 'prop_table_tennis',           ['price'] = 300,  ['label'] = '網球桌' },
			{ ['object'] = 'prop_ven_market_table1',      ['price'] = 150,  ['label'] = '市場錶' },
			{ ['object'] = 'ba_prop_int_glam_table',      ['price'] = 300,  ['label'] = '華麗的桌子' },
			{ ['object'] = 'ba_prop_int_trad_table',      ['price'] = 300,  ['label'] = '傳統桌' },
			{ ['object'] = 'ex_prop_ex_console_table_01', ['price'] = 500,  ['label'] = '玄關桌' },
			{ ['object'] = 'prop_patio_lounger1_table',   ['price'] = 800,  ['label'] = '躺椅桌' },
			{ ['object'] = 'apa_mp_h_tab_coffee_08',      ['price'] = 1900, ['label'] = '優雅的桌子' },
			{ ['object'] = 'ex_mp_h_din_table_05',        ['price'] = 1900, ['label'] = '桌子 05' },
			{ ['object'] = 'hei_heist_stn_benchshort',    ['price'] = 1200, ['label'] = '長凳' },
		}
	},

	['walldecoration'] = {
		['label'] = '牆麵裝飾',
		['items'] = {
			{
				['object'] = 'ch_prop_vault_painting_01a',
				['price'] = 180,
				['label'] = '壁畫',
				['group_items'] = {
					{ ['object'] = 'ch_prop_vault_painting_01a', ['price'] = 180, ['label'] = '壁畫 01a' },
					{ ['object'] = 'ch_prop_vault_painting_01b', ['price'] = 180, ['label'] = '壁畫 01b' },
					{ ['object'] = 'ch_prop_vault_painting_01c', ['price'] = 180, ['label'] = '壁畫 01c' },
					{ ['object'] = 'ch_prop_vault_painting_01d', ['price'] = 180, ['label'] = '壁畫 01d' },
					{ ['object'] = 'ch_prop_vault_painting_01e', ['price'] = 180, ['label'] = '壁畫 01e' },
					{ ['object'] = 'ch_prop_vault_painting_01f', ['price'] = 180, ['label'] = '壁畫 01f' },
					{ ['object'] = 'ch_prop_vault_painting_01g', ['price'] = 180, ['label'] = '壁畫 01g' },
					{ ['object'] = 'ch_prop_vault_painting_01h', ['price'] = 180, ['label'] = '壁畫 01h' },
					{ ['object'] = 'ch_prop_vault_painting_01i', ['price'] = 180, ['label'] = '壁畫 01i' },
					{ ['object'] = 'ch_prop_vault_painting_01j', ['price'] = 180, ['label'] = '壁畫 01j' }
				}
			},
			{
				['object'] = 'ex_office_swag_paintings01',
				['price'] = 350,
				['label'] = 'SWAG壁畫',
				['group_items'] = {
					{ ['object'] = 'ex_office_swag_paintings01', ['price'] = 350, ['label'] = 'SWAG壁畫 01' },
					{ ['object'] = 'ex_office_swag_paintings02', ['price'] = 350, ['label'] = 'SWAG壁畫 02' },
					{ ['object'] = 'ex_office_swag_paintings03', ['price'] = 350, ['label'] = 'SWAG壁畫 03' }
				}
			},
			{
				['object'] = 'apa_mp_h_acc_artwalll_01',
				['price'] = 350,
				['label'] = '藝術繪畫',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_acc_artwalll_01', ['price'] = 350, ['label'] = '藝術繪畫 MP 01' },
					{ ['object'] = 'apa_mp_h_acc_artwalll_02', ['price'] = 350, ['label'] = '藝術繪畫 MP 02' },
					{ ['object'] = 'apa_mp_h_acc_artwalll_03', ['price'] = 350, ['label'] = '藝術繪畫 MP 03' },
					{ ['object'] = 'apa_p_h_acc_artwalll_01',  ['price'] = 350, ['label'] = '藝術繪畫 P 01' },
					{ ['object'] = 'apa_p_h_acc_artwalll_02',  ['price'] = 350, ['label'] = '藝術繪畫 P 02' },
					{ ['object'] = 'apa_p_h_acc_artwalll_03',  ['price'] = 350, ['label'] = '藝術繪畫 P 03' },
					{ ['object'] = 'apa_p_h_acc_artwalll_04',  ['price'] = 350, ['label'] = '藝術繪畫 P 04' },
					{ ['object'] = 'apa_p_h_acc_artwallm_01',  ['price'] = 350, ['label'] = '藝術繪畫 PH 01' }
				}
			},
			{
				['object'] = 'apa_p_h_acc_artwalls_03',
				['price'] = 1850,
				['label'] = '藝術牆',
				['group_items'] = {
					{ ['object'] = 'apa_p_h_acc_artwalls_03', ['price'] = 1850, ['label'] = '藝術牆 03' },
					{ ['object'] = 'apa_p_h_acc_artwalls_04', ['price'] = 1850, ['label'] = '藝術牆 04' }
				}
			},
			{
				['object'] = 'ch_prop_ch_wallart_01a',
				['price'] = 650,
				['label'] = '牆麵壁紙',
				['group_items'] = {
					{ ['object'] = 'ch_prop_ch_wallart_01a',     ['price'] = 650, ['label'] = '牆麵壁紙 01a' },
					{ ['object'] = 'ch_prop_ch_wallart_02a',     ['price'] = 650, ['label'] = '牆麵壁紙 02a' },
					{ ['object'] = 'ch_prop_ch_wallart_03a',     ['price'] = 650, ['label'] = '牆麵壁紙 03a' },
					{ ['object'] = 'ch_prop_ch_wallart_04a',     ['price'] = 650, ['label'] = '牆麵壁紙 04a' },
					{ ['object'] = 'ch_prop_ch_wallart_05a',     ['price'] = 650, ['label'] = '牆麵壁紙 05a' },
					{ ['object'] = 'ch_prop_ch_wallart_06a',     ['price'] = 650, ['label'] = '牆麵壁紙 06a' },
					{ ['object'] = 'ch_prop_ch_wallart_07a',     ['price'] = 650, ['label'] = '牆麵壁紙 07a' },
					{ ['object'] = 'ch_prop_ch_wallart_08a',     ['price'] = 650, ['label'] = '牆麵壁紙 08a' },
					{ ['object'] = 'ch_prop_ch_wallart_09a',     ['price'] = 650, ['label'] = '牆麵壁紙 09a' },
					{ ['object'] = 'vw_prop_vw_wallart_01a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 01a' },
					{ ['object'] = 'vw_prop_vw_wallart_02a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 02a' },
					{ ['object'] = 'vw_prop_vw_wallart_03a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 03a' },
					{ ['object'] = 'vw_prop_vw_wallart_04a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 04a' },
					{ ['object'] = 'vw_prop_vw_wallart_05a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 05a' },
					{ ['object'] = 'vw_prop_vw_wallart_06a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 06a' },
					{ ['object'] = 'vw_prop_vw_wallart_07a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 07a' },
					{ ['object'] = 'vw_prop_vw_wallart_08a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 08a' },
					{ ['object'] = 'vw_prop_vw_wallart_09a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 09a' },
					{ ['object'] = 'vw_prop_vw_wallart_100a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 100a' },
					{ ['object'] = 'vw_prop_vw_wallart_101a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 101a' },
					{ ['object'] = 'vw_prop_vw_wallart_102a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 102a' },
					{ ['object'] = 'vw_prop_vw_wallart_103a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 103a' },
					{ ['object'] = 'vw_prop_vw_wallart_104a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 104a' },
					{ ['object'] = 'vw_prop_vw_wallart_105a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 105a' },
					{ ['object'] = 'vw_prop_vw_wallart_106a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 106a' },
					{ ['object'] = 'vw_prop_vw_wallart_107a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 107a' },
					{ ['object'] = 'vw_prop_vw_wallart_108a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 108a' },
					{ ['object'] = 'vw_prop_vw_wallart_109a',    ['price'] = 650, ['label'] = '牆麵壁紙 109a' },
					{ ['object'] = 'vw_prop_vw_wallart_10a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 10a' },
					{ ['object'] = 'vw_prop_vw_wallart_110a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 110a' },
					{ ['object'] = 'vw_prop_vw_wallart_111a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 111a' },
					{ ['object'] = 'vw_prop_vw_wallart_112a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 112a' },
					{ ['object'] = 'vw_prop_vw_wallart_113a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 113a' },
					{ ['object'] = 'vw_prop_vw_wallart_114a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 114a' },
					{ ['object'] = 'vw_prop_vw_wallart_115a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 115a' },
					{ ['object'] = 'vw_prop_vw_wallart_116a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 116a' },
					{ ['object'] = 'vw_prop_vw_wallart_117a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 117a' },
					{ ['object'] = 'vw_prop_vw_wallart_118a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 118a' },
					{ ['object'] = 'vw_prop_vw_wallart_11a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 11a' },
					{ ['object'] = 'vw_prop_vw_wallart_123a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 123a' },
					{ ['object'] = 'vw_prop_vw_wallart_124a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 124a' },
					{ ['object'] = 'vw_prop_vw_wallart_125a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 125a' },
					{ ['object'] = 'vw_prop_vw_wallart_126a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 126a' },
					{ ['object'] = 'vw_prop_vw_wallart_127a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 127a' },
					{ ['object'] = 'vw_prop_vw_wallart_128a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 128a' },
					{ ['object'] = 'vw_prop_vw_wallart_129a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 129a' },
					{ ['object'] = 'vw_prop_vw_wallart_12a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 12a' },
					{ ['object'] = 'vw_prop_vw_wallart_130a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 130a' },
					{ ['object'] = 'vw_prop_vw_wallart_131a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 131a' },
					{ ['object'] = 'vw_prop_vw_wallart_132a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 132a' },
					{ ['object'] = 'vw_prop_vw_wallart_133a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 133a' },
					{ ['object'] = 'vw_prop_vw_wallart_134a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 134a' },
					{ ['object'] = 'vw_prop_vw_wallart_135a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 135a' },
					{ ['object'] = 'vw_prop_vw_wallart_136a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 136a' },
					{ ['object'] = 'vw_prop_vw_wallart_137a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 137a' },
					{ ['object'] = 'vw_prop_vw_wallart_138a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 138a' },
					{ ['object'] = 'vw_prop_vw_wallart_139a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 139a' },
					{ ['object'] = 'vw_prop_vw_wallart_140a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 140a' },
					{ ['object'] = 'vw_prop_vw_wallart_141a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 141a' },
					{ ['object'] = 'vw_prop_vw_wallart_142a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 142a' },
					{ ['object'] = 'vw_prop_vw_wallart_143a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 143a' },
					{ ['object'] = 'vw_prop_vw_wallart_144a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 144a' },
					{ ['object'] = 'vw_prop_vw_wallart_145a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 145a' },
					{ ['object'] = 'vw_prop_vw_wallart_146a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 146a' },
					{ ['object'] = 'vw_prop_vw_wallart_147a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 147a' },
					{ ['object'] = 'vw_prop_vw_wallart_14a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 14a' },
					{ ['object'] = 'vw_prop_vw_wallart_150a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 150a' },
					{ ['object'] = 'vw_prop_vw_wallart_151a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 151a' },
					{ ['object'] = 'vw_prop_vw_wallart_151b',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 151b' },
					{ ['object'] = 'vw_prop_vw_wallart_151c',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 151c' },
					{ ['object'] = 'vw_prop_vw_wallart_151d',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 151d' },
					{ ['object'] = 'vw_prop_vw_wallart_151e',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 151e' },
					{ ['object'] = 'vw_prop_vw_wallart_151f',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 151f' },
					{ ['object'] = 'vw_prop_vw_wallart_152a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 152a' },
					{ ['object'] = 'vw_prop_vw_wallart_153a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 153a' },
					{ ['object'] = 'vw_prop_vw_wallart_154a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 154a' },
					{ ['object'] = 'vw_prop_vw_wallart_155a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 155a' },
					{ ['object'] = 'vw_prop_vw_wallart_156a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 156a' },
					{ ['object'] = 'vw_prop_vw_wallart_157a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 157a' },
					{ ['object'] = 'vw_prop_vw_wallart_158a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 158a' },
					{ ['object'] = 'vw_prop_vw_wallart_159a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 159a' },
					{ ['object'] = 'vw_prop_vw_wallart_15a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 15a' },
					{ ['object'] = 'vw_prop_vw_wallart_160a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 160a' },
					{ ['object'] = 'vw_prop_vw_wallart_161a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 161a' },
					{ ['object'] = 'vw_prop_vw_wallart_162a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 162a' },
					{ ['object'] = 'vw_prop_vw_wallart_163a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 163a' },
					{ ['object'] = 'vw_prop_vw_wallart_164a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 164a' },
					{ ['object'] = 'vw_prop_vw_wallart_165a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 165a' },
					{ ['object'] = 'vw_prop_vw_wallart_166a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 166a' },
					{ ['object'] = 'vw_prop_vw_wallart_167a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 167a' },
					{ ['object'] = 'vw_prop_vw_wallart_168a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 168a' },
					{ ['object'] = 'vw_prop_vw_wallart_169a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 169a' },
					{ ['object'] = 'vw_prop_vw_wallart_16a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 16a' },
					{ ['object'] = 'vw_prop_vw_wallart_170a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 170a' },
					{ ['object'] = 'vw_prop_vw_wallart_171a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 171a' },
					{ ['object'] = 'vw_prop_vw_wallart_172a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 172a' },
					{ ['object'] = 'vw_prop_vw_wallart_173a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 173a' },
					{ ['object'] = 'vw_prop_vw_wallart_174a',    ['price'] = 650, ['label'] = '牆麵壁紙 VW 174a' },
					{ ['object'] = 'vw_prop_vw_wallart_17a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 17a' },
					{ ['object'] = 'vw_prop_vw_wallart_18a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 18a' },
					{ ['object'] = 'vw_prop_vw_wallart_19a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 19a' },
					{ ['object'] = 'vw_prop_vw_wallart_20a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 20a' },
					{ ['object'] = 'vw_prop_vw_wallart_21a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 21a' },
					{ ['object'] = 'vw_prop_vw_wallart_22a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 22a' },
					{ ['object'] = 'vw_prop_vw_wallart_23a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 23a' },
					{ ['object'] = 'vw_prop_vw_wallart_24a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 24a' },
					{ ['object'] = 'vw_prop_vw_wallart_25a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 25a' },
					{ ['object'] = 'vw_prop_vw_wallart_26a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 26a' },
					{ ['object'] = 'vw_prop_vw_wallart_28a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 28a' },
					{ ['object'] = 'vw_prop_vw_wallart_29a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 29a' },
					{ ['object'] = 'vw_prop_vw_wallart_30a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 30a' },
					{ ['object'] = 'vw_prop_vw_wallart_31a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 31a' },
					{ ['object'] = 'vw_prop_vw_wallart_32a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 32a' },
					{ ['object'] = 'vw_prop_vw_wallart_33a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 33a' },
					{ ['object'] = 'vw_prop_vw_wallart_34a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 34a' },
					{ ['object'] = 'vw_prop_vw_wallart_35a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 35a' },
					{ ['object'] = 'vw_prop_vw_wallart_36a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 36a' },
					{ ['object'] = 'vw_prop_vw_wallart_37a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 37a' },
					{ ['object'] = 'vw_prop_vw_wallart_38a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 38a' },
					{ ['object'] = 'vw_prop_vw_wallart_39a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 39a' },
					{ ['object'] = 'vw_prop_vw_wallart_40a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 40a' },
					{ ['object'] = 'vw_prop_vw_wallart_41a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 41a' },
					{ ['object'] = 'vw_prop_vw_wallart_42a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 42a' },
					{ ['object'] = 'vw_prop_vw_wallart_43a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 43a' },
					{ ['object'] = 'vw_prop_vw_wallart_44a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 44a' },
					{ ['object'] = 'vw_prop_vw_wallart_46a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 46a' },
					{ ['object'] = 'vw_prop_vw_wallart_47a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 47a' },
					{ ['object'] = 'vw_prop_vw_wallart_48a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 48a' },
					{ ['object'] = 'vw_prop_vw_wallart_49a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 49a' },
					{ ['object'] = 'vw_prop_vw_wallart_50a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 50a' },
					{ ['object'] = 'vw_prop_vw_wallart_51a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 51a' },
					{ ['object'] = 'vw_prop_vw_wallart_52a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 52a' },
					{ ['object'] = 'vw_prop_vw_wallart_53a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 53a' },
					{ ['object'] = 'vw_prop_vw_wallart_54a_01a', ['price'] = 650, ['label'] = '牆麵壁紙 VW 54a' },
					{ ['object'] = 'vw_prop_vw_wallart_55a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 55a' },
					{ ['object'] = 'vw_prop_vw_wallart_56a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 56a' },
					{ ['object'] = 'vw_prop_vw_wallart_57a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 57a' },
					{ ['object'] = 'vw_prop_vw_wallart_58a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 58a' },
					{ ['object'] = 'vw_prop_vw_wallart_59a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 59a' },
					{ ['object'] = 'vw_prop_vw_wallart_60a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 60a' },
					{ ['object'] = 'vw_prop_vw_wallart_61a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 61a' },
					{ ['object'] = 'vw_prop_vw_wallart_62a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 62a' },
					{ ['object'] = 'vw_prop_vw_wallart_63a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 63a' },
					{ ['object'] = 'vw_prop_vw_wallart_64a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 64a' },
					{ ['object'] = 'vw_prop_vw_wallart_65a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 65a' },
					{ ['object'] = 'vw_prop_vw_wallart_66a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 66a' },
					{ ['object'] = 'vw_prop_vw_wallart_67a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 67a' },
					{ ['object'] = 'vw_prop_vw_wallart_68a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 68a' },
					{ ['object'] = 'vw_prop_vw_wallart_69a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 69a' },
					{ ['object'] = 'vw_prop_vw_wallart_70a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 70a' },
					{ ['object'] = 'vw_prop_vw_wallart_71a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 71a' },
					{ ['object'] = 'vw_prop_vw_wallart_72a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 72a' },
					{ ['object'] = 'vw_prop_vw_wallart_73a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 73a' },
					{ ['object'] = 'vw_prop_vw_wallart_74a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 74a' },
					{ ['object'] = 'vw_prop_vw_wallart_75a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 75a' },
					{ ['object'] = 'vw_prop_vw_wallart_76a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 76a' },
					{ ['object'] = 'vw_prop_vw_wallart_77a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 77a' },
					{ ['object'] = 'vw_prop_vw_wallart_78a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 78a' },
					{ ['object'] = 'vw_prop_vw_wallart_79a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 79a' },
					{ ['object'] = 'vw_prop_vw_wallart_80a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 80a' },
					{ ['object'] = 'vw_prop_vw_wallart_81a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 81a' },
					{ ['object'] = 'vw_prop_vw_wallart_82a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 82a' },
					{ ['object'] = 'vw_prop_vw_wallart_83a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 83a' },
					{ ['object'] = 'vw_prop_vw_wallart_84a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 84a' },
					{ ['object'] = 'vw_prop_vw_wallart_85a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 85a' },
					{ ['object'] = 'vw_prop_vw_wallart_86a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 86a' },
					{ ['object'] = 'vw_prop_vw_wallart_87a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 87a' },
					{ ['object'] = 'vw_prop_vw_wallart_88a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 88a' },
					{ ['object'] = 'vw_prop_vw_wallart_89a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 89a' },
					{ ['object'] = 'vw_prop_vw_wallart_90a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 90a' },
					{ ['object'] = 'vw_prop_vw_wallart_91a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 91a' },
					{ ['object'] = 'vw_prop_vw_wallart_92a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 92a' },
					{ ['object'] = 'vw_prop_vw_wallart_93a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 93a' },
					{ ['object'] = 'vw_prop_vw_wallart_94a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 94a' },
					{ ['object'] = 'vw_prop_vw_wallart_95a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 95a' },
					{ ['object'] = 'vw_prop_vw_wallart_96a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 96a' },
					{ ['object'] = 'vw_prop_vw_wallart_97a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 97a' },
					{ ['object'] = 'vw_prop_vw_wallart_98a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 98a' },
					{ ['object'] = 'vw_prop_vw_wallart_99a',     ['price'] = 650, ['label'] = '牆麵壁紙 VW 99a' }
				}
			},
			{
				['object'] = 'apa_prop_flag_argentina',
				['price'] = 150,
				['label'] = '國家國旗',
				['group_items'] = {
					{ ['object'] = 'apa_prop_flag_argentina',  ['price'] = 150, ['label'] = '阿根廷國旗' },
					{ ['object'] = 'apa_prop_flag_australia',  ['price'] = 150, ['label'] = '澳大利亞國旗' },
					{ ['object'] = 'apa_prop_flag_austria',    ['price'] = 150, ['label'] = '奧地利國旗' },
					{ ['object'] = 'apa_prop_flag_belgium',    ['price'] = 150, ['label'] = '比利時國旗' },
					{ ['object'] = 'apa_prop_flag_brazil',     ['price'] = 150, ['label'] = '巴西國旗' },
					{ ['object'] = 'apa_prop_flag_china',      ['price'] = 150, ['label'] = '中國國旗' },
					{ ['object'] = 'apa_prop_flag_england',    ['price'] = 150, ['label'] = '英格蘭國旗' },
					{ ['object'] = 'apa_prop_flag_czechrep',   ['price'] = 150, ['label'] = '捷克共和國國旗' },
					{ ['object'] = 'apa_prop_flag_croatia',    ['price'] = 150, ['label'] = '克羅地亞國旗' },
					{ ['object'] = 'apa_prop_flag_denmark',    ['price'] = 150, ['label'] = '丹麥國旗' },
					{ ['object'] = 'apa_prop_flag_eu_yt',      ['price'] = 150, ['label'] = '歐盟旗幟' },
					{ ['object'] = 'apa_prop_flag_finland',    ['price'] = 150, ['label'] = '芬蘭國旗' },
					{ ['object'] = 'apa_prop_flag_german_yt',  ['price'] = 150, ['label'] = '德國國旗' },
					{ ['object'] = 'apa_prop_flag_hungary',    ['price'] = 150, ['label'] = '匈牙利國旗' },
					{ ['object'] = 'apa_prop_flag_spain',      ['price'] = 150, ['label'] = '西班牙國旗' },
					{ ['object'] = 'apa_prop_flag_us_yt',      ['price'] = 150, ['label'] = '美國國旗' },
					{ ['object'] = 'apa_prop_flag_southkorea', ['price'] = 150, ['label'] = '韓國國旗' },
					{ ['object'] = 'apa_prop_flag_script',     ['price'] = 150, ['label'] = '黑旗' },
					{ ['object'] = 'apa_prop_flag_russia_yt',  ['price'] = 150, ['label'] = '俄羅斯國旗' },
					{ ['object'] = 'apa_prop_flag_puertorico', ['price'] = 150, ['label'] = '波多黎各國旗' },
				}
			},
			{
				['object'] = 'gr_prop_gr_sign_01a',
				['price'] = 350,
				['label'] = '外部標誌',
				['group_items'] = {
					{ ['object'] = 'gr_prop_gr_sign_01a', ['price'] = 350, ['label'] = '外部標誌 01a' },
					{ ['object'] = 'gr_prop_gr_sign_01b', ['price'] = 350, ['label'] = '外部標誌 01b' },
					{ ['object'] = 'gr_prop_gr_sign_01c', ['price'] = 350, ['label'] = '外部標誌 01c' },
					{ ['object'] = 'gr_prop_gr_sign_01e', ['price'] = 350, ['label'] = '外部標誌 01e' },
				}
			},
			{
				['object'] = 'gr_prop_gr_target_02a',
				['price'] = 350,
				['label'] = '靶 021',
				['group_items'] = {
					{ ['object'] = 'gr_prop_gr_target_02a', ['price'] = 250, ['label'] = '靶 021' },
					{ ['object'] = 'gr_prop_gr_target_02b', ['price'] = 250, ['label'] = '靶 02b' },
					{ ['object'] = 'gr_prop_gr_target_04a', ['price'] = 450, ['label'] = '靶 04a' },
					{ ['object'] = 'gr_prop_gr_target_04b', ['price'] = 450, ['label'] = '靶 02b' },
				}
			},
			{ ['object'] = 'sm_prop_smug_wall_radio_01',  ['price'] = 150, ['label'] = '牆壁收音機' },
			{ ['object'] = 'bkr_prop_biker_safedoor_01a', ['price'] = 150, ['label'] = '防盜門' },
			{ ['object'] = 'gr_prop_gr_target_02a',       ['price'] = 250, ['label'] = '靶 021' },
			{ ['object'] = 'gr_prop_gr_target_02b',       ['price'] = 250, ['label'] = '靶 02b' },
		}
	},

	['electronics'] = {
		['label'] = '電子産品',
		['items'] = {
			{
				['object'] = 'ex_office_swag_electronic',
				['price'] = 500,
				['label'] = '贓物電子',
				['group_items'] = {
					{ ['object'] = 'ex_office_swag_electronic',  ['price'] = 500, ['label'] = '贓物電子' },
					{ ['object'] = 'ex_office_swag_electronic2', ['price'] = 500, ['label'] = '贓物電子 2' },
					{ ['object'] = 'ex_office_swag_electronic3', ['price'] = 500, ['label'] = '贓物電子 3' }
				}
			},
			{
				['object'] = 'ex_prop_ex_tv_flat_01',
				['price'] = 1200,
				['label'] = '電視機',
				['group_items'] = {
					{ ['object'] = 'ex_prop_ex_tv_flat_01',     ['price'] = 1200, ['label'] = '電視機 EX 扁平 01' },
					{ ['object'] = 'gr_prop_gr_trailer_tv',     ['price'] = 1200, ['label'] = '電視機 預告片' },
					{ ['object'] = 'prop_trev_tv_01',           ['price'] = 700,  ['label'] = '電視機 特雷夫' },
					{ ['object'] = 'prop_tv_02',                ['price'] = 320,  ['label'] = '電視機 02' },
					{ ['object'] = 'prop_tv_03',                ['price'] = 450,  ['label'] = '電視機 03' },
					{ ['object'] = 'prop_tv_04',                ['price'] = 120,  ['label'] = '電視機 04' },
					{ ['object'] = 'prop_tv_05',                ['price'] = 140,  ['label'] = '電視機 05' },
					{ ['object'] = 'prop_tv_06',                ['price'] = 480,  ['label'] = '電視機 06' },
					{ ['object'] = 'prop_tv_07',                ['price'] = 450,  ['label'] = '電視機 07' },
					{ ['object'] = 'prop_tv_flat_01',           ['price'] = 1600, ['label'] = '電視機 扁平 01' },
					{ ['object'] = 'prop_tv_flat_02',           ['price'] = 1500, ['label'] = '電視機 扁平 02' },
					{ ['object'] = 'prop_tv_flat_02b',          ['price'] = 1700, ['label'] = '電視機 扁平 02b' },
					{ ['object'] = 'prop_tv_flat_03',           ['price'] = 1300, ['label'] = '電視機 扁平 03' },
					{ ['object'] = 'sm_prop_smug_tv_flat_01',   ['price'] = 1600, ['label'] = '電視機 Smug' },
					{ ['object'] = 'vw_prop_vw_cinema_tv_01',   ['price'] = 1800, ['label'] = '電視機 電影' },
					{ ['object'] = 'xm_prop_x17_tv_ceiling_01', ['price'] = 2000, ['label'] = '電視機 天花闆' },
					{ ['object'] = 'xm_prop_x17_tv_stand_01a',  ['price'] = 2800, ['label'] = '電視機 站立' },
				}
			},
			{
				['object'] = 'apa_mp_h_str_avunits_01',
				['price'] = 2200,
				['label'] = '獨家電視',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_str_avunitm_01',   ['price'] = 2200, ['label'] = '收音電視機 01' },
					{ ['object'] = 'apa_mp_h_str_avunitm_03',   ['price'] = 2200, ['label'] = '收音電視機 02' },
					{ ['object'] = 'apa_mp_h_str_avunitl_04',   ['price'] = 1500, ['label'] = '收音電視機 Loot' },
					{ ['object'] = 'apa_mp_h_str_avunitl_04',   ['price'] = 1600, ['label'] = '收音電視機 Loot' },
					{ ['object'] = 'hei_heist_str_avunitl_03',  ['price'] = 1600, ['label'] = '收音電視機 03' },
					{ ['object'] = 'hei_heist_str_avunits_01',  ['price'] = 1600, ['label'] = '收音電視機 01' },
					{ ['object'] = 'apa_mp_h_str_avunitl_01_b', ['price'] = 6800, ['label'] = '管理人員的電視機' },
					{ ['object'] = 'hei_heist_str_avunitl_01',  ['price'] = 6800, ['label'] = '管理人員的電視機 01' },
				}
			},
			{
				['object'] = 'prop_cs_cctv',
				['price'] = 130,
				['label'] = '中央電視臺',
				['group_items'] = {
					{ ['object'] = 'prop_cs_cctv',       ['price'] = 130,  ['label'] = '中央電視臺' },
					{ ['object'] = 'prop_cctv_cam_01b',  ['price'] = 120,  ['label'] = '中央電視臺 Cam 01b' },
					{ ['object'] = 'prop_cctv_cam_02a',  ['price'] = 135,  ['label'] = '中央電視臺 Cam 02a' },
					{ ['object'] = 'prop_cctv_cam_03a',  ['price'] = 155,  ['label'] = '中央電視臺 Cam 03a' },
					{ ['object'] = 'prop_cctv_cam_04a',  ['price'] = 250,  ['label'] = '中央電視臺 Cam 04a' },
					{ ['object'] = 'prop_cctv_cam_04b',  ['price'] = 250,  ['label'] = '中央電視臺 Cam 04b' },
					{ ['object'] = 'prop_cctv_cam_04c',  ['price'] = 250,  ['label'] = '中央電視臺 Cam 04c' },
					{ ['object'] = 'prop_cctv_cam_05a',  ['price'] = 120,  ['label'] = '中央電視臺 Cam 05a' },
					{ ['object'] = 'prop_cctv_cam_06a',  ['price'] = 120,  ['label'] = '中央電視臺 Cam 06a' },
					{ ['object'] = 'prop_cctv_cam_07a',  ['price'] = 160,  ['label'] = '中央電視臺 Cam 07a' },
					{ ['object'] = 'prop_cctv_pole_01a', ['price'] = 230,  ['label'] = '中央電視臺 Pole 01a' },
					{ ['object'] = 'prop_cctv_pole_02',  ['price'] = 480,  ['label'] = '中央電視臺 Pole 02' },
					{ ['object'] = 'prop_cctv_pole_03',  ['price'] = 500,  ['label'] = '中央電視臺 Pole 03' },
					{ ['object'] = 'prop_cctv_pole_04',  ['price'] = 450,  ['label'] = '中央電視臺 Pole 04' },
					{ ['object'] = 'prop_cctv_01_sm',    ['price'] = 800,  ['label'] = '中央電視臺 01 SM' },
					{ ['object'] = 'prop_cctv_02_sm',    ['price'] = 800,  ['label'] = '中央電視臺 02 SM' },
					{ ['object'] = 'prop_cctv_unit_02',  ['price'] = 1700, ['label'] = '中央電視臺 Unit 02' },
					{ ['object'] = 'prop_cctv_unit_04',  ['price'] = 2500, ['label'] = '中央電視臺 Unit 04' },
					{ ['object'] = 'prop_cctv_unit_05',  ['price'] = 3200, ['label'] = '中央電視臺 Unit 05' },
					{ ['object'] = 'prop_dest_cctv_02',  ['price'] = 900,  ['label'] = '中央電視臺 Dest 02' },
					{ ['object'] = 'prop_dest_cctv_03',  ['price'] = 900,  ['label'] = '中央電視臺 Dest 03' },
					{ ['object'] = 'prop_dest_cctv_03b', ['price'] = 900,  ['label'] = '中央電視臺 Dest 03b' }
				}
			},
			{
				['object'] = 'ex_prop_tv_settop_remote',
				['price'] = 10,
				['label'] = 'Remote',
				['group_items'] = {
					{ ['object'] = 'ex_prop_tv_settop_remote', ['price'] = 10, ['label'] = 'Remote TV' },
					{ ['object'] = 'prop_cs_remote_01',        ['price'] = 10, ['label'] = 'Remote CS' },
					{ ['object'] = 'v_res_tre_remote',         ['price'] = 10, ['label'] = 'Remote Tre' },
					{ ['object'] = 'v_res_tt_tvremote',        ['price'] = 10, ['label'] = 'Remote TT' }
				}
			},
			{
				['object'] = 'as_prop_as_laptop_01a',
				['price'] = 300,
				['label'] = '筆記本電腦',
				['group_items'] = {
					{ ['object'] = 'as_prop_as_laptop_01a',         ['price'] = 300, ['label'] = '筆記本電腦 開合' },
					{ ['object'] = 'ba_prop_battle_laptop_dj',      ['price'] = 300, ['label'] = '筆記本電腦 閉合' },
					{ ['object'] = 'ch_prop_laptop_01a',            ['price'] = 300, ['label'] = '筆記本電腦 像素商場' },
					{ ['object'] = 'ex_prop_ex_laptop_01a',         ['price'] = 300, ['label'] = '筆記本電腦 廣告鷹' },
					{ ['object'] = 'gr_prop_gr_laptop_01c',         ['price'] = 300, ['label'] = '筆記本電腦 Excel' },
					{ ['object'] = 'hei_prop_hst_laptop',           ['price'] = 300, ['label'] = '筆記本電腦 HD OFF' },
					{ ['object'] = 'prop_laptop_jimmy',             ['price'] = 300, ['label'] = '筆記本電腦 Jimmy' },
					{ ['object'] = 'prop_laptop_lester',            ['price'] = 300, ['label'] = '筆記本電腦 Lester' },
					{ ['object'] = 'xm_prop_x17_laptop_avon',       ['price'] = 300, ['label'] = '筆記本電腦 Avon' },
					{ ['object'] = 'p_cs_laptop_02',                ['price'] = 150, ['label'] = '筆記本電腦 Old Open OFF' },
					{ ['object'] = 'p_cs_laptop_02_w',              ['price'] = 150, ['label'] = '筆記本電腦 Special' },
					{ ['object'] = 'p_laptop_02_s',                 ['price'] = 300, ['label'] = '筆記本電腦 Old Close' },
					{ ['object'] = 'v_ind_ss_laptop',               ['price'] = 150, ['label'] = '筆記本電腦 Ind' },
					{ ['object'] = 'xm_prop_x17_laptop_agent14_01', ['price'] = 600, ['label'] = '筆記本電腦 Agent' },
					{ ['object'] = 'xm_prop_x17_laptop_lester_01',  ['price'] = 600, ['label'] = '筆記本電腦 Agent Lester' },
					{ ['object'] = 'xm_prop_x17_laptop_mrsr',       ['price'] = 300, ['label'] = '筆記本電腦 MRSR' }
				}
			},
			{
				['object'] = 'ch_prop_ch_phone_ing_01a',
				['price'] = 800,
				['label'] = '移動電話',
				['group_items'] = {
					{ ['object'] = 'ch_prop_ch_phone_ing_01a',   ['price'] = 800, ['label'] = '移動電話 01a' },
					{ ['object'] = 'ch_prop_ch_phone_ing_02a',   ['price'] = 800, ['label'] = '移動電話 02a' },
					{ ['object'] = 'prop_npc_phone',             ['price'] = 800, ['label'] = '移動電話' },
					{ ['object'] = 'prop_npc_phone_02',          ['price'] = 800, ['label'] = '移動電話 02' },
					{ ['object'] = 'prop_phone_ing',             ['price'] = 800, ['label'] = '移動電話 Ing' },
					{ ['object'] = 'prop_phone_ing_02',          ['price'] = 450, ['label'] = '移動電話 Ing 02' },
					{ ['object'] = 'prop_player_phone_01',       ['price'] = 800, ['label'] = '移動電話 Player 01' },
					{ ['object'] = 'prop_player_phone_02',       ['price'] = 800, ['label'] = '移動電話 Player 02' },
					{ ['object'] = 'prop_prologue_phone',        ['price'] = 300, ['label'] = '移動電話 Prologue' },
					{ ['object'] = 'prop_v_m_phone_01',          ['price'] = 50,  ['label'] = '移動電話 VM' },
					{ ['object'] = 'p_cs_cam_phone',             ['price'] = 350, ['label'] = '移動電話 Cam' },

					{ ['object'] = 'apa_mp_h_acc_phone_01',      ['price'] = 80,  ['label'] = '移動電話 Acc' },
					{ ['object'] = 'hei_prop_hei_bank_phone_01', ['price'] = 110, ['label'] = '移動電話 Bank' },
					{ ['object'] = 'prop_cs_phone_01',           ['price'] = 110, ['label'] = '移動電話 CS' },
					{ ['object'] = 'prop_off_phone_01',          ['price'] = 130, ['label'] = '移動電話 Office' },
					{ ['object'] = 'vw_prop_casino_phone_01a',   ['price'] = 110, ['label'] = '移動電話 Casino' }
				}
			},
			{
				['object'] = 'as_prop_as_speakerdock',
				['price'] = 420,
				['label'] = '音響',
				['group_items'] = {
					{ ['object'] = 'as_prop_as_speakerdock',            ['price'] = 420,  ['label'] = '音響 Dock' },
					{ ['object'] = 'prop_mp3_dock',                     ['price'] = 350,  ['label'] = '音響 MP3 Dock' },
					{ ['object'] = 'ba_prop_battle_club_speaker_array', ['price'] = 1800, ['label'] = '音響 Array' },
					{ ['object'] = 'ba_prop_battle_club_speaker_dj',    ['price'] = 600,  ['label'] = '音響 DJ' },
					{ ['object'] = 'ba_prop_battle_club_speaker_large', ['price'] = 900,  ['label'] = '音響 Large' },
					{ ['object'] = 'ba_prop_battle_club_speaker_med',   ['price'] = 800,  ['label'] = '音響 Med' },
					{ ['object'] = 'ba_prop_battle_club_speaker_small', ['price'] = 650,  ['label'] = '音響 Small' },
					{ ['object'] = 'prop_speaker_01',                   ['price'] = 320,  ['label'] = '音響 01' },
					{ ['object'] = 'prop_speaker_02',                   ['price'] = 300,  ['label'] = '音響 02' },
					{ ['object'] = 'prop_speaker_03',                   ['price'] = 300,  ['label'] = '音響 03' },
					{ ['object'] = 'prop_speaker_05',                   ['price'] = 300,  ['label'] = '音響 05' },
					{ ['object'] = 'prop_speaker_06',                   ['price'] = 350,  ['label'] = '音響 06' },
					{ ['object'] = 'prop_speaker_07',                   ['price'] = 650,  ['label'] = '音響 07' },
					{ ['object'] = 'prop_speaker_08',                   ['price'] = 450,  ['label'] = '音響 08' },
					{ ['object'] = 'v_res_pcspeaker',                   ['price'] = 80,   ['label'] = '音響 PC' }
				}
			},
			{
				['object'] = 'hei_prop_heist_pc_01',
				['price'] = 420,
				['label'] = '臺式電腦',
				['group_items'] = {
					{ ['object'] = 'hei_prop_heist_pc_01', ['price'] = 420, ['label'] = '臺式電腦 01' },
					{ ['object'] = 'prop_dyn_pc',          ['price'] = 120, ['label'] = '臺式電腦 DYN' },
					{ ['object'] = 'prop_dyn_pc_02',       ['price'] = 500, ['label'] = '臺式電腦 DYN 02' },
					{ ['object'] = 'prop_pc_01a',          ['price'] = 110, ['label'] = '臺式電腦 01a' },
					{ ['object'] = 'prop_pc_02a',          ['price'] = 250, ['label'] = '臺式電腦 02s' },
					{ ['object'] = 'v_res_pctower',        ['price'] = 300, ['label'] = '臺式電腦 RES' }
				}
			},
			{
				['object'] = 'prop_monitor_01c',
				['price'] = 150,
				['label'] = '攝像頭 01c',
				['group_items'] = {
					{ ['object'] = 'prop_monitor_01c',        ['price'] = 150,  ['label'] = '攝像頭 01c' },
					{ ['object'] = 'prop_monitor_01d',        ['price'] = 150,  ['label'] = '攝像頭 01d' },
					{ ['object'] = 'prop_monitor_02',         ['price'] = 150,  ['label'] = '攝像頭 02' },
					{ ['object'] = 'prop_monitor_03b',        ['price'] = 150,  ['label'] = '攝像頭 03b' },
					{ ['object'] = 'prop_trailer_monitor_01', ['price'] = 350,  ['label'] = '攝像頭 Trailer' },
					{ ['object'] = 'sm_prop_smug_monitor_01', ['price'] = 250,  ['label'] = '攝像頭 Smug' },
					{ ['object'] = 'v_res_monitor',           ['price'] = 150,  ['label'] = '攝像頭 Res' },
					{ ['object'] = 'xm_prop_x17_screens_02a', ['price'] = 1600, ['label'] = '攝像頭 Ultra Wide' }
				}
			},
			{
				['object'] = 'hei_prop_hei_cs_keyboard',
				['price'] = 50,
				['label'] = '電腦鍵盤',
				['group_items'] = {
					{ ['object'] = 'hei_prop_hei_cs_keyboard', ['price'] = 50, ['label'] = '電腦鍵盤' },
					{ ['object'] = 'prop_cs_keyboard_01',      ['price'] = 50, ['label'] = '電腦鍵盤 01' },
					{ ['object'] = 'prop_keyboard_01a',        ['price'] = 50, ['label'] = '電腦鍵盤 01a' }
				}
			},
			{
				['object'] = 'prop_mouse_01',
				['price'] = 50,
				['label'] = '電腦鼠標',
				['group_items'] = {
					{ ['object'] = 'prop_mouse_01',  ['price'] = 50, ['label'] = '電腦鼠標' },
					{ ['object'] = 'prop_mouse_01b', ['price'] = 50, ['label'] = '電腦鼠標 01b' },
					{ ['object'] = 'v_res_mousemat', ['price'] = 80, ['label'] = '電腦鼠標 Mat' }
				}
			},
			{
				['object'] = 'prop_printer_01',
				['price'] = 350,
				['label'] = '打印機',
				['group_items'] = {
					{ ['object'] = 'prop_printer_01', ['price'] = 350, ['label'] = '打印機 01' },
					{ ['object'] = 'prop_printer_02', ['price'] = 350, ['label'] = '打印機 02' },
					{ ['object'] = 'v_res_printer',   ['price'] = 350, ['label'] = '打印機 Res' }
				}
			},
			{
				['object'] = 'v_res_pcheadset',
				['price'] = 120,
				['label'] = '耳機',
				['group_items'] = {
					{ ['object'] = 'v_res_pcheadset',              ['price'] = 120, ['label'] = '耳機 PC' },
					{ ['object'] = 'prop_headset_01',              ['price'] = 45,  ['label'] = '耳機' },
					{ ['object'] = 'vw_prop_vw_headset_01a',       ['price'] = 80,  ['label'] = '耳機' },
					{ ['object'] = 'ba_prop_battle_headphones_dj', ['price'] = 180, ['label'] = '手機二級' }
				}
			},
			{
				['object'] = 'prop_radio_01',
				['price'] = 35,
				['label'] = '收音機',
				['group_items'] = {
					{ ['object'] = 'prop_radio_01',              ['price'] = 35,  ['label'] = '收音機 01' },
					{ ['object'] = 'sm_prop_smug_wall_radio_01', ['price'] = 120, ['label'] = '收音機 Wall' },
					{ ['object'] = 'prop_boombox_01',            ['price'] = 80,  ['label'] = '低音炮音響' }
				}
			},
			{
				['object'] = 'prop_ing_camera_01',
				['price'] = 120,
				['label'] = '照相機',
				['group_items'] = {
					{ ['object'] = 'prop_ing_camera_01', ['price'] = 120, ['label'] = '照相機 01' },
					{ ['object'] = 'prop_pap_camera_01', ['price'] = 850, ['label'] = '照相機 Large' },
				}
			},
			{
				['object'] = 'hei_prop_dlc_tablet',
				['price'] = 450,
				['label'] = '平闆電腦',
				['group_items'] = {
					{ ['object'] = 'hei_prop_dlc_tablet',           ['price'] = 450, ['label'] = '平闆電腦' },
					{ ['object'] = 'xm_prop_x17_tablet_01',         ['price'] = 520, ['label'] = '平闆電腦 HD' },
					{ ['object'] = 'xs_prop_arena_tablet_drone_01', ['price'] = 600, ['label'] = '平闆電腦 Argen Wars' }
				}
			},
			{
				['object'] = 'v_ilev_mm_screen',
				['price'] = 150,
				['label'] = '油畫',
				['group_items'] = {
					{ ['object'] = 'v_ilev_mm_screen',  ['price'] = 150, ['label'] = '油畫' },
					{ ['object'] = 'v_ilev_mm_screen2', ['price'] = 150, ['label'] = '油畫 2' }
				}
			},
			{
				['object'] = 'ch_prop_arcade_claw_01a',
				['price'] = 1200,
				['label'] = '遊戲機/街機',
				['group_items'] = {
					{ ['object'] = 'ch_prop_arcade_claw_01a',          ['price'] = 1500, ['label'] = '遊戲機街機 Claw' },
					{ ['object'] = 'ch_prop_arcade_degenatron_01a',    ['price'] = 1500, ['label'] = '遊戲機街機 Degenatron' },
					{ ['object'] = 'ch_prop_arcade_fortune_01a',       ['price'] = 1800, ['label'] = '遊戲機街機 Fortune' },
					{ ['object'] = 'ch_prop_arcade_fortune_door_01a',  ['price'] = 150,  ['label'] = '遊戲機街機 Forutne Door' },
					{ ['object'] = 'ch_prop_arcade_gun_01a',           ['price'] = 2600, ['label'] = '遊戲機街機 Gun' },
					{ ['object'] = 'ch_prop_arcade_invade_01a',        ['price'] = 1400, ['label'] = '遊戲機街機 Invade' },
					{ ['object'] = 'ch_prop_arcade_love_01a',          ['price'] = 2800, ['label'] = '遊戲機街機 Love' },
					{ ['object'] = 'ch_prop_arcade_monkey_01a',        ['price'] = 1500, ['label'] = '遊戲機街機 Monkey' },
					{ ['object'] = 'ch_prop_arcade_penetrator_01a',    ['price'] = 1500, ['label'] = '遊戲機街機 Penetrator' },
					{ ['object'] = 'ch_prop_arcade_race_01a',          ['price'] = 4300, ['label'] = '遊戲機街機 Race 01a' },
					{ ['object'] = 'ch_prop_arcade_race_01b',          ['price'] = 4300, ['label'] = '遊戲機街機 Race 01b' },
					{ ['object'] = 'ch_prop_arcade_space_01a',         ['price'] = 1500, ['label'] = '遊戲機街機 Space' },
					{ ['object'] = 'ch_prop_arcade_street_01a',        ['price'] = 1500, ['label'] = '遊戲機街機 Street 01a' },
					{ ['object'] = 'ch_prop_arcade_street_01a_off',    ['price'] = 1500, ['label'] = '遊戲機街機 Street 01a off' },
					{ ['object'] = 'ch_prop_arcade_street_01b',        ['price'] = 1500, ['label'] = '遊戲機街機 Street 01b' },
					{ ['object'] = 'ch_prop_arcade_street_01b_off',    ['price'] = 1500, ['label'] = '遊戲機街機 Street 01b off' },
					{ ['object'] = 'ch_prop_arcade_street_01c',        ['price'] = 1500, ['label'] = '遊戲機街機 Street 01c' },
					{ ['object'] = 'ch_prop_arcade_street_01c_off',    ['price'] = 1500, ['label'] = '遊戲機街機 Street 01c off' },
					{ ['object'] = 'ch_prop_arcade_street_01d',        ['price'] = 1500, ['label'] = '遊戲機街機 Street 01d' },
					{ ['object'] = 'ch_prop_arcade_street_01d_off',    ['price'] = 1500, ['label'] = '遊戲機街機 Street 01d off' },
					{ ['object'] = 'ch_prop_arcade_street_02b',        ['price'] = 1500, ['label'] = '遊戲機街機 Street 02b' },
					{ ['object'] = 'ch_prop_arcade_wizard_01a',        ['price'] = 1500, ['label'] = '遊戲機街機 Wizard' },
					{ ['object'] = 'prop_bball_arcade_01',             ['price'] = 1500, ['label'] = '遊戲機街機 Ball' },
					{ ['object'] = 'sum_prop_arcade_strength_01a',     ['price'] = 1500, ['label'] = '遊戲機街機 Strength' },
					{ ['object'] = 'sum_prop_arcade_strength_ham_01a', ['price'] = 150,  ['label'] = '遊戲機街機 Strength Hammer' },
					{ ['object'] = 'sum_prop_arcade_qub3d_01a',        ['price'] = 1500, ['label'] = '遊戲機街機 Qub3D' }
				}
			},
			{
				['object'] = 'ba_prop_battle_dj_deck_01a',
				['price'] = 120,
				['label'] = 'DJ',
				['group_items'] = {
					{ ['object'] = 'ba_prop_battle_dj_deck_01a',  ['price'] = 120,  ['label'] = 'DJ Deck' },
					{ ['object'] = 'ba_prop_battle_dj_kit_mixer', ['price'] = 350,  ['label'] = 'DJ Kit Mixer' },
					{ ['object'] = 'ba_prop_battle_dj_mixer_01a', ['price'] = 450,  ['label'] = 'DJ Mixer 01a' },
					{ ['object'] = 'ba_prop_battle_dj_mixer_01b', ['price'] = 800,  ['label'] = 'DJ Mixer 01b' },
					{ ['object'] = 'ba_prop_battle_dj_mixer_01c', ['price'] = 450,  ['label'] = 'DJ Mixer 01c' },
					{ ['object'] = 'ba_prop_battle_dj_mixer_01d', ['price'] = 380,  ['label'] = 'DJ Mixer 01d' },
					{ ['object'] = 'ba_prop_battle_dj_mixer_01e', ['price'] = 420,  ['label'] = 'DJ Mixer 01e' },
					{ ['object'] = 'ba_prop_battle_dj_stand',     ['price'] = 1450, ['label'] = 'DJ Stand' },
				}
			},
			{
				['object'] = 'ba_prop_battle_drone_quad_static',
				['price'] = 160,
				['label'] = '無人機',
				['group_items'] = {
					{ ['object'] = 'ba_prop_battle_drone_quad_static', ['price'] = 160, ['label'] = '無人機' },
					{ ['object'] = 'ch_prop_casino_drone_broken01a',   ['price'] = 160, ['label'] = '無人機' }
				}
			},
			{
				['object'] = 'apa_p_apdlc_treadmill_s',
				['price'] = 1260,
				['label'] = '跑步機',
				['group_items'] = {
					{ ['object'] = 'apa_p_apdlc_treadmill_s',    ['price'] = 1260, ['label'] = '跑步機S' },
					{ ['object'] = 'apa_p_apdlc_crosstrainer_s', ['price'] = 2360, ['label'] = '跑步機SS' },
					{ ['object'] = 'hei_heist_crosstrainer_s',   ['price'] = 2360, ['label'] = '跑步機SSS' }
				}
			},
			{
				['object'] = 'hei_prop_hei_bank_phone_01',
				['price'] = 660,
				['label'] = '座機',
				['group_items'] = {
					{ ['object'] = 'hei_prop_hei_bank_phone_01', ['price'] = 660, ['label'] = '座機' },
					{ ['object'] = 'hei_prop_carrier_phone_02',  ['price'] = 300, ['label'] = '複古座機' },
				}
			},
			{ ['object'] = 'v_res_vacuum',                   ['price'] = 350,  ['label'] = '吸塵器' },
			{ ['object'] = 'prop_microphone_02',             ['price'] = 35,   ['label'] = '麥克風' },
			{ ['object'] = 'bkr_prop_weed_fan_ceiling_01a',  ['price'] = 1450, ['label'] = '大風扇01a' },
			{ ['object'] = 'bkr_prop_weed_fan_floor_01a',    ['price'] = 450,  ['label'] = '扇子 01a' },
			{ ['object'] = 'bkr_prop_clubhouse_jukebox_01a', ['price'] = 800,  ['label'] = '點唱機 01a' },
			{ ['object'] = 'bkr_prop_clubhouse_jukebox_01b', ['price'] = 920,  ['label'] = '點唱機 01b' },
			{ ['object'] = 'bkr_prop_clubhouse_jukebox_02a', ['price'] = 1200, ['label'] = '點唱機 02a' },
			{ ['object'] = 'hei_prop_hei_carrier_disp_01',   ['price'] = 700,  ['label'] = '點歌機顯示器 01' },
			{ ['object'] = 'prop_arcade_01',                 ['price'] = 900,  ['label'] = 'Arcade街機 01' },
		}
	},

	--[[ ['fridges'] = {
		['label'] = '冰箱',
		['items'] = {
			{ ['object'] = 'bkr_prop_prtmachine_dryer_spin', ['price'] = 600, ['label'] = 'Money Wash' },
		}
	}, ]]

	['fridges'] = {
		['label'] = '廚房用品',
		['items'] = {
			{ ['object'] = 'bkr_prop_prtmachine_dryer_spin', ['price'] = 600, ['label'] = 'Money Wash' },
			{
				['object'] = 'ba_prop_battle_bar_beerfridge_01',
				['price'] = 1300,
				['label'] = '啤酒冰箱',
				['group_items'] = {
					{ ['object'] = 'ba_prop_battle_bar_beerfridge_01', ['price'] = 1300, ['label'] = '啤酒冰箱1' },
					{ ['object'] = 'ba_prop_battle_bar_fridge_01',     ['price'] = 1300, ['label'] = '啤酒冰箱2' },
					{ ['object'] = 'prop_bar_fridge_01',               ['price'] = 1300, ['label'] = '啤酒冰箱3' },
				}
			},
			{
				['object'] = 'ba_prop_battle_bar_fridge_02',
				['price'] = 1450,
				['label'] = '迷你冰箱',
				['group_items'] = {
					{ ['object'] = 'ba_prop_battle_bar_fridge_02', ['price'] = 1450, ['label'] = '迷你冰箱1' },
					{ ['object'] = 'prop_bar_fridge_03',           ['price'] = 1100, ['label'] = '迷你冰箱2' },
					{ ['object'] = 'prop_bar_fridge_04',           ['price'] = 1400, ['label'] = '迷你冰箱3' }
				}
			},
			{
				['object'] = 'v_ilev_mm_fridgeint',
				['price'] = 900,
				['label'] = '冰箱',
				['group_items'] = {
					{ ['object'] = 'v_ilev_mm_fridgeint', ['price'] = 900, ['label'] = '冰箱 Int' },
					{ ['object'] = 'v_ilev_mm_fridge_l',  ['price'] = 450, ['label'] = '冰箱 L' },
					{ ['object'] = 'v_ilev_mm_fridge_r',  ['price'] = 450, ['label'] = '冰箱 R' }
				}
			},
			{ ['object'] = 'prop_fridge_01',            ['price'] = 1100, ['label'] = '冰箱 01' },
			{ ['object'] = 'prop_vend_fridge01',        ['price'] = 900,  ['label'] = '冰箱 03' },
			{ ['object'] = 'v_res_fridgemoda',          ['price'] = 1450, ['label'] = '冰箱 Moda' },
			{ ['object'] = 'v_res_fridgemodsml',        ['price'] = 1350, ['label'] = '冰箱 Modsml' },
			{ ['object'] = 'bkr_prop_meth_chiller_01a', ['price'] = 2300, ['label'] = '藥品冰箱 01' },
		}
	},

	['sinks'] = {
		['label'] = '水槽',
		['items'] = {
			{
				['object'] = 'prop_bar_sink_01',
				['price'] = 380,
				['label'] = '水槽吧臺 01',
				['group_items'] = {
					{ ['object'] = 'prop_ff_sink_02', ['price'] = 600, ['label'] = '水槽吧臺 ff 02' },
					{ ['object'] = 'prop_sink_04',    ['price'] = 600, ['label'] = '水槽吧臺 04' },
				}
			},
			{
				['object'] = 'prop_sink_02',
				['price'] = 350,
				['label'] = '水槽 01',
				['group_items'] = {
					{ ['object'] = 'prop_sink_05',    ['price'] = 250, ['label'] = '水槽 05' },
					{ ['object'] = 'prop_ff_sink_01', ['price'] = 175, ['label'] = '水槽 06' },
				}
			},
			{ ['object'] = 'prop_sink_06',     ['price'] = 350, ['label'] = '水槽 02' },
			{ ['object'] = 'v_res_mbsink',     ['price'] = 350, ['label'] = '水槽 MB' },
			{ ['object'] = 'v_ilev_mm_faucet', ['price'] = 175, ['label'] = '水龍頭' },
		}
	},

	['microwaves'] = {
		['label'] = '微波爐',
		['items'] = {
			{ ['object'] = 'prop_microwave_1', ['price'] = 200, ['label'] = '微波爐 01' },
			{ ['object'] = 'prop_micro_01',    ['price'] = 120, ['label'] = '微波爐 01' },
			{ ['object'] = 'prop_micro_02',    ['price'] = 200, ['label'] = '微波爐 02' },
		}
	},

	['ovens'] = {
		['label'] = '烤箱',
		['items'] = {
			{ ['object'] = 'prop_chip_fryer', ['price'] = 1300, ['label'] = '炸薯條烤箱' },
			{ ['object'] = 'prop_cooker_03',  ['price'] = 2500, ['label'] = '電磁烤箱' }
		}
	},

	['kitchendecs'] = {
		['label'] = '廚房裝飾',
		['items'] = {
			{
				['object'] = 'v_res_mknifeblock',
				['price'] = 130,
				['label'] = '刀具',
				['group_items'] = {
					{ ['object'] = 'v_res_mknifeblock', ['price'] = 130, ['label'] = '木製刀具' },
					{ ['object'] = 'prop_knife_stand',  ['price'] = 130, ['label'] = '黑色刀具' }
				}
			},
			{
				['object'] = 'apa_mp_h_acc_coffeemachine_01',
				['price'] = 250,
				['label'] = '咖啡機',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_acc_coffeemachine_01', ['price'] = 250,  ['label'] = '咖啡機 1' },
					{ ['object'] = 'prop_coffee_mac_01',            ['price'] = 1800, ['label'] = '咖啡機 Mac' },
					{ ['object'] = 'prop_coffee_mac_02',            ['price'] = 350,  ['label'] = '咖啡機 Mac' },
					{ ['object'] = 'xm_prop_x17_coffee_jug',        ['price'] = 75,   ['label'] = '咖啡機 Jug' }
				}
			},
			{
				['object'] = 'prop_cs_kettle_01',
				['price'] = 80,
				['label'] = '燒水壺',
				['group_items'] = {
					{ ['object'] = 'prop_cs_kettle_01', ['price'] = 80,  ['label'] = '燒水壺 1' },
					{ ['object'] = 'prop_kettle',       ['price'] = 100, ['label'] = '燒水壺 2' }
				}
			},
			{
				['object'] = 'prop_kitch_pot_fry',
				['price'] = 50,
				['label'] = '鍋',
				['group_items'] = {
					{ ['object'] = 'prop_kitch_pot_fry',  ['price'] = 50,  ['label'] = '油炸鍋' },
					{ ['object'] = 'prop_kitch_pot_huge', ['price'] = 150, ['label'] = '大鍋' },
					{ ['object'] = 'prop_kitch_pot_lrg',  ['price'] = 80,  ['label'] = '水缸1' },
					{ ['object'] = 'prop_kitch_pot_lrg2', ['price'] = 80,  ['label'] = '水缸2' },
					{ ['object'] = 'prop_pot_01',         ['price'] = 90,  ['label'] = '鍋 01' },
					{ ['object'] = 'prop_pot_03',         ['price'] = 80,  ['label'] = '鍋 03' },
					{ ['object'] = 'prop_pot_05',         ['price'] = 70,  ['label'] = '鍋 05' }
				}
			},
			{
				['object'] = 'v_res_fa_chopbrd',
				['price'] = 45,
				['label'] = '菜闆',
				['group_items'] = {
					{ ['object'] = 'v_res_fa_chopbrd', ['price'] = 45, ['label'] = '菜闆(不含刀具)' },
					{ ['object'] = 'v_res_mchopboard', ['price'] = 90, ['label'] = '菜闆(含刀具)' }
				}
			},
			{ ['object'] = 'v_res_mkniferack',         ['price'] = 180, ['label'] = '刀架' },
			{ ['object'] = 'v_res_mutensils',          ['price'] = 75,  ['label'] = '餐具' },
			{ ['object'] = 'prop_kitch_juicer',        ['price'] = 130, ['label'] = '廚房榨汁機' },
			{ ['object'] = 'v_res_tre_mixer',          ['price'] = 110, ['label'] = '烤箱披薩' },
			{ ['object'] = 'v_res_fa_sponge01',        ['price'] = 10,  ['label'] = '海綿' },
			{ ['object'] = 'bkr_prop_weed_scales_01a', ['price'] = 120, ['label'] = '雜草鱗片 01a' },
			{ ['object'] = 'bkr_prop_weed_scales_01b', ['price'] = 120, ['label'] = '雜草鱗片 01b' },
		}
	},

	['chairs'] = {
		['label'] = 'Chairs',
		['items'] = {
			{
				['object'] = 'apa_mp_h_din_chair_04',
				['price'] = 75,
				['label'] = '喧鬨椅',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_din_chair_04',  ['price'] = 75, ['label'] = '喧鬨椅 04' },
					{ ['object'] = 'hei_heist_din_chair_01', ['price'] = 75, ['label'] = '喧鬨椅 01' },
					{ ['object'] = 'hei_heist_din_chair_06', ['price'] = 75, ['label'] = '喧鬨椅 06' },
					{ ['object'] = 'apa_mp_h_din_chair_08',  ['price'] = 75, ['label'] = '喧鬨椅 08' },
					{ ['object'] = 'apa_mp_h_din_chair_09',  ['price'] = 80, ['label'] = '喧鬨椅 09' },
					{ ['object'] = 'hei_heist_din_chair_09', ['price'] = 80, ['label'] = '喧鬨椅 Heist 09' },
					{ ['object'] = 'apa_mp_h_din_chair_12',  ['price'] = 75, ['label'] = '喧鬨椅 12' },
					{ ['object'] = 'hei_heist_din_chair_02', ['price'] = 75, ['label'] = '喧鬨椅 02' },
					{ ['object'] = 'hei_heist_din_chair_05', ['price'] = 75, ['label'] = '喧鬨椅 05' },
					{ ['object'] = 'p_dinechair_01_s',       ['price'] = 75, ['label'] = '喧鬨椅 01s' },
				}
			},
			{
				['object'] = 'prop_table_04_chr',
				['price'] = 80,
				['label'] = '桌椅 04',
				['group_items'] = {
					{ ['object'] = 'prop_table_04_chr', ['price'] = 80, ['label'] = '桌椅 04' },
					{ ['object'] = 'prop_table_05_chr', ['price'] = 80, ['label'] = '桌椅 05' },
					{ ['object'] = 'prop_table_06_chr', ['price'] = 80, ['label'] = '桌椅 06' },
					{ ['object'] = 'prop_table_08_chr', ['price'] = 80, ['label'] = '桌椅 08' }
				}
			},
			{
				['object'] = 'apa_mp_h_yacht_barstool_01',
				['price'] = 90,
				['label'] = '酒吧高椅',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_yacht_barstool_01', ['price'] = 90, ['label'] = '酒吧高椅 01' },
					{ ['object'] = 'bkr_prop_biker_barstool_02', ['price'] = 90, ['label'] = '酒吧高椅 02' },
					{ ['object'] = 'bkr_prop_biker_barstool_03', ['price'] = 90, ['label'] = '酒吧高椅 03' },
					{ ['object'] = 'bkr_prop_biker_barstool_04', ['price'] = 90, ['label'] = '酒吧高椅 04' }
				}
			},
			{
				['object'] = 'apa_mp_h_stn_foot_stool_01',
				['price'] = 185,
				['label'] = '腳踏凳',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_stn_foot_stool_01', ['price'] = 185, ['label'] = '腳踏凳 01' },
					{ ['object'] = 'apa_mp_h_stn_foot_stool_02', ['price'] = 185, ['label'] = '腳踏凳 02' }
				}
			},
			{
				['object'] = 'apa_mp_h_stn_chairarm_01',
				['price'] = 135,
				['label'] = '扶手椅子',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_stn_chairarm_01',  ['price'] = 135, ['label'] = '椅子扶手 01' },
					{ ['object'] = 'apa_mp_h_stn_chairarm_02',  ['price'] = 135, ['label'] = '椅子扶手 02' },
					{ ['object'] = 'apa_mp_h_stn_chairarm_03',  ['price'] = 135, ['label'] = '椅子扶手 03' },
					{ ['object'] = 'apa_mp_h_stn_chairarm_09',  ['price'] = 135, ['label'] = '椅子扶手 09' },
					{ ['object'] = 'apa_mp_h_stn_chairarm_11',  ['price'] = 135, ['label'] = '椅子扶手 11' },
					{ ['object'] = 'apa_mp_h_stn_chairarm_12',  ['price'] = 135, ['label'] = '椅子扶手 12' },
					{ ['object'] = 'apa_mp_h_stn_chairarm_13',  ['price'] = 135, ['label'] = '椅子扶手 13' },
					{ ['object'] = 'apa_mp_h_stn_chairarm_23',  ['price'] = 135, ['label'] = '椅子扶手 23' },
					{ ['object'] = 'apa_mp_h_stn_chairarm_24',  ['price'] = 135, ['label'] = '椅子扶手 24' },
					{ ['object'] = 'apa_mp_h_stn_chairarm_25',  ['price'] = 135, ['label'] = '椅子扶手 25' },
					{ ['object'] = 'apa_mp_h_stn_chairarm_26',  ['price'] = 135, ['label'] = '椅子扶手 26' },
					{ ['object'] = 'ex_mp_h_stn_chairarm_03',   ['price'] = 135, ['label'] = '椅子扶手 STN 03' },
					{ ['object'] = 'ex_mp_h_stn_chairarm_24',   ['price'] = 135, ['label'] = '椅子扶手 STN 24' },
					{ ['object'] = 'hei_heist_stn_chairarm_01', ['price'] = 135, ['label'] = '椅子扶手 STN 01' },
					{ ['object'] = 'hei_heist_stn_chairarm_04', ['price'] = 135, ['label'] = '椅子扶手 STN 04' },
					{ ['object'] = 'hei_heist_stn_chairarm_06', ['price'] = 135, ['label'] = '椅子扶手 STN 06' },
					{ ['object'] = 'xm_lab_chairarm_11',        ['price'] = 135, ['label'] = '椅子扶手 Lab 11' },
					{ ['object'] = 'xm_lab_chairarm_12',        ['price'] = 160, ['label'] = '椅子扶手 Lab 12' },
					{ ['object'] = 'xm_mp_h_stn_chairarm_13',   ['price'] = 135, ['label'] = '椅子扶手 STN 13' }
				}
			},
			{
				['object'] = 'apa_mp_h_yacht_armchair_01',
				['price'] = 175,
				['label'] = '扶手椅子',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_yacht_armchair_01',      ['price'] = 175, ['label'] = '扶手椅子 Yacht 01' },
					{ ['object'] = 'apa_mp_h_yacht_armchair_03',      ['price'] = 135, ['label'] = '扶手椅子 Yacht 03' },
					{ ['object'] = 'apa_mp_h_yacht_armchair_04',      ['price'] = 175, ['label'] = '扶手椅子 Yacht 04' },
					{ ['object'] = 'bkr_prop_clubhouse_armchair_01a', ['price'] = 200, ['label'] = '扶手椅子 01a' },
					{ ['object'] = 'prop_armchair_01',                ['price'] = 135, ['label'] = '扶手椅子 01' },
					{ ['object'] = 'p_armchair_01_s',                 ['price'] = 145, ['label'] = '扶手椅子 01s' }
				}
			},
			{
				['object'] = 'ba_prop_battle_club_chair_01',
				['price'] = 165,
				['label'] = '俱樂部椅子',
				['group_items'] = {
					{ ['object'] = 'ba_prop_battle_club_chair_01', ['price'] = 175, ['label'] = '俱樂部椅子 01' },
					{ ['object'] = 'ba_prop_battle_club_chair_02', ['price'] = 135, ['label'] = '俱樂部椅子 02' },
					{ ['object'] = 'ba_prop_battle_club_chair_03', ['price'] = 175, ['label'] = '俱樂部椅子 03' }
				}
			},
			{
				['object'] = 'apa_mp_h_stn_chairstrip_01',
				['price'] = 170,
				['label'] = '椅子條',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_stn_chairstrip_01',   ['price'] = 170, ['label'] = '椅子條 STN 01' },
					{ ['object'] = 'apa_mp_h_stn_chairstrip_02',   ['price'] = 170, ['label'] = '椅子條 STN 02' },
					{ ['object'] = 'apa_mp_h_stn_chairstrip_03',   ['price'] = 170, ['label'] = '椅子條 STN 03' },
					{ ['object'] = 'apa_mp_h_stn_chairstrip_04',   ['price'] = 170, ['label'] = '椅子條 STN 04' },
					{ ['object'] = 'apa_mp_h_stn_chairstrip_05',   ['price'] = 170, ['label'] = '椅子條 STN 05' },
					{ ['object'] = 'apa_mp_h_stn_chairstrip_07',   ['price'] = 170, ['label'] = '椅子條 STN 07' },
					{ ['object'] = 'apa_mp_h_stn_chairstrip_08',   ['price'] = 170, ['label'] = '椅子條 STN 08' },
					{ ['object'] = 'bkr_prop_biker_chairstrip_01', ['price'] = 120, ['label'] = '椅子條 Biker 01' },
					{ ['object'] = 'bkr_prop_biker_chairstrip_02', ['price'] = 80,  ['label'] = '椅子條 Biker 02' },
					{ ['object'] = 'ex_mp_h_off_chairstrip_01',    ['price'] = 170, ['label'] = '椅子條 01' }
				}
			},
			{
				['object'] = 'ex_prop_offchair_exec_01',
				['price'] = 185,
				['label'] = '辦公椅',
				['group_items'] = {
					{ ['object'] = 'ex_prop_offchair_exec_01',        ['price'] = 185, ['label'] = '辦公椅 01' },
					{ ['object'] = 'bkr_prop_clubhouse_offchair_01a', ['price'] = 25,  ['label'] = '辦公椅 01a' },
					{ ['object'] = 'ex_prop_offchair_exec_02',        ['price'] = 185, ['label'] = '辦公椅 02' },
					{ ['object'] = 'ex_prop_offchair_exec_03',        ['price'] = 185, ['label'] = '辦公椅 03' },
					{ ['object'] = 'ex_prop_offchair_exec_04',        ['price'] = 185, ['label'] = '辦公椅 04' },
					{ ['object'] = 'imp_prop_impexp_offchair_01a',    ['price'] = 185, ['label'] = '辦公椅 Impexp 01a' },
					{ ['object'] = 'p_soloffchair_s',                 ['price'] = 185, ['label'] = '辦公椅 S' }
				}
			},
			{
				['object'] = 'prop_chair_01a',
				['price'] = 125,
				['label'] = '道具椅',
				['group_items'] = {
					{ ['object'] = 'prop_chair_01a',     ['price'] = 125, ['label'] = '道具椅 01a' },
					{ ['object'] = 'prop_chair_01b',     ['price'] = 125, ['label'] = '道具椅 01b' },
					{ ['object'] = 'prop_chair_02',      ['price'] = 125, ['label'] = '道具椅 02' },
					{ ['object'] = 'prop_chair_03',      ['price'] = 125, ['label'] = '道具椅 03' },
					{ ['object'] = 'prop_chair_04a',     ['price'] = 125, ['label'] = '道具椅 04a' },
					{ ['object'] = 'prop_chair_04b',     ['price'] = 125, ['label'] = '道具椅 04b' },
					{ ['object'] = 'prop_chair_05',      ['price'] = 125, ['label'] = '道具椅 05' },
					{ ['object'] = 'prop_chair_06',      ['price'] = 125, ['label'] = '道具椅 06' },
					{ ['object'] = 'prop_chair_07',      ['price'] = 125, ['label'] = '道具椅 07' },
					{ ['object'] = 'prop_chair_08',      ['price'] = 125, ['label'] = '道具椅 08' },
					{ ['object'] = 'prop_chair_09',      ['price'] = 125, ['label'] = '道具椅 09' },
					{ ['object'] = 'prop_chair_10',      ['price'] = 125, ['label'] = '道具椅 10' },
					{ ['object'] = 'prop_chair_pile_01', ['price'] = 125, ['label'] = '道具椅 Pile 01' }
				}
			},
			{ ['object'] = 'apa_mp_h_stn_chairstool_12',  ['price'] = 100,  ['label'] = '椅凳' },
			{ ['object'] = 'apa_mp_h_yacht_stool_01',     ['price'] = 120,  ['label'] = '遊艇凳' },
			{ ['object'] = 'ba_prop_int_edgy_stool',      ['price'] = 110,  ['label'] = '前衛的凳子' },
			{ ['object'] = 'ba_prop_int_glam_stool',      ['price'] = 110,  ['label'] = '華麗的凳子' },
			{ ['object'] = 'ex_mp_h_off_easychair_01',    ['price'] = 150,  ['label'] = '簡易的椅子' },
			{ ['object'] = 'prop_chateau_chair_01',       ['price'] = 110,  ['label'] = '高貴的椅子' },
			{ ['object'] = 'prop_clown_chair',            ['price'] = 80,   ['label'] = '小醜椅' },
			{ ['object'] = 'prop_direct_chair_01',        ['price'] = 95,   ['label'] = '主席椅子' },
			{ ['object'] = 'prop_wheelchair_01',          ['price'] = 215,  ['label'] = '輪椅' },
			{ ['object'] = 'apa_mp_h_din_stool_04',       ['price'] = 215,  ['label'] = '豪華的凳子' },
			{ ['object'] = 'gr_prop_highendchair_gr_01a', ['price'] = 1215, ['label'] = '電競椅' }
		}
	},

	['trashcans'] = {
		['label'] = '垃圾桶',
		['items'] = {
			{
				['object'] = 'prop_bin_07a',
				['price'] = 80,
				['label'] = '垃圾桶',
				['group_items'] = {
					{ ['object'] = 'prop_bin_07a', ['price'] = 80, ['label'] = '垃圾桶 07a' },
					{ ['object'] = 'prop_bin_07b', ['price'] = 80, ['label'] = '垃圾桶 07b' },
					{ ['object'] = 'prop_bin_07c', ['price'] = 80, ['label'] = '垃圾桶 07c' },
					{ ['object'] = 'prop_bin_07d', ['price'] = 80, ['label'] = '垃圾桶 07d' }
				}
			},
			{
				['object'] = 'prop_bin_08a',
				['price'] = 90,
				['label'] = '垃圾桶 08a',
				['group_items'] = {
					{ ['object'] = 'prop_bin_08a',    ['price'] = 90, ['label'] = '垃圾桶 08a' },
					{ ['object'] = 'prop_bin_08open', ['price'] = 90, ['label'] = '垃圾桶 08open' }
				}
			},
			{
				['object'] = 'prop_cs_bin_01',
				['price'] = 90,
				['label'] = '垃圾桶 01',
				['group_items'] = {
					{ ['object'] = 'prop_cs_bin_01',         ['price'] = 90, ['label'] = '垃圾桶 01' },
					{ ['object'] = 'prop_cs_bin_01_skinned', ['price'] = 90, ['label'] = '垃圾桶 01 Skinned' },
					{ ['object'] = 'prop_cs_bin_03',         ['price'] = 90, ['label'] = '垃圾桶 03' }
				}
			},
			{ ['object'] = 'hei_heist_kit_bin_01', ['price'] = 100, ['label'] = '垃圾桶 Kit' },
			{ ['object'] = 'prop_bin_03a',         ['price'] = 80,  ['label'] = '垃圾桶 03a' },
			{ ['object'] = 'prop_bin_04a',         ['price'] = 80,  ['label'] = '垃圾桶 04a' },
		}
	},

	['wardrobes'] = {
		['label'] = '儲物櫃',
		['items'] = {
			{
				['object'] = 'ch_prop_ch_service_locker_01a',
				['price'] = 200,
				['label'] = '儲物櫃服務',
				['group_items'] = {
					{ ['object'] = 'ch_prop_ch_service_locker_01a', ['price'] = 200, ['label'] = '儲物櫃服務 01a' },
					{ ['object'] = 'ch_prop_ch_service_locker_02a', ['price'] = 200, ['label'] = '儲物櫃服務 02a' },
				}
			},
			{
				['object'] = 'apa_mp_h_str_shelffloorm_02',
				['price'] = 900,
				['label'] = '巨大的貨架',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_str_shelffloorm_02', ['price'] = 200, ['label'] = '巨大的貨架 02' },
					{ ['object'] = 'apa_mp_h_str_shelffreel_01',  ['price'] = 200, ['label'] = '白色貨架' },
				}
			},
			{ ['object'] = 'bkr_prop_gunlocker_01a',     ['price'] = 160, ['label'] = '優雅的牆' },
			{ ['object'] = 'apa_mp_h_str_shelfwallm_01', ['price'] = 160, ['label'] = '架子牆' },
			{ ['object'] = 'p_cs_locker_01_s',           ['price'] = 80,  ['label'] = '儲物櫃' },
			{ ['object'] = 'v_serv_cupboard_01',         ['price'] = 160, ['label'] = '櫥櫃 01' },
		}
	},

	['mirrors'] = {
		['label'] = '鏡子',
		['items'] = {
			{ ['object'] = 'p_int_jewel_mirror', ['price'] = 280, ['label'] = '鏡子 1' },
			{ ['object'] = 'v_ret_mirror',       ['price'] = 160, ['label'] = '鏡子 2' },
		}
	},

	['lamps'] = {
		['label'] = '燈具',
		['items'] = {
			{
				['object'] = 'apa_mp_h_floorlamp_a',
				['price'] = 175,
				['label'] = '落地燈',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_floorlamp_a',           ['price'] = 175, ['label'] = '落地燈 a' },
					{ ['object'] = 'apa_mp_h_floorlamp_b',           ['price'] = 175, ['label'] = '落地燈 b' },
					{ ['object'] = 'apa_mp_h_floorlamp_c',           ['price'] = 175, ['label'] = '落地燈 c' },
					{ ['object'] = 'apa_mp_h_lit_floorlampnight_05', ['price'] = 175, ['label'] = '落地燈 05' },
					{ ['object'] = 'apa_mp_h_lit_floorlampnight_07', ['price'] = 175, ['label'] = '落地燈 07' },
					{ ['object'] = 'apa_mp_h_lit_floorlampnight_14', ['price'] = 175, ['label'] = '落地燈 14' },
					{ ['object'] = 'apa_mp_h_lit_floorlamp_01',      ['price'] = 175, ['label'] = '落地燈 01' },
					{ ['object'] = 'apa_mp_h_lit_floorlamp_02',      ['price'] = 175, ['label'] = '落地燈 02' },
					{ ['object'] = 'apa_mp_h_lit_floorlamp_05',      ['price'] = 175, ['label'] = '落地燈 05' },
					{ ['object'] = 'apa_mp_h_lit_floorlamp_06',      ['price'] = 175, ['label'] = '落地燈 06' },
					{ ['object'] = 'apa_mp_h_lit_floorlamp_10',      ['price'] = 175, ['label'] = '落地燈 10' },
					{ ['object'] = 'apa_mp_h_lit_floorlamp_13',      ['price'] = 175, ['label'] = '落地燈 13' },
					{ ['object'] = 'apa_mp_h_lit_floorlamp_17',      ['price'] = 175, ['label'] = '落地燈 17' },
					{ ['object'] = 'hei_heist_lit_floorlamp_01',     ['price'] = 175, ['label'] = '落地燈 Lit 01' },
					{ ['object'] = 'hei_heist_lit_floorlamp_02',     ['price'] = 175, ['label'] = '落地燈 Lit 02' },
					{ ['object'] = 'hei_heist_lit_floorlamp_03',     ['price'] = 175, ['label'] = '落地燈 Lit 03' },
					{ ['object'] = 'hei_heist_lit_floorlamp_04',     ['price'] = 175, ['label'] = '落地燈 Lit 04' },
				}
			},
			{
				['object'] = 'apa_mp_h_lit_lamptablenight_16',
				['price'] = 75,
				['label'] = '臺燈',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_lit_lamptablenight_16', ['price'] = 75, ['label'] = '臺燈 16' },
					{ ['object'] = 'apa_mp_h_lit_lamptablenight_24', ['price'] = 75, ['label'] = '臺燈 24' },
					{ ['object'] = 'apa_mp_h_lit_lamptable_005',     ['price'] = 75, ['label'] = '臺燈 005' },
					{ ['object'] = 'apa_mp_h_lit_lamptable_02',      ['price'] = 75, ['label'] = '臺燈 02' },
					{ ['object'] = 'apa_mp_h_lit_lamptable_09',      ['price'] = 75, ['label'] = '臺燈 09' },
					{ ['object'] = 'apa_mp_h_lit_lamptable_14',      ['price'] = 75, ['label'] = '臺燈 14' },
					{ ['object'] = 'apa_mp_h_lit_lamptable_17',      ['price'] = 75, ['label'] = '臺燈 17' },
					{ ['object'] = 'apa_mp_h_lit_lamptable_21',      ['price'] = 75, ['label'] = '臺燈 21' },
					{ ['object'] = 'hei_heist_lit_lamptable_03',     ['price'] = 75, ['label'] = '臺燈 03' },
					{ ['object'] = 'hei_heist_lit_lamptable_04',     ['price'] = 75, ['label'] = '臺燈 04' },
					{ ['object'] = 'hei_heist_lit_lamptable_06',     ['price'] = 75, ['label'] = '臺燈 06' }
				}
			},
			{
				['object'] = 'ch_prop_ch_lamp_ceiling_01a',
				['price'] = 120,
				['label'] = '吸頂燈',
				['group_items'] = {
					{ ['object'] = 'ch_prop_ch_lamp_ceiling_01a',   ['price'] = 120, ['label'] = '吸頂燈 01a' },
					{ ['object'] = 'ch_prop_ch_lamp_ceiling_04a',   ['price'] = 120, ['label'] = '吸頂燈 04a' },
					{ ['object'] = 'ch_prop_ch_lamp_ceiling_g_01a', ['price'] = 120, ['label'] = '吸頂燈 01a' },
					{ ['object'] = 'ch_prop_ch_lamp_ceiling_g_01b', ['price'] = 120, ['label'] = '吸頂燈 01b' },
					{ ['object'] = 'ch_prop_ch_lamp_ceiling_w_01a', ['price'] = 120, ['label'] = '吸頂燈 01a' },
					{ ['object'] = 'ch_prop_ch_lamp_ceiling_w_01b', ['price'] = 120, ['label'] = '吸頂燈 01b' },
					{ ['object'] = 'xm_base_cia_lamp_ceiling_02a',  ['price'] = 120, ['label'] = '吸頂燈 02a' }
				}
			},
			{
				['object'] = 'ch_prop_ch_tunnel_worklight',
				['price'] = 85,
				['label'] = '工程照明燈',
				['group_items'] = {
					{ ['object'] = 'ch_prop_ch_tunnel_worklight', ['price'] = 85, ['label'] = '燈管工程' },
					{ ['object'] = 'prop_construcionlamp_01',     ['price'] = 85, ['label'] = '隧道照明燈' },
				}
			},
			{
				['object'] = 'v_ret_fh_walllighton',
				['price'] = 120,
				['label'] = '牆燈',
				['group_items'] = {
					{ ['object'] = 'v_ret_fh_walllighton',  ['price'] = 120, ['label'] = '牆燈(開)' },
					{ ['object'] = 'v_ret_fh_walllightoff', ['price'] = 120, ['label'] = '牆燈(關)' }
				}
			},
			{
				['object'] = 'hei_heist_lit_lightpendant_01',
				['price'] = 60,
				['label'] = '燈飾吊墜 01',
				['group_items'] = {
					{ ['object'] = 'hei_heist_lit_lightpendant_01', ['price'] = 60, ['label'] = '燈飾吊墜 01' },
					{ ['object'] = 'hei_heist_lit_lightpendant_02', ['price'] = 60, ['label'] = '燈飾吊墜 02' }
				}
			},
			{
				['object'] = 'prop_wall_light_08a',
				['price'] = 60,
				['label'] = '壁燈',
				['group_items'] = {
					{ ['object'] = 'prop_wall_light_08a', ['price'] = 60,  ['label'] = '壁燈 08a' },
					{ ['object'] = 'prop_wall_light_11',  ['price'] = 130, ['label'] = '壁燈 11' },
					{ ['object'] = 'prop_wall_light_12',  ['price'] = 60,  ['label'] = '壁燈 12' },
					{ ['object'] = 'prop_wall_light_17b', ['price'] = 60,  ['label'] = '壁燈 17b' },
					{ ['object'] = 'prop_wall_light_18a', ['price'] = 60,  ['label'] = '壁燈 18a' },
				}
			},
			{
				['object'] = 'prop_beer_neon_01',
				['price'] = 490,
				['label'] = '酒吧霓虹燈',
				['group_items'] = {
					{ ['object'] = 'prop_beer_neon_01', ['price'] = 490, ['label'] = '酒吧霓虹燈 01' },
					{ ['object'] = 'prop_beer_neon_02', ['price'] = 340, ['label'] = '酒吧霓虹燈 02' },
					{ ['object'] = 'prop_beer_neon_03', ['price'] = 340, ['label'] = '酒吧霓虹燈 03' },
					{ ['object'] = 'prop_beer_neon_04', ['price'] = 340, ['label'] = '酒吧霓虹燈 04' }
				}
			},
			{
				['object'] = 'apa_mp_h_lampbulb_multiple_a',
				['price'] = 490,
				['label'] = '吸頂燈',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_lampbulb_multiple_a', ['price'] = 490, ['label'] = '吸頂燈' },
				}
			},
			{ ['object'] = 'vw_prop_casino_art_lampf_01a',   ['price'] = 150,  ['label'] = '藝術燈' },
			{ ['object'] = 'bkr_prop_fakeid_desklamp_01a',   ['price'] = 80,   ['label'] = '臺燈' },
			{ ['object'] = 'h4_prop_battle_lights_wall_l_b', ['price'] = 100,  ['label'] = '戰光牆' },
			{ ['object'] = 'v_res_tre_lightfan',             ['price'] = 220,  ['label'] = '風扇淺紅' },
			{ ['object'] = 'v_med_examlight',                ['price'] = 1300, ['label'] = '醫學檢查燈' },
			{ ['object'] = 'apa_mp_h_floor_lamp_int_08',     ['price'] = 800,  ['label'] = '立燈' },
		}
	},

	['toilets'] = {
		['label'] = '馬桶',
		['items'] = {
			{ ['object'] = 'prop_toilet_01', ['price'] = 160, ['label'] = '馬桶 01' },
			{ ['object'] = 'prop_toilet_02', ['price'] = 120, ['label'] = '馬桶 02' },
		}
	},

	['toilet-brushs'] = {
		['label'] = '馬桶刷',
		['items'] = {
			{ ['object'] = 'prop_toilet_brush_01', ['price'] = 20, ['label'] = '馬桶刷 01' }
		}
	},

	['toilet-papers'] = {
		['label'] = '衛生紙',
		['items'] = {
			{ ['object'] = 'prop_toilet_roll_01', ['price'] = 10, ['label'] = '衛生紙 01' },
			{ ['object'] = 'prop_toilet_roll_02', ['price'] = 20, ['label'] = '衛生紙 02' },
			{ ['object'] = 'prop_toilet_roll_05', ['price'] = 50, ['label'] = '衛生紙 05' },
		}
	},

	['hand-towels'] = {
		['label'] = '手巾',
		['items'] = {
			{ ['object'] = 'prop_beach_towel_01',   ['price'] = 10,  ['label'] = '手巾' },
			{ ['object'] = 'prop_beach_towel_02',   ['price'] = 10,  ['label'] = '手巾' },
			{ ['object'] = 'prop_beach_towel_03',   ['price'] = 10,  ['label'] = '手巾' },
			{ ['object'] = 'prop_beach_towel_04',   ['price'] = 10,  ['label'] = '手巾' },
			{ ['object'] = 'prop_cs_beachtowel_01', ['price'] = 15,  ['label'] = '手巾' },
			{ ['object'] = 'prop_ftowel_01',        ['price'] = 10,  ['label'] = '手巾' },
			{ ['object'] = 'prop_ftowel_07',        ['price'] = 50,  ['label'] = '手巾' },
			{ ['object'] = 'prop_ftowel_08',        ['price'] = 50,  ['label'] = '手巾' },
			{ ['object'] = 'prop_ftowel_10',        ['price'] = 50,  ['label'] = '手巾' },
			{ ['object'] = 'prop_tint_towel',       ['price'] = 15,  ['label'] = '手巾' },
			{ ['object'] = 'prop_tint_towels_01',   ['price'] = 120, ['label'] = '手巾' },
			{ ['object'] = 'prop_tint_towels_01b',  ['price'] = 120, ['label'] = '手巾' },
			{ ['object'] = 'prop_towel2_01',        ['price'] = 15,  ['label'] = '手巾' },
			{ ['object'] = 'prop_towel2_02',        ['price'] = 15,  ['label'] = '手巾' },
			{ ['object'] = 'prop_towel_01',         ['price'] = 25,  ['label'] = '手巾' },
			{ ['object'] = 'prop_towel_rail_01',    ['price'] = 50,  ['label'] = '手巾' },
			{ ['object'] = 'prop_towel_rail_02',    ['price'] = 50,  ['label'] = '手巾' },
			{ ['object'] = 'prop_towel_shelf_01',   ['price'] = 250, ['label'] = '手巾' },
			{ ['object'] = 'p_shower_towel_s',      ['price'] = 20,  ['label'] = '手巾' },
			{ ['object'] = 'v_res_mbtowel',         ['price'] = 20,  ['label'] = '手巾' },
			{ ['object'] = 'v_res_mbtowelfld',      ['price'] = 25,  ['label'] = '手巾' }
		}
	},

	['showers'] = {
		['label'] = '淋浴',
		['items'] = {
			{ ['object'] = 'apa_mp_h_bathtub_01', ['price'] = 590, ['label'] = '淋浴' },
		}
	},

	['sideboards'] = {
		['label'] = '餐邊櫃',
		['items'] = {
			{
				['object'] = 'apa_mp_h_str_sideboardl_06',
				['price'] = 620,
				['label'] = '優雅的餐邊櫃',
				['group_items'] = {
					{ ['object'] = 'apa_mp_h_str_sideboardl_06', ['price'] = 620, ['label'] = '餐邊櫃 06' },
					{ ['object'] = 'apa_mp_h_str_sideboardm_03', ['price'] = 560, ['label'] = '餐邊櫃 03' },
					{ ['object'] = 'apa_mp_h_str_sideboardl_09', ['price'] = 420, ['label'] = '餐邊櫃 09' },
				}
			},
			{
				['object'] = 'ex_prop_ex_toolchest_01',
				['price'] = 620,
				['label'] = '工具櫃',
				['group_items'] = {
					{ ['object'] = 'ex_prop_ex_toolchest_01',   ['price'] = 450, ['label'] = '工具箱 01' },
					{ ['object'] = 'gr_prop_gr_tool_chest_01a', ['price'] = 450, ['label'] = '工具箱 01a' },
					{ ['object'] = 'gr_prop_gr_tool_draw_01a',  ['price'] = 450, ['label'] = '工具箱 01a' },
					{ ['object'] = 'gr_prop_gr_tool_draw_01b',  ['price'] = 450, ['label'] = '工具箱 01b' },
					{ ['object'] = 'gr_prop_gr_tool_draw_01d',  ['price'] = 450, ['label'] = '工具箱 01d' },
				}
			},
			{ ['object'] = 'apa_mp_h_bed_chestdrawer_02',  ['price'] = 250, ['label'] = '餐邊櫃' },
			{ ['object'] = 'apa_mp_h_str_sideboardl_14',   ['price'] = 350, ['label'] = '餐邊櫃 14' },
			{ ['object'] = 'apa_mp_h_str_sideboardl_13',   ['price'] = 450, ['label'] = '餐邊櫃 13' },
			{ ['object'] = 'apa_mp_h_str_sideboardm_02',   ['price'] = 450, ['label'] = '餐邊櫃 Oak' },
			{ ['object'] = 'apa_mp_h_str_sideboards_02',   ['price'] = 450, ['label'] = '餐邊櫃 Crystal' },
			{ ['object'] = 'hei_heist_bed_chestdrawer_04', ['price'] = 450, ['label'] = '餐邊櫃 Roble' },
			{ ['object'] = 'hei_heist_str_sideboardl_04',  ['price'] = 550, ['label'] = '餐邊櫃 04' },
			{ ['object'] = 'hei_heist_str_sideboardl_02',  ['price'] = 250, ['label'] = '餐邊櫃 02' },
			{ ['object'] = 'p_v_43_safe_s',                ['price'] = 750, ['label'] = '舒適櫃 43' },
		}
	},

	['decals'] = {
		['label'] = '貼花',
		['items'] = {
			{
				['object'] = 'vw_prop_vw_colle_pogo',
				['price'] = 120,
				['label'] = '收藏人物',
				['group_items'] = {
					{ ['object'] = 'vw_prop_vw_colle_pogo',       ['price'] = 120, ['label'] = '太空猴子' },
					{ ['object'] = 'vw_prop_vw_colle_alien',      ['price'] = 120, ['label'] = '艾倫' },
					{ ['object'] = 'vw_prop_vw_colle_imporage',   ['price'] = 120, ['label'] = '憤怒小鳥' },
					{ ['object'] = 'vw_prop_vw_colle_prbubble',   ['price'] = 120, ['label'] = 'Princess Bubblegum' },
					{ ['object'] = 'vw_prop_vw_colle_rsrcomm',    ['price'] = 120, ['label'] = 'Space Ranger Commander' },
					{ ['object'] = 'vw_prop_vw_colle_rsrgeneric', ['price'] = 120, ['label'] = 'Space Ranger' },
					{ ['object'] = 'vw_prop_vw_colle_beast',      ['price'] = 120, ['label'] = 'Beast' },
					{ ['object'] = 'vw_prop_vw_colle_sasquatch',  ['price'] = 120, ['label'] = 'Sasquatch' }
				}
			},
			{
				['object'] = 'v_res_tissues',
				['price'] = 25,
				['label'] = '紙巾',
				['group_items'] = {
					{ ['object'] = 'v_res_tissues',    ['price'] = 25, ['label'] = '紙巾' },
					{ ['object'] = 'v_res_tt_tissues', ['price'] = 25, ['label'] = '紙巾 TT' }
				}
			},
			{
				['object'] = 'prop_cs_stock_book',
				['price'] = 10,
				['label'] = '書本',
				['group_items'] = {
					{ ['object'] = 'prop_cs_stock_book',     ['price'] = 10, ['label'] = '書本 Cs Stock' },
					{ ['object'] = 'vw_prop_book_stack_01a', ['price'] = 25, ['label'] = '書本 01a' },
					{ ['object'] = 'vw_prop_book_stack_01b', ['price'] = 25, ['label'] = '書本 01b' },
					{ ['object'] = 'vw_prop_book_stack_01c', ['price'] = 25, ['label'] = '書本 01c' },
					{ ['object'] = 'vw_prop_book_stack_02a', ['price'] = 25, ['label'] = '書本 02a' },
					{ ['object'] = 'vw_prop_book_stack_02b', ['price'] = 25, ['label'] = '書本 02b' },
					{ ['object'] = 'vw_prop_book_stack_02c', ['price'] = 25, ['label'] = '書本 02c' },
					{ ['object'] = 'vw_prop_book_stack_03a', ['price'] = 25, ['label'] = '書本 03a' },
					{ ['object'] = 'vw_prop_book_stack_03b', ['price'] = 25, ['label'] = '書本 03b' },
					{ ['object'] = 'vw_prop_book_stack_03c', ['price'] = 25, ['label'] = '書本 03c' }
				}
			},
			{
				['object'] = 'prop_acc_guitar_01',
				['price'] = 120,
				['label'] = '吉他',
				['group_items'] = {
					{ ['object'] = 'prop_acc_guitar_01',            ['price'] = 120, ['label'] = '吉他 ACC 01' },
					{ ['object'] = 'prop_el_guitar_01',             ['price'] = 280, ['label'] = '吉他 EL 01' },
					{ ['object'] = 'prop_el_guitar_02',             ['price'] = 280, ['label'] = '吉他 EL 02' },
					{ ['object'] = 'prop_el_guitar_03',             ['price'] = 280, ['label'] = '吉他 EL 03' },
					{ ['object'] = 'vw_prop_casino_art_guitar_01a', ['price'] = 280, ['label'] = '吉他 Art' },
				}
			},
			{
				['object'] = 'v_res_fa_candle02',
				['price'] = 10,
				['label'] = '蠟燭',
				['group_items'] = {
					{ ['object'] = 'v_res_fa_candle02',       ['price'] = 10, ['label'] = '蠟燭 FA 02' },
					{ ['object'] = 'v_res_fa_candle03',       ['price'] = 10, ['label'] = '蠟燭 FA 03' },
					{ ['object'] = 'v_res_fa_candle04',       ['price'] = 10, ['label'] = '蠟燭 FA 04' },
					{ ['object'] = 'v_prop_floatcandle',      ['price'] = 15, ['label'] = '蠟燭 Float' },
					{ ['object'] = 'apa_mp_h_acc_candles_01', ['price'] = 20, ['label'] = '蠟燭 ACC 01' },
					{ ['object'] = 'apa_mp_h_acc_candles_02', ['price'] = 65, ['label'] = '蠟燭 ACC 02' },
					{ ['object'] = 'apa_mp_h_acc_candles_04', ['price'] = 20, ['label'] = '蠟燭 ACC 04' },
					{ ['object'] = 'apa_mp_h_acc_candles_05', ['price'] = 15, ['label'] = '蠟燭 ACC 05' },
					{ ['object'] = 'apa_mp_h_acc_candles_06', ['price'] = 25, ['label'] = '蠟燭 ACC 06' }
				}
			},
			{
				['object'] = 'v_ret_ml_chips1',
				['price'] = 10,
				['label'] = '薯片',
				['group_items'] = {
					{ ['object'] = 'v_ret_ml_chips1', ['price'] = 10, ['label'] = '薯片 1' },
					{ ['object'] = 'v_ret_ml_chips2', ['price'] = 10, ['label'] = '薯片 2' },
					{ ['object'] = 'v_ret_ml_chips3', ['price'] = 10, ['label'] = '薯片 3' },
					{ ['object'] = 'v_ret_ml_chips4', ['price'] = 10, ['label'] = '薯片 4' }
				}
			},
			{
				['object'] = 'v_res_tt_cigs01',
				['price'] = 10,
				['label'] = '香煙',
				['group_items'] = {
					{ ['object'] = 'v_res_tt_cigs01',         ['price'] = 10, ['label'] = '香煙 01' },
					{ ['object'] = 'p_cs_lighter_01',         ['price'] = 5,  ['label'] = '打火機 CS' },
					{ ['object'] = 'v_res_tt_lighter',        ['price'] = 10, ['label'] = '打火機 TT' },
					{ ['object'] = 'ex_prop_exec_lighter_01', ['price'] = 10, ['label'] = '打火機 01' },
					{ ['object'] = 'lux_prop_lighter_luxe',   ['price'] = 20, ['label'] = '打火機 Lux' },
					{ ['object'] = 'v_res_mp_ashtraya',       ['price'] = 10, ['label'] = '煙灰缸1' },
					{ ['object'] = 'v_res_mp_ashtrayb',       ['price'] = 10, ['label'] = '煙灰缸2' },
					{ ['object'] = 'v_ret_fh_ashtray',        ['price'] = 10, ['label'] = '煙灰缸3' },
					{ ['object'] = 'prop_fib_ashtray_01',     ['price'] = 10, ['label'] = '煙灰缸4' },
					{ ['object'] = 'ex_prop_exec_ashtray_01', ['price'] = 20, ['label'] = '煙灰缸5' },
					{ ['object'] = 'v_ret_ml_cigs',           ['price'] = 10, ['label'] = '香煙' },
					{ ['object'] = 'v_ret_ml_cigs2',          ['price'] = 10, ['label'] = '香煙 2' },
					{ ['object'] = 'v_ret_ml_cigs3',          ['price'] = 10, ['label'] = '香煙 3' },
					{ ['object'] = 'v_ret_ml_cigs4',          ['price'] = 10, ['label'] = '香煙 4' },
					{ ['object'] = 'v_ret_ml_cigs5',          ['price'] = 10, ['label'] = '香煙 5' },
					{ ['object'] = 'v_ret_ml_cigs6',          ['price'] = 10, ['label'] = '香煙 6' },
					{ ['object'] = 'prop_bong_01',            ['price'] = 80, ['label'] = 'Bong 01' },
				}
			},
			{
				['object'] = 'prop_anim_cash_note',
				['price'] = 10,
				['label'] = '金錢',
				['group_items'] = {
					{ ['object'] = 'prop_anim_cash_note',           ['price'] = 10,  ['label'] = '現金票據' },
					{ ['object'] = 'prop_anim_cash_pile_01',        ['price'] = 10,  ['label'] = '現金堆 01' },
					{ ['object'] = 'prop_anim_cash_pile_02',        ['price'] = 10,  ['label'] = '現金堆 02' },
					{ ['object'] = 'prop_cash_case_01',             ['price'] = 50,  ['label'] = '現金箱 01' },
					{ ['object'] = 'prop_cash_case_02',             ['price'] = 50,  ['label'] = '現金箱 02' },
					{ ['object'] = 'bkr_prop_bkr_cash_roll_01',     ['price'] = 80,  ['label'] = '現金卷 01' },
					{ ['object'] = 'bkr_prop_bkr_cash_scatter_01',  ['price'] = 20,  ['label'] = '現金分散 01' },
					{ ['object'] = 'bkr_prop_bkr_cash_scatter_03',  ['price'] = 20,  ['label'] = '現金分散 03' },
					{ ['object'] = 'bkr_prop_bkr_cashpile_01',      ['price'] = 80,  ['label'] = '現金BKR堆 01' },
					{ ['object'] = 'bkr_prop_bkr_cashpile_02',      ['price'] = 80,  ['label'] = '現金BKR堆 02' },
					{ ['object'] = 'bkr_prop_bkr_cashpile_03',      ['price'] = 80,  ['label'] = '現金BKR堆 03' },
					{ ['object'] = 'bkr_prop_bkr_cashpile_05',      ['price'] = 80,  ['label'] = '現金BKR堆 05' },
					{ ['object'] = 'bkr_prop_bkr_cashpile_06',      ['price'] = 80,  ['label'] = '現金BKR堆 06' },
					{ ['object'] = 'ex_prop_exec_cashpile',         ['price'] = 80,  ['label'] = '現金堆' },
					{ ['object'] = 'hei_prop_cash_crate_half_full', ['price'] = 80,  ['label'] = '現金箱 半滿' },
					{ ['object'] = 'ch_prop_ch_cashtrolley_01a',    ['price'] = 140, ['label'] = '現金車 01a' },
					{ ['object'] = 'h4_prop_h4_cash_bag_01a',       ['price'] = 80,  ['label'] = '現金背包 01a' },
					{ ['object'] = 'h4_prop_h4_cash_stack_01a',     ['price'] = 80,  ['label'] = '現金儲備 01a' },
					{ ['object'] = 'h4_prop_h4_cash_stack_02a',     ['price'] = 80,  ['label'] = '現金堆棧 02a' },
					{ ['object'] = 'bkr_prop_money_pokerbucket',    ['price'] = 80,  ['label'] = '現金撲克桶' },
					{ ['object'] = 'bkr_prop_moneypack_01a',        ['price'] = 80,  ['label'] = '現金撲克桶 01a' },
					{ ['object'] = 'bkr_prop_moneypack_02a',        ['price'] = 80,  ['label'] = '現金 02a' },
					{ ['object'] = 'bkr_prop_moneypack_03a',        ['price'] = 80,  ['label'] = '現金 03a' },
					{ ['object'] = 'ex_prop_crate_money_bc',        ['price'] = 580, ['label'] = '現金 BC' },
					{ ['object'] = 'ex_prop_crate_money_sc',        ['price'] = 580, ['label'] = '現金 SC' }
				}
			},
			{
				['object'] = 'prop_weed_01',
				['price'] = 50,
				['label'] = '藥品',
				['group_items'] = {
					{ ['object'] = 'prop_weed_01',                     ['price'] = 50,  ['label'] = '藥品 01' },
					{ ['object'] = 'prop_weed_02',                     ['price'] = 50,  ['label'] = '藥品 02' },
					{ ['object'] = 'prop_weed_block_01',               ['price'] = 50,  ['label'] = '藥品 塊 01' },
					{ ['object'] = 'prop_weed_bottle',                 ['price'] = 50,  ['label'] = '藥品 瓶子' },
					{ ['object'] = 'prop_weed_pallet',                 ['price'] = 350, ['label'] = '藥品 托盤' },
					{ ['object'] = 'h4_prop_h4_weed_stack_01a',        ['price'] = 150, ['label'] = '藥品 堆放 01a' },
					{ ['object'] = 'bkr_prop_weed_table_01a',          ['price'] = 320, ['label'] = '藥品 桌子 01a' },
					{ ['object'] = 'bkr_prop_weed_spray_01a',          ['price'] = 10,  ['label'] = '藥品 噴霧 01a' },
					{ ['object'] = 'bkr_prop_weed_scales_01b',         ['price'] = 50,  ['label'] = '藥品 秤 01b' },
					{ ['object'] = 'bkr_prop_weed_scales_01a',         ['price'] = 50,  ['label'] = '藥品 秤 01a' },
					{ ['object'] = 'bkr_prop_weed_plantpot_stack_01c', ['price'] = 50,  ['label'] = '藥品 鍋堆 01c' },
					{ ['object'] = 'bkr_prop_weed_plantpot_stack_01b', ['price'] = 50,  ['label'] = '藥品 鍋堆 01b' },
					{ ['object'] = 'bkr_prop_weed_plantpot_stack_01a', ['price'] = 50,  ['label'] = '藥品 鍋堆 01a' },
					{ ['object'] = 'bkr_prop_weed_med_01b',            ['price'] = 50,  ['label'] = '藥品 MED 01b' },
					{ ['object'] = 'bkr_prop_weed_med_01a',            ['price'] = 50,  ['label'] = '藥品 MED 01a' },
					{ ['object'] = 'bkr_prop_weed_lrg_01b',            ['price'] = 50,  ['label'] = '藥品 LRG 01b' },
					{ ['object'] = 'bkr_prop_weed_lrg_01a',            ['price'] = 50,  ['label'] = '藥品 LRG 01a' },
					{ ['object'] = 'bkr_prop_weed_fan_floor_01a',      ['price'] = 50,  ['label'] = '藥品 落地扇 01a' },
					{ ['object'] = 'bkr_prop_weed_fan_ceiling_01a',    ['price'] = 50,  ['label'] = '藥品 Ceiling Fan 01a' },
					{ ['object'] = 'bkr_prop_weed_drying_02a',         ['price'] = 50,  ['label'] = '藥品 02a' },
					{ ['object'] = 'bkr_prop_weed_drying_01a',         ['price'] = 50,  ['label'] = '藥品 01a' },
					{ ['object'] = 'bkr_prop_weed_dry_02b',            ['price'] = 50,  ['label'] = '藥品 幹燥 02b' },
					{ ['object'] = 'bkr_prop_weed_dry_02a',            ['price'] = 50,  ['label'] = '藥品 幹燥 02a' },
					{ ['object'] = 'bkr_prop_weed_dry_01a',            ['price'] = 50,  ['label'] = '藥品 幹燥 01a' },
					{ ['object'] = 'bkr_prop_weed_bud_01a',            ['price'] = 50,  ['label'] = '藥品 芽 01a' },
					{ ['object'] = 'bkr_prop_weed_bud_01b',            ['price'] = 50,  ['label'] = '藥品 芽 01b' },
					{ ['object'] = 'bkr_prop_weed_bud_02a',            ['price'] = 50,  ['label'] = '藥品 芽 02a' },
					{ ['object'] = 'bkr_prop_weed_bud_02b',            ['price'] = 50,  ['label'] = '藥品 芽 02b' },
					{ ['object'] = 'bkr_prop_weed_bucket_open_01a',    ['price'] = 50,  ['label'] = '藥品 桶裝 Open 01a' },
					{ ['object'] = 'bkr_prop_weed_bigbag_open_01a',    ['price'] = 50,  ['label'] = '藥品 大袋子 Open 01a' },
					{ ['object'] = 'bkr_prop_weed_bigbag_03a',         ['price'] = 50,  ['label'] = '藥品 大袋子 03a' },
					{ ['object'] = 'bkr_prop_weed_bigbag_02a',         ['price'] = 50,  ['label'] = '藥品 大袋子 02a' },
					{ ['object'] = 'bkr_prop_weed_bigbag_01a',         ['price'] = 50,  ['label'] = '藥品 大袋子 01a' },
					{ ['object'] = 'bkr_prop_weed_01_small_01c',       ['price'] = 50,  ['label'] = '藥品 小號 01c' },
					{ ['object'] = 'bkr_prop_weed_01_small_01b',       ['price'] = 50,  ['label'] = '藥品 小號 01b' },
					{ ['object'] = 'bkr_prop_weed_01_small_01a',       ['price'] = 50,  ['label'] = '藥品 小號 01a' },
				}
			},
			{
				['object'] = 'bkr_prop_meth_acetone',
				['price'] = 50,
				['label'] = '冰毒',
				['group_items'] = {
					{ ['object'] = 'bkr_prop_meth_acetone',              ['price'] = 50,  ['label'] = '冰毒 丙酮' },
					{ ['object'] = 'bkr_prop_meth_ammonia',              ['price'] = 50,  ['label'] = '冰毒 氨' },
					{ ['object'] = 'bkr_prop_meth_hcacid',               ['price'] = 50,  ['label'] = '冰毒 赫卡酸' },
					{ ['object'] = 'bkr_prop_meth_lithium',              ['price'] = 50,  ['label'] = '冰毒 鋰' },
					{ ['object'] = 'bkr_prop_meth_openbag_01a',          ['price'] = 50,  ['label'] = '冰毒 開袋' },
					{ ['object'] = 'bkr_prop_meth_phosphorus',           ['price'] = 50,  ['label'] = '冰毒 磷' },
					{ ['object'] = 'bkr_prop_meth_sacid',                ['price'] = 50,  ['label'] = '冰毒 Sacid' },
					{ ['object'] = 'bkr_prop_meth_scoop_01a',            ['price'] = 50,  ['label'] = '冰毒 勺子 01a' },
					{ ['object'] = 'bkr_prop_meth_smallbag_01a',         ['price'] = 50,  ['label'] = '冰毒 小袋子 01a' },
					{ ['object'] = 'bkr_prop_meth_smashedtray_01',       ['price'] = 50,  ['label'] = '冰毒 砸碎的托盤 01a' },
					{ ['object'] = 'bkr_prop_meth_smashedtray_01_frag_', ['price'] = 50,  ['label'] = '冰毒 砸碎的托盤 01 Frag' },
					{ ['object'] = 'bkr_prop_meth_smashedtray_02',       ['price'] = 50,  ['label'] = '冰毒 砸碎的托盤 02' },
					{ ['object'] = 'bkr_prop_meth_sodium',               ['price'] = 50,  ['label'] = '冰毒 鈉' },
					{ ['object'] = 'bkr_prop_meth_table01a',             ['price'] = 320, ['label'] = '冰毒 桌子 01a' },
					{ ['object'] = 'bkr_prop_meth_toulene',              ['price'] = 50,  ['label'] = '冰毒 甲苯' },
					{ ['object'] = 'bkr_prop_meth_tray_01a',             ['price'] = 50,  ['label'] = '冰毒 托盤 01a' },
					{ ['object'] = 'bkr_prop_meth_tray_01b',             ['price'] = 50,  ['label'] = '冰毒 托盤 01b' },
					{ ['object'] = 'bkr_prop_meth_tray_02a',             ['price'] = 50,  ['label'] = '冰毒 托盤 02a' }
				}
			},
			{
				['object'] = 'prop_coke_block_01',
				['price'] = 50,
				['label'] = '可樂',
				['group_items'] = {
					{ ['object'] = 'prop_coke_block_01',             ['price'] = 50, ['label'] = '焦塊 01' },
					{ ['object'] = 'prop_coke_block_half_a',         ['price'] = 50, ['label'] = '可樂 塊半 a' },
					{ ['object'] = 'prop_coke_block_half_b',         ['price'] = 50, ['label'] = '可樂 塊半 B' },
					{ ['object'] = 'ba_prop_battle_coke_block_01a',  ['price'] = 50, ['label'] = '可樂 Block 01a' },
					{ ['object'] = 'bkr_prop_coke_bakingsoda',       ['price'] = 50, ['label'] = '可樂 小碳粉' },
					{ ['object'] = 'bkr_prop_coke_bakingsoda_o',     ['price'] = 50, ['label'] = '可樂 小碳粉 Open' },
					{ ['object'] = 'bkr_prop_coke_bottle_01a',       ['price'] = 50, ['label'] = '可樂 瓶子 01a' },
					{ ['object'] = 'bkr_prop_coke_box_01a',          ['price'] = 50, ['label'] = '可樂 箱子 01a' },
					{ ['object'] = 'bkr_prop_coke_cracktray_01',     ['price'] = 50, ['label'] = '可樂 裂紋嘗試 01' },
					{ ['object'] = 'bkr_prop_coke_cut_01',           ['price'] = 50, ['label'] = '可樂 剪切 01' },
					{ ['object'] = 'bkr_prop_coke_cut_02',           ['price'] = 50, ['label'] = '可樂 剪切 02' },
					{ ['object'] = 'bkr_prop_coke_cutblock_01',      ['price'] = 50, ['label'] = '可樂 剪切 01' },
					{ ['object'] = 'bkr_prop_coke_dehydrator_01',    ['price'] = 50, ['label'] = '可樂 去回轉儀 01' },
					{ ['object'] = 'bkr_prop_coke_fullmetalbowl_02', ['price'] = 50, ['label'] = '可樂 全金屬缽 02' },
					{ ['object'] = 'bkr_prop_coke_fullscoop_01a',    ['price'] = 50, ['label'] = '可樂 全勺 01a' },
					{ ['object'] = 'bkr_prop_coke_fullsieve_01a',    ['price'] = 50, ['label'] = '可樂 全勺 01a' },
					{ ['object'] = 'bkr_prop_coke_metalbowl_01',     ['price'] = 50, ['label'] = '可樂 金屬缽 01' },
					{ ['object'] = 'bkr_prop_coke_metalbowl_02',     ['price'] = 50, ['label'] = '可樂 金屬缽 02' },
					{ ['object'] = 'bkr_prop_coke_metalbowl_03',     ['price'] = 50, ['label'] = '可樂 金屬缽 03' },
					{ ['object'] = 'bkr_prop_coke_mixer_01',         ['price'] = 50, ['label'] = '可樂 攪拌機 01' },
					{ ['object'] = 'bkr_prop_coke_mold_01a',         ['price'] = 50, ['label'] = '可樂 模具 01a' },
					{ ['object'] = 'bkr_prop_coke_mold_02a',         ['price'] = 50, ['label'] = '可樂 模具 02a' },
					{ ['object'] = 'bkr_prop_coke_mortalpestle',     ['price'] = 50, ['label'] = '可樂 死亡杵' },
					{ ['object'] = 'bkr_prop_coke_painkiller_01a',   ['price'] = 50, ['label'] = '可樂 止痛劑 01a' },
					{ ['object'] = 'bkr_prop_coke_plasticbowl_01',   ['price'] = 50, ['label'] = '可樂 塑料盆 01' },
					{ ['object'] = 'bkr_prop_coke_powder_01',        ['price'] = 50, ['label'] = '可樂 啓動 01' },
					{ ['object'] = 'bkr_prop_coke_powderbottle_01',  ['price'] = 50, ['label'] = '可樂 粉末瓶 01' },
					{ ['object'] = 'bkr_prop_coke_powderbottle_02',  ['price'] = 50, ['label'] = '可樂 粉末瓶 02' },
					{ ['object'] = 'bkr_prop_coke_powderedmilk',     ['price'] = 50, ['label'] = '可樂 奶粉' },
					{ ['object'] = 'bkr_prop_coke_powderedmilk_o',   ['price'] = 50, ['label'] = '可樂 奶粉 Open' },
					{ ['object'] = 'bkr_prop_coke_press_01aa',       ['price'] = 50, ['label'] = '可樂 報刊 01aa' },
					{ ['object'] = 'bkr_prop_coke_press_01b',        ['price'] = 50, ['label'] = '可樂 報刊 01b' },
					{ ['object'] = 'bkr_prop_coke_scale_01',         ['price'] = 50, ['label'] = '可樂 比例 01' },
					{ ['object'] = 'bkr_prop_coke_scale_02',         ['price'] = 50, ['label'] = '可樂 比例 02' },
					{ ['object'] = 'bkr_prop_coke_scale_03',         ['price'] = 50, ['label'] = '可樂 比例 03' },
					{ ['object'] = 'bkr_prop_coke_spatula_04',       ['price'] = 50, ['label'] = '可樂 鏟子 04' },
					{ ['object'] = 'bkr_prop_coke_spoon_01',         ['price'] = 50, ['label'] = '可樂 勺子 01' },
					{ ['object'] = 'bkr_prop_coke_testtubes',        ['price'] = 50, ['label'] = '可樂 檢測管' },
					{ ['object'] = 'bkr_prop_coke_tin_01',           ['price'] = 50, ['label'] = '可樂 信仰 01' },
					{ ['object'] = 'bkr_prop_coke_tub_01a',          ['price'] = 50, ['label'] = '可樂 管材 01a' },
					{ ['object'] = 'bkr_prop_coke_tube_01',          ['price'] = 50, ['label'] = '可樂 管材 01' },
					{ ['object'] = 'bkr_prop_coke_tube_02',          ['price'] = 50, ['label'] = '可樂 管材 02' },
					{ ['object'] = 'bkr_prop_coke_tube_03',          ['price'] = 50, ['label'] = '可樂 管材 03' }
				}
			},
			{
				['object'] = 'vw_prop_casino_art_bird_01a',
				['price'] = 240,
				['label'] = '賭場元素',
				['group_items'] = {
					{ ['object'] = 'vw_prop_casino_art_bird_01a',       ['price'] = 240,  ['label'] = '賭場元素	鳥 01a' },
					{ ['object'] = 'vw_prop_casino_art_car_01a',        ['price'] = 200,  ['label'] = '賭場元素	汽車 01a' },
					{ ['object'] = 'vw_prop_casino_art_car_02a',        ['price'] = 200,  ['label'] = '賭場元素	汽車 02a' },
					{ ['object'] = 'vw_prop_casino_art_car_03a',        ['price'] = 200,  ['label'] = '賭場元素	汽車 03a' },
					{ ['object'] = 'vw_prop_casino_art_car_04a',        ['price'] = 200,  ['label'] = '賭場元素	汽車 04a' },
					{ ['object'] = 'vw_prop_casino_art_car_05a',        ['price'] = 200,  ['label'] = '賭場元素	汽車 05a' },
					{ ['object'] = 'vw_prop_casino_art_car_06a',        ['price'] = 200,  ['label'] = '賭場元素	汽車 06a' },
					{ ['object'] = 'vw_prop_casino_art_car_07a',        ['price'] = 200,  ['label'] = '賭場元素	汽車 07a' },
					{ ['object'] = 'vw_prop_casino_art_car_08a',        ['price'] = 200,  ['label'] = '賭場元素	汽車 08a' },
					{ ['object'] = 'vw_prop_casino_art_car_09a',        ['price'] = 200,  ['label'] = '賭場元素	汽車 09a' },
					{ ['object'] = 'vw_prop_casino_art_car_10a',        ['price'] = 200,  ['label'] = '賭場元素	汽車 10a' },
					{ ['object'] = 'vw_prop_casino_art_car_11a',        ['price'] = 200,  ['label'] = '賭場元素	汽車 11a' },
					{ ['object'] = 'vw_prop_casino_art_car_12a',        ['price'] = 200,  ['label'] = '賭場元素	汽車 12a' },
					{ ['object'] = 'vw_prop_casino_art_cherries_01a',   ['price'] = 1850, ['label'] = '賭場元素	櫻桃01a' },
					{ ['object'] = 'vw_prop_casino_art_deer_01a',       ['price'] = 1200, ['label'] = '賭場元素	鹿 01a' },
					{ ['object'] = 'vw_prop_casino_art_dog_01a',        ['price'] = 650,  ['label'] = '賭場元素	狗 01a' },
					{ ['object'] = 'vw_prop_casino_art_egg_01a',        ['price'] = 150,  ['label'] = '賭場元素 蛋 01a' },
					{ ['object'] = 'vw_prop_casino_art_grenade_01a',    ['price'] = 340,  ['label'] = '賭場元素 手榴彈 01a' },
					{ ['object'] = 'vw_prop_casino_art_grenade_01b',    ['price'] = 340,  ['label'] = '賭場元素 手榴彈 01b' },
					{ ['object'] = 'vw_prop_casino_art_grenade_01c',    ['price'] = 340,  ['label'] = '賭場元素 手榴彈 01c' },
					{ ['object'] = 'vw_prop_casino_art_grenade_01d',    ['price'] = 340,  ['label'] = '賭場元素 手榴彈 01d' },
					{ ['object'] = 'vw_prop_casino_art_gun_01a',        ['price'] = 2150, ['label'] = '賭場元素 槍械 01a' },
					{ ['object'] = 'vw_prop_casino_art_gun_02a',        ['price'] = 4500, ['label'] = '賭場元素 槍械 02a' },
					{ ['object'] = 'vw_prop_casino_art_head_01a',       ['price'] = 310,  ['label'] = '賭場元素 頭部 01a' },
					{ ['object'] = 'vw_prop_casino_art_head_01b',       ['price'] = 310,  ['label'] = '賭場元素 頭部 01b' },
					{ ['object'] = 'vw_prop_casino_art_head_01c',       ['price'] = 310,  ['label'] = '賭場元素 頭部 01c' },
					{ ['object'] = 'vw_prop_casino_art_head_01d',       ['price'] = 310,  ['label'] = '賭場元素 頭部 01d' },
					{ ['object'] = 'vw_prop_casino_art_lollipop_01a',   ['price'] = 1850, ['label'] = '賭場元素 棒棒糖 01a' },
					{ ['object'] = 'vw_prop_casino_art_mod_01a',        ['price'] = 1850, ['label'] = '賭場元素 模型 01a' },
					{ ['object'] = 'vw_prop_casino_art_mod_02a',        ['price'] = 350,  ['label'] = '賭場元素 模型 02a' },
					{ ['object'] = 'vw_prop_casino_art_mod_03a',        ['price'] = 1730, ['label'] = '賭場元素 模型 03a' },
					{ ['object'] = 'vw_prop_casino_art_mod_03a_a',      ['price'] = 1730, ['label'] = '賭場元素 模型 03aa' },
					{ ['object'] = 'vw_prop_casino_art_mod_03a_b',      ['price'] = 1730, ['label'] = '賭場元素 模型 03ab' },
					{ ['object'] = 'vw_prop_casino_art_mod_03a_c',      ['price'] = 1730, ['label'] = '賭場元素 模型 03ac' },
					{ ['object'] = 'vw_prop_casino_art_mod_03b',        ['price'] = 1730, ['label'] = '賭場元素 模型 03b' },
					{ ['object'] = 'vw_prop_casino_art_mod_03b_a',      ['price'] = 1730, ['label'] = '賭場元素 模型 03ba' },
					{ ['object'] = 'vw_prop_casino_art_mod_03b_b',      ['price'] = 1730, ['label'] = '賭場元素 模型 03bb' },
					{ ['object'] = 'vw_prop_casino_art_mod_03b_c',      ['price'] = 1730, ['label'] = '賭場元素 模型 03bc' },
					{ ['object'] = 'vw_prop_casino_art_mod_04a',        ['price'] = 240,  ['label'] = '賭場元素 模型 04a' },
					{ ['object'] = 'vw_prop_casino_art_mod_04b',        ['price'] = 240,  ['label'] = '賭場元素 模型 04b' },
					{ ['object'] = 'vw_prop_casino_art_mod_04c',        ['price'] = 240,  ['label'] = '賭場元素 模型 04c' },
					{ ['object'] = 'vw_prop_casino_art_mod_05a',        ['price'] = 480,  ['label'] = '賭場元素 模型 05a' },
					{ ['object'] = 'vw_prop_casino_art_mod_06a',        ['price'] = 850,  ['label'] = '賭場元素 模型 06a' },
					{ ['object'] = 'vw_prop_casino_art_sh_01a',         ['price'] = 490,  ['label'] = '賭場元素 SH 01a' },
					{ ['object'] = 'vw_prop_casino_art_statue_04a',     ['price'] = 1350, ['label'] = '賭場元素 雕花 04a' },
					{ ['object'] = 'vw_prop_casino_art_vase_01a',       ['price'] = 680,  ['label'] = '賭場元素 花瓶 01a' },
					{ ['object'] = 'vw_prop_casino_art_vase_02a',       ['price'] = 680,  ['label'] = '賭場元素 花瓶 02a' },
					{ ['object'] = 'vw_prop_casino_art_vase_03a',       ['price'] = 680,  ['label'] = '賭場元素 花瓶 03a' },
					{ ['object'] = 'vw_prop_casino_art_vase_04a',       ['price'] = 680,  ['label'] = '賭場元素 花瓶 04a' },
					{ ['object'] = 'vw_prop_casino_art_vase_05a',       ['price'] = 680,  ['label'] = '賭場元素 花瓶 05a' },
					{ ['object'] = 'vw_prop_casino_art_vase_06a',       ['price'] = 680,  ['label'] = '賭場元素 花瓶 06a' },
					{ ['object'] = 'vw_prop_casino_art_vase_07a',       ['price'] = 680,  ['label'] = '賭場元素 花瓶 07a' },
					{ ['object'] = 'vw_prop_casino_art_vase_08a',       ['price'] = 680,  ['label'] = '賭場元素 花瓶 08a' },
					{ ['object'] = 'vw_prop_casino_art_vase_09a',       ['price'] = 680,  ['label'] = '賭場元素 花瓶 09a' },
					{ ['object'] = 'vw_prop_casino_art_vase_10a',       ['price'] = 680,  ['label'] = '賭場元素 花瓶 10a' },
					{ ['object'] = 'vw_prop_casino_art_vase_11a',       ['price'] = 680,  ['label'] = '賭場元素 花瓶 11a' },
					{ ['object'] = 'vw_prop_casino_art_vase_12a',       ['price'] = 680,  ['label'] = '賭場元素 花瓶 12a' },
					{ ['object'] = 'vw_prop_art_football_01a',          ['price'] = 1450, ['label'] = '賭場元素 花瓶 01a' },
					{ ['object'] = 'vw_prop_art_mic_01a',               ['price'] = 1450, ['label'] = '賭場元素 麥克風 01a' },
					{ ['object'] = 'vw_prop_art_pug_01a',               ['price'] = 870,  ['label'] = '賭場元素 哈巴狗 01a' },
					{ ['object'] = 'vw_prop_art_pug_01b',               ['price'] = 870,  ['label'] = '賭場元素 哈巴狗 01b' },
					{ ['object'] = 'vw_prop_art_pug_02a',               ['price'] = 870,  ['label'] = '賭場元素 哈巴狗 02a' },
					{ ['object'] = 'vw_prop_art_pug_02b',               ['price'] = 870,  ['label'] = '賭場元素 哈巴狗 02b' },
					{ ['object'] = 'vw_prop_art_pug_03a',               ['price'] = 870,  ['label'] = '賭場元素 哈巴狗 03a' },
					{ ['object'] = 'vw_prop_art_pug_03b',               ['price'] = 870,  ['label'] = '賭場元素 哈巴狗 03b' },
					{ ['object'] = 'vw_prop_art_resin_balls_01a',       ['price'] = 2450, ['label'] = '賭場元素 球 01a' },
					{ ['object'] = 'vw_prop_art_resin_guns_01a',        ['price'] = 2450, ['label'] = '賭場元素 槍械 01a' },
					{ ['object'] = 'vw_prop_art_wall_segment_01a',      ['price'] = 1700, ['label'] = '賭場元素 Segment 01a' },
					{ ['object'] = 'vw_prop_art_wall_segment_02a',      ['price'] = 1700, ['label'] = '賭場元素 Segment 02a' },
					{ ['object'] = 'vw_prop_art_wall_segment_02b',      ['price'] = 1700, ['label'] = '賭場元素 Segment 02b' },
					{ ['object'] = 'vw_prop_art_wall_segment_03a',      ['price'] = 1700, ['label'] = '賭場元素 Segment 03a' },
					{ ['object'] = 'vw_prop_art_wings_01a',             ['price'] = 4700, ['label'] = '賭場元素 翅膀 01a' },
					{ ['object'] = 'vw_prop_art_wings_01b',             ['price'] = 4700, ['label'] = '賭場元素 翅膀 01b' },
					{ ['object'] = 'vw_prop_casino_art_basketball_01a', ['price'] = 630,  ['label'] = '賭場元素 籃球 01a' },
					{ ['object'] = 'vw_prop_casino_art_basketball_02a', ['price'] = 630,  ['label'] = '賭場元素 籃球 02a' },
					{ ['object'] = 'vw_prop_casino_art_absman_01a',     ['price'] = 340,  ['label'] = '賭場元素 Absman 01a' },
					{ ['object'] = 'vw_prop_casino_art_bottle_01a',     ['price'] = 240,  ['label'] = '賭場元素 酒瓶 01a' },
					{ ['object'] = 'vw_prop_casino_art_bowling_01a',    ['price'] = 240,  ['label'] = '賭場元素 保齡球 01a' },
					{ ['object'] = 'vw_prop_casino_art_bowling_01b',    ['price'] = 240,  ['label'] = '賭場元素 保齡球 01b' },
					{ ['object'] = 'vw_prop_casino_art_bowling_02a',    ['price'] = 240,  ['label'] = '賭場元素 保齡球 02a' },
					{ ['object'] = 'vw_prop_casino_art_ego_01a',        ['price'] = 350,  ['label'] = '賭場元素 EGO' },
					{ ['object'] = 'vw_prop_casino_art_horse_01a',      ['price'] = 240,  ['label'] = '賭場元素 馬 01a' },
					{ ['object'] = 'vw_prop_casino_art_horse_01b',      ['price'] = 240,  ['label'] = '賭場元素 馬 01b' },
					{ ['object'] = 'vw_prop_casino_art_horse_01c',      ['price'] = 240,  ['label'] = '賭場元素 馬 01c' },
					{ ['object'] = 'vw_prop_casino_art_panther_01a',    ['price'] = 240,  ['label'] = '賭場元素 黑豹 01a' },
					{ ['object'] = 'vw_prop_casino_art_panther_01b',    ['price'] = 240,  ['label'] = '賭場元素 黑豹 01b' },
					{ ['object'] = 'vw_prop_casino_art_panther_01c',    ['price'] = 240,  ['label'] = '賭場元素 黑豹 01c' },
					{ ['object'] = 'vw_prop_casino_art_rocket_01a',     ['price'] = 750,  ['label'] = '賭場元素 火箭 01a' },
					{ ['object'] = 'vw_prop_casino_art_v_01a',          ['price'] = 840,  ['label'] = '賭場元素 V 01a' },
					{ ['object'] = 'vw_prop_casino_art_v_01b',          ['price'] = 420,  ['label'] = '賭場元素 V 01b' },
					{ ['object'] = 'vw_prop_casino_art_statue_02a',     ['price'] = 450,  ['label'] = '賭場元素 雕像 02a' },
					{ ['object'] = 'vw_prop_casino_art_statue_01a',     ['price'] = 450,  ['label'] = '賭場元素 雕像 01a' },
					{ ['object'] = 'vw_prop_casino_art_concrete_01a',   ['price'] = 240,  ['label'] = '賭場元素 混凝土 01' },
					{ ['object'] = 'vw_prop_casino_art_console_01a',    ['price'] = 240,  ['label'] = '賭場元素 控製臺 01a' },
					{ ['object'] = 'vw_prop_casino_art_console_02a',    ['price'] = 380,  ['label'] = '賭場元素 控製臺 02a' },
					{ ['object'] = 'vw_prop_casino_art_miniature_05a',  ['price'] = 450,  ['label'] = '賭場元素 微小裝飾 05a' },
					{ ['object'] = 'vw_prop_casino_art_miniature_05b',  ['price'] = 450,  ['label'] = '賭場元素 微小裝飾 05b' },
					{ ['object'] = 'vw_prop_casino_art_miniature_05c',  ['price'] = 450,  ['label'] = '賭場元素 微小裝飾 05c' },
					{ ['object'] = 'vw_prop_casino_art_miniature_09a',  ['price'] = 450,  ['label'] = '賭場元素 微小裝飾 09a' },
					{ ['object'] = 'vw_prop_casino_art_miniature_09b',  ['price'] = 450,  ['label'] = '賭場元素 微小裝飾 09b' },
					{ ['object'] = 'vw_prop_casino_art_miniature_09c',  ['price'] = 450,  ['label'] = '賭場元素 微小裝飾 09c' },
					{ ['object'] = 'vw_prop_casino_art_sculpture_01a',  ['price'] = 870,  ['label'] = '賭場元素 微小裝飾 01a' },
					{ ['object'] = 'vw_prop_casino_art_sculpture_02a',  ['price'] = 870,  ['label'] = '賭場元素 微小裝飾 02a' },
					{ ['object'] = 'vw_prop_casino_art_sculpture_02b',  ['price'] = 870,  ['label'] = '賭場元素 微小裝飾 02b' },
					{ ['object'] = 'vw_prop_casino_art_skull_01a',      ['price'] = 450,  ['label'] = '賭場元素 雕像 01a' },
					{ ['object'] = 'vw_prop_casino_art_skull_01b',      ['price'] = 450,  ['label'] = '賭場元素 雕像 01b' },
					{ ['object'] = 'vw_prop_casino_art_skull_02a',      ['price'] = 450,  ['label'] = '賭場元素 雕像 02a' },
					{ ['object'] = 'vw_prop_casino_art_skull_02b',      ['price'] = 450,  ['label'] = '賭場元素 雕像 02b' },
					{ ['object'] = 'vw_prop_casino_art_skull_03a',      ['price'] = 450,  ['label'] = '賭場元素 雕像 03a' },
					{ ['object'] = 'vw_prop_casino_art_skull_03b',      ['price'] = 450,  ['label'] = '賭場元素 雕像 03b' }
				}
			},
			{ ['object'] = 'prop_defilied_ragdoll_01',   ['price'] = 5,   ['label'] = '被褻瀆的佈偶貓' },
			{ ['object'] = 'prop_beware_dog_sign',       ['price'] = 35,  ['label'] = '狗標誌' },
			{ ['object'] = 'prop_t_telescope_01b',       ['price'] = 475, ['label'] = '望遠鏡' },
			{ ['object'] = 'vw_prop_vw_key_cabinet_01a', ['price'] = 150, ['label'] = '鑰匙櫃' },
			{ ['object'] = 'ex_office_citymodel_01',     ['price'] = 150, ['label'] = '城市模型 01' },
		},
	},

	-- Download KillstorexQuasar_props DLC!
	['ksgaming'] = {
		['label'] = 'Killstore Gaming',
		['items'] = {}
	},

	['ksgarden'] = {
		['label'] = 'Killstore Gaming',
		['items'] = {}
	},

	['kskitchen'] = {
		['label'] = 'Killstore Kitchen',
		['items'] = {}
	},

	['ksroom'] = {
		['label'] = 'Killstore Room',
		['items'] = {}
	},
}
