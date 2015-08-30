local libLocations = {
	windows	= "src/lib/public",
	macosx	= "src/lib/public/osx32",
	linux	= "src/lib/public/linux32"
}

local osDefinition = {
	windows	= { "WIN32" },
	macosx	= { "POSIX", "_POSIX", "GNUC", "OSX" },
	linux	= { "POSIX", "_POSIX", "LINUX", "_LINUX", "GNUC" }
}

includedirs { 
	"src/common",
	"src/public",
	"src/public/tier0",
	"src/public/tier1",
	"src/public/tier2",
	"src/public/tier3",
	"src/public/mathlib",
}

libdirs(libLocations[os.get()])
defines(osDefinition[os.get()])
