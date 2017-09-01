# TrueSight Pulse Windows Performance Counter Plugin

The TrueSight Pulse Windows Performance Counter provides a framework whereby ad-hoc counter information can be collected.

### Prerequisites

#### Supported OS

|     OS    | Linux | Windows | OS X |
|:----------|:-----:|:-------:|:----:|
| Supported |   -   |    v    |  -   |

#### TrueSight Pulse Meter versions v4.6.1 or later

- To install new meter go to Settings->Installation or [see instructions](https://help.truesight.bmc.com/hc/en-us/sections/200634331-Installation).
- To upgrade the meter to the latest version - [see instructions](https://help.truesight.bmc.com/hc/en-us/articles/201573102-Upgrading-the-Boundary-Meter).

### Plugin Setup

None

### Plugin Configuration Fields

|Field Name        |Description                                                         |
|:-----------------|:-------------------------------------------------------------------|
|Metric Name       |The name of the metric for the counter                              |
|Counter           |The counter path for windows performance metric                     |
|Factor            |The multiplication factor for the metric                            |
|Poll Interval     |The collection interval in seconds                                  |


#### Available Windows Performance counters
We can see the available performance counters by executing the below command on the windows command prompt.
TypePerf.exe -q > counters.txt


#### Monitoring multiple counters

We can monitor multiple counters by creating multiple instances of the plugin with each specifying one counter each. Once the meter detects the valid counters, they will be monitored and the metrics will be available in the metrics page. To view the metrics on a dashboard we may need to edit a dashboard and add the metrics to it.

Note: If one of the counters specified is invalid, none of them will be shown.

### Metrics Collected

|Metric Name             |Description                                                   |
|:-----------------------|:-------------------------------------------------------------|
|User Defined            |Dependent on user defined counter path                        |

### Dashboards

WIN PDH

### References

None
