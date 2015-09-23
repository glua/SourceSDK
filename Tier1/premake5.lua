include ".."

includedirs "../src/common"
includedirs "../src/public"
includedirs "../src/public/tier1"

vpaths { Tier1 = "../src/tier1/*.cpp" }

links "vstdlib"

files {
	"../src/tier1/bitbuf.cpp",
	"../src/tier1/byteswap.cpp",
	"../src/tier1/characterset.cpp",
	"../src/tier1/checksum_crc.cpp",
	"../src/tier1/checksum_md5.cpp",
	"../src/tier1/checksum_sha1.cpp",
	"../src/tier1/commandbuffer.cpp",
	"../src/tier1/convar.cpp",
	"../src/tier1/datamanager.cpp",
	"../src/tier1/diff.cpp",
	"../src/tier1/generichash.cpp",
	"../src/tier1/ilocalize.cpp",
	"../src/tier1/interface.cpp",
	"../src/tier1/KeyValues.cpp",
	"../src/tier1/kvpacker.cpp",
	"../src/tier1/lzmaDecoder.cpp",
	"../src/tier1/mempool.cpp",
	"../src/tier1/memstack.cpp",
	"../src/tier1/NetAdr.cpp",
	"../src/tier1/newbitbuf.cpp",
	"../src/tier1/rangecheckedvar.cpp",
	"../src/tier1/reliabletimer.cpp",
	"../src/tier1/snappy-sinksource.cpp",
	"../src/tier1/snappy-stubs-internal.cpp",
	"../src/tier1/snappy.cpp",
	"../src/tier1/sparsematrix.cpp",
	"../src/tier1/splitstring.cpp",
	"../src/tier1/stringpool.cpp",
	"../src/tier1/strtools.cpp",
	"../src/tier1/tier1.cpp",
	"../src/tier1/tokenreader.cpp",
	"../src/tier1/uniqueid.cpp",
	"../src/tier1/utlbinaryblock.cpp",
	"../src/tier1/utlbuffer.cpp",
	"../src/tier1/utlbufferutil.cpp",
	"../src/tier1/utlstring.cpp",
	"../src/tier1/utlsymbol.cpp"
}

if os.is "windows" then
	links { "Ws2_32", "Rpcrt4" }
	files "../src/tier1/processor_detect.cpp"
else

--[[
	local function _WRAP(name)
	        buildoptions("-Xlinker --wrap="..name)
	end

	_WRAP("fopen") _WRAP("freopen") _WRAP("open")    _WRAP("creat")    _WRAP("access")  _WRAP("__xstat")
	_WRAP("stat")  _WRAP("lstat")   _WRAP("fopen64") _WRAP("open64")   _WRAP("opendir") _WRAP("__lxstat")
	_WRAP("chmod") _WRAP("chown")   _WRAP("lchown")  _WRAP("symlink")  _WRAP("link")    _WRAP("__lxstat64")
	_WRAP("mknod") _WRAP("utimes")  _WRAP("unlink")  _WRAP("rename")   _WRAP("utime")   _WRAP("__xstat64")
	_WRAP("mount") _WRAP("mkfifo")  _WRAP("mkdir")   _WRAP("rmdir")    _WRAP("scandir") _WRAP("realpath")
]]--

	files {
		"../src/tier1/processor_detect_linux.cpp",
		"../src/tier1/qsort_s.cpp",
--		"../src/tier1/pathmatch.cpp"
	}
end
