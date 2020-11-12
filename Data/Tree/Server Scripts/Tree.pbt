Name: "Server Scripts"
RootId: 5253240157554064535
Objects {
  Id: 10904775536389546199
  Name: "Server Scripts"
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
  ParentId: 5253240157554064535
  ChildIds: 10228886015464289850
  ChildIds: 17574444400243650927
  ChildIds: 11994945518478722210
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  NetworkContext {
    Type: Server
  }
}
Objects {
  Id: 11994945518478722210
  Name: "PIXELDEPTH_Server"
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
  ParentId: 10904775536389546199
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Script {
    ScriptAsset {
      Id: 11749374915854355029
    }
  }
}
Objects {
  Id: 17574444400243650927
  Name: "PIXELDEPTH_Player_Server"
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
  ParentId: 10904775536389546199
  UnregisteredParameters {
    Overrides {
      Name: "cs:ffa_data"
      NetReference {
        Key: "b3c9efbde4cc4105b1fc83f2de888744"
        Type {
          Value: "mc:enetreferencetype:sharedpersistence"
        }
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
      Id: 10200445020597966486
    }
  }
}
Objects {
  Id: 10228886015464289850
  Name: "PIXELDEPTH_Killed"
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
  ParentId: 10904775536389546199
  UnregisteredParameters {
    Overrides {
      Name: "cs:PIXELDEPTH_API"
      AssetReference {
        Id: 16622261663679835299
      }
    }
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
      Id: 10906881924338434508
    }
  }
}
