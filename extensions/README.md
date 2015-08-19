# GeoJSON-X Well-Known Extensions


## Well-Known Values

| Value | Description | Source |
| ----- | ----------- | ------ |
| `atemp` | ATemp represents the air temperature in degree celsius. | TrackPointExtension V1 |
| `cad` | Cadence represents the cadence in revolutions per minute. | TrackPointExtension V1 |
| `depth` | Depth represents the diving depth in meters. | TrackPointExtension V1 |
| `hr` | HR represents the heart rate in beats per minute. | TrackPointExtension V1 |
| `time` | A time stamp (defined as xsd:dateTime in GPX 1.1) for an individual geographic point. | GPX 1.1 |
| `wtemp` | WTemp represents the water temperature in degree celsius. | TrackPointExtension V1 |


## References

1. [GPX 1.1](http://www.topografix.com/gpx.asp): GPX (the GPS Exchange Format) is a light-weight XML data format for the interchange of GPS data (waypoints, routes, and tracks) between applications and Web services on the Internet.
2. [TrackPointExtension V1](https://www.cluetrust.com/Schemas/gpxdata10.xsd): This schema defines Garmin extensions to be used with the GPX 1.1 schema. The root element defined by this schema is intended to be used as a child element of the "extensions" elements in the trkpt element in the GPX 1.1 schema.
