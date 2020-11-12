Name: "Client Scripts"
RootId: 11693234414961003129
Objects {
  Id: 15012712991265619918
  Name: "Client Scripts"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 11693234414961003129
  ChildIds: 2692436639450543280
  ChildIds: 10472926499226061826
  ChildIds: 16653042817522226198
  ChildIds: 12011382631882427942
  ChildIds: 11173929742660906152
  ChildIds: 14304451811208614862
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceoff"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  NetworkContext {
  }
}
Objects {
  Id: 14304451811208614862
  Name: "PIXELDEPTH_Nametag"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 15012712991265619918
  UnregisteredParameters {
    Overrides {
      Name: "cs:nametag_tpl"
      AssetReference {
        Id: 2499813271635472949
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Script {
    ScriptAsset {
      Id: 13957666376178014896
    }
  }
}
Objects {
  Id: 11173929742660906152
  Name: "PIXELDEPTH_Ammo_UI"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 15012712991265619918
  UnregisteredParameters {
    Overrides {
      Name: "cs:ammo_count"
      ObjectReference {
        SelfId: 4154724052755035850
      }
    }
    Overrides {
      Name: "cs:ammo_panel"
      ObjectReference {
        SelfId: 11594151118445841925
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Script {
    ScriptAsset {
      Id: 1947314065198355105
    }
  }
}
Objects {
  Id: 12011382631882427942
  Name: "PIXELDEPTH_Player_Messages"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 15012712991265619918
  UnregisteredParameters {
    Overrides {
      Name: "cs:msgs_container"
      ObjectReference {
        SelfId: 6187006761738844322
      }
    }
    Overrides {
      Name: "cs:promo_txt"
      AssetReference {
        Id: 10361177162361645998
      }
    }
    Overrides {
      Name: "cs:sound"
      ObjectReference {
        SelfId: 7609706404651483792
        SubObjectId: 6396276908183712420
        InstanceId: 12904695520489846877
        TemplateId: 3439130141810428105
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Script {
    ScriptAsset {
      Id: 5691312417852736840
    }
  }
}
Objects {
  Id: 16653042817522226198
  Name: "PIXELDEPTH_Player_Client"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 15012712991265619918
  UnregisteredParameters {
    Overrides {
      Name: "cs:PIXELDEPTH_RANKS"
      AssetReference {
        Id: 7815028865570495210
      }
    }
    Overrides {
      Name: "cs:PIXELDEPTH_API"
      AssetReference {
        Id: 16622261663679835299
      }
    }
    Overrides {
      Name: "cs:messenger"
      ObjectReference {
        SelfId: 16653042817522226198
      }
    }
    Overrides {
      Name: "cs:XP"
      ObjectReference {
        SelfId: 8007175402745751488
      }
    }
    Overrides {
      Name: "cs:Level"
      ObjectReference {
        SelfId: 17885775941529732201
      }
    }
    Overrides {
      Name: "cs:Kills"
      ObjectReference {
        SelfId: 6698029861709933226
      }
    }
    Overrides {
      Name: "cs:Deaths"
      ObjectReference {
        SelfId: 10352221149358727736
      }
    }
    Overrides {
      Name: "cs:KillStreak"
      ObjectReference {
        SelfId: 17409945663819641871
      }
    }
    Overrides {
      Name: "cs:HighestKillStreak"
      ObjectReference {
        SelfId: 12534713412889617951
      }
    }
    Overrides {
      Name: "cs:TotalKills"
      ObjectReference {
        SelfId: 14479112298101667050
      }
    }
    Overrides {
      Name: "cs:TotalDeaths"
      ObjectReference {
        SelfId: 5885401822338348417
      }
    }
    Overrides {
      Name: "cs:Health"
      ObjectReference {
        SelfId: 9607340290219380487
      }
    }
    Overrides {
      Name: "cs:hit"
      ObjectReference {
        SelfId: 15580690452733488731
      }
    }
    Overrides {
      Name: "cs:hit_sound"
      ObjectReference {
        SelfId: 13046872358671488104
      }
    }
    Overrides {
      Name: "cs:hit_effect"
      ObjectReference {
        SelfId: 8796442200253985106
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Script {
    ScriptAsset {
      Id: 10036777468913226098
    }
  }
}
Objects {
  Id: 10472926499226061826
  Name: "PIXELDEPTH_Class_Picker"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 15012712991265619918
  UnregisteredParameters {
    Overrides {
      Name: "cs:class_ui"
      ObjectReference {
        SelfId: 16944460689344375616
      }
    }
    Overrides {
      Name: "cs:class_btns"
      ObjectReference {
        SelfId: 9480166006019430336
      }
    }
    Overrides {
      Name: "cs:active_class_color"
      Color {
        R: 0.00891202
        B: 0.0510417633
        A: 1
      }
    }
    Overrides {
      Name: "cs:notice"
      ObjectReference {
        SelfId: 11945542562591117885
      }
    }
    Overrides {
      Name: "cs:PIXELDEPTH_API"
      AssetReference {
        Id: 16622261663679835299
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Script {
    ScriptAsset {
      Id: 2425870375457490383
    }
  }
}
Objects {
  Id: 2692436639450543280
  Name: "PIXELDEPTH_Feed"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 15012712991265619918
  UnregisteredParameters {
    Overrides {
      Name: "cs:feed_container"
      ObjectReference {
        SelfId: 15665953494340846489
      }
    }
    Overrides {
      Name: "cs:feed_line"
      AssetReference {
        Id: 5404452350067326022
      }
    }
    Overrides {
      Name: "cs:feed_line_color"
      Color {
        R: 1
        G: 1
        B: 1
        A: 1
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Script {
    ScriptAsset {
      Id: 1542634807890507226
    }
  }
}
