local label = {type=CONTROLLER_TYPE.LABEL, text="玄元剑仙-zz脚本"}
local platf ={type=CONTROLLER_TYPE.PICKER, title="平台选择(QQ需提前进入游戏)", key="platf", value="QQ", options={"QQ", "其他"}}
local platf1 = {type=CONTROLLER_TYPE.PICKER, title="洞府升级", key="wood", value="粮食，木头", options={"粮食，木头，铁", "粮食，木头"}}
local label_book = {type=CONTROLLER_TYPE.LABEL, text="悟道书设置"}
local label_book1 = {type=CONTROLLER_TYPE.LABEL, text="第一本悟道书设置"}
local book_row1 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几行", key="row", value="1"}
local book_col1 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几列", key="column", value="1"}
local first_times1 = {type=CONTROLLER_TYPE.INPUT, title="悟道几次", key="column", value="2"}
local label_book2 = {type=CONTROLLER_TYPE.LABEL, text="第二本悟道书设置"}
local book_row2 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几行", key="row", value="1"}
local book_col2 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几列", key="column", value="2"}
local first_times2 = {type=CONTROLLER_TYPE.INPUT, title="悟道几次", key="column", value="2"}
local label_book3 = {type=CONTROLLER_TYPE.LABEL, text="第三本悟道书设置"}
local book_row3 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几行", key="row", value="2"}
local book_col3 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几列", key="column", value="2"}
local first_times3 = {type=CONTROLLER_TYPE.INPUT, title="悟道几次", key="column", value="2"}
local label_book4 = {type=CONTROLLER_TYPE.LABEL, text="第四本悟道书设置（无限阅读）"}
local book_row4 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几行", key="row", value="3"}
local book_col4 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几列", key="column", value="3"}
local label_gf = {type=CONTROLLER_TYPE.LABEL, text="功法设置"}
local update_gf8 = {type=CONTROLLER_TYPE.SWITCH, title="自动悟道", key="悟道", value=1}
local update_gf9 = {type=CONTROLLER_TYPE.SWITCH, title="自动熄屏", key="息屏", value=1}
local update_gf1 = {type=CONTROLLER_TYPE.SWITCH, title="升级绝学", key="绝学", value=1}
local update_gf2 = {type=CONTROLLER_TYPE.SWITCH, title="升级真绝", key="真绝", value=1}
local update_gf3 = {type=CONTROLLER_TYPE.SWITCH, title="升级门派", key="门派", value=1}
local update_gf4 = {type=CONTROLLER_TYPE.SWITCH, title="升级秘籍", key="秘籍", value=1}
local update_gf5 = {type=CONTROLLER_TYPE.SWITCH, title="升级心经", key="心经", value=1}
local update_gf6 = {type=CONTROLLER_TYPE.SWITCH, title="升级遁术", key="遁术", value=1}
local update_gf7 = {type=CONTROLLER_TYPE.SWITCH, title="升级残页", key="残页", value=1}
--It's an option for users to determine weather the inputs should be remembered, if you use this control in the dialog.
local remember = {type=CONTROLLER_TYPE.REMEMBER, on=false}
local btn1 = {type=CONTROLLER_TYPE.BUTTON, title="开始", color=0x71C69E, width=0.8, flag=1, collectInputs=true}
local controls = {label, platf, platf1, label_gf, label_book1, book_row1, book_col1, first_times1, label_book2, book_row2, book_col2, first_times2,
	label_book3, book_row3, book_col3, first_times3, label_book4, book_row4, book_col4, update_gf8, label_gf, update_gf1, update_gf2, update_gf3, update_gf4, 
    update_gf5, update_gf6, update_gf7, update_gf9, remember, btn1}
local orientations = { ORIENTATION_TYPE.LANDSCAPE_LEFT, ORIENTATION_TYPE.LANDSCAPE_RIGHT };
local result = dialog(controls, orientations);
    
if (result == 1) then
   toast('开始运行');
end

local first = tonumber(first_times1.value);
local second = tonumber(first_times2.value);
local third = tonumber(first_times3.value);

-- define resolution
local screenX, screenY = getScreenResolution();
if screenX > screenY then
   screenX, screenY = screenY, screenX;
end

local xf = screenX / 750.0;
local yf = screenY / 1334.0;

--define function
function responsiveTap(x,y)
    return tap(x*xf, y*yf);
end
function responsiveGetColor(x,y)
    return getColor(math.floor(x*xf), math.floor(y*yf));
end
function responsiveTouchMove(x1, y1,x2,y2)
    touchDown(0, x1*xf, y1*yf); 
    usleep(100000);
    touchMove(0, x2*xf, y2*yf);
    usleep(500000);
    touchUp(0, x2*xf, y2*yf);
end
function check_gf(x, y, times)
    responsiveTap(x, y);
    usleep(100000);
    responsiveTap(x, y);
    usleep(1000000);
	local count = 0
	while count < 10 do
		responsiveTouchMove(560,1020,560,333);
		usleep(100000);
		count = count + 1
	end
	usleep(100000);
    local cnt = 0;
    while cnt < times do
        local start = 1134;
        while start > 208 do
        responsiveTap(605, start);
        usleep(100000);
        responsiveTap(605, start);
        usleep(100000);
        start = start - 36;
        end
        usleep(1000000);
		responsiveTouchMove(560,333, 560,1020);
        usleep(1000000);
        cnt = cnt + 1
    end
end
function unlockScreen()
    keyDown(KEY_TYPE.POWER_BUTTON);
    keyUp(KEY_TYPE.POWER_BUTTON);

    usleep(1000000);

    keyDown(KEY_TYPE.HOME_BUTTON);
    keyUp(KEY_TYPE.HOME_BUTTON)
end
function lockScreen()
    keyDown(KEY_TYPE.POWER_BUTTON);
    keyUp(KEY_TYPE.POWER_BUTTON);
end
function check_notice()
    if (responsiveGetColor(655, 227) == 13127218 and responsiveGetColor(432, 240) == 16644084 and 
        responsiveGetColor(375,350) == 2894892 and responsiveGetColor(380, 457) == 12367017) then
        toast('关闭公告', 1);
        usleep(1000000);
        responsiveTap(655, 229);
        usleep(5000000);
    end
end
function check_login()
	if (responsiveGetColor(424, 1010) == 15313229 and responsiveGetColor(617,303) == 13456441 and 
            responsiveGetColor(575,288)==15065814) then
        toast('检测到登陆界面公告',1);
        usleep(1000000);
        responsiveTap(617,303);
        usleep(1000000);
        responsiveTap(369,936); --tap 3 times
        usleep(100000);
        responsiveTap(369,936);
        usleep(100000);
        responsiveTap(369,936);
        usleep(100000);
    end	
end
function sleep(n)  -- seconds
    local sec = os.time() + n;
    repeat until os.time()> sec
end



local total = -1;
while total >= -1 do
    total = total + 1
    if (platf.value == 'QQ') then
		openURL("https://h5.qzone.qq.com/app/open/1108228472/home?app_display=2&_happ=1&_proxy=1&_wv=145191&pf=wanba_ts.9&via=H5.SHARE.QQAIO");
		usleep(3000000);
		-- 点击浏览器open 跳转
		while (responsiveGetColor(622, 742) ==31487) do
			responsiveTap(622, 742);
			usleep(1000000);
		end
        --appActivate("com.tencent.mqq"); --强制切换程序
        usleep(100000);
    end

    usleep(40000000);

    --login
    check_login();
	
	usleep(1000000);
	
	while (responsiveGetColor(709, 37) == 16373867 and responsiveGetColor(697,78) == 16644836 and responsiveGetColor(303,1027) == 15662333) do
        toast('检测到登陆界面,正在努力登陆',1);
        usleep(100000);
        responsiveTap(369,936); --tap 3 times
        usleep(100000);
        responsiveTap(369,936);
        usleep(100000);
        responsiveTap(369,936);
        usleep(100000);
	end
	usleep(1000000);
	check_login();
    usleep(1000000);

    while (responsiveGetColor(257, 1142) == 15977041 and responsiveGetColor(499, 1145) == 16505449 and 
            responsiveGetColor(371,1146) == 6758400) do
        toast('正在进入游戏', 1);
        usleep(1000000);
        responsiveTap(373, 1132); --tap twice
        responsiveTap(373, 1132);
        usleep(20000000);
    end
	
    -- 已登陆
    usleep(1000000);

    --检测公告
    while (responsiveGetColor(655, 227) == 13127218 and responsiveGetColor(432, 240) == 16644084 and 
            responsiveGetColor(375,350) == 2894892 and responsiveGetColor(380, 457) == 12367017) do
        toast('关闭公告', 1);
        usleep(1000000);
        responsiveTap(655, 229);
        usleep(5000000);
    end
	
    usleep(1000000);

    --检测主界面
    if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16184558 and 
            responsiveGetColor(172, 18) == 10006456) then
        toast('找到主界面', 1);
        usleep(1000000);
    end
	
    usleep(1000000);

    --历练检测
    if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16184558 and 
            responsiveGetColor(172, 18) == 10006456) then
        toast('进入历练', 1);
        usleep(1000000);
        responsiveTap(660, 1033);
        usleep(5000000);
    end

    usleep(1000000);
	
	toast("检测圣兽",1);
	usleep(1000000);
	responsiveTap(646, 1027);
	usleep(5000000);
	
	while (responsiveGetColor(245,254) == 5983502 and responsiveGetColor(302,262) == 15651945 and 
			responsiveGetColor(642, 194) == 13588026) do
		toast("检测到圣兽界面",1);
		usleep(1000000);
		responsiveTap(373, 1119);
		usleep(100000);
		responsiveTap(373, 1119);
		usleep(100000);
		toast("关闭圣兽界面",1);
		usleep(1000000);
		responsiveTap(642, 194);
		usleep(1000000);
	end
	
	usleep(1000000);
			
    --检测历练界面
    if (responsiveGetColor(360,1035) == 14402463 and responsiveGetColor(517,1030) == 15324846 and 
    responsiveGetColor(630,1015) == 15522482 and responsiveGetColor(653,1069) == 16772306) then
        toast('已在历练界面', 1);
        usleep(1000000);
    end
    usleep(1000000);
	
    --神游设置
    if (responsiveGetColor(360,1035) == 14402463 and responsiveGetColor(517,1030) == 15324846 and 
    responsiveGetColor(630,1015) == 15522482 and responsiveGetColor(653,1069) == 16772306) then
        toast('检测神游', 1);
        usleep(1000000);
        responsiveTap(248, 1034);
        usleep(10000000);
    end 

    usleep(1000000);

    if (responsiveGetColor(444, 258) == 12996693 and responsiveGetColor(515, 258) == 12329773) then
        toast('已经在神游界面', 1);
        usleep(1000000);
        if (responsiveGetColor(184, 985) == 9128487 and responsiveGetColor(498, 984) == 9128487 and 
            responsiveGetColor(374, 1067) == 14453035 and responsiveGetColor(577, 984) == 9128487) then
            toast('开始设置神游', 1);
            usleep(100000);
            responsiveTap(558, 979);
            usleep(100000);
            responsiveTap(558, 979);
            usleep(1000000);
            responsiveTap(382, 1046);
            usleep(1000000);
            responsiveTap(636, 199)
            usleep(1000000);
        else
            toast('未完成神游', 1);
            usleep(1000000);
            responsiveTap(636, 199)
            usleep(1000000);
        end
    end
	
    usleep(1000000);

    while (responsiveGetColor(107, 37) == 8093819 and responsiveGetColor(93, 28) == 9804180 and 
    responsiveGetColor(133, 27) == 12369850 and responsiveGetColor(151, 31) == 9080714) do
        toast('退出神游界面', 1);
        usleep(1000000);
        responsiveTap(57, 33);
        usleep(2000000);
    end
	
    usleep(1000000);

    while (responsiveGetColor(360,1035) == 14402463 and responsiveGetColor(517,1030) == 15324846 and 
    responsiveGetColor(630,1015) == 15522482 and responsiveGetColor(653,1069) == 16772306) do
        toast('退出历练界面', 1);
        usleep(1000000);
        responsiveTap(37, 32);
        usleep(2000000);
    end
	
    usleep(1000000);

    check_notice();

    usleep(1000000);

    --灵根检测
    if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16184558 and 
            responsiveGetColor(172, 18) == 10006456) then
        toast('进入灵根', 1);
        usleep(1000000);
        responsiveTap(95, 1030);
        usleep(100000);
        responsiveTap(95, 1030);
        usleep(5000000);
    end
	
    usleep(1000000);

    --灵根界面检测
    if (responsiveGetColor(199, 42) == 1979717 and responsiveGetColor(115, 40) == 1715515 and 
            responsiveGetColor(84, 27) == 1715515 and responsiveGetColor(57,42) == 1058351) then
        toast('已在灵根界面', 1);
        usleep(1000000);
        responsiveTap(375, 278);
        usleep(100000);
        responsiveTap(375, 278);
        usleep(100000);
        responsiveTap(375, 278);
        usleep(100000);
        responsiveTap(152, 445);
        usleep(100000);
        responsiveTap(152, 445);
        usleep(100000);
        responsiveTap(152, 445);
        usleep(100000);
        responsiveTap(235, 701);
        usleep(100000);
        responsiveTap(235, 701);
        usleep(100000);
        responsiveTap(235, 701);
        usleep(100000);
        responsiveTap(532, 698);
        usleep(100000);
        responsiveTap(532, 698);
        usleep(100000);
        responsiveTap(532, 698);
        usleep(100000);
        responsiveTap(610, 438);
        usleep(100000);
        responsiveTap(610, 438);
        usleep(100000);
        responsiveTap(610, 438);
        usleep(100000);

        responsiveTap(620, 996);
        usleep(500000);

        responsiveTap(516, 806);
        usleep(1000000);
    end

    usleep(1000000);
	
    --退出界面
    while (responsiveGetColor(199, 42) == 1979717 and responsiveGetColor(115, 40) == 1715515 and 
            responsiveGetColor(84, 27) == 1715515 and responsiveGetColor(57,42) == 1058351) do
        toast('退出灵根界面', 1);
        usleep(1000000);
        responsiveTap(29, 39);
        usleep(1000000);
    end

    usleep(1000000);
	
    --功法
	local gf_times = 4;
	if (tonumber(update_gf9.value) == 1) then
		gf_times = 5;
	end
	usleep(100000);
    if (total%gf_times == 1) then
        if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16184558 and 
            responsiveGetColor(172, 18) == 10006456) then
            toast('进入功法', 1);
            usleep(1000000);
            responsiveTap(238, 1029);
			usleep(100000);
            responsiveTap(238, 1029);
            usleep(5000000);
        end
    end
    usleep(1000000);
	
    --检测功法
    if (responsiveGetColor(544, 163) == 12362367 and responsiveGetColor(551, 169) == 13547400 and 
            responsiveGetColor(669, 166) == 13416074 and responsiveGetColor(628, 164) == 9535077 and responsiveGetColor(599, 174) == 3815477) then
        if (tonumber(update_gf1.value) == 1) then
            toast('升级绝学', 1);
            usleep(1000000);
            check_gf(297, 169, 1);
        end
        usleep(1000000);
        if (tonumber(update_gf2.value) == 1) then
            toast('升级真绝', 1);
            usleep(1000000);
            check_gf(447, 104, 5);
        end
        usleep(1000000);
        if (tonumber(update_gf3.value) == 1) then
            toast('升级门派', 1);
            usleep(1000000);
            check_gf(150, 105, 2);
        end
        usleep(1000000);
        if (tonumber(update_gf4.value) == 1) then
            toast('升级秘籍', 1);
            usleep(1000000);
            check_gf(288, 104, 3);
        end
        usleep(1000000);
        if (tonumber(update_gf5.value) == 1) then
            toast('升级心经', 1);
            usleep(1000000);
            check_gf(608, 106, 3);
        end
        usleep(1000000);
        if (tonumber(update_gf6.value) == 1) then
            toast('升级遁术', 1);
            usleep(1000000);
            check_gf(142, 171, 3);
        end
        usleep(1000000);
        if (tonumber(update_gf7.value) == 1) then
            toast('升级残页', 1);
            usleep(1000000);
            check_gf(451,158, 1);
        end
    end
	
    usleep(1000000);

    --退出功法
    while (responsiveGetColor(544, 163) == 12362367 and responsiveGetColor(551, 169) == 13547400 and 
            responsiveGetColor(669, 166) == 13416074 and responsiveGetColor(628, 164) == 9535077 and responsiveGetColor(599, 174) == 3815477) do
        toast('退出功法界面', 1);
        usleep(1000000);
        responsiveTap(36, 33);
        usleep(1000000);
    end
    
    --检测洞府
    if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16184558 and 
            responsiveGetColor(172, 18) == 10006456) then
        toast('进入洞府', 1);
        usleep(1000000);
        responsiveTap(516, 1029);
        usleep(5000000);
    end
    
    usleep(1000000);
    
    if (responsiveGetColor(283, 142) == 13605221 and responsiveGetColor(282, 159) == 8736827 and 
            responsiveGetColor(528, 148) == 9523242 and responsiveGetColor(136, 237) == 765169) then
        toast('检测到洞府界面', 1);
        usleep(1000000);
        if (responsiveGetColor(424, 589) == 5917496 and responsiveGetColor(373, 592) == 8879212 
             and responsiveGetColor(358, 593) == 14868175 and responsiveGetColor(356, 593) == 6773062 
                and responsiveGetColor(425, 589) == 5917497) then
            toast('洞府点击升级', 1);
            usleep(1000000);
            responsiveTap(609, 421);
            usleep(100000);
            responsiveTap(490, 807);
            usleep(100000);
            responsiveTap(612, 610);
            usleep(100000);
            responsiveTap(490, 805);
            usleep(1000000);
			if (platf1.value == '粮食，木头，铁') then
				responsiveTap(606, 802);
				usleep(100000);
				responsiveTap(490, 807);
				usleep(1000000);
			end
        else
            toast('木头未满级', 1);
            usleep(1000000);
        end
    
        usleep(1000000);

        --点击书阁
        if (tonumber(update_gf8.value) == 1) then
            toast('点击书阁', 1);
            usleep(1000000);
            responsiveTap(96, 1032);
            usleep(1000000);
        end
    end

    usleep(5000000);
	
    --检测书阁
    if (responsiveGetColor(282, 145) == 5785389 and responsiveGetColor(284, 160) == 3022104 and 
    responsiveGetColor(291, 158) == 4137752) then
        toast('检测到书阁界面', 1);
        usleep(1000000);
        if (tonumber(update_gf8.value) == 1) then
            toast('进入悟道', 1);
            usleep(1000000);
            responsiveTap(396, 307);
            usleep(100000);
            responsiveTap(396, 307);
            usleep(1000000);
        end
    end

    usleep(1000000);
	
    --检测悟道
    if (responsiveGetColor(388, 243) == 10781564 and responsiveGetColor(381, 234) == 10462891 and 
        responsiveGetColor(640, 419) == 13719869) then
        toast('检测悟道界面', 1);

        usleep(1000000);

        --悟道设置
        if (responsiveGetColor(375, 896) == 15379022 and responsiveGetColor(409, 908) == 14453035 and 
        responsiveGetColor(358, 894) == 6501916) then
            toast('开始悟道', 1);
            usleep(1000000);
            responsiveTap(373, 895);
            usleep(3000000);
        else
            toast('悟道未结束', 1);
            usleep(1000000);
            toast("退出悟道", 1);
            usleep(1000000);
            responsiveTap(640, 418);
            usleep(100000);
        end
    end

    usleep(5000000);
	
    --开始悟道
    if (responsiveGetColor(98, 29) == 16711675 and responsiveGetColor(138, 26) == 14804709 and 
       responsiveGetColor(137,112) == 13613194 and responsiveGetColor(455, 112) == 16444319 and 
       responsiveGetColor(406, 123) == 16111236) then
        toast('检测到道书界面', 1);
        usleep(1000000);
        responsiveTap(81, 201);
        usleep(100000);
		if first > 0 then
			 book_row = tonumber(book_row1.value);
			 book_col = tonumber(book_col1.value);
			 first = first - 1;
			toast(tostring(book_row),3);
			usleep(3000000);
		elseif second > 0 then
			 book_row = tonumber(book_row2.value);
			 book_col = tonumber(book_col2.value);
			 second = second - 1;
		elseif third > 0 then
			 book_row = tonumber(book_row3.value);
			 book_col = tonumber(book_col3.value);
			 third = third - 1;
		else
			 book_row = tonumber(book_row4.value);
			 book_col = tonumber(book_col4.value);
		end
		
        local row_times = book_row - 2;
        local book_location1 = {{x=177, y=412}, {x=383, y=387}, {x=596, y=382}, {x=177, y=671}, {x=383, y=646}, {x=596, y=641}}; --选书坐标1 （正序列，1，2，3，4，5，6）
        local book_location2 = {{x=175, y=710}, {x=375, y=720}, {x=597, y=718}}; --选书坐标2（从第三排开始，1,2,3）
        while row_times > 0 do
            row_times = row_times -1;
            responsiveTouchMove(177, 763, 177, 501); 
            usleep(500000);
        end
    
        usleep(500000);

        --选书
		if (book_row == 1) then
			toast('选书', 1);
			usleep(1000000);
			responsiveTap(book_location1[book_col].x, book_location1[book_col].y);
			usleep(1000000);
			responsiveTap(380, 686);
			usleep(100000);
			responsiveTap(380, 686);
			usleep(100000);
		else if (book_row == 2) then
				toast('选书', 1);
				usleep(1000000);
				responsiveTap(book_location1[book_col+3].x, book_location1[book_col+3].y);
				usleep(1000000);
				responsiveTap(380, 686);
				usleep(100000);
				responsiveTap(380, 686);
				usleep(100000);
		else
			responsiveTap(book_location2[book_col].x, book_location2[book_col].y);
			toast('选书', 1);
			usleep(1000000);
			responsiveTap(380, 686);
			usleep(100000);
			responsiveTap(380, 686);
			usleep(100000);
		end
			
        -- 多点开了界面
        while (responsiveTap(636,378) == 13588026) do
            toast('关闭多余界面', 1);
            usleep(1000000);
            responsiveTap(636, 378);
            usleep(100000);
        end
    end
	end
	
    usleep(1000000);

    ---退出道书界面
    if (responsiveGetColor(98, 29) == 16711675 and responsiveGetColor(138, 26) == 14804709 and 
       responsiveGetColor(137,112) == 13613194 and responsiveGetColor(455, 112) == 16444319 and 
       responsiveGetColor(406, 123) == 16111236) then
        toast('退出道书界面', 1);
        usleep(1000000);
        responsiveTap(49, 40);
        usleep(100000);
        responsiveTap(49, 40);
        usleep(100000);
    end

    usleep(1000000);

    ---检测背包
    if (responsiveGetColor(691, 539) == 9128487 and responsiveGetColor(629, 1301) == 14452778 and 
       responsiveGetColor(138, 1286) == 12025402 and responsiveGetColor(38, 29) == 16310408) then
        toast('检测到背包', 1);
        usleep(1000000);
        responsiveTap(38, 29);
        usleep(1000000);
    end

    usleep(1000000);

    --退出洞府
    if (responsiveGetColor(283, 142) == 13605221 and responsiveGetColor(282, 159) == 8736827 and 
        responsiveGetColor(528, 148) == 9523242 and responsiveGetColor(136, 237) == 765169) then
        toast('退出洞府', 1);
        usleep(1000000);
        responsiveTap(30, 36);
        usleep(1000000);
    end

    usleep(1000000);
    
    --分享有礼
    if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16184558 and 
            responsiveGetColor(172, 18) == 10006456) then
        toast('进入分享界面', 1);
        usleep(1000000);
        responsiveTap(624, 159);
        usleep(1000000);
    end

    usleep(3000000);

    --检测分享有礼
    if (responsiveGetColor(248, 470) == 15647086 and responsiveGetColor(313, 482) == 11295300 and 
      responsiveGetColor(378, 469) == 12487548 and responsiveGetColor(636, 461) == 15586948) then
        toast('检测分享界面', 1);
        usleep(1000000);
        if (responsiveGetColor(418, 575) == 13132901 and responsiveGetColor(444, 572) == 14336182 and 
            responsiveGetColor(455, 575) == 14001566 and responsiveGetColor(475, 571) == 13132131) then
            toast('开始分享', 1);
            usleep(1000000);
            responsiveTap(375, 816);
            usleep(100000);
            responsiveTap(338, 475);
            usleep(100000);
            responsiveTap(338, 475);
            usleep(100000);
            responsiveTap(338, 475);
            usleep(100000);
            responsiveTap(338, 475);
            usleep(100000);
            responsiveTap(375, 816);
            usleep(1000000);
        else
            toast('分享时间未到', 1);
            usleep(1000000);
            responsiveTap(423, 386);
            usleep(1000000);
        end
   end

    usleep(1000000);
    -- 每隔16min
    if (tonumber(update_gf9.value) == 1) then
		appKill("com.tencent.mqq");
		usleep(1000000);
		log("lock");
        lockScreen();
        sleep(600);
		log("unlock");
        unlockScreen();
        usleep(500000);
    else
        usleep(900000000);
    end
end