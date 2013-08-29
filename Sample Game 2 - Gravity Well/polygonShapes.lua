-- This file is for use with Corona(R) SDK
--
-- This file is automatically generated with PhysicsEdtior (http://physicseditor.de). Do not edit
--
-- Usage example:
--			local scaleFactor = 1.0
--			local physicsData = (require "shapedefs").physicsData(scaleFactor)
--			local shape = display.newImage("objectname.png")
--			physics.addBody( shape, physicsData:get("objectname") )
--

-- copy needed functions to local scope
local unpack = unpack
local pairs = pairs
local ipairs = ipairs

local M = {}

function M.physicsData(scale)
	local physics = { data =
	{ 	
		["pory"] = {
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   114.5, -88  ,  85.5, 23  ,  18, 112.5  ,  15.5, 109  ,  12.5, 88  ,  38, -31.5  ,  98.5, -97  ,  107, -97.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   132.5, 73  ,  61, 121.5  ,  18, 112.5  ,  85.5, 23  ,  116, 27.5  ,  134.5, 49  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -136.5, -12  ,  -119.5, -49  ,  -91.5, -92  ,  -49, -123.5  ,  -73.5, -3  ,  -111, 2.5  ,  -134, -3.5  ,  -136.5, -7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   15.5, -50  ,  4, -38.5  ,  -48, -123.5  ,  -12, -120.5  ,  -6, -116.5  ,  19.5, -79  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -126.5, 55  ,  -125.5, 49  ,  -98.5, 16  ,  -78, 6.5  ,  -45, 62.5  ,  -87, 82.5  ,  -92, 81.5  ,  -124, 64.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -42, 62.5  ,  33, -31.5  ,  38, -31.5  ,  12.5, 88  ,  7, 87.5  ,  -22, 76.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   12.5, 88  ,  15.5, 109  ,  11.5, 93  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -73.5, -3  ,  -45, 62.5  ,  -78, 6.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -49, -123.5  ,  -48, -123.5  ,  -42, 62.5  ,  -45, 62.5  ,  -73.5, -3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -42, 62.5  ,  4, -38.5  ,  33, -31.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -42, 62.5  ,  -48, -123.5  ,  4, -38.5  }
                    }
		}
		,
		["StrawHat"] = {
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   217.5, 24  ,  211, 29.5  ,  140, 22.5  ,  168, 13.5  ,  186, 10.5  ,  215, 11.5  ,  220.5, 16  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -219.5, 64  ,  -209, 56.5  ,  -181, 48.5  ,  -139, 43.5  ,  -95, 44.5  ,  -122, 74.5  ,  -216, 74.5  ,  -221, 71.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -24, 87.5  ,  -95, 44.5  ,  -9, 88.5  ,  -17, 90.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   199, 33.5  ,  208, 29.5  ,  203, 33.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -92.5, 33  ,  -93, 42.5  ,  -94.5, 35  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -95, 44.5  ,  -51, 83.5  ,  -57, 83.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -41, -70.5  ,  -91.5, 12  ,  -93.5, 4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   65, 78.5  ,  76, 74.5  ,  73, 77.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -13, -81.5  ,  -31, -75.5  ,  -21, -81.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   8, 87.5  ,  -95, 44.5  ,  35, 83.5  ,  22, 88.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -76, 76.5  ,  -95, 44.5  ,  -59, 81.5  ,  -71, 80.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2, -84.5  ,  -13, -81.5  ,  -3, -85.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -88.5, -16  ,  -41, -70.5  ,  -91.5, 1  ,  -91.5, -12  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   76, 74.5  ,  87, 69.5  ,  81, 73.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -31, -75.5  ,  -92.5, 33  ,  -91.5, 12  ,  -41, -70.5  ,  -34, -75.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   32, -81.5  ,  98.5, 17  ,  101.5, 26  ,  -93, 42.5  ,  2, -84.5  ,  10, -86.5  ,  11, -86.5  ,  23, -85.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   98.5, 17  ,  32, -81.5  ,  38, -81.5  ,  49, -77.5  ,  72, -60.5  ,  82.5, -49  ,  89.5, -38  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   185, 38.5  ,  199, 33.5  ,  191, 37.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -91.5, 12  ,  -92.5, 33  ,  -93.5, 18  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -41, -70.5  ,  -88.5, -16  ,  -83.5, -30  ,  -75.5, -43  ,  -52, -66.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   98.5, -8  ,  98.5, 17  ,  90.5, -32  ,  96.5, -19  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -51, 83.5  ,  -95, 44.5  ,  -24, 87.5  ,  -38, 87.5  ,  -48, 85.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   39, 84.5  ,  35, 83.5  ,  -95, 44.5  ,  65, 78.5  ,  60, 81.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   140, 22.5  ,  211, 29.5  ,  121, 26.5  ,  135, 22.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -95, 44.5  ,  -117, 72.5  ,  -122, 74.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -95, 44.5  ,  -92, 72.5  ,  -117, 72.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -95, 44.5  ,  -76, 76.5  ,  -92, 72.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -95, 44.5  ,  8, 87.5  ,  -9, 88.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   87, 69.5  ,  -95, 44.5  ,  185, 38.5  ,  144, 55.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2, -84.5  ,  -93, 42.5  ,  -92.5, 33  ,  -31, -75.5  ,  -13, -81.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   65, 78.5  ,  -95, 44.5  ,  87, 69.5  ,  76, 74.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   185, 38.5  ,  -95, 44.5  ,  -93, 42.5  ,  101.5, 26  ,  208, 29.5  ,  199, 33.5  }
                    }
		}
		,
		["BlueFairyTail"] = {
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   100.5, -91  ,  97.5, -85  ,  95, -91.5  ,  100, -93.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   107.5, -73  ,  102.5, -63  ,  89, -49.5  ,  91, -69.5  ,  107, -81.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   89, -49.5  ,  80, -64.5  ,  91, -69.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   89, -49.5  ,  58, -32.5  ,  69, -61.5  ,  80, -64.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   58, -32.5  ,  56, -61.5  ,  69, -61.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -81.5, -66  ,  -66.5, -88  ,  -45, -108.5  ,  -26, -119.5  ,  -6, -124.5  ,  -47, -61.5  ,  -75, -61.5  ,  -80, -62.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   97.5, -85  ,  87.5, -74  ,  73, -65.5  ,  56, -61.5  ,  82, -91.5  ,  95, -91.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.5, 8  ,  -169, 19.5  ,  -188, 16.5  ,  -194, 12.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   141.5, 13  ,  147.5, 4  ,  150, 10.5  ,  142, 15.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   147.5, 4  ,  163, -8.5  ,  195, -25.5  ,  159, 9.5  ,  150, 10.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   56, -61.5  ,  73, -93.5  ,  82, -91.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   56, -61.5  ,  51, -103.5  ,  73, -93.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   56, -61.5  ,  58, -32.5  ,  43, 5.5  ,  -5, -124.5  ,  9, -123.5  ,  22, -119.5  ,  51, -103.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -37.5, -21  ,  -16, -33.5  ,  41, 46.5  ,  -31, 35.5  ,  -42.5, 2  ,  -42.5, -12  ,  -40.5, -18  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   150, -66.5  ,  161, -62.5  ,  168, -56.5  ,  168.5, -55  ,  148, -48.5  ,  77, -37.5  ,  112, -57.5  ,  131, -65.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -6, -124.5  ,  -36, -59.5  ,  -47, -61.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -6, -124.5  ,  -25, -54.5  ,  -36, -59.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -6, -124.5  ,  -5, -124.5  ,  -14.5, -45  ,  -25, -54.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   104, 78.5  ,  70, 82.5  ,  36, 80.5  ,  3, 74.5  ,  -23, 67.5  ,  99, 57.5  ,  147.5, 58  ,  130, 70.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   183, -43.5  ,  195, -34.5  ,  166, -16.5  ,  93, -3.5  ,  136, -33.5  ,  157, -43.5  ,  166, -45.5  ,  177, -45.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   188.5, -15  ,  163.5, 11  ,  159, 9.5  ,  195, -25.5  ,  195.5, -24  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -110, -10.5  ,  -109.5, -9  ,  -130.5, 12  ,  -170, 3.5  ,  -137, -7.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   41, 46.5  ,  75, 6.5  ,  93, -3.5  ,  166, -16.5  ,  96, 30.5  ,  66, 43.5  ,  52, 46.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   166.5, 35  ,  156.5, 49  ,  147.5, 58  ,  151, 30.5  ,  160.5, 17  ,  176.5, 7  ,  171.5, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   166, -16.5  ,  195, -34.5  ,  195.5, -32  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   41, 46.5  ,  62, 10.5  ,  75, 6.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   41, 46.5  ,  48, 9.5  ,  62, 10.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   41, 46.5  ,  43, 5.5  ,  48, 9.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.5, 8  ,  -193, 7.5  ,  -92, 23.5  ,  49, 51.5  ,  72, 57.5  ,  -136, 28.5  ,  -169, 19.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   176.5, 7  ,  160.5, 17  ,  163.5, 11  ,  188.5, -15  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   147.5, 58  ,  142, 39.5  ,  151, 30.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   147.5, 58  ,  122, 51.5  ,  142, 39.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   147.5, 58  ,  99, 57.5  ,  122, 51.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   123, -32.5  ,  43, 5.5  ,  63, -32.5  ,  77, -37.5  ,  148, -48.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   43, 5.5  ,  58, -32.5  ,  63, -32.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   41, 46.5  ,  -14.5, -45  ,  -5, -124.5  ,  43, 5.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -130.5, 12  ,  -129.5, 13  ,  -193, 7.5  ,  -170, 3.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -23, 67.5  ,  72, 57.5  ,  99, 57.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -136, 28.5  ,  72, 57.5  ,  -23, 67.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -92, 23.5  ,  -193, 7.5  ,  -129.5, 13  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   41, 46.5  ,  -16, -33.5  ,  -14.5, -45  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density=1.5 , friction = 0.1, bounce = 0.4,
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   49, 51.5  ,  -31, 35.5  ,  41, 46.5  }
                    }
		}
	} }

        -- apply scale factor
        local s = scale or 1.0
        for bi,body in pairs(physics.data) do
                for fi,fixture in ipairs(body) do
                    if(fixture.shape) then
                        for ci,coordinate in ipairs(fixture.shape) do
                            fixture.shape[ci] = s * coordinate
                        end
                    else
                        fixture.radius = s * fixture.radius
                    end
                end
        end
	
	function physics:get(name)
		return unpack(self.data[name])
	end

	function physics:getFixtureId(name, index)
                return self.data[name][index].pe_fixture_id
	end
	
	return physics;
end

return M
