import os
import subprocess


def env_defined(key):
    return key in os.environ and len(os.environ[key]) > 0

# KEYS = "/arma3/keys"

# if not os.path.isdir(KEYS):
#     if os.path.exists(KEYS):
#         os.remove(KEYS)
#     os.makedirs(KEYS)

# Install Arma

steamcmd = ["/steamcmd/steamcmd.sh"]
steamcmd.extend(["+force_install_dir", "/armareforger"])
steamcmd.extend(["+login", os.environ["STEAM_USER"], os.environ["STEAM_PASSWORD"]])
steamcmd.extend(["+app_update", "1874900"])
if env_defined("STEAM_BRANCH"):
    steamcmd.extend(["-beta", os.environ["STEAM_BRANCH"]])
if env_defined("STEAM_BRANCH_PASSWORD"):
    steamcmd.extend(["-betapassword", os.environ["STEAM_BRANCH_PASSWORD"]])
steamcmd.extend(["validate", "+quit"])
subprocess.call(steamcmd)

launch = "{}".format(
    os.environ["ARMA_BINARY"]
)

# Mods
if os.environ["MODS_PRESET"] != "":
    launch += " -gproj ./mods/{}".format(
        os.environ["MODS_PRESET"]
    )

launch += ' -config ./configs/{} -profile ./profile/ -listScenarios -logLevel {}'.format(
    os.environ["ARMA_CONFIG"],
    os.environ["LOG_LEVEL"]
)

print("LAUNCHING ARMA SERVER WITH", launch, flush=True)
while(True):
    pass
os.system(launch)
