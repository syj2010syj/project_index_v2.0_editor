    
    HeroName[12] = "艾扎力"
    HeroMain[12] = "智力"
    HeroType[12] = |Hmkg|
    RDHeroType[12] = |h017|
    HeroTypePic[12] = "ReplaceableTextures\\CommandButtons\\BTNAiZaLi.blp"
    HeroSize[12] = 1.1
    LearnSkillId = {|A19S|, |A19T|, |A19U|, |A19V|}
    
    --剥离
    InitSkill{
        name = "剥离",
        type = {"主动", 1},
        ani = "spell 1",
        art = {"BTNTransmute.blp"}, --左边是学习,右边是普通.不填右边视为左边
        mana = {50, 75, 100, 125},
        cool = 5,
        rng = {300, 400, 500, 600},
        icon = 3,
        cast = 0.1,
        time = 6,
        dur = 6,
        targs = GetTargs("地面,空中,敌人,有机生物"),
        tip = "\
艾扎力使用阿兹特克魔法持续剥离一个单位,对其造成持续伤害并恢复自己的生命值.当该技能杀死一个非英雄单位后,你获得一次性的伪装技能.\n\
|cffffcc00需要持续施法\n\
|cff00ffcc技能|r: 单位目标\
|cff00ffcc伤害|r: 法术\n\
|cffffcc00每秒伤害|r: %s(|cff0000ff+%d|r)\
|cffffcc00恢复比例|r: %s%%\n\
|cff888888当距离超过施法距离的2倍后技能被打断\n必须通过该技能杀死单位才能获得对应的伪装\n伪装不使用的话可以一直保存,使用后消失",
        researchtip = "该技能持续过程中目标死亡即可获得对应的伪装",
        data = {
            {20, 30, 40, 50}, --每秒伤害1   
            function(ap) --伤害加成2
                return ap * 0.25
            end,
            75, --恢复比例
        },
        events = {"发动技能"},
        code = function(this)
            if this.event == "发动技能" then
                
            end
        end
    }
    
    --原典-操纵武器
    InitSkill{
        name = "原典-操纵武器",
        type = {"主动", 2, 3},
        ani = "spell 1",
        art = {"BTNManaBurn.blp"},
        cast = 0.3,
        mana = {120, 130, 140, 150},
        dur = {2, 2.5, 3, 3.5},
        cool = 12,
        area = {250, 300, 350, 400},
        tip = "\
使用原典的力量让一个区域内的敌人被迫放弃武装,使他们|cffffcc00缴械|r并|cffffcc00减速|r.\n\
|cff00ffcc技能|r: 点目标\n\
|cffffcc00降低移速|r: %s%%\n\
|cff888888缴械效果可以驱散",
        researchtip = "",
        data = {
            {25, 30, 35, 40} --降低移速1
        },
        events = {"发动技能"},
        code = function(this)
            if this.event == "发动技能" then
                
            end
        end
    }
    
    --原典-无远弗届
    InitSkill{
        name = "原典-无远弗届",
        type = {"主动", 2, 3},
        ani = "spell 1",
        art = {"BTNManual3.blp"},
        cast = 0.3,
        mana = 125,
        dur = 10,
        cool = 20,
        area = 400,
        tip = "\
将原典抄写在地面上,利用原典的特质来保护自己,为艾扎力吸收伤害并反击伤害来源.当原典吸收到一定的伤害后会自行崩溃.\n\
|cff00ffcc技能|r: 点目标\
|cff00ffcc伤害|r: 法术\n\
|cffffcc00吸收比例|r: %s%%\
|cffffcc00吸收上限|r: %s(|cff0000ff+%d|r)\
|cffffcc00反击伤害|r: %s(|cff0000ff+%d|r)\
|cffffcc00对同一单位的反击间隔|r: %s\n\
|cff888888艾扎力必须处于原典保护范围内才会生效\n弹道速率为%d",
        researchtip = "",
        data = {
            {50, 60, 70, 80}, --吸收比例1
            {150, 275, 400, 525}, --吸收上限2
            function(ap) --吸收上限加成3
                return ap * 1.25
            end,
            {100, 150, 200, 250}, --反击伤害4
            function(ap) --反击伤害加成5
                return ap * 0.75
            end,
            {1, 0.75, 0.5, 0.25}, --反击间隔6
            750, --弹道速率7
        },
        events = {"发动技能"},
        code = function(this)
            if this.event == "发动技能" then
                
            end
        end
    }
    
    --金星之枪
    InitSkill{
        name = "金星之枪",
        type = {"主动", 1},
        ani = "spell 1",
        art = {"BTNJXR Ico.blp"},
        cast = 0.1,
        mana = {150, 200, 250},
        time = 0.75,
        cool = {30, 20, 10},
        area = 100,
        tip = "\
用黑曜石匕首反射金星的光芒,分解被照射到的单位或建筑,造成大量伤害,此外还会根据对方最大生命值造成额外伤害.\n\
|cff00ffcc技能|r: 点目标\
|cff00ffcc伤害|r: 混合\n\
|cffffcc00伤害(最大生命值)|r: %s%%\
|cffffcc00伤害(固定部分)|r: %s(|cff0000ff+%d|r)\n\
|cff888888轨迹线仅友方可见\n施法延迟0.75秒\n伤害在2秒内分5段造成",
        researchtip = "",
        data = {
            {30, 40, 50}, --最大生命值部分1
            {200, 400, 600}, --固定伤害部分2
            function(ap) --伤害加成3
                return ap * 2
            end
        },
        events = {"发动技能"},
        code = function(this)
            if this.event == "发动技能" then
                
            end
        end
    }
        
