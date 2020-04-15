local label = {type=CONTROLLER_TYPE.LABEL, text="找色脚本"}
local x = {type=CONTROLLER_TYPE.INPUT, title="横轴x", key="book_row", value=2}
local y = {type=CONTROLLER_TYPE.INPUT, title="纵轴y", key="book_col", value=1}
--It's an option for users to determine weather the inputs should be remembered, if you use this control in the dialog.
local remember = {type=CONTROLLER_TYPE.REMEMBER, on=false}
local btn1 = {type=CONTROLLER_TYPE.BUTTON, title="开始", color=0x71C69E, width=0.8, flag=1, collectInputs=true}
local controls = {label, x, y, btn1, remember}
local orientations = { ORIENTATION_TYPE.LANDSCAPE_LEFT, ORIENTATION_TYPE.LANDSCAPE_RIGHT };
local result = dialog(controls, orientations);
    
if (result == 1) then
	co = getColor(tonumber(x.value), tonumber(y.value));
   alert(string.format("颜色: %d",co));
end