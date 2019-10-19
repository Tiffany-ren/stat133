| *Name in csv*  | *Name* | *Unit* | *Description* |
| ------------- | ------------- | -------------- | ------------- |
| Serial_Num| serial number  |N/A | **YYYY** is the corresponding year of the first recorded observation of the storm  **JJJ** is the day of year of the first recorded observation of the storm H is the hemisphere of the storm: N=Northern, S=Southern **TT** is the absolute value of the rounded latitude of the first recorded observation of the storm (range 0-90, if basin=SA or SH, then TT in reality is negative) **NNN** is the rounded longitude of the first recorded observation of the storm (range 0-359) |
|Season| Year | Year | Season (year) that the storm began |
|Num | Number |# | Number of the storm for the year (restarts at 1 for each year) |
|Basin | Basin boundaries | BB| *Southern Hemisphere basins (latitude < 0бу)* **SI** = 	South Indian 		  10бу < Longitude < 135бу **SP** = 	South Pacific		135бу < Longitude < 290бу **SA** =	South Atlantic		 -70бу < Longitude <   10бу *Northern Hemisphere basins (latitude > 0)* Two basins are defined solely by longitude: **NI** = 	North Indian		  30бу < Longitude < 100бу **WP** =	Western Pacific 	100бу < Longitude < 180бу |
|Sub_basin|Subbasin Boundaries|BB|**WA** (SI)	Western Australia	In SI and Longitude > 90бу **EA** (SP) Eastern Australia	In SP and Longitude < 160бу **AS** (NI)	Arabian Sea	In NI and Longitude < 78бу **BB** (NI)	Bay of Bengal		In NI and Longitude > 78бу **CP** (EP)	Central Pacific		In EP and Longitude < -140бу **CS** (NA)	Caribbean Sea	In NA and inside the boundary from: http://www.marineregions.org/gazetteer.php?p=details&id=4287  **GM** (NA)	Gulf of Mexico		In NA and inside the boundary from: http://www.marineregions.org/gazetteer.php?p=details&id=4288|
|Name| Name | N/A | Name of system give by source (if available) |
|ISO_time| Time in ISO format |YYYY-MM-DD HH:MM:SS |Time of the observation in ISO format (YYYY-MM-DD hh:mm:ss) |
|Nature| Type of form |N/A| Type of storm (a combination of the various types from the available sources) |
|Latitude|latitude| deg_north|Mean position - latitude (a combination of the available positions)|
|Longitude|longitute|deg_east| Mean position - longitude (a combination of the available positions)|
|Wind(WMO)|Wind speed|kt| Maximum sustained wind speed assigned by the responsible WMO agency |
|Pres(WMO)|pressure |mb|Minimum central pressure assigned by the responsible WMO agnecy|


