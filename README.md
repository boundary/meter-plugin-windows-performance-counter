# pdh_test
=======
# TrueSight Pulse CPU Core Plugin

The TrueSight Pulse CPU Core Plugin reports the CPU utilization of each CPU core individually. Each core is a separate source so when graphed, the legend will display the hostname, or the source provided in the plugin configuration, followed by "-CN" where N is the core number.

**NOTE:** Starting with release 0.9.2 the CPU Core plugin generates sources with core numbers from 0 to N-1, releases previous to 0.9.2 use a 1 to N numbering scheme.

### Prerequisites

#### Supported OS

|     OS    | Linux | Windows | OS X |
|:----------|:-----:|:-------:|:----:|
| Supported |   v   |    v    |  v   |

#### TrueSight Pulse Meter versions v4.2 or later

- To install new meter go to Settings->Installation or [see instructions](https://help.truesight.bmc.com/hc/en-us/sections/200634331-Installation).
- To upgrade the meter to the latest version - [see instructions](https://help.truesight.bmc.com/hc/en-us/articles/201573102-Upgrading-the-Boundary-Meter).

#### TrueSight Pulse Meter versions earlier than v4.2

|  Runtime | node.js | Python | Java |
|:---------|:-------:|:------:|:----:|
| Required |    +    |        |      |

- [How to install node.js?](https://help.truesight.bmc.com/hc/en-us/articles/202360701)

### Plugin Setup

None

### Plugin Configuration Fields

None

### Metrics Collected

|Metric Name             |Description                                                   |
|:-----------------------|:-------------------------------------------------------------|
|Per core CPU utilization|Per core CPU utilization                                      |

### Dashboards

|Dashboard Name|Metrics Displayed       |
|:-------------|:-----------------------|
|CPU Core      |Per core CPU utilization|

### References

None
