# Control configuration for basic water balance
yaml::write_yaml(medfate::defaultControl(), "inst/yaml_configurations/basic.yaml")
# Control configuration for advanced water balance
advanced = medfate::defaultControl("Sperry")
advanced$cavitationRefill = "rate"
advanced$fracRootResistance = 0.4
advanced$refillMaximumRate = 0.1
advanced$capacitance = TRUE
yaml::write_yaml(advanced,"inst/yaml_configurations/advanced.yaml")
