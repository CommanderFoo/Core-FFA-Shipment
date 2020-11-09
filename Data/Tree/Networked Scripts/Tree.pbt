Name: "Networked Scripts"
RootId: 7193685109751679562
Objects {
  Id: 4569329967828069285
  Name: "PIXELDEPTH_Weapon_Assets"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 7193685109751679562
  UnregisteredParameters {
    Overrides {
      Name: "cs:1"
      AssetReference {
        Id: 15027938538745799724
      }
    }
    Overrides {
      Name: "cs:2"
      AssetReference {
        Id: 6890919382649363793
      }
    }
    Overrides {
      Name: "cs:3"
      AssetReference {
        Id: 13820297575634285191
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
      Id: 364180029738268491
    }
  }
}
Objects {
  Id: 14277736308585922196
  Name: "PIXELDEPTH_Equipment"
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
  ParentId: 7193685109751679562
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
    Overrides {
      Name: "cs:PIXELDEPTH_Weapons"
      AssetReference {
        Id: 13640537296973504035
      }
    }
    Overrides {
      Name: "cs:PIXELDEPTH_Perks"
      AssetReference {
        Id: 2163635863331147484
      }
    }
    Overrides {
      Name: "cs:weapon_assets"
      ObjectReference {
        SelfId: 4569329967828069285
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
      Id: 9362961433814813585
    }
  }
}
