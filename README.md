# GeoJSON-X

GeoJSON-X is an attempt to make GeoJSON extensions self-describing. In the long run, [the ongoing work to standardize GeoJSON](https://datatracker.ietf.org/wg/geojson) will hopefully mean that it takes less guessing to understand if/how GeoJSON can be extended, and maybe there will even be some guidance on how to extend it so that something along the lines of GeoJSON-X can be done without the need for extra conventions.


## Well-known Extensions

The idea for GeoJSON-X is to make GeoJSON extensions self-describing by defining a convention of how to represent data that is not covered by GeoJSON itself, but allowed by GeoJSON's extensibility rules. From [one of the](examples/jake.json) [examples](examples), here's a snippet showing how GeoJSON-X works:

```javascript
{ "type" : "GeometryCollection",
  "geometries" : [
    { "type" : "LineString",
      "extensions" : [ "time", "atemp", "hr", "cad" ],
      "coordinates" : [
        [
          -122.45671039447188,
          37.786870915442705,
          0.4000000059604645, 
          "2014-11-06T19:16:06.000Z", 
          31.0, 
          99, 
          0
        ], 
```

Currently, the "well-known" extensions are driven by existing formats such as GPX (and extensions to it). The goal is to have [a developing registry of "well-known extensions"](extensions), and to allow any other extensions to be used, in which case they have to be identified by URIs.

