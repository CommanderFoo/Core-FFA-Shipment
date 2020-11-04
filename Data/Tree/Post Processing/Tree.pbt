Name: "Post Processing"
RootId: 10487198642387844799
Objects {
  Id: 2942135470202920873
  Name: "Vingette Grain Post Process"
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
  ParentId: 10487198642387844799
  UnregisteredParameters {
    Overrides {
      Name: "bp:Vignette Intensity"
      Float: 0.0950902104
    }
    Overrides {
      Name: "bp:Grain Intensity"
      Float: 0
    }
    Overrides {
      Name: "bp:Grain Jitter"
      Float: 0
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Blueprint {
    BlueprintAsset {
      Id: 2920556432021751741
    }
    TeamSettings {
    }
  }
}
Objects {
  Id: 11726177369525544988
  Name: "Bloom Post Process"
  Transform {
    Location {
      X: -2110
      Y: -1335
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 10487198642387844799
  UnregisteredParameters {
    Overrides {
      Name: "bp:Intensity"
      Float: 3.89901376
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Blueprint {
    BlueprintAsset {
      Id: 5556271614757209781
    }
    TeamSettings {
    }
  }
}
Objects {
  Id: 15606586081368409979
  Name: "Color Grading Post Process"
  Transform {
    Location {
      X: -2020
      Y: -1235
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 10487198642387844799
  UnregisteredParameters {
    Overrides {
      Name: "bp:White Temperature"
      Float: 6950.01611
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Blueprint {
    BlueprintAsset {
      Id: 7151983334208985477
    }
    TeamSettings {
    }
  }
}
Objects {
  Id: 12964028792620254015
  Name: "Ambient Occlusion Post Process"
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
  ParentId: 10487198642387844799
  UnregisteredParameters {
    Overrides {
      Name: "bp:Blend Weight"
      Float: 0.306296378
    }
    Overrides {
      Name: "bp:Intensity"
      Float: 0.265085936
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Blueprint {
    BlueprintAsset {
      Id: 10435647979670465118
    }
    TeamSettings {
    }
  }
}
