local label = {type=CONTROLLER_TYPE.LABEL, text="玄元剑仙-zz脚本"}
local update_gf1 = {type=CONTROLLER_TYPE.SWITCH, title="升级绝学", key="绝学", value=1}
local update_gf2 = {type=CONTROLLER_TYPE.SWITCH, title="升级真绝", key="真绝", value=1}
local update_gf3 = {type=CONTROLLER_TYPE.SWITCH, title="升级门派", key="门派", value=1}
local update_gf4 = {type=CONTROLLER_TYPE.SWITCH, title="升级秘籍", key="秘籍", value=1}
local update_gf5 = {type=CONTROLLER_TYPE.SWITCH, title="升级心经", key="心经", value=1}
local update_gf6 = {type=CONTROLLER_TYPE.SWITCH, title="升级遁术", key="遁术", value=1}
local update_gf7 = {type=CONTROLLER_TYPE.SWITCH, title="升级残页", key="残页", value=1}
local iteration = {type=CONTROLLER_TYPE.INPUT, title="循环多少次升级灵根（只能数字）", key="循环", value=15}
--It's an option for users to determine weather the inputs should be remembered, if you use this control in the dialog.
local remember = {type=CONTROLLER_TYPE.REMEMBER, on=false}
local btn1 = {type=CONTROLLER_TYPE.BUTTON, title="开始", color=0x71C69E, width=0.8, flag=1, collectInputs=true}
local controls = {label, update_gf1, update_gf2, update_gf3, update_gf4, 
    update_gf5, update_gf6, update_gf7, iteration, btn1, remember}
local orientations = { ORIENTATION_TYPE.LANDSCAPE_LEFT, ORIENTATION_TYPE.LANDSCAPE_RIGHT };
local result = dialog(controls, orientations);
    
if (result == 1) then
   toast('开始运行');
end


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
    usleep(100000);
    touchUp(0, x2*xf, y2*yf);
end
function check_gf(x, y, times)
    responsiveTap(x, y);
    usleep(100000);
    responsiveTap(x, y);
    usleep(1000000);
    local cnt = 0;
    while cnt < times do
        local start = 208;
        while start < 1134 do
        responsiveTap(605, start);
        usleep(100000);
        responsiveTap(605, start);
        usleep(100000);
        start = start + 36;
        end
        usleep(1000000);
        responsiveTouchMove(560,1020,560,333);
        usleep(1000000);
        cnt = cnt + 1
    end
end

local total =1;
while total > 0 do
    total = total + 1
    --appActivate("com.tencent.mqq"); 强制切换程序
    usleep(10000000);

    --login
    if (responsiveGetColor(424, 1010) == 15313229 and responsiveGetColor(617,303) == 13456441 and 
            responsiveGetColor(575,288)==15065814) then
        toast('检测到登陆界面',1);
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

    usleep(4000000);

    if (responsiveGetColor(257, 1142) == 15977041 and responsiveGetColor(499, 1145) == 16505449 and 
            responsiveGetColor(371,1146) == 6758400) then
        toast('正在进入游戏', 1);
        usleep(1000000);
        responsiveTap(373, 1132); --tap twice
        responsiveTap(373, 1132);
        usleep(30000000);
    end

    -- 已登陆
    usleep(1000000);

    --检测公告
    if (responsiveGetColor(655, 227) == 13127218 and responsiveGetColor(432, 240) == 16644084 and 
            responsiveGetColor(375,350) == 2894892 and responsiveGetColor(380, 457) == 12367017) then
        toast('关闭公告', 1);
        usleep(1000000);
        responsiveTap(655, 229);
        usleep(5000000);
    end

    usleep(1000000);

    --检测主界面
    if (responsiveGetColor(120, 21) == 16315888 and responsiveGetColor(153, 33) == 16250094 and 
            responsiveGetColor(172, 18) == 9874870) then
        toast('找到主界面', 1);
        usleep(1000000);
    end

    usleep(1000000);

    --历练检测
    if (responsiveGetColor(650,1068) == 6185059 and responsiveGetColor(628,1049) == 10924722 and 
            responsiveGetColor(674,1047) == 5791837 and responsiveGetColor(657,1027) == 15654836) then
        toast('进入历练', 1);
        usleep(1000000);
        responsiveTap(660, 1033);
        usleep(10000000);
    end

    usleep(1000000);

    --检测历练界面
    if (responsiveGetColor(107, 37) == 8093819 and responsiveGetColor(93, 28) == 9804180 and 
            responsiveGetColor(133, 27) == 12369850 and responsiveGetColor(151, 31) == 9080714) then
        toast('已在历练界面', 1);
        usleep(1000000);
    end
    usleep(1000000);


    --神游设置
    if (responsiveGetColor(500, 1029) == 3168101 and responsiveGetColor(531, 1060) == 16774114 and 
            responsiveGetColor(611, 1043) == 16776695 and responsiveGetColor(492, 1001) == 14137237) then
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
            local rep = 0;
            while (rep < 70) do
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

    if (responsiveGetColor(235, 1022) == 15589044 and responsiveGetColor(255, 1044) == 10457745 and 
            responsiveGetColor(236, 1075) == 5190194 and responsiveGetColor(217, 1043) == 8879228) then
        toast('退出神游界面', 1);
        usleep(1000000);
        responsiveTap(57, 33);
        usleep(2000000);
    end

    usleep(1000000);

    if (responsiveGetColor(96, 28) == 14343384 and responsiveGetColor(57, 23) == 4929837 and 
            responsiveGetColor(152, 43) == 5988956 and responsiveGetColor(31, 44) == 16179879) then
        toast('退出历练界面', 1);
        usleep(1000000);
        responsiveTap(37, 32);
        usleep(2000000);
    end

    usleep(1000000);

    --灵根检测
    if (responsiveGetColor(78, 1031) == 5462102 and responsiveGetColor(117, 1032) == 14928548 and 
            responsiveGetColor(96, 1015) == 6518652 and responsiveGetColor(92, 1056) == 5930111) then
        toast('进入灵根', 1);
        usleep(1000000);
        responsiveTap(95, 1030);
        responsiveTap(95, 1030);
        usleep(10000000);
    end

    usleep(1000000);

    --灵根界面检测
    if (responsiveGetColor(199, 42) == 1979717 and responsiveGetColor(115, 40) == 1715515 and 
            responsiveGetColor(84, 27) == 1715515 and responsiveGetColor(57,42) == 1058351) then
        toast('已经在界面了', 1);
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
    if (responsiveGetColor(199, 42) == 1979717 and responsiveGetColor(115, 40) == 1715515 and 
            responsiveGetColor(84, 27) == 1715515 and responsiveGetColor(57,42) == 1058351) then
        toast('退出灵根界面', 1);
        usleep(1000000);
        responsiveTap(29, 39);
        usleep(1000000);
    end

    usleep(1000000);

    --功法
    if (total%tonumber(iteration.value) == 0) then
        if (responsiveGetColor(78, 1031) == 5462102 and responsiveGetColor(117, 1032) == 14928548 and 
            responsiveGetColor(96, 1015) == 6518652 and responsiveGetColor(92, 1056) == 5930111) then
            toast('进入功法', 1);
            usleep(1000000);
            responsiveTap(238, 1029);
            responsiveTap(238, 1029);
            usleep(10000000);
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
        if (tonumber(update_gf3.value) == 1) then
            toast('升级门派', 1);
            usleep(1000000);
            check_gf(150, 105, 2);
        end
        if (tonumber(update_gf4.value) == 1) then
            toast('升级秘籍', 1);
            usleep(1000000);
            check_gf(288, 104, 3);
        end
        if (tonumber(update_gf5.value) == 1) then
            toast('升级心经', 1);
            usleep(1000000);
            check_gf(608, 106, 3);
        end
        if (tonumber(update_gf6.value) == 1) then
            toast('升级遁术', 1);
            usleep(1000000);
            check_gf(142, 171, 3);
        end
        if (tonumber(update_gf7.value) == 1) then
            toast('升级残页', 1);
            usleep(1000000);
            check_gf(451,158, 1);
        end
        usleep(1000000);
    end

    usleep(1000000);

    --退出功法
    if (responsiveGetColor(544, 163) == 12362367 and responsiveGetColor(551, 169) == 13547400 and 
            responsiveGetColor(669, 166) == 13416074 and responsiveGetColor(628, 164) == 9535077 and responsiveGetColor(599, 174) == 3815477) then
        toast('退出功法界面', 1);
        usleep(1000000);
        responsiveTap(36, 33);
        usleep(1000000);
    end
    
    --检测洞府
    if (responsiveGetColor(650,1068) == 6185059 and responsiveGetColor(628,1049) == 10924722 and 
            responsiveGetColor(674,1047) == 5791837 and responsiveGetColor(657,1027) == 15654836) then
        toast('进入洞府', 1);
        usleep(1000000);
        responsiveTap(516, 1029);
        usleep(10000000);
    end
    
    usleep(1000000);
    
    if (responsiveGetColor(283, 142) == 13605221 and responsiveGetColor(282, 159) == 8736827 and 
            responsiveGetColor(528, 148) == 9523242 and responsiveGetColor(136, 237) == 765169) then
        toast('检测到洞府界面', 1);
        usleep(1000000);
        if (responsiveGetColor(424, 589) == 5917496 and responsiveGetColor(373, 592) == 8879212 and 
            responsiveGetColor(256, 584) == 6773062 and responsiveGetColor(358, 593) == 14868175 and responsiveGetColor(356, 593) == 6773062 
                and responsiveGetColor(425, 589) == 5917497) then
            toast('洞府点击升级', 1);
            usleep(1000000);
            responsiveTap(609, 421);
            usleep(100000);
            responsiveTap(612, 610);
            usleep(100000);
            responsiveTap(605, 805);
            usleep(10000000);
        else
            toast('木头未满级', 1);
            usleep(1000000);
        end
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
    
    usleep(180000000);
end

--if (responsiveGetColor(, ) ==  and responsiveGetColor(, ) ==  and 
--       responsiveGetColor(,) ==  and responsiveGetColor(, ) == ) then
--    toast('', 1);
--   usleep(1000000);
--   responsiveTap(, );
--   usleep(10000000);
--end