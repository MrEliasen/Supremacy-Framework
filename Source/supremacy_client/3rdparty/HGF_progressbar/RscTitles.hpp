class HGF_ProgressBar 
{
    idd = -1; 
    onLoad = "uiNamespace setVariable [""HGF_ProgressBar"", _this select 0];";   
    duration = 999999999;
    movingEnable = false;

    class controls 
    {   
        class HGF_UI_ProgressBarBackground: IGUIBack
        {
            idc = 22200;
            x = 0.259375 * safezoneW + safezoneX;
            y = 0.247042 * safezoneH + safezoneY;
            w = 0.48125 * safezoneW;
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 0.9) / 25)";
            colorBackground[] = {"0.0745","0.0863","0.1059",0.8};
        }; 
        class HGF_UI_ProgressBar: RscProgress
        {
            idc = 22202;
            text = "";
            x = 0.259375 * safezoneW + safezoneX;
            y = 0.247042 * safezoneH + safezoneY;
            w = 0.48125 * safezoneW;
            zzh = 0.032 * safezoneH;
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 0.9) / 25)";
            colorFrame[] = {0,0,0,1};
            colorBar[]={"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            texture = "#(argb,8,8,3)color(1,1,1,1)";
        }; 
        class HGF_UI_ProgressBarText: RscText
        {
            idc = 22201;
            text = "";
            x = 0.259375 * safezoneW + safezoneX;
            y = 0.247042 * safezoneH + safezoneY;
            w = 0.48125 * safezoneW;
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.05) / 25)";
            sizeEx = "2 * (0.021)";
            style = ST_CENTER;
        }; 
    };
};