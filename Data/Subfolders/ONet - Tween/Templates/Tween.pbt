Assets {
  Id: 16624210776459901424
  Name: "Tween"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 271100980496378244
      Objects {
        Id: 271100980496378244
        Name: "ONet-Tween"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 7254777495604079757
        ChildIds: 13262487688902623995
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        Folder {
          IsFilePartition: true
        }
      }
      Objects {
        Id: 7254777495604079757
        Name: "TweenLibrary"
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
        ParentId: 271100980496378244
        UnregisteredParameters {
          Overrides {
            Name: "cs:Duration"
            Float: 0
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
            Id: 12541589855841787
          }
        }
      }
      Objects {
        Id: 13262487688902623995
        Name: "VolumeTweenDemo"
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
        ParentId: 271100980496378244
        UnregisteredParameters {
          Overrides {
            Name: "cs:Tween"
            AssetReference {
              Id: 12541589855841787
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
            Id: 14287438001322055734
          }
        }
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  Marketplace {
    Description: "Includes a (optional, removable) demo script demonstrating usage!\r\n\r\nTween any property using a wide array of easing functions:\r\n\r\nEasing functions include:\r\n* `linear` \r\n* `quad`, `cubic`, `quart`, `quint`, `expo`, `sine` and `circle` are all \"smooth\" curves that will make transitions look natural.\r\n* The `back` family starts by moving the interpolation slightly \"backwards\" before moving it forward.\r\n* The `bounce` family simulates the motion of an object bouncing.\r\n* The `elastic` family simulates inertia in the easing, like an elastic gum.\r\n\r\nSimply provide a duration, subject, and target properties and the tween will ensure the subject\'s properties are updated every time you call update()."
  }
  SerializationVersion: 65
  DirectlyPublished: true
}
