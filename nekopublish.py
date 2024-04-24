from subprocess import run
from os import path, _exit, remove, environ
from shutil import make_archive
import requests

if (environ["NKWEB_API_TOKEN"] is None):
    print("Fill in the env var NKWEB_API_TOKEN...")
    _exit(1)

api_root = "https://nekoweb.org/api"

headers = {
    "Authorization": environ["NKWEB_API_TOKEN"]
}

def check_if_exists(cmd):
    command = run(cmd, shell=True)
    return command.returncode == 0


node_exists = check_if_exists("node -v")
pnpm_exists = check_if_exists("pnpm --version")

if not node_exists and not pnpm_exists:
    print("NodeJS and PNPM are missing from this system.")
    _exit(1)

print("Building...")
run('pnpm run build', shell=True)

if path.exists("./website-archive.zip"):
    print("Website archive already exists, removing...")
    remove("./website-archive.zip")

make_archive("website-archive", "zip", "./_site")

big_id = requests.get(f"{api_root}/files/big/create", headers=headers).json()["id"]

print(f"Got big id: {big_id}")

append_req = requests.post(
    f"{api_root}/files/big/append",
    headers=headers,
    files={
        "file": open("website-archive.zip", "rb")
    },
    data={"id": (None, big_id)}
)

if append_req.text != "Appended":
    print("Failed to append website archive, aborting...")
    print(f"Error: {append_req.json}, {append_req.text}")
    _exit(1)

requests.post(f"{api_root}/files/import/{big_id}", headers=headers)

print("Done")