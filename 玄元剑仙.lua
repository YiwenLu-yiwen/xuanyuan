local label = {type=CONTROLLER_TYPE.LABEL, text="玄元剑仙-zz脚本"}
local platf ={type=CONTROLLER_TYPE.PICKER, title="平台选择(QQ需提前进入游戏)", key="platf", value="QQ", options={"QQ", "其他"}}
local platf1 = {type=CONTROLLER_TYPE.PICKER, title="洞府升级", key="wood", value="粮食，木头", options={"粮食，木头，铁", "粮食，木头"}}
local label_book = {type=CONTROLLER_TYPE.LABEL, text="悟道书设置"}
local label_book1 = {type=CONTROLLER_TYPE.LABEL, text="第一本悟道书设置"}
local book_row1 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几行", key="row", value="10"}
local book_col1 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几列", key="column", value="3"}
local first_times1 = {type=CONTROLLER_TYPE.INPUT, title="悟道几次", key="column", value="2"}
local label_book2 = {type=CONTROLLER_TYPE.LABEL, text="第二本悟道书设置"}
local book_row2 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几行", key="row", value="9"}
local book_col2 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几列", key="column", value="3"}
local first_times2 = {type=CONTROLLER_TYPE.INPUT, title="悟道几次", key="column", value="3"}
local label_book3 = {type=CONTROLLER_TYPE.LABEL, text="第三本悟道书设置"}
local book_row3 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几行", key="row", value="9"}
local book_col3 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几列", key="column", value="2"}
local first_times3 = {type=CONTROLLER_TYPE.INPUT, title="悟道几次", key="column", value="3"}
local label_book4 = {type=CONTROLLER_TYPE.LABEL, text="第四本悟道书设置（无限阅读）"}
local book_row4 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几行", key="row", value="13"}
local book_col4 = {type=CONTROLLER_TYPE.INPUT, title="悟道书第几列", key="column", value="2"}
local label_gf = {type=CONTROLLER_TYPE.LABEL, text="功法设置"}
local update_gf8 = {type=CONTROLLER_TYPE.SWITCH, title="自动悟道", key="悟道", value=1}
local update_gf9 = {type=CONTROLLER_TYPE.SWITCH, title="自动熄屏", key="息屏", value=1}
local update_gf1 = {type=CONTROLLER_TYPE.SWITCH, title="升级绝学", key="绝学", value=0}
local update_gf2 = {type=CONTROLLER_TYPE.SWITCH, title="升级真绝", key="真绝", value=0}
local update_gf3 = {type=CONTROLLER_TYPE.SWITCH, title="升级门派", key="门派", value=0}
local update_gf4 = {type=CONTROLLER_TYPE.SWITCH, title="升级秘籍", key="秘籍", value=0}
local update_gf5 = {type=CONTROLLER_TYPE.SWITCH, title="升级心经", key="心经", value=0}
local update_gf6 = {type=CONTROLLER_TYPE.SWITCH, title="升级遁术", key="遁术", value=0}
local update_gf7 = {type=CONTROLLER_TYPE.SWITCH, title="升级残页", key="残页", value=0}
local update_gf10 = {type=CONTROLLER_TYPE.SWITCH, title="灵根已经100级(升级功法时间小于45分钟)", key="灵根100", value=1}
local update_iron = {type=CONTROLLER_TYPE.SWITCH, title="自动器道（有门派加成才会自动学）", key="器道", value=1}
local update_medi = {type=CONTROLLER_TYPE.SWITCH, title="自动丹道（有门派加成才会自动学）", key="丹道", value=1}
local label_iron = {type=CONTROLLER_TYPE.LABEL, text="器道丹道设置"}
--It's an option for users to determine weather the inputs should be remembered, if you use this control in the dialog.
local btn1 = {type=CONTROLLER_TYPE.BUTTON, title="开始", color=0x71C69E, width=0.8, flag=1, collectInputs=true}
local controls = {label, platf, platf1, label_iron, update_medi, update_iron, label_book, label_book1, book_row1, book_col1, first_times1, label_book2, book_row2, book_col2, first_times2,
	label_book3, book_row3, book_col3, first_times3, label_book4, book_row4, book_col4, label_gf, update_gf8, label_gf, update_gf10, update_gf1, update_gf2, update_gf3, update_gf4, 
    update_gf5, update_gf6, update_gf7, update_gf9, btn1}
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
	while count < 12 do
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
    if (responsiveGetColor(655, 227) == 13127218 and responsiveGetColor(375,350) == 2894892 and 
			responsiveGetColor(380, 457) == 12367527) then
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

keepAutoTouchAwake(true);

-- 所有条件汇总
-- 地上
base_codition = responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16250094 and responsiveGetColor(172, 18) == 9809335
-- 历练
lilian = responsiveGetColor(360,1035) == 14337183 and responsiveGetColor(517,1030) == 15193774 and responsiveGetColor(630,1015) == 15588017
-- 圣兽
shengshou = responsiveGetColor(245,254) == 5983502 and responsiveGetColor(642, 194) == 13588026
-- 神游界面
shenyou = responsiveGetColor(444, 258) == 2625553 and responsiveGetColor(515, 258) == 12329773
-- 神游次数
shenyou_times = responsiveGetColor(184, 985) == 9128487 and responsiveGetColor(498, 984) == 9128487 and responsiveGetColor(374, 1067) == 14453035 
-- 灵根
linggen = responsiveGetColor(199, 42) == 1979717 and responsiveGetColor(115, 40) == 1781307 and responsiveGetColor(84, 27) == 1715515 
-- 功法
gongfa = responsiveGetColor(544, 163) == 12362367 and responsiveGetColor(551, 169) == 13547400 and responsiveGetColor(669, 166) == 13416074
-- 洞府
dongfu = responsiveGetColor(283, 142) == 13343076 and responsiveGetColor(282, 159) == 8276548 and responsiveGetColor(528, 148) == 9523242
-- 洞府升级
dongfu_update = responsiveGetColor(424, 589) == 5917496 and responsiveGetColor(373, 592) == 8879212 and responsiveGetColor(358, 593) == 14868175
-- 书阁
shuge = dongfu
-- 丹道
dandao = responsiveGetColor(282, 145) == 5719086 and responsiveGetColor(284, 160) == 2824473 and responsiveGetColor(291, 158) == 4136734
-- 器道
qidao = dandao
-- 门派加成
menpai_jiacheng = responsiveGetColor(115, 485) == 3318589
-- 升级丹器
upcondition = responsiveGetColor(534, 912) == 14452778 and responsiveGetColor(524, 903) == 6173210
-- 悟道
wudao = dandao
-- 悟道判断
wudao_condition = responsiveGetColor(375, 896) == 15379022 and responsiveGetColor(409, 908) == 14453035 and responsiveGetColor(358, 894) == 6501916
-- 道书
daoshu = responsiveGetColor(98, 29) == 16711675 and responsiveGetColor(138, 26) == 14804709 and responsiveGetColor(137,112) == 13613194 
-- 背包
bag = responsiveGetColor(691, 539) == 9128487 and responsiveGetColor(629, 1301) == 14452778 and responsiveGetColor(138, 1286) == 12025402
-- 分享
fenxiang = responsiveGetColor(248, 470) == 15581806 and responsiveGetColor(313, 482) == 11228994 and responsiveGetColor(378, 469) == 12487035
-- 分享判断
fenxiang_condition = responsiveGetColor(418, 575) == 13132901 and responsiveGetColor(444, 572) == 14336182 and responsiveGetColor(455, 575) == 14001566
-- 飞升
fly_condition = responsiveGetColor(120, 21) == 16446959 and responsiveGetColor(153, 33) == 16381422 and responsiveGetColor(172, 18) == 13486530
-- 宗门
zongmen = responsiveGetColor(106, 1035) == 5992580 and responsiveGetColor(343, 1045) == 12491648 and responsiveGetColor(576, 1033) == 7307405
-- 传道院
chuandao = responsiveGetColor(205, 775) == 16310401 and responsiveGetColor(383, 704) == 16443019 and responsiveGetColor(553, 693) == 11760406
-- 护法
hufa = responsiveGetColor(100, 47) == 6250076 and responsiveGetColor(228, 889) == 15313229 and responsiveGetColor(530, 886) == 15512148
-- 盟主令
mengzhu = responsiveGetColor(79, 45) == 5592920 and responsiveGetColor(149, 45) == 1579291 and responsiveGetColor(217, 62) == 1579291 


local total = -1;
while total >= -1 do
    total = total + 1
    if (platf.value == 'QQ') then
		appActivate("com.tencent.mqq"); --强制切换程序
		--QQ登陆界面
		usleep(10000000);
		if (responsiveGetColor(327, 235) == 0 and responsiveGetColor(468, 243) == 0) then
			toast('检测登录界面，开始登陆', 1);
			responsiveTap(381, 781);
			usleep(3000000);
		end		
		--QQ重新登录
        usleep(1000000);
		if (responsiveGetColor(319, 487) == 0 and responsiveGetColor(366, 486) == 2236962 and 
        	responsiveGetColor(397,486) == 0 and responsiveGetColor(438, 498) == 0) then
			toast('QQ被挤掉线，重新登录', 1);
			responsiveTap(539,854)
			usleep(3000000);
		end
		usleep(3000000);
		openURL("https://h5.qzone.qq.com/app/open/1108228472/home?app_display=2&_happ=1&_proxy=1&_wv=145191&pf=wanba_ts.9&via=H5.SHARE.QQAIO");
		usleep(3000000);
		-- 点击浏览器open 跳转
		while (responsiveGetColor(622, 742) ==31487) do
			responsiveTap(622, 742);
			usleep(4000000);
		end
    end

    usleep(10000000);
	
	while (responsiveGetColor(319, 487) == 16119546 and responsiveGetColor(366, 486) == 16119546 and 
        	responsiveGetColor(397,486) == 16119546 and responsiveGetColor(438, 498) == 16119546) do
			toast('正在等待界面', 1);
			usleep(3000000);
	end
	
	usleep(20000000);
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

    while (responsiveGetColor(257, 1142) == 15845455 and responsiveGetColor(499, 1145) == 16440174 and 
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
    check_notice();
	
    usleep(1000000);
	
	--检测检飞升主界面
	--fly_condition
    if (responsiveGetColor(120, 21) == 16446959 and responsiveGetColor(153, 33) == 16381422 and responsiveGetColor(172, 18) == 13486530) then
        toast('找到飞升主界面', 1);
        usleep(1000000);
		responsiveTap(655, 229);
		usleep(1000000);
	end
	
	usleep(1000000);
	
	--fly_condition
	if (responsiveGetColor(120, 21) == 16446959 and responsiveGetColor(153, 33) == 16381422 and responsiveGetColor(172, 18) == 13486530) then
		toast('进入宗门', 1);
		responsiveTap(98,1029);
		usleep(5000000);
	end

	usleep(1000000);
	--zongmen
	if (responsiveGetColor(106, 1035) == 5992580 and responsiveGetColor(343, 1045) == 12491648 and responsiveGetColor(576, 1033) == 7307405) then
		toast('检测到宗门', 1);
		usleep(1000000);
		toast('进入传道院', 1);
		usleep(100000);
		responsiveTap(55, 257);
		usleep(5000000);
	end

	usleep(100000);

	--chuandao
	if (responsiveGetColor(205, 775) == 16310401 and responsiveGetColor(383, 704) == 16443019 and responsiveGetColor(553, 693) == 11760406) then
		toast('检测到传道院', 1);
		usleep(1000000);
		toast('进入护法', 1);
		usleep(100000);
		responsiveTap(548, 770);
		usleep(3000000);
	end

	usleep(100000);

	--hufa
	if (responsiveGetColor(100, 47) == 6250076 and responsiveGetColor(228, 889) == 15313229 and responsiveGetColor(530, 886) == 15512148) then
		toast('开始护法', 1);
		usleep(100000);
		responsiveTap(533, 887);
		usleep(100000);
		responsiveTap(518, 798);
		usleep(1000000);
	end

	usleep(1000000);

	--chuandao
	if (responsiveGetColor(205, 775) == 16310401 and responsiveGetColor(383, 704) == 16443019 and responsiveGetColor(553, 693) == 11760406) then
		toast('退出护法', 1);
		responsiveTap(93, 43);
		usleep(1000000);
	end
	
	usleep(1000000);
	--zongmen
	if (responsiveGetColor(106, 1035) == 5992580 and responsiveGetColor(343, 1045) == 12491648 and responsiveGetColor(576, 1033) == 7307405) then
		toast('检测到宗门', 1);
		usleep(1000000);
		toast('进入外事大厅', 1);
		usleep(100000);
		responsiveTap(675, 816);
		usleep(1000000);
		toast('进入盟主令', 1);
		responsiveTap(383, 775);
		usleep(4000000);
	end

	usleep(1000000);
	--mengzhu
	if (responsiveGetColor(79, 45) == 5592920 and responsiveGetColor(149, 45) == 1579291 and responsiveGetColor(217, 62) == 1579291 ) then
		toast('检测到盟主令，开始任务', 1);
		usleep(1000000);
		responsiveTap(377, 1081);
		usleep(500000);
		responsiveTap(377, 1081);
		usleep(500000);
		responsiveTap(643, 214);
		usleep(500000);
		toast('退出外事大厅', 1);
		responsiveTap(49, 42);
		usleep(1000000);
	end

	usleep(1000000);

	--zongmen
	if (responsiveGetColor(106, 1035) == 5992580 and responsiveGetColor(343, 1045) == 12491648 and responsiveGetColor(576, 1033) == 7307405) then
		toast('退出宗门', 1);
		usleep(100000);
		responsiveTap(49, 42);
		usleep(1000000);
	end
	
	usleep(1000000);
	--fly_condition
	while (responsiveGetColor(120, 21) == 16446959 and responsiveGetColor(153, 33) == 16381422 and responsiveGetColor(172, 18) == 13486530) do
		toast('去地界', 1);
        responsiveTap(33, 209);
        usleep(1000000);
	end
	
    usleep(5000000);

	
	--检测地上主界面
	--base_condition
    if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16250094 and responsiveGetColor(172, 18) == 9809335) then
        toast('找到地上主界面', 1);
        usleep(1000000);
    end
	
    usleep(1000000);

     --检测洞府
	--base_codition
    if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16250094 and responsiveGetColor(172, 18) == 9809335) then
        toast('进入洞府', 1);
        usleep(100000);
        responsiveTap(516, 1029);
        usleep(5000000);
    end
    
    usleep(1000000);
    
	--dongfu
    if (responsiveGetColor(283, 142) == 13343076 and responsiveGetColor(282, 159) == 8276548 and responsiveGetColor(528, 148) == 9523242) then
        toast('检测到洞府界面', 1);
        usleep(1000000);
		--dongfu_update
        if (responsiveGetColor(424, 589) == 5917496 and responsiveGetColor(373, 592) == 8879212 and responsiveGetColor(358, 593) == 14868175) then
            toast('洞府点击升级', 1);
            usleep(100000);
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
	end
	
	usleep(1000000);
	
	
	--点击书阁
	--dongfu
	if (responsiveGetColor(283, 142) == 13343076 and responsiveGetColor(282, 159) == 8276548 and responsiveGetColor(528, 148) == 9523242) then
		if (tonumber(update_gf8.value) == 1) then
			toast('点击书阁', 1);
			usleep(100000);
			responsiveTap(96, 1032);
			usleep(1000000);
		end
	end

	usleep(5000000);
	
	--检测丹道
	-- dandao
	if (responsiveGetColor(282, 145) == 5719086 and responsiveGetColor(284, 160) == 2824473 and responsiveGetColor(291, 158) == 4136734) then
		toast('检测到丹道界面', 1);
		usleep(1000000);
		if (tonumber(update_medi.value) == 1 and responsiveGetColor(115, 485) == 3318589) then --menpai_jiacheng
			if (responsiveGetColor(534, 912) == 14452778 and responsiveGetColor(524, 903) == 6173210) then --upcondition
				toast('检测到丹道加成, 开始升级');
				usleep(100000);
				responsiveTap(500, 902);
				usleep(500000);
				responsiveTap(490, 804);
				usleep(1000000);
			else
				toast('丹道升级中');
				usleep(100000);
			end
		end
		usleep(1000000);
		if (tonumber(update_iron.value) == 1) then
			toast('进入器道', 1);
			usleep(100000);
			responsiveTap(284, 337);
			usleep(100000);
			responsiveTap(284, 337);
			usleep(1000000);
		end
	end

	usleep(1000000);

	--检测器道
	--qidao
	if (responsiveGetColor(282, 145) == 5719086 and responsiveGetColor(284, 160) == 2824473 and responsiveGetColor(291, 158) == 4136734) then
		toast('检测到器道界面', 1);
		usleep(1000000);
		if (tonumber(update_iron.value) == 1 and responsiveGetColor(115, 485) == 3318589) then --menpai_jiacheng
			if (responsiveGetColor(534, 912) == 14452778 and responsiveGetColor(524, 903) == 6173210) then --upcondition
				toast('检测到器道加成, 开始升级');
				usleep(1000000);
				responsiveTap(500, 902);
				usleep(500000);
				responsiveTap(490, 804);
				usleep(1000000);
			else
				toast('器道升级中');
				usleep(1000000);
			end
		end
		toast('返回丹道');
		usleep(100000);
		responsiveTap(154, 299);
		usleep(100000);
		responsiveTap(154, 299);
	end

	usleep(1000000);
	
    --检测书阁
	--dandao
    if (responsiveGetColor(282, 145) == 5719086 and responsiveGetColor(284, 160) == 2824473 and responsiveGetColor(291, 158) == 4136734) then
        toast('检测到丹道界面', 1);
        usleep(1000000);
        if (tonumber(update_gf8.value) == 1) then
            toast('进入悟道', 1);
            usleep(100000);
            responsiveTap(396, 307);
            usleep(100000);
            responsiveTap(396, 307);
            usleep(1000000);
        end
    end

    usleep(1000000);
	
    --检测悟道
	--wudao
    if (responsiveGetColor(282, 145) == 5719086 and responsiveGetColor(284, 160) == 2824473 and responsiveGetColor(291, 158) == 4136734) then
        toast('检测悟道界面', 1);

        usleep(1000000);

        --悟道设置
		-- wudao_condition 
        if (responsiveGetColor(375, 896) == 15379022 and responsiveGetColor(409, 908) == 14453035 and responsiveGetColor(358, 894) == 6501916) then
            toast('开始悟道', 1);
            usleep(100000);
            responsiveTap(373, 895);
            usleep(3000000);
        else
            toast('悟道未结束', 1);
            usleep(1000000);
            toast("退出悟道", 1);
            usleep(100000);
            responsiveTap(640, 418);
            usleep(100000);
        end
    end

    usleep(5000000);
	
    --开始悟道
	--daoshu
    if (responsiveGetColor(98, 29) == 16711675 and responsiveGetColor(138, 26) == 14804709 and responsiveGetColor(137,112) == 13613194 ) then
        toast('检测到道书界面', 1);
        usleep(100000);
        responsiveTap(81, 201);
        usleep(1000000);
		if first > 0 then
			 book_row = tonumber(book_row1.value);
			 book_col = tonumber(book_col1.value);
			 first = first - 1;
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
			usleep(100000);
			responsiveTap(book_location1[book_col].x, book_location1[book_col].y);
			usleep(1000000);
			responsiveTap(380, 686);
			usleep(100000);
			responsiveTap(380, 686);
			usleep(100000);
		else if (book_row == 2) then
				toast('选书', 1);
				usleep(100000);
				responsiveTap(book_location1[book_col+3].x, book_location1[book_col+3].y);
				usleep(1000000);
				responsiveTap(380, 686);
				usleep(100000);
				responsiveTap(380, 686);
				usleep(100000);
		else
			responsiveTap(book_location2[book_col].x, book_location2[book_col].y);
			toast('选书', 1);
			usleep(100000);
			responsiveTap(380, 686);
			usleep(100000);
			responsiveTap(380, 686);
			usleep(100000);
		end
			
        -- 多点开了界面
        while (responsiveTap(636,378) == 13588026) do
            toast('关闭多余界面', 1);
            usleep(100000);
            responsiveTap(636, 378);
            usleep(1000000);
        end
    end
	end
	
    usleep(1000000);

    ---退出道书界面
	--daoshu
    if (responsiveGetColor(98, 29) == 16711675 and responsiveGetColor(138, 26) == 14804709 and responsiveGetColor(137,112) == 13613194 ) then
        toast('退出道书界面', 1);
        usleep(100000);
        responsiveTap(49, 40);
        usleep(100000);
        responsiveTap(49, 40);
        usleep(1000000);
    end

    usleep(1000000);

    ---检测背包
	--bag
    if (responsiveGetColor(691, 539) == 9128487 and responsiveGetColor(629, 1301) == 14452778 and responsiveGetColor(138, 1286) == 12025402) then
        toast('检测到背包', 1);
        usleep(100000);
        responsiveTap(38, 29);
        usleep(1000000);
    end

    usleep(1000000);

    --退出洞府
	--dongfu
    if (responsiveGetColor(283, 142) == 13343076 and responsiveGetColor(282, 159) == 8276548 and responsiveGetColor(528, 148) == 9523242) then
        toast('退出洞府', 1);
        usleep(100000);
        responsiveTap(30, 36);
        usleep(1000000);
    end

    usleep(1000000);
	
	--历练检测
	--base_condition
    if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16250094 and responsiveGetColor(172, 18) == 9809335) then
        toast('进入历练', 1);
        usleep(1000000);
        responsiveTap(660, 1033);
        usleep(5000000);
    end

    usleep(1000000);
	
	--检测圣兽
	--lilian
	if (responsiveGetColor(360,1035) == 14337183 and responsiveGetColor(517,1030) == 15193774 and responsiveGetColor(630,1015) == 15588017) then
		toast("检测圣兽",1);
		usleep(100000);
		responsiveTap(646, 1027);
        usleep(6000000);
		while (responsiveGetColor(245,254) == 5983502 and responsiveGetColor(642, 194) == 13588026) do
			toast("检测到圣兽界面",1);
			usleep(100000);
			responsiveTap(373, 1119);
			usleep(100000);
			responsiveTap(373, 1119);
			usleep(1000000);
			toast("关闭圣兽界面",1);
			responsiveTap(642, 194);
			usleep(1000000);
		end
    end

	usleep(1000000);
			
    --检测历练界面
	--lilian
    if (responsiveGetColor(360,1035) == 14337183 and responsiveGetColor(517,1030) == 15193774 and responsiveGetColor(630,1015) == 15588017) then
        toast('已在历练界面', 1);
        usleep(1000000);
    end
    usleep(1000000);
	
    --神游设置
	--lilian
    if (responsiveGetColor(360,1035) == 14337183 and responsiveGetColor(517,1030) == 15193774 and responsiveGetColor(630,1015) == 15588017) then
        toast('检测神游', 1);
		usleep(100000);
        responsiveTap(248, 1034);
        usleep(2000000);
    end 

    usleep(1000000);
	toast('检测神游', 1);
	
	--shenyou
    if (responsiveGetColor(444, 258) == 2625553 and responsiveGetColor(515, 258) == 12329773) then
        toast('已经在神游界面', 1);
        usleep(1000000);
		--shenyou_times
        if (responsiveGetColor(184, 985) == 9128487 and responsiveGetColor(498, 984) == 9128487 and responsiveGetColor(374, 1067) == 14453035 ) then
            toast('开始设置神游', 1);
            usleep(100000);
            local rep = 1;
            while (rep < 50) do
                responsiveTap(500, 984);
                usleep(100000);
                rep = rep + 1
            end
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

	-- shenyou
    while (responsiveGetColor(444, 258) == 2625553 and responsiveGetColor(515, 258) == 12329773) do
        toast('退出神游界面', 1);
        usleep(1000000);
        responsiveTap(57, 33);
        usleep(1000000);
    end
	
    usleep(1000000);

	--lilian
    while (responsiveGetColor(360,1035) == 14337183 and responsiveGetColor(517,1030) == 15193774 and responsiveGetColor(630,1015) == 15588017) do
        toast('退出历练界面', 1);
        usleep(1000000);
        responsiveTap(37, 32);
        usleep(2000000);
    end
	
    usleep(1000000);

    check_notice();

    usleep(1000000);

    --灵根检测
	-- base_condition
    if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16250094 and responsiveGetColor(172, 18) == 9809335) then
        toast('进入灵根', 1);
        usleep(1000000);
        responsiveTap(95, 1030);
        usleep(100000);
        responsiveTap(95, 1030);
        usleep(5000000);
    end
	
    usleep(1000000);

    --灵根界面检测
	--linggen
    if (responsiveGetColor(199, 42) == 1979717 and responsiveGetColor(115, 40) == 1781307 and responsiveGetColor(84, 27) == 1715515) then
        toast('已在灵根界面，升级灵根', 1);
        usleep(100000);
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
	--linggen
    while (responsiveGetColor(199, 42) == 1979717 and responsiveGetColor(115, 40) == 1781307 and responsiveGetColor(84, 27) == 1715515) do
        toast('退出灵根界面', 1);
        usleep(100000);
        responsiveTap(29, 39);
        usleep(1000000);
    end

    usleep(1000000);
	
    --功法
	local gf_times = 2;
	if (tonumber(update_gf10.value) == 1) then
		gf_times = 2
	end
	
	usleep(100000);
    if (total%gf_times == 0) then
        if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16250094 and responsiveGetColor(172, 18) == 9809335) then --base_codition
            toast('进入功法', 1);
            usleep(100000);
            responsiveTap(238, 1029);
			usleep(100000);
            responsiveTap(238, 1029);
            usleep(5000000);
        end
    end
    usleep(1000000);
	
    --检测功法
	-- gongfa
    if (responsiveGetColor(544, 163) == 12362367 and responsiveGetColor(551, 169) == 13547400 and responsiveGetColor(669, 166) == 13416074) then
        if (tonumber(update_gf1.value) == 1) then
            toast('升级绝学', 1);
            usleep(100000);
            check_gf(297, 169, 1);
        end
        usleep(1000000);
        if (tonumber(update_gf2.value) == 1) then
            toast('升级真绝', 1);
            usleep(100000);
            check_gf(447, 104, 9);
        end
        usleep(1000000);
        if (tonumber(update_gf3.value) == 1) then
            toast('升级门派', 1);
            usleep(100000);
            check_gf(150, 105, 3);
        end
        usleep(1000000);
        if (tonumber(update_gf4.value) == 1) then
            toast('升级秘籍', 1);
            usleep(100000);
            check_gf(288, 104, 5);
        end
        usleep(1000000);
        if (tonumber(update_gf5.value) == 1) then
            toast('升级心经', 1);
            usleep(100000);
            check_gf(608, 106, 5);
        end
        usleep(1000000);
        if (tonumber(update_gf6.value) == 1) then
            toast('升级遁术', 1);
            usleep(1000000);
            check_gf(142, 171, 5);
        end
        usleep(1000000);
        if (tonumber(update_gf7.value) == 1) then
            toast('升级残页', 1);
            usleep(100000);
            check_gf(451,158, 1);
        end
    end
	
    usleep(1000000);
	
    --退出功法
	-- gongfa
    while (responsiveGetColor(544, 163) == 12362367 and responsiveGetColor(551, 169) == 13547400 and responsiveGetColor(669, 166) == 13416074) do
        toast('退出功法界面', 1);
        usleep(100000);
        responsiveTap(36, 33);
        usleep(1000000);
    end
    
   	usleep(1000000);
    
    --分享有礼
	--base_codition
    if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16250094 and responsiveGetColor(172, 18) == 9809335) then
        toast('进入分享界面', 1);
        usleep(100000);
        responsiveTap(624, 159);
        usleep(1000000);
    end

    usleep(3000000);

    --检测分享有礼
	--fenxiang
    if (responsiveGetColor(248, 470) == 15581806 and responsiveGetColor(313, 482) == 11228994 and responsiveGetColor(378, 469) == 12487035) then
        toast('检测分享界面', 1);
        usleep(1000000);
		--fenxiang_condition
        if (responsiveGetColor(418, 575) == 13132901 and responsiveGetColor(444, 572) == 14336182 and responsiveGetColor(455, 575) == 14001566) then
            toast('开始分享', 1);
            usleep(100000);
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
            usleep(100000);
            responsiveTap(423, 386);
            usleep(1000000);
        end
   end

    usleep(1000000);
    -- 每隔24min
    if (tonumber(update_gf9.value) == 1) then
		appKill("com.tencent.mqq");
		usleep(1000000);
		log("locklocklock");
        lockScreen();
        sleep(1440);
		log("unlock");
        unlockScreen();
        usleep(500000);
    else
        sleep(1440);
    end
end