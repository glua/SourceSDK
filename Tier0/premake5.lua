include ".."

includedirs "../src/common"
includedirs "../src/public"
includedirs "../src/public/tier0"

filter "system:not linux"
	links "tier0"
filter "system:linux"
	prelinkcommands {
		"mkdir -p " .. solution().location .. "/bin",
		"ln -f " .. _SCRIPT_DIR .. "/../src/lib/public/linux32/libtier0.so " .. solution().location .. "/bin/libtier0.so"
	}
	linkoptions { "-Wl,--no-as-needed", "bin/libtier0.so" }
filter {}
